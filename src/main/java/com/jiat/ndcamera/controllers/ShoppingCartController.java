package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.Cart;
import com.jiat.ndcamera.entity.Product;
import com.jiat.ndcamera.entity.User;
import com.jiat.ndcamera.service.CartService;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.HttpMethod;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

@Routes(value = "/shopping-cart", tags = {"auth","user","admin"})
public class ShoppingCartController {

    Session session = HibernateUtil.getSessionFactory().openSession();
    CartService cartService = new CartService();

    @Route
    public String get(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null) {
            request.getSession().setAttribute("cartItemList", cartService.getCartDataByUser(user));
        }
        return "frontend/shopping-cart.jsp";
    }

    @Route(value = "/add-product-to-cart")
    public String addProductToCart(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            String productId = request.getParameter("productId");
            int qty = 1;
            if(request.getParameter("qty") != null){
                qty = Integer.parseInt(request.getParameter("qty"));
            }
            Query<Cart> cartQuery = session.createQuery("from cart where product.id=:productId and user.id=:userId", Cart.class);
            cartQuery.setParameter("productId", Long.valueOf(productId));
            cartQuery.setParameter("userId", Long.valueOf(user.getId()));

            try{
                Cart cartProduct = cartQuery.getSingleResult();
                request.getSession().setAttribute("warning", "Product Already Added to Cart");
            }catch (NoResultException e) {
                Query<Product> productQuery = session.createQuery("from product where id=:productId", Product.class);
                productQuery.setParameter("productId", Long.valueOf(productId));

                try {
                    Product product = productQuery.getSingleResult();
                    Cart cart = new Cart();
                    cart.setProduct(product);
                    cart.setQty(qty);
                    cart.setUser(user);
                    Transaction transaction = session.beginTransaction();
                    session.save(cart);
                    transaction.commit();

                    request.getSession().setAttribute("cartItemList",cartService.getCartDataByUser(user));
                } catch (NoResultException ex) {
                    request.getSession().setAttribute("error", "Products Not Available");
                }
            }
            return "redirect:" + request.getHeader("Referer");
        }else {
            return "redirect:/login";
        }
    }

    @Route(value = "/update-product-in-cart",respondsToMethods = HttpMethod.POST)
    public String updateProductInCart(HttpServletRequest request){
        String cartItemId = request.getParameter("cartItemId");
        String qty = request.getParameter("qty");
        System.out.println("ssss"+qty);
        Query<Cart> cartQuery = session.createQuery("from cart where id=:cartItemId", Cart.class);
        cartQuery.setParameter("cartItemId", Long.valueOf(cartItemId));

        try {
            Cart cartItem = cartQuery.getSingleResult();
            cartItem.setQty(Integer.parseInt(qty));
            Transaction transaction = session.beginTransaction();
            session.update(cartItem);
            transaction.commit();

        } catch (NoResultException ex) {
            request.getSession().setAttribute("error", "Cart Product Not Available");
        }
        return "redirect:/shopping-cart";
    }

    @Route(value = "/remove-product-from-cart")
    public String removeProductFromCart(HttpServletRequest request){
        String cartItemId = request.getParameter("cartItemId");

            Query<Cart> cartQuery = session.createQuery("from cart where id=:cartItemId", Cart.class);
            cartQuery.setParameter("cartItemId", Long.valueOf(cartItemId));

                try {
                    Cart cartItem = cartQuery.getSingleResult();
                    Transaction transaction = session.beginTransaction();
                    session.delete(cartItem);
                    transaction.commit();

                } catch (NoResultException ex) {
                    request.getSession().setAttribute("error", "Cart Product Not Available");
                }
        return "redirect:/shopping-cart";
    }
}
