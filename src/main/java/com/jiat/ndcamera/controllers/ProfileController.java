package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.MessageType;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.entity.UserUpdateResult;
import com.jiat.ndcamera.service.ProfileService;
import com.jiat.ndcamera.util.Encryption;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.HttpMethod;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
@Routes(value = "/profile", tags = {"auth","user","admin"})
public class ProfileController {

    Session session = HibernateUtil.getSessionFactory().openSession();
    ProfileService profileService = new ProfileService();

    @Route
    public String get(HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            return "frontend/profile.jsp";
        }
        return "redirect:/login";
    }

    @Route(value = "/update-profile",respondsToMethods = HttpMethod.POST)
    public String updateProfile(HttpServletRequest request){
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String contactNumber = request.getParameter("contactNumber");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String postalCode = request.getParameter("postalCode");

        UserUpdateResult userUpdateResult = profileService.updateProfileById(userId, name, contactNumber, address, city, postalCode);
        if(userUpdateResult.getUser() != null && userUpdateResult.getMessage().equals(MessageType.SUCCESS)){
            request.getSession().setAttribute("user",userUpdateResult.getUser());
            request.getSession().setAttribute("success", "Profile Updated");
        } else if (userUpdateResult.getUser() != null && userUpdateResult.getMessage().equals(MessageType.INVALID)) {
            request.getSession().setAttribute("user",userUpdateResult.getUser());
            request.getSession().setAttribute("success", "Profile Updated");
            request.getSession().setAttribute("error", "Invalid Phone");
        } else if (userUpdateResult.getUser() != null && userUpdateResult.getMessage().equals(MessageType.ALREADY_EXIST)) {
            request.getSession().setAttribute("user",userUpdateResult.getUser());
            request.getSession().setAttribute("success", "Profile Updated");
            request.getSession().setAttribute("error", "Phone Already Exist");
        } else {
            request.getSession().setAttribute("error", "User Not Found");
        }
        return "redirect:/profile";
    }

    @Route(value = "/change-password",respondsToMethods = HttpMethod.POST)
    public String changePassword(HttpServletRequest request){
        String userId = request.getParameter("userId");
        String currentPassword = Encryption.encrypt(request.getParameter("currentPassword")) ;
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");

        UserUpdateResult userUpdateResult = profileService.changePasswordByID(userId, currentPassword, newPassword, confirmNewPassword);
        if(userUpdateResult.getUser() != null && userUpdateResult.getMessage().equals(MessageType.SUCCESS)){
            request.getSession().setAttribute("user",userUpdateResult.getUser());
            request.getSession().setAttribute("success", "Password Changed");
        } else if (userUpdateResult.getMessage().equals(MessageType.CURRENT_PW_NOT_MATCH)) {
            request.getSession().setAttribute("error","Current Password Dose Not Match");
        } else if (userUpdateResult.getMessage().equals(MessageType.NEW_PW_NOT_MATCH)) {
            request.getSession().setAttribute("error","Current Password Dose Not Match");
        } else {
            request.getSession().setAttribute("error", "User Not Found");
        }
        return "redirect:/profile";
    }

    @Route(value = "/deactivate-user")
    public String deactivateUser(HttpServletRequest request){
        String userId = request.getParameter("userId");

        UserUpdateResult userUpdateResult = profileService.deactivateUserById(userId);
        if(userUpdateResult.getMessage().equals(MessageType.SUCCESS)){
            request.getSession().setAttribute("user",null);
            request.getSession().setAttribute("cartItemList", null);
            request.getSession().setAttribute("wishListItemList", null);
            return "redirect:/login";
        }else {
            request.getSession().setAttribute("error", "User Not Found");
        }
        return "redirect:/profile";
    }
}
