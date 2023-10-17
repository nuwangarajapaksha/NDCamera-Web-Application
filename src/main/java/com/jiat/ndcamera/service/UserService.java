package com.jiat.ndcamera.service;

import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import java.util.List;

public class UserService {
    public List<User> getAllUsers() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<User> query = session.createQuery("from users where active=:active", User.class);
        query.setParameter("active", true);

//        Query<User> query = session.createQuery("from users", User.class);

        try{
            List<User> userList = query.getResultList();
            return userList;
        }catch (NoResultException e){
            return null;
        }
    }
}
