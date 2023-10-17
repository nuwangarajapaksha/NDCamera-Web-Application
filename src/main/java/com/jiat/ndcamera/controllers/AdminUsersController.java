package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.MessageType;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.entity.UserType;
import com.jiat.ndcamera.entity.UserUpdateResult;
import com.jiat.ndcamera.service.ProfileService;
import com.jiat.ndcamera.service.RegistrationService;
import com.jiat.ndcamera.service.UserService;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.HttpMethod;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

@Routes(value = "/admin-users", tags = {"auth","admin"})
public class AdminUsersController {

    Session session = HibernateUtil.getSessionFactory().openSession();
    ProfileService profileService = new ProfileService();
    @Route
    public String get(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            if(user.getUserType().equals(UserType.ADMIN)){
                request.getSession().setAttribute("userList", new UserService().getAllUsers());
                return "frontend/admin/users.jsp";
            }
            return "redirect:/";
        }
        return "redirect:/login";
    }

    @Route(value = "/register-admin", respondsToMethods = HttpMethod.POST)
    public String register(HttpServletRequest request){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String userType = request.getParameter("userType");

        RegistrationService registrationService = new RegistrationService();
        UserUpdateResult userUpdateResult = registrationService.register(name, email, password, confirmPassword, userType);
        if(userUpdateResult.getMessage().equals(MessageType.SUCCESS)){
            request.getSession().setAttribute("success","User Added");
        } else if (userUpdateResult.getMessage().equals(MessageType.ALREADY_EXIST)) {
            request.getSession().setAttribute("error","Email already exist");
        } else if (userUpdateResult.getMessage().equals(MessageType.NEW_PW_NOT_MATCH)){
            request.getSession().setAttribute("error","Password Dose Not Match");
        }
        return "redirect:/admin-users";
    }

    @Route(value = "/update-user", respondsToMethods = HttpMethod.POST)
    public String updateUser(HttpServletRequest request){
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String contactNumber = request.getParameter("contactNumber");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String postalCode = request.getParameter("postalCode");
        String userType = request.getParameter("userType");

        UserUpdateResult userUpdateResult = profileService.updateProfileById(userId, name, contactNumber, address, city, postalCode);
        if(userUpdateResult.getUser() != null && userUpdateResult.getMessage().equals(MessageType.SUCCESS)){
            request.getSession().setAttribute("success", "User Updated");
        } else if (userUpdateResult.getUser() != null && userUpdateResult.getMessage().equals(MessageType.INVALID)) {
            request.getSession().setAttribute("success", "User Updated");
            request.getSession().setAttribute("error", "Invalid Phone");
        } else if (userUpdateResult.getUser() != null && userUpdateResult.getMessage().equals(MessageType.ALREADY_EXIST)) {
            request.getSession().setAttribute("success", "User Updated");
            request.getSession().setAttribute("error", "Phone Already Exist");
        }else {
            request.getSession().setAttribute("error", "User Not Found");
        }
        return "redirect:/admin-users";
    }

    @Route(value = "/remove-user")
    public String removeUser(HttpServletRequest request){
        String userId = request.getParameter("userId");
        Query<User> query = session.createQuery("from users where id=:userId", User.class);
        query.setParameter("userId", Long.valueOf(userId));
        try{
            User user = query.getSingleResult();
            User currentUser = (User) request.getSession().getAttribute("user");

            if(user.getId() == currentUser.getId()){
                request.getSession().setAttribute("error","You Can't Delete Your Account");
                return "redirect:/admin-users";
            }

            UserUpdateResult userUpdateResult = profileService.deactivateUserById(userId);
            if(userUpdateResult.getMessage().equals(MessageType.SUCCESS)){
                request.getSession().setAttribute("success","User Removed");
            }else {
                request.getSession().setAttribute("error", "User Not Found");
            }
        }catch (NoResultException e){
            request.getSession().setAttribute("error","User Not Found");
        }
        return "redirect:/admin-users";
    }
}
