package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.*;
import com.jiat.ndcamera.service.OrderService;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.HttpMethod;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

@Routes(value = "/admin-orders", tags = {"auth","admin"})
public class AdminOrdersController {

    Session session = HibernateUtil.getSessionFactory().openSession();

    @Route
    public String get(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            if(user.getUserType().equals(UserType.ADMIN)){
                request.getSession().setAttribute("orderList", new OrderService().getAllOrders());
                request.getSession().setAttribute("orderItemList", new OrderService().getAllOrderItems());
                return "frontend/admin/orders.jsp";
            }
            return "redirect:/";
        }
        return "redirect:/login";
    }

    @Route(value = "/update-order", respondsToMethods = HttpMethod.POST)
    public String updateUser(HttpServletRequest request){
        String orderId = request.getParameter("orderId");
        String status = request.getParameter("status");


        Query<Order> orderQuery = session.createQuery("from orders where id=:orderId", Order.class);
        orderQuery.setParameter("orderId", Long.valueOf(orderId));

        try{
            Order order = orderQuery.getSingleResult();
            order.setStatus(status);
            Transaction transaction = session.beginTransaction();
            session.update(order);
            transaction.commit();
            request.getSession().setAttribute("success","Order Status Updated");
        }catch (NoResultException e){
            request.getSession().setAttribute("error","Order Not Found");
        }

        return "redirect:/admin-orders";
    }


    @Route(value = "/remove-order")
    public String removeOrder(HttpServletRequest request){
        String orderId = request.getParameter("orderId");
        Query<Order> orderQuery = session.createQuery("from orders where id=:orderId", Order.class);
        orderQuery.setParameter("orderId", Long.valueOf(orderId));

        Query<OrderItem> orderItemQuery = session.createQuery("from order_item where order=:orderId", OrderItem.class);
        orderItemQuery.setParameter("orderId", Long.valueOf(orderId));

        try{

            Order order = orderQuery.getSingleResult();
            order.setActive(false);
            Transaction transaction = session.beginTransaction();
            session.update(order);
            transaction.commit();

            request.getSession().setAttribute("success","Order Removed");
        }catch (NoResultException e){
            request.getSession().setAttribute("error","Order Not Found");
        }
        return "redirect:/admin-orders";
    }
}
