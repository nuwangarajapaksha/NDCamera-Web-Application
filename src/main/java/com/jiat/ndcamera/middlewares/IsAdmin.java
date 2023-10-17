package com.jiat.ndcamera.middlewares;

import com.jiat.ndcamera.entity.User;
import org.baswell.routes.BeforeRoute;
import org.baswell.routes.RedirectTo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public abstract class IsAdmin extends Authenticate{

    @BeforeRoute(exceptTags = "any", onlyTags = {"user","admin"})
    public void handle(HttpServletRequest request){
        System.out.println("IsAdmin: handle");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user != null && user.getUserType().toString().equals("ADMIN")){

        }else {
            throw new RedirectTo("/");
        }
    }
}
