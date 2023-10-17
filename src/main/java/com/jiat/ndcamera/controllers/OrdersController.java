package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.service.OrderService;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;

import javax.servlet.http.HttpServletRequest;

@Routes(value = "/orders", tags = {"auth","user","admin"})
public class OrdersController {
    @Route
    public String get(HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            request.getSession().setAttribute("orderList", new OrderService().getAllOrders());
            request.getSession().setAttribute("orderItemList", new OrderService().getAllOrderItems());
            return "frontend/orders.jsp";
        }
        return "redirect:/login";
    }
}
