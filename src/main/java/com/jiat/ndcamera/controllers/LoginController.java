package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.Cart;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.service.CartService;
import com.jiat.ndcamera.service.WishListService;
import com.jiat.ndcamera.util.Encryption;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.HttpMethod;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import java.security.spec.EncodedKeySpec;
import java.util.List;

@Routes(value = "/login")
public class LoginController {

    Session session = HibernateUtil.getSessionFactory().openSession();

    @Route
    public String get(HttpServletRequest request){
        return "frontend/auth/login.jsp";
    }

    @Route(value = "/login-action",respondsToMethods = {HttpMethod.POST})
    public String loginAction(HttpServletRequest request){
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Query<User> query = session.createQuery("from users where email=:email and password=:password", User.class);
        query.setParameter("email", email);
        query.setParameter("password", Encryption.encrypt(password));

        try{
            User user = query.getSingleResult();
            if(!user.isActive()){
                request.getSession().setAttribute("error","Email Not Verified or User Not Activated");
                return "redirect:/login";
            }else if(user.getEmail_verified_at() == null){
                request.getSession().setAttribute("error","Email Not Verified");
                return "redirect:/login";
            }else {
                request.getSession().setAttribute("user",user);
                WishListService wishListService = new WishListService();
                request.getSession().setAttribute("cartItemList", new CartService().getCartDataByUser(user));
                request.getSession().setAttribute("wishListItemList", new WishListService().getWishListDataByUser(user));
                return "redirect:/";
            }

        }catch (NoResultException e){
            request.getSession().setAttribute("error","Invalid Email or Password");
            return "redirect:/login";
        }
    }

    @Route(value = "/logout")
    public String logout(HttpServletRequest request){
        request.getSession().setAttribute("user",null);
        request.getSession().setAttribute("cartItemList", null);
        request.getSession().setAttribute("wishListItemList", null);
//        return "redirect:" + request.getHeader("Referer");
        return "redirect:/";
    }
}
