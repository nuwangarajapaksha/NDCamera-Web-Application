package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.Product;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Routes(value = "/shop")
public class ShopController {

    Session session = HibernateUtil.getSessionFactory().openSession();

    @Route
    public String get(HttpServletRequest request){
        return "frontend/shop.jsp";
    }

    @Route(value = "/get-product-by-name")
    public String shopActionByName(HttpServletRequest request){
        String search = request.getParameter("search");

        Query<Product> productQuery = session.createQuery("from product where name like:search", Product.class);
        productQuery.setParameter("search", "%" + search + "%");

        try{
            List<Product> productList = productQuery.getResultList();
            request.getSession().setAttribute("productList",productList);
        }catch (NoResultException e){
            request.getSession().setAttribute("error","Products Not Available");
        }
        return "redirect:/shop";
    }

    @Route(value = "/get-product-by-brand")
    public String getProductByBrand(HttpServletRequest request){
        String brandId = request.getParameter("brandId");

        Query<Product> productQuery = session.createQuery("from product where brand.id=:brandId", Product.class);
        productQuery.setParameter("brandId", Long.valueOf(brandId));

        try{
            List<Product> productList = productQuery.getResultList();
            request.getSession().setAttribute("productList",productList);
        }catch (NoResultException e){
            request.getSession().setAttribute("error","Products Not Available");
        }
        return "redirect:/shop";
    }

    @Route(value = "/get-product-by-price")
    public String getProductByPrice(HttpServletRequest request){
        String minAmount = request.getParameter("minAmount");
        String maxAmount = request.getParameter("maxAmount");

        System.out.println("ssss "+maxAmount);
        System.out.println("ssss "+minAmount);
        System.out.println("ssss "+Double.parseDouble(minAmount));
        System.out.println("ssss "+Double.parseDouble(maxAmount));

        Query<Product> productQuery = session.createQuery("from product where price between :minAmount and :maxAmount", Product.class);
        productQuery.setParameter("minAmount", Double.valueOf(minAmount));
        productQuery.setParameter("maxAmount", Double.valueOf(maxAmount));

        try{
            List<Product> productList = productQuery.getResultList();
            request.getSession().setAttribute("productList",productList);
        }catch (NoResultException e){
            request.getSession().setAttribute("error","Products Not Available");
        }
        return "redirect:/shop";
    }
}
