package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import java.sql.Timestamp;

@Routes
public class EmailVerificationController {

    @Route("/verify?token={}")
    public String verify(String token){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<User> query = session.createQuery("from users where verification_code=:vc", User.class);
        query.setParameter("vc", token);

        try{
            User user = query.getSingleResult();
            user.setEmail_verified_at(new Timestamp(System.currentTimeMillis()));
            user.setActive(true);
            Transaction tr = session.beginTransaction();
            session.update(user);
            tr.commit();
            return "redirect:/login";
        }catch (NoResultException e){
            e.printStackTrace();
            return "redirect:/";

        }
    }
}
