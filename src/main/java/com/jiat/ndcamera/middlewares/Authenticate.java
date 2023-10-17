package com.jiat.ndcamera.middlewares;

import org.baswell.routes.AfterRoute;
import org.baswell.routes.BeforeRoute;

import javax.servlet.http.HttpServletRequest;

public abstract class Authenticate {

    @BeforeRoute(onlyTags = "auth")
    public void checkAuth(HttpServletRequest request){
        System.out.println("CheckAuth.....");
    }
}
