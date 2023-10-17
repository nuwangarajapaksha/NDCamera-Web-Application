package com.jiat.ndcamera.service;

import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.entity.WishList;
import com.jiat.ndcamera.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import java.util.List;

public class WishListService {
    public List<WishList> getWishListDataByUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<WishList> wishListQuery = session.createQuery("from wishlist where user.id=:userId", WishList.class);
        wishListQuery.setParameter("userId", user.getId());
        try {
            List<WishList> wishListItemList = wishListQuery.getResultList();
            return  wishListItemList;
        } catch (NoResultException e) {
            return null;
        }
    }
}
