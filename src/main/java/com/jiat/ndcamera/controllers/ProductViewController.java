package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.Product;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

@Routes(value = "/product-view")
public class ProductViewController {

    Session session = HibernateUtil.getSessionFactory().openSession();

    @Route
    public String get(HttpServletRequest request){
        if(request.getSession().getAttribute("product") != null){
            return "frontend/product-view.jsp";
        }
        return "redirect:/shop";
    }

    @Route(value = "/get-product-by-id")
    public String getProductById(HttpServletRequest request){
        String productId = request.getParameter("productId");

        Query<Product> productQuery = session.createQuery("from product where id=:productId", Product.class);
        productQuery.setParameter("productId", Long.valueOf(productId));

        try{
            Product product = productQuery.getSingleResult();
            request.getSession().setAttribute("product",product);
            return "redirect:/product-view";
        }catch (NoResultException e){
            request.getSession().setAttribute("error","Product Not Available");
            return "redirect:/shop";
        }
    }
}
