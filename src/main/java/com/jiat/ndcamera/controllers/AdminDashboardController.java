package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.entity.UserType;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;

import javax.servlet.http.HttpServletRequest;

@Routes(value = "/admin", tags = {"auth","admin"})
public class AdminDashboardController {
    @Route
    public String get(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            if(user.getUserType().equals(UserType.ADMIN)){
//                return "frontend/admin/dashboard.jsp";
                return "redirect:/admin-orders";
            }
            return "redirect:/";
        }
        return "redirect:/login";
    }
}
