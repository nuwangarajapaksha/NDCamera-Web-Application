package com.jiat.ndcamera.controllers;

import org.baswell.routes.Route;
import org.baswell.routes.Routes;

import javax.servlet.http.HttpServletRequest;

@Routes(value = "/contact")
public class ContactController {
    @Route
    public String get(HttpServletRequest request){
        return "frontend/contact.jsp";
    }
}
