package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.Brand;
import com.jiat.ndcamera.entity.Product;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.entity.UserType;
import com.jiat.ndcamera.service.BrandService;
import com.jiat.ndcamera.service.ProductService;
import com.jiat.ndcamera.util.HibernateUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.baswell.routes.HttpMethod;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.nio.file.Paths;
import java.util.List;

@Routes(value = "/admin-products", tags = {"auth","admin"})
public class AdminProductsController {
    Session session = HibernateUtil.getSessionFactory().openSession();
    static String uploadDirectory = "C:\\Users\\NUWAA\\IdeaProjects\\NDCamera\\src\\main\\webapp\\assets\\img\\product\\";
    @Route
    public String get(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            if(user.getUserType().equals(UserType.ADMIN)){
                request.getSession().setAttribute("brandList", new BrandService().getAllBrands());
                request.getSession().setAttribute("productList",new ProductService().getAllProducts());
                return "frontend/admin/products.jsp";
            }
            return "redirect:/";
        }
        return "redirect:/login";
    }

    @Route(value = "/add-new-product", respondsToMethods = HttpMethod.POST)
    public String addNewProduct(HttpServletRequest request) {
        String name = null;
        String description = null;
        Brand brand = null;
        String type = null;
        Double price = null;
        String imgFileName = null;

        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    switch (fieldName) {
                        case "name":
                            name = fieldValue;
                            break;
                        case "description":
                            description = fieldValue;
                            break;
                        case "brandId":
                            Long brandId = Long.valueOf(fieldValue);
                            Query<Brand> query = session.createQuery("from brand where id=:brandId", Brand.class);
                            query.setParameter("brandId", brandId);
                            brand = query.getSingleResult();
                            break;
                        case "type":
                            type = fieldValue;
                            break;
                        case "price":
                            price = Double.valueOf(fieldValue);
                            break;
                    }
                } else if (!item.isFormField() && "img".equals(item.getFieldName())) {
                    if (!item.getName().isEmpty()) {
                        imgFileName = System.currentTimeMillis() + "_" + Paths.get(item.getName()).getFileName().toString();
                        String destination = uploadDirectory + imgFileName;
                        item.write(new File(destination));
                    }
                }
            }

            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setBrand(brand);
            product.setType(type);
            product.setPrice(price);
            product.setImg(imgFileName);

            Transaction transaction = session.beginTransaction();
            session.save(product);
            transaction.commit();

            request.getSession().setAttribute("success", "Product Added");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Product Not Added");
        }
        return "redirect:/admin-products";
    }

    @Route(value = "/update-product", respondsToMethods = HttpMethod.POST)
    public String updateProduct(HttpServletRequest request) {
        Long productId = null;
        String name = null;
        String description = null;
        Brand brand = null;
        String type = null;
        Double price = null;
        boolean available = true; // Default value
        String imgFileName = null;

        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    switch (fieldName) {
                        case "productId":
                            productId = Long.valueOf(fieldValue);
                            break;
                        case "name":
                            name = fieldValue;
                            break;
                        case "description":
                            description = fieldValue;
                            break;
                        case "brandId":
                            Long brandId = Long.valueOf(fieldValue);
                            Query<Brand> query = session.createQuery("from brand where id=:brandId", Brand.class);
                            query.setParameter("brandId", brandId);
                            brand = query.getSingleResult();
                            break;
                        case "type":
                            type = fieldValue;
                            break;
                        case "price":
                            price = Double.valueOf(fieldValue);
                            break;
                        case "available":
                            available = Boolean.parseBoolean(fieldValue);
                            break;
                    }
                } else if (!item.isFormField() && "img".equals(item.getFieldName())) {
                    if (!item.getName().isEmpty()) {
                        imgFileName = System.currentTimeMillis() + "_" + Paths.get(item.getName()).getFileName().toString();
                        String destination = uploadDirectory + imgFileName;
                        item.write(new File(destination));
                    }
                }
            }
            Query<Product> query = session.createQuery("from product where id=:productId", Product.class);
            query.setParameter("productId", productId);
            Product product = query.getSingleResult();
                product.setName(name);
                product.setDescription(description);
                product.setBrand(brand);
                product.setType(type);
                product.setPrice(price);
                product.setAvailable(available);

                if (imgFileName != null) {
                    product.setImg(imgFileName);
                }
                Transaction transaction = session.beginTransaction();
                session.update(product);
                transaction.commit();

                request.getSession().setAttribute("success", "Product Updated");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Product Not Updated");
        }

        return "redirect:/admin-products";
    }


    @Route(value = "/remove-product")
    public String removeProduct(HttpServletRequest request){
        Query<Product> query = session.createQuery("from product where id=:productId", Product.class);
        query.setParameter("productId", Long.valueOf(request.getParameter("productId")));
        try{
            Product product = query.getSingleResult();
            product.setActive(false);
            Transaction transaction = session.beginTransaction();
            session.update(product);
            transaction.commit();
            request.getSession().setAttribute("success","Product Removed");
        }catch (NoResultException e){
            request.getSession().setAttribute("error","Product Not Found");
        }
        return "redirect:/admin-products";
    }
}
