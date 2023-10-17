package com.jiat.ndcamera.service;

import com.jiat.ndcamera.entity.MessageType;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.entity.UserType;
import com.jiat.ndcamera.entity.UserUpdateResult;
import com.jiat.ndcamera.mail.VerificationMail;
import com.jiat.ndcamera.providers.MailServiceProvider;
import com.jiat.ndcamera.util.Encryption;
import com.jiat.ndcamera.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import java.util.UUID;

public class RegistrationService {


    public UserUpdateResult register (String name,String email,String password,String confirmPassword,String userType){
        Session session = HibernateUtil.getSessionFactory().openSession();

        Query<User> query = session.createQuery("from users where email=:email",User.class);
        query.setParameter("email", email);

        try{
            query.getSingleResult();
            return new UserUpdateResult(null, MessageType.ALREADY_EXIST);
        }catch (NoResultException e){

        }

        if(!password.equals(confirmPassword)){
            return new UserUpdateResult(null, MessageType.NEW_PW_NOT_MATCH);
        }

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(Encryption.encrypt(password));
        user.setUserType(UserType.valueOf(userType));

//        String s = RandomStringUtils.randomAlphanumeric(20);

        String verificationCode = UUID.randomUUID().toString();
        user.setVerification_code(verificationCode);

        Transaction transaction = session.beginTransaction();

        session.save(user);

        transaction.commit();

        session.close();

        VerificationMail mail = new VerificationMail(user.getEmail(), verificationCode);
        MailServiceProvider.getInstance().sendMail(mail);

        return new UserUpdateResult(null, MessageType.SUCCESS);
    }
}
