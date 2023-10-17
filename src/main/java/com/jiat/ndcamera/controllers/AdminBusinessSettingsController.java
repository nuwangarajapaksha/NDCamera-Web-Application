package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.*;
import com.jiat.ndcamera.util.BSUtil;
import com.jiat.ndcamera.util.HibernateUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.baswell.routes.HttpMethod;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.file.Paths;
import java.util.List;

@Routes(value = "/admin-business-settings", tags = {"auth","admin"})
public class AdminBusinessSettingsController {

    Session session = HibernateUtil.getSessionFactory().openSession();

    @Route
    public String get(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            if(user.getUserType().equals(UserType.ADMIN)){
                return "frontend/admin/business-settings.jsp";
            }
            return "redirect:/";
        }
        return "redirect:/login";
    }

    @Route(value = "/update-business-settings", respondsToMethods = HttpMethod.POST)
    public String updateBusinessSettings(HttpServletRequest request) {
        String appName = null;
        String email = null;
        String contactNumber = null;
        String openTime = null;
        String address = null;
        String location = null;
        String sliderTitle = null;
        String sliderSubTitle = null;
        String sliderCaption = null;
        String navCaption = null;
        String deliveryCharges = null;
        String logoImgFileName = null;
        String sliderImgFileName = null;
        String homeBanner1ImgFileName = null;
        String homeBanner2ImgFileName = null;
        String breadCrumbImgFileName = null;
        String[] nameList = {"appName", "email", "contactNumber", "openTime", "address", "location", "sliderTitle",
                "sliderSubTitle", "sliderCaption", "navCaption", "deliveryCharges", "logo", "slider-img", "home-banner-img", "breadcrumb"};

        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    switch (fieldName) {
                        case "appName":
                            appName = fieldValue;
                            break;
                        case "email":
                            email = fieldValue;
                            break;
                        case "contactNumber":
                            contactNumber = fieldValue;
                            break;
                        case "openTime":
                            openTime = fieldValue;
                            break;
                        case "address":
                            address = fieldValue;
                            break;
                        case "location":
                            location = fieldValue;
                            break;
                        case "sliderTitle":
                            sliderTitle = fieldValue;
                            break;
                        case "sliderSubTitle":
                            sliderSubTitle = fieldValue;
                            break;
                        case "sliderCaption":
                            sliderCaption = fieldValue;
                            break;
                        case "navCaption":
                            navCaption = fieldValue;
                            break;
                        case "deliveryCharges":
                            deliveryCharges = fieldValue;
                            break;
                    }
                } else if (!item.isFormField() && "logoImg".equals(item.getFieldName())) {
                    if (!item.getName().isEmpty()) {
                        logoImgFileName = System.currentTimeMillis() + "_" + Paths.get(item.getName()).getFileName().toString();
                        String uploadDirectory = "C:\\Users\\NUWAA\\IdeaProjects\\NDCamera\\src\\main\\webapp\\assets\\img\\";
                        String destination = uploadDirectory + logoImgFileName;
                        item.write(new File(destination));
                    }
                }else if (!item.isFormField() && "sliderImg".equals(item.getFieldName())) {
                    if (!item.getName().isEmpty()) {
                        sliderImgFileName = System.currentTimeMillis() + "_" + Paths.get(item.getName()).getFileName().toString();
                        String uploadDirectory = "C:\\Users\\NUWAA\\IdeaProjects\\NDCamera\\src\\main\\webapp\\assets\\img\\hero\\";
                        String destination = uploadDirectory + sliderImgFileName;
                        item.write(new File(destination));
                    }
                }else if (!item.isFormField() && "homeBanner1Img".equals(item.getFieldName())) {
                    if (!item.getName().isEmpty()) {
                        homeBanner1ImgFileName = System.currentTimeMillis() + "_" + Paths.get(item.getName()).getFileName().toString();
                        String uploadDirectory = "C:\\Users\\NUWAA\\IdeaProjects\\NDCamera\\src\\main\\webapp\\assets\\img\\banner\\";
                        String destination = uploadDirectory + homeBanner1ImgFileName;
                        item.write(new File(destination));
                    }
                }else if (!item.isFormField() && "homeBanner2Img".equals(item.getFieldName())) {
                    if (!item.getName().isEmpty()) {
                        homeBanner2ImgFileName = System.currentTimeMillis() + "_" + Paths.get(item.getName()).getFileName().toString();
                        String uploadDirectory = "C:\\Users\\NUWAA\\IdeaProjects\\NDCamera\\src\\main\\webapp\\assets\\img\\banner\\";
                        String destination = uploadDirectory + homeBanner2ImgFileName;
                        item.write(new File(destination));
                    }
                }else if (!item.isFormField() && "breadCrumbImg".equals(item.getFieldName())) {
                    if (!item.getName().isEmpty()) {
                        breadCrumbImgFileName = System.currentTimeMillis() + "_" + Paths.get(item.getName()).getFileName().toString();
                        String uploadDirectory = "C:\\Users\\NUWAA\\IdeaProjects\\NDCamera\\src\\main\\webapp\\assets\\img\\";
                        String destination = uploadDirectory + breadCrumbImgFileName;
                        item.write(new File(destination));
                    }
                }
            }

            BSUtil bsUtil = new BSUtil();
            bsUtil.updateBusinessSetting("app-name",appName);
            bsUtil.updateBusinessSetting("email",email);
            bsUtil.updateBusinessSetting("contact-number",contactNumber);
            bsUtil.updateBusinessSetting("open-time",openTime);
            bsUtil.updateBusinessSetting("address",address);
            bsUtil.updateBusinessSetting("location",location);
            bsUtil.updateBusinessSetting("slider-title",sliderTitle);
            bsUtil.updateBusinessSetting("slider-subtitle",sliderSubTitle);
            bsUtil.updateBusinessSetting("slider-caption",sliderCaption);
            bsUtil.updateBusinessSetting("nav-caption",navCaption);
            bsUtil.updateBusinessSetting("delivery-charges",deliveryCharges);
            if(logoImgFileName != null){
                bsUtil.updateBusinessSetting("logo",logoImgFileName);
            }

            if(sliderImgFileName != null){
                bsUtil.updateBusinessSetting("slider-img",sliderImgFileName);
            }

            if(homeBanner1ImgFileName != null && homeBanner2ImgFileName != null){
                bsUtil.updateBusinessSetting("home-banner-img",homeBanner1ImgFileName+","+homeBanner2ImgFileName);
            }

            if(breadCrumbImgFileName != null){
                bsUtil.updateBusinessSetting("breadcrumb-img",breadCrumbImgFileName);
            }
            request.getSession().setAttribute("success", "Business Settings Updated");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Business Settings Not Updated");
        }

        return "redirect:/admin-business-settings";
    }

}
