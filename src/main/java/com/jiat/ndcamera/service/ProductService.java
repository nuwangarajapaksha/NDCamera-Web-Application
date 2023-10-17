package com.jiat.ndcamera.service;

import com.jiat.ndcamera.entity.Product;
import com.jiat.ndcamera.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import java.util.List;

public class ProductService {
    public List<Product> getAllProducts() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Product> productQuery = session.createQuery("from product where active=:active", Product.class);
        productQuery.setParameter("active", true);
        try {
            List<Product> productList = productQuery.getResultList();
            return productList;
        } catch (NoResultException e) {
            return null;
        }
    }
}
