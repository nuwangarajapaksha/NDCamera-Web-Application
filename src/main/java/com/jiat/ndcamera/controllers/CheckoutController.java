package com.jiat.ndcamera.controllers;

import com.jiat.ndcamera.entity.*;
import com.jiat.ndcamera.service.CartService;
import com.jiat.ndcamera.util.HibernateUtil;
import org.baswell.routes.HttpMethod;
import org.baswell.routes.Route;
import org.baswell.routes.Routes;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.util.Collections;
import java.util.List;

@Routes(value = "/checkout", tags = {"auth","user","admin"})
public class CheckoutController {

    Session session = HibernateUtil.getSessionFactory().openSession();
    CartService cartService = new CartService();
    @Route
    public String get(HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("user");
        if(user != null ){
            return "frontend/checkout.jsp";
        }
        return "redirect:/login";
    }

    @Route(value = "/multiple-products")
    public String checkoutMultipleProducts(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            List<Cart> cartData = cartService.getCartDataByUser(user);
            if (cartData != null && cartData.size() > 0) {
                request.getSession().setAttribute("checkoutItemList", cartData);
                request.getSession().setAttribute("checkoutType", "multiple");
                return "redirect:/checkout";
            }
        }
        return "redirect:" + request.getHeader("Referer");
    }

    @Route(value = "/single-product")
    public String checkoutSingleProduct(HttpServletRequest request) {
        String productId = request.getParameter("productId");
        String qty = request.getParameter("qty");
        User user = (User) request.getSession().getAttribute("user");
        if(user != null) {
            Query<Product> productQuery = session.createQuery("from product where id=:productId", Product.class);
            productQuery.setParameter("productId", Long.valueOf(productId));
            try {
                Product product = productQuery.getSingleResult();
                Checkout checkout = new Checkout();
                checkout.setProduct(product);
                checkout.setQty(Integer.parseInt(qty));
                List<Checkout> checkoutItemList = Collections.singletonList(checkout);

                request.getSession().setAttribute("checkoutItemList", checkoutItemList);
                request.getSession().setAttribute("checkoutType", "single");
                return "redirect:/checkout";
            } catch (NoResultException e) {
                request.getSession().setAttribute("error", "Product Not Available");
            }

        }
        return "redirect:/login";
    }

    @Route(value = "/place-order", respondsToMethods = HttpMethod.POST)
    public String placeOrder(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Checkout> checkoutItemList = (List<Checkout>) request.getSession().getAttribute("checkoutItemList");
        List<Cart> cartData = cartService.getCartDataByUser(user);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String postalCode = request.getParameter("postalCode");
        String note = request.getParameter("note");
        String paymentType = request.getParameter("paymentType");
        String delivery = request.getParameter("delivery");
        String totalAmount = request.getParameter("totalAmount");
        String checkoutType = request.getParameter("checkoutType");
        String itemCount = request.getParameter("itemCount");

        Query query = session.createQuery("SELECT id FROM orders ORDER BY id DESC");
        query.setMaxResults(1);
        Long nextOrderId = null;
        try{
            nextOrderId = (Long) query.getSingleResult() + 1;

        }catch (NoResultException e){
            nextOrderId = Long.valueOf(1);
        }

        PlaceOrder placeOrder = new PlaceOrder();
        placeOrder.setId(nextOrderId);
        placeOrder.setName(name);
        placeOrder.setEmail(email);
        placeOrder.setContactNumber(contactNumber);
        placeOrder.setAddress(address);
        placeOrder.setCity(city);
        placeOrder.setPostalCode(postalCode);
        placeOrder.setNote(note);
        placeOrder.setDelivery(delivery);
        placeOrder.setTotalAmount(totalAmount);
        placeOrder.setCheckoutType(checkoutType);
        placeOrder.setItemCount(itemCount);
        placeOrder.setPaymentType(paymentType);
        request.getSession().setAttribute("placeOrder", placeOrder);

        if(paymentType.equals("Card")){
        String merchantId = "1223720"; // Your merchant ID
        String merchantSecret = "MzU4NTUyOTM5MzQxNjA2MDkwMzMxNjYwODY4NDQyNzgyMDQ1MzYz";
        String returnUrl = "http://localhost:8080/ndcamera/checkout-complete";
        String cancelUrl = "http://localhost:8080/ndcamera/checkout";
        String notifyUrl = "http://localhost:8080/ndcamera/checkout-complete";
        String orderId = String.valueOf(nextOrderId);
        String items = null;
        if(checkoutType.equals("multiple")){
            for (Cart cartItem : cartData) {
                if(items == null){
                    items = cartItem.getProduct().getName();
                }else {
                    items = items + ", " + cartItem.getProduct().getName();
                }
            }
        }else {
            for (Checkout checkoutItem : checkoutItemList) {
                if(items == null){
                    items = checkoutItem.getProduct().getName();
                }else {
                    items = items + ", " + checkoutItem.getProduct().getName();
                }
            }
        }
        String currency = "LKR";
        String country = "Sri Lanka";
        DecimalFormat df       = new DecimalFormat("0.00");
        String amountFormatted = df.format(Double.valueOf(totalAmount));
        String hash    = getMd5(merchantId + orderId + amountFormatted + currency + getMd5(merchantSecret));
        System.out.println("Generated Hash: " + hash);

        String formContent = "<html><body>" +
                "<form id=\"payhereForm\" method=\"post\" action=\"https://sandbox.payhere.lk/pay/checkout\">" +
                "<input type=\"hidden\" name=\"merchant_id\" value=\"" + merchantId + "\">" +
                "<input type=\"hidden\" name=\"return_url\" value=\"" + returnUrl + "\">" +
                "<input type=\"hidden\" name=\"cancel_url\" value=\"" + cancelUrl + "\">" +
                "<input type=\"hidden\" name=\"notify_url\" value=\"" + notifyUrl + "\">" +
                "<input type=\"hidden\" name=\"order_id\" value=\"" + orderId + "\">" +
                "<input type=\"hidden\" name=\"items\" value=\"" + items + "\">" +
                "<input type=\"hidden\" name=\"currency\" value=\"" + currency + "\">" +
                "<input type=\"hidden\" name=\"amount\" value=\"" + totalAmount + "\">" +
                "<input type=\"hidden\" name=\"first_name\" value=\"" + name + "\">" +
                "<input type=\"hidden\" name=\"last_name\" value=\"" + name + "\">" +
                "<input type=\"hidden\" name=\"email\" value=\"" + email + "\">" +
                "<input type=\"hidden\" name=\"phone\" value=\"" + contactNumber + "\">" +
                "<input type=\"hidden\" name=\"address\" value=\"" + address + "\">" +
                "<input type=\"hidden\" name=\"city\" value=\"" + city + "\">" +
                "<input type=\"hidden\" name=\"country\" value=\"" + country + "\">" +
                "<input type=\"hidden\" name=\"hash\" value=\"" + hash + "\">" +
                "</form>" +
                "<script>document.getElementById('payhereForm').submit();</script>" +
                "</body></html>";

        response.setContentType("text/html");

        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        out.println(formContent);
        out.close();
            return null;
        }else {
            return "redirect:/checkout-complete";
        }
    }

    public static String getMd5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext.toUpperCase();
        }
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

}
