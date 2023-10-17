package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.Brand;
import com.jiat.ndcamera.entity.Product;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.entity.UserType;
import com.jiat.ndcamera.service.BrandService;
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
import java.io.File;
import java.nio.file.Paths;
import java.util.List;

@Routes(value = "/admin-brands", tags = {"auth","admin"})
public class AdminBrandsController {
    Session session = HibernateUtil.getSessionFactory().openSession();
    static String uploadDirectory = "C:\\Users\\NUWAA\\IdeaProjects\\NDCamera\\src\\main\\webapp\\assets\\img\\brands\\";
    @Route
    public String get(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            if(user.getUserType().equals(UserType.ADMIN)){
                request.getSession().setAttribute("brandList", new BrandService().getAllBrands());
                return "frontend/admin/brands.jsp";
            }
            return "redirect:/";
        }
        return "redirect:/login";
    }

    @Route(value = "/add-new-brand",respondsToMethods = HttpMethod.POST)
    public String addNewBrand(HttpServletRequest request){
        String name = null;
        String imgFileName = null;
//        String baseUrl = (String) request.getServletContext().getAttribute("BASE_URL");
        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (item.isFormField() && "name".equals(item.getFieldName())) {
                    name = item.getString();

                    Query<Brand> query = session.createQuery("from brand where name=:name", Brand.class);
                    query.setParameter("name", name);
                    if(query.getResultList().size() > 0){
                        request.getSession().setAttribute("error", "Brand Already Exist");
                        return "redirect:/admin-brands";
                    }
                } else if (!item.isFormField() && "img".equals(item.getFieldName())) {
                    imgFileName = System.currentTimeMillis() + "_" + Paths.get(item.getName()).getFileName().toString();
//                    String uploadDirectory = "C:\\Users\\NUWAA\\IdeaProjects\\NDCamera\\src\\main\\webapp\\assets\\img\\brands\\";
//                    String uploadDirectory = "/webapp/assets/img/brands/";
                    String destination = uploadDirectory + imgFileName;
                    item.write(new File(destination));
                }
            }

            Brand brand = new Brand();
            brand.setName(name);
            brand.setImg(imgFileName);

            Transaction transaction = session.beginTransaction();
            session.save(brand);
            transaction.commit();

            request.getSession().setAttribute("success", "Brand Added");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Brand Not Added");
        }
        return "redirect:/admin-brands";
    }

    @Route(value = "/update-brand",respondsToMethods = HttpMethod.POST)
    public String updateBrand(HttpServletRequest request){
        String message = "Brand Updated";
        String messageType = "success";
        Long brandId = null; // Initialize brandId
        String name = null;
        String imgFileName = null;

        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (item.isFormField()) {
                    if ("brandId".equals(item.getFieldName())) {
                        brandId = Long.valueOf(item.getString());
                    } else if ("name".equals(item.getFieldName())) {
                        name = item.getString();
                        Query<Brand> query = session.createQuery("from brand where name=:name", Brand.class);
                        query.setParameter("name", name);
                        List<Brand> brandList = query.getResultList();
                        if( brandList.size() > 0){
                            for (Brand brand: brandList) {
                                if(brand.getId() != brandId){
                                   name = null;
                                   message = "Brand Name Already Exist";
                                   messageType = "error";
                                }
                            }
                        }
                    }
                } else if (!item.isFormField() && "img".equals(item.getFieldName())) {
                    if (!item.getName().isEmpty()) {
                        imgFileName = System.currentTimeMillis() + "_" + Paths.get(item.getName()).getFileName().toString();
                        String destination = uploadDirectory + imgFileName;
                        item.write(new File(destination));
                    }
                }
            }

                Query<Brand> query = session.createQuery("from brand where id=:brandId", Brand.class);
                query.setParameter("brandId", brandId);
                Brand brand = query.getSingleResult();

                    if (name != null) {
                        brand.setName(name);
                    }

                    if (imgFileName != null) {
                        brand.setImg(imgFileName);
                    }
                    Transaction transaction = session.beginTransaction();
                    session.update(brand);
                    transaction.commit();

            request.getSession().setAttribute(messageType, message);
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Brand Not Updated");
        }
        return "redirect:/admin-brands";
    }

    @Route(value = "/remove-brand")
    public String removeBrand(HttpServletRequest request){
        String brandId = request.getParameter("brandId");
        Query<Brand> brandQuery = session.createQuery("from brand where id=:brandId", Brand.class);
        brandQuery.setParameter("brandId", Long.valueOf(request.getParameter("brandId")));

        try{
            Brand brand = brandQuery.getSingleResult();
            Query<Product> productQuery = session.createQuery("from product where brand=:brand", Product.class);
            productQuery.setParameter("brand", brand);
            List<Product> resultList = productQuery.getResultList();
            if(productQuery.getResultList().size() > 0){
                request.getSession().setAttribute("error","This Brand Can't Removed");
                return "redirect:/admin-brands";
            }
            brand.setActive(false);
            Transaction transaction = session.beginTransaction();
            session.update(brand);
            transaction.commit();
            request.getSession().setAttribute("success","Brand Removed");
        }catch (NoResultException e){
            request.getSession().setAttribute("error","Brand Not Found");
        }
        return "redirect:/admin-brands";
    }
}
