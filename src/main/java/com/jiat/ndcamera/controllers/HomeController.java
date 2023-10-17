package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.*;
import com.jiat.ndcamera.middlewares.IsUser;
import com.jiat.ndcamera.service.BrandService;
import com.jiat.ndcamera.service.CartService;
import com.jiat.ndcamera.service.ProductService;
import com.jiat.ndcamera.service.WishListService;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

@Routes
public class HomeController extends IsUser {

    @Route(value = "/")
    public String index(HttpServletRequest request){
        Session session = HibernateUtil.getSessionFactory().openSession();
        User user = (User) request.getSession().getAttribute("user");
        if(user != null) {
            request.getSession().setAttribute("cartItemList", new CartService().getCartDataByUser(user));
            request.getSession().setAttribute("wishListItemList", new WishListService().getWishListDataByUser(user));
        }
        try{
            request.getSession().setAttribute("brandList", new BrandService().getAllBrands());
            request.getSession().setAttribute("productList",new ProductService().getAllProducts());
        }catch (NoResultException e){
            e.printStackTrace();
            request.getSession().setAttribute("error","Not Available");
        }
        return "frontend/index.jsp";
    }
}
