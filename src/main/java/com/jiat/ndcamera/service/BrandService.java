package com.jiat.ndcamera.service;

import com.jiat.ndcamera.entity.Brand;
import com.jiat.ndcamera.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import java.util.List;

public class BrandService {
    public List<Brand> getAllBrands() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Brand> brandQuery = session.createQuery("from brand where active=:active", Brand.class);
        brandQuery.setParameter("active", true);
        try {
            List<Brand> brandList = brandQuery.getResultList();
            return brandList;
        } catch (NoResultException e) {
            return null;
        }
    }
}
