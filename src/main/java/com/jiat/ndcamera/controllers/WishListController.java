package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.Product;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.entity.WishList;
import com.jiat.ndcamera.service.WishListService;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

@Routes(value = "/wish-list", tags = {"auth","user","admin"})
public class WishListController {
    Session session = HibernateUtil.getSessionFactory().openSession();
    WishListService wishListService = new WishListService();

    @Route
    public String get(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null) {
            request.getSession().setAttribute("wishListItemList", wishListService.getWishListDataByUser(user));
        }
        return "frontend/wish-list.jsp";
    }

    @Route(value = "/add-product-to-wish-list")
    public String addProductToWishList(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            String productId = request.getParameter("productId");

            Query<WishList> wishListQuery = session.createQuery("from wishlist where product.id=:productId and user.id=:userId", WishList.class);
            wishListQuery.setParameter("productId", Long.valueOf(productId));
            wishListQuery.setParameter("userId", Long.valueOf(user.getId()));

            try{
                WishList wishListProduct = wishListQuery.getSingleResult();
                request.getSession().setAttribute("warning", "Product Already Added to Wish List");
            }catch (NoResultException e) {
                Query<Product> productQuery = session.createQuery("from product where id=:productId", Product.class);
                productQuery.setParameter("productId", Long.valueOf(productId));

                try {
                    Product product = productQuery.getSingleResult();
                    WishList wishList = new WishList();
                    wishList.setProduct(product);
                    wishList.setUser(user);
                    Transaction transaction = session.beginTransaction();
                    session.save(wishList);
                    transaction.commit();

                    request.getSession().setAttribute("wishListItemList",wishListService.getWishListDataByUser(user));
                } catch (NoResultException ex) {
                    request.getSession().setAttribute("error", "Products Not Available");
                }
            }
            return "redirect:" + request.getHeader("Referer");
        }else {
            return "redirect:/login";
        }
    }

    @Route(value = "/remove-product-from-wish-list")
    public String removeProductFromWishList(HttpServletRequest request){
        String wishListItemId = request.getParameter("wishListItemId");

        Query<WishList> wishListQuery = session.createQuery("from wishlist where id=:wishListItemId", WishList.class);
        wishListQuery.setParameter("wishListItemId", Long.valueOf(wishListItemId));

        try {
            WishList wishListItem = wishListQuery.getSingleResult();
            Transaction transaction = session.beginTransaction();
            session.delete(wishListItem);
            transaction.commit();

        } catch (NoResultException ex) {
            request.getSession().setAttribute("error", "Cart Product Not Available");
        }
        return "redirect:/wish-list";
    }
}
