package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.MessageType;
import com.jiat.ndcamera.entity.UserUpdateResult;
import com.jiat.ndcamera.service.RegistrationService;
import org.baswell.routes.HttpMethod;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;

import javax.servlet.http.HttpServletRequest;

@Routes(value = "/user-register")
public class RegistrationController {
    @Route
    public String get(HttpServletRequest request){
        return "frontend/auth/register.jsp";
    }

    @Route(value = "/register-user", respondsToMethods = HttpMethod.POST)
    public String register(HttpServletRequest request){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String userType = request.getParameter("userType");

        RegistrationService registrationService = new RegistrationService();
        UserUpdateResult userUpdateResult = registrationService.register(name, email, password, confirmPassword, userType);
        if(userUpdateResult.getMessage().equals(MessageType.SUCCESS)){
            return "redirect:/login";
        } else if (userUpdateResult.getMessage().equals(MessageType.ALREADY_EXIST)) {
            request.getSession().setAttribute("error","Email already exist");
        } else if (userUpdateResult.getMessage().equals(MessageType.NEW_PW_NOT_MATCH)){
            request.getSession().setAttribute("error","Passwords Do Not Match");
        }
        return "redirect:/user-register";
    }
}
