package com.jiat.ndcamera.service;

import com.jiat.ndcamera.entity.Cart;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import java.util.List;

public class CartService {
    public List<Cart> getCartDataByUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Cart> cartQuery = session.createQuery("from cart where user.id=:userId", Cart.class);
        cartQuery.setParameter("userId", user.getId());
        try {
            List<Cart> cartItemList = cartQuery.getResultList();
            return cartItemList;
        } catch (NoResultException e) {
            return null;
        }
    }
}
