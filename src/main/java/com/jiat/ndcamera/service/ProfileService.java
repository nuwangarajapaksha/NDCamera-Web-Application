package com.jiat.ndcamera.service;

import com.jiat.ndcamera.entity.MessageType;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.entity.UserUpdateResult;
import com.jiat.ndcamera.util.Encryption;
import com.jiat.ndcamera.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import java.util.List;

public class ProfileService {
    Session session = HibernateUtil.getSessionFactory().openSession();
    public UserUpdateResult updateProfileById(String userId, String name, String contactNumber, String address, String city, String postalCode){
        MessageType messageType = MessageType.SUCCESS;
        Query<User> userQuery = session.createQuery("from users where id=:userId", User.class);
        userQuery.setParameter("userId", Long.valueOf(userId));

        Query<User> contactNumberQuery = session.createQuery("from users where contact_number=:contactNumber",User.class);
        contactNumberQuery.setParameter("contactNumber", contactNumber);

        try {
            List<User> checkUserList = contactNumberQuery.getResultList();

            User user = userQuery.getSingleResult();
            user.setName(name);
            if(!contactNumber.equals("")){
                String regex = "^[0-9]{10}$";
                if(!contactNumber.matches(regex)){
                    messageType = MessageType.INVALID;
                }else {
                    if( checkUserList.size() > 0){
                        for (User checkUser: checkUserList) {
                            if(!checkUser.getId().toString().equals(userId)){
                                messageType = MessageType.ALREADY_EXIST;
                            }else {
                                user.setContact_number(contactNumber);
                            }
                        }
                    }else {
                        user.setContact_number(contactNumber);
                    }
                }
            }else {
                user.setContact_number(null);
            }



            user.setAddress(address);
            user.setCity(city);
            user.setPostal_code(postalCode);
            Transaction transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();
            return new UserUpdateResult(user, messageType);

        } catch (NoResultException ex) {
            return new UserUpdateResult(null,MessageType.NOT_FOUND);
        }
    }


    public UserUpdateResult changePasswordByID(String userId,String currentPassword,String newPassword,String confirmNewPassword){
        Query<User> userQuery = session.createQuery("from users where id=:userId", User.class);
        userQuery.setParameter("userId", Long.valueOf(userId));

        try {
            User user = userQuery.getSingleResult();
            if(!user.getPassword().equals(currentPassword)){
                return new UserUpdateResult(null, MessageType.CURRENT_PW_NOT_MATCH);
            }
            if(!newPassword.equals(confirmNewPassword)){
                return new UserUpdateResult(null, MessageType.NEW_PW_NOT_MATCH);
            }

            user.setPassword(Encryption.encrypt(newPassword));
            Transaction transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();

            return new UserUpdateResult(user, MessageType.SUCCESS);
        } catch (NoResultException ex) {
            return new UserUpdateResult(null, MessageType.NOT_FOUND);
        }
    }

    public UserUpdateResult deactivateUserById(String userId){
        Query<User> userQuery = session.createQuery("from users where id=:userId", User.class);
        userQuery.setParameter("userId", Long.valueOf(userId));

        try {
            User user = userQuery.getSingleResult();
            user.setActive(false);
            Transaction transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();
            return new UserUpdateResult(null, MessageType.SUCCESS);
        } catch (NoResultException ex) {
            return new UserUpdateResult(null, MessageType.NOT_FOUND);
        }
    }
}
