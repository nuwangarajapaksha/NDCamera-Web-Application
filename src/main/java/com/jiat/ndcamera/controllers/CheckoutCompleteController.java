package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.*;
import com.jiat.ndcamera.service.CartService;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Routes(value = "/checkout-complete", tags = {"auth","user","admin"})
public class CheckoutCompleteController {
    @Route
    public String get(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            Session session = HibernateUtil.getSessionFactory().openSession();
            PlaceOrder placeOrder = (PlaceOrder) request.getSession().getAttribute("placeOrder");

            if(placeOrder != null){
                try {
                    Order order = new Order();
                    order.setId(placeOrder.getId());
                    order.setUser(user);
                    order.setName(placeOrder.getName());
                    order.setAddress(placeOrder.getAddress());
                    order.setCity(placeOrder.getCity());
                    order.setPostal_code(placeOrder.getPostalCode());
                    order.setTotalAmount(Double.valueOf(placeOrder.getTotalAmount()));
                    order.setDelivery(Double.valueOf(placeOrder.getDelivery()));
                    order.setEmail(placeOrder.getEmail());
                    order.setContact_number(placeOrder.getContactNumber());
                    order.setNote(placeOrder.getNote());
                    order.setPaymentType(placeOrder.getPaymentType());
                    order.setStatus("PROCESSING");
                    order.setItem_count(Integer.parseInt(placeOrder.getItemCount()));
                    Transaction transaction = session.beginTransaction();
                    session.save(order);
                    transaction.commit();

                    if(placeOrder.getCheckoutType().equals("multiple")){
                        CartService cartService = new CartService();
                        List<Cart> cartData = cartService.getCartDataByUser(user);
                        for (Cart cartItem : cartData) {
                            OrderItem orderItem = new OrderItem();
                            orderItem.setProduct(cartItem.getProduct());
                            orderItem.setQty(cartItem.getQty());
                            orderItem.setOrder(order);
                            Transaction transaction1 = session.beginTransaction();
                            session.save(orderItem);
                            transaction1.commit();

                            Query<Cart> cartQuery = session.createQuery("from cart where id=:cartItemId", Cart.class);
                            cartQuery.setParameter("cartItemId", cartItem.getId());
                            Cart currentCartItem = cartQuery.getSingleResult();
                            Transaction transaction2 = session.beginTransaction();
                            session.delete(currentCartItem);
                            transaction2.commit();
                        }
                        request.getSession().setAttribute("cartItemList", cartService.getCartDataByUser(user));
                    }else {
                        List<Checkout> checkoutItemList = (List<Checkout>) request.getSession().getAttribute("checkoutItemList");
                        for (Checkout checkoutItem : checkoutItemList) {
                            OrderItem orderItem = new OrderItem();
                            orderItem.setProduct(checkoutItem.getProduct());
                            orderItem.setQty(checkoutItem.getQty());
                            orderItem.setOrder(order);
                            Transaction transaction1 = session.beginTransaction();
                            session.save(orderItem);
                            transaction1.commit();
                        }
                    }
                    request.getSession().setAttribute("placeOrder", null);
                    request.getSession().setAttribute("checkoutItemList", null);
                    request.getSession().setAttribute("success", "Checkout Completed");
                    return "frontend/checkout-complete.jsp";
                }catch (Exception ex){
                    request.getSession().setAttribute("error", "Checkout Failed");
                    return "redirect:/checkout";
                }
            }else {
                return "redirect:/shop";
            }
        }
        return "redirect:/login";
    }
}
