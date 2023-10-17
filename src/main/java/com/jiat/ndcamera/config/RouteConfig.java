package com.jiat.ndcamera.config;

import com.jiat.ndcamera.controllers.*;
import org.baswell.routes.RoutesConfiguration;
import org.baswell.routes.RoutesFilter;
import org.baswell.routes.RoutingTable;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

//@WebFilter(filterName = "RoutesFilter", urlPatterns = "/*")
@WebFilter(filterName = "RoutesFilter", urlPatterns = "/*",
        initParams = {
                @WebInitParam(name = "EXCEPT", value = "/assets/.*")
        })
public class RouteConfig extends RoutesFilter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        super.init(filterConfig);
        System.out.println("init...");

        RoutesConfiguration configuration = new RoutesConfiguration();
        configuration.rootForwardPath = "/WEB-INF/views";

        RoutingTable routing = new RoutingTable(configuration);
        routing
                .add(new HomeController())
                .add(new LoginController())
                .add(new RegistrationController())
                .add(new EmailVerificationController())
                .add(new BlogController())
                .add(new CheckoutController())
                .add(new ContactController())
                .add(new ProductViewController())
                .add(new ShopController())
                .add(new ShoppingCartController())
                .add(new WishListController())
                .add(new ProfileController())
                .add(new AdminDashboardController())
                .add(new AdminProfileController())
                .add(new AdminUsersController())
                .add(new AdminProductsController())
                .add(new AdminBrandsController())
                .add(new AdminBusinessSettingsController())
                .add(new AdminOrdersController())
                .add(new OrdersController())
                .add(new CheckoutCompleteController())
                .build();
    }
}
