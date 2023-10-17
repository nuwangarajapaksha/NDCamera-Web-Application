<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: NUWAA
  Date: 6/9/2023
  Time: 11:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<layout:extends name="base">
    <layout:put block="title" type="REPLACE">
        <title>${BSUtil.getString('app-name')} - Shopping Cart</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="${BASE_URL}/assets/img/${BSUtil.getString('breadcrumb-img')}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Shopping Cart</h2>
                            <div class="breadcrumb__option">
                                <a href="./">Home</a>
                                <span>Shopping Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shoping Cart Section Begin -->
        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="total" value="0"/>
                                <c:if test="${not empty sessionScope.user}">
                                <c:forEach items="${sessionScope.cartItemList}" var="cartItem">
                                    <form action="shopping-cart/update-product-in-cart" method="post">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <a href="product-view/get-product-by-id?productId=${cartItem.product.id}">
                                        <img src="${BASE_URL}/assets/img/product/${cartItem.product.img}" style="height: 100px;width: 100px;" alt="">
                                        <h5>${cartItem.product.name}</h5>
                                        </a>
                                    </td>
                                    <td class="shoping__cart__price">
                                        LKR ${cartItem.product.price}0
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" name="qty" value="${cartItem.qty}" readonly/>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        LKR ${cartItem.product.price*cartItem.qty}0
                                    </td>
                                    <td class="shoping__cart__item__close">
<%--                                        <a href="" id="updateCart"><span class="icon_loading"></span></a>--%>
                                            <input type="hidden" name="cartItemId" value="${cartItem.id}"/>
                                            <input type="image" src="${BASE_URL}/assets/img/icon/update-icon.png" alt="Submit">
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <a href="shopping-cart/remove-product-from-cart?cartItemId=${cartItem.id}"><span class="icon_close"></span></a>
                                    </td>
                                </tr>
                                    </form>
                                    <c:set var="total" value="${total+cartItem.product.price*cartItem.qty}" />
                                </c:forEach>
                                </c:if>
                                <c:if test="${empty sessionScope.user}">
                                    <div class="col-5 mb-lg-5">
                                    <a href="login" class="primary-btn cart-btn">SIGN IN</a>
                                    </div>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a href="shop" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <h5>Cart Total</h5>
                            <ul>
                                <li>Subtotal
                                    <span>
                                        LKR ${total}0
                                    </span>
                                </li>
                                <li style="font-weight: normal">Delivery
                                    <span style="color:black;">
                                         <c:if test="${not empty sessionScope.cartItemList}">
                                            LKR ${BSUtil.getString('delivery-charges')}.00
                                         </c:if>
                                        <c:if test="${empty sessionScope.cartItemList}">
                                            LKR 00
                                        </c:if>
                                    </span></li>
                                <li>Total
                                    <span>
                                        <c:if test="${not empty sessionScope.cartItemList}">
                                            LKR ${total+BSUtil.getString('delivery-charges')}0
                                        </c:if>
                                        <c:if test="${empty sessionScope.cartItemList}">
                                            LKR 00
                                        </c:if>
                                    </span></li>
                            </ul>
                            <a href="checkout/multiple-products" class="primary-btn">PROCEED TO CHECKOUT</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->

    </layout:put>
    <layout:put block="script">
    </layout:put>
</layout:extends>
