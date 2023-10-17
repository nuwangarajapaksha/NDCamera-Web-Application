package com.jiat.ndcamera.service;

import com.jiat.ndcamera.entity.Order;
import com.jiat.ndcamera.entity.OrderItem;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import java.util.List;

public class OrderService {

    public List<Order> getAllOrders() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Order> orderQuery = session.createQuery("from orders where active=:active order by id desc", Order.class);
        orderQuery.setParameter("active", true);
        try {
            List<Order> orderList = orderQuery.getResultList();
            return orderList;
        } catch (NoResultException e) {
            return null;
        }
    }

    public List<OrderItem> getAllOrderItems() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<OrderItem> orderQuery = session.createQuery("from order_item where active=:active", OrderItem.class);
        orderQuery.setParameter("active", true);
        try {
            List<OrderItem> orderItemList = orderQuery.getResultList();
            return orderItemList;
        } catch (NoResultException e) {
            return null;
        }
    }

    public List<Order> getOrdersByUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Order> orderQuery = session.createQuery("from orders where user.id=:userId and active=:active", Order.class);
        orderQuery.setParameter("userId", user.getId());
        orderQuery.setParameter("active", true);
        try {
            List<Order> orderList = orderQuery.getResultList();
            return orderList;
        } catch (NoResultException e) {
            return null;
        }
    }

    public List<OrderItem> getOrderItemsByUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<OrderItem> orderQuery = session.createQuery("from order_item where user.id=:userId", OrderItem.class);
        orderQuery.setParameter("userId", user.getId());

        try {
            List<OrderItem> orderItemList = orderQuery.getResultList();
            return orderItemList;
        } catch (NoResultException e) {
            return null;
        }
    }
}
