<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: NUWAA
  Date: 6/9/2023
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<layout:extends name="base">
    <layout:put block="title" type="REPLACE">
        <title>${BSUtil.getString('app-name')} - Checkout</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="${BASE_URL}/assets/img/${BSUtil.getString('breadcrumb-img')}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Checkout</h2>
                            <div class="breadcrumb__option">
                                <a href="./">Home</a>
                                <span>Checkout</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Checkout Section Begin -->
        <section class="checkout spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                        </h6>
                    </div>
                </div>
                <div class="checkout__form">
                    <h4>Billing Details</h4>
                    <form action="checkout/place-order" method="post">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="checkout__input">
                                    <p>Name<span>*</span></p>
                                    <input type="text" name="name" value="${sessionScope.user.name}" required>
                                </div>
                                <div class="checkout__input">
                                    <p>Address<span>*</span></p>
                                    <input type="text" placeholder="Street Address" name="address" value="${sessionScope.user.address}" required>
                                </div>
                                <div class="checkout__input">
                                    <p>Town/City<span>*</span></p>
                                    <input type="text" name="city" value="${sessionScope.user.city}" required>
                                </div>
                                <div class="checkout__input">
                                    <p>Postal Code / ZIP<span>*</span></p>
                                    <input type="text" name="postalCode" value="${sessionScope.user.postal_code}" required>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Phone<span>*</span></p>
                                            <input type="tel" name="contactNumber" value="${sessionScope.user.contact_number}" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <input type="email" name="email" value="${sessionScope.user.email}" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="checkout__input">
                                    <p>Order notes</p>
                                    <input type="text" name="note" placeholder="Notes about your order, e.g. special notes for delivery.">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="checkout__order">
                                    <h4>Your Order</h4>
                                    <div class="checkout__order__products">Products <span>Total</span></div>
                                    <ul>
                                        <c:set var="total" value="0"/>
                                        <c:set var="itemCount" value="0"/>
                                        <c:forEach items="${sessionScope.checkoutItemList}" var="checkoutItem">
                                        <li>${checkoutItem.product.name}<br>
                                            LKR ${checkoutItem.product.price}0 &nbsp;&nbsp; x${checkoutItem.qty} <span>LKR ${checkoutItem.product.price*checkoutItem.qty}0</span></li>
                                            <c:set var="total" value="${total+checkoutItem.product.price*checkoutItem.qty}" />
                                            <c:set var="itemCount" value="${itemCount + 1}" />
                                        </c:forEach>
                                    </ul>
                                    <div class="checkout__order__subtotal">Subtotal <span>LKR ${total}0</span></div>
                                    <ul>
                                            <li>Delivery <span>LKR ${BSUtil.getString('delivery-charges')}.00</span></li>
                                    </ul>
                                    <div class="checkout__order__total">Total Amount <span>LKR ${total + BSUtil.getString('delivery-charges')}0</span></div>
                                    <div class="checkout__input__checkbox">
                                        <label for="payment">
                                            Cash On Delivery
                                            <input type="radio" id="payment" name="paymentType" value="Cash On Delivery">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="checkout__input__checkbox">
                                        <label for="paypal">
                                            Card
                                            <input type="radio" id="paypal" name="paymentType" value="Card" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <input type="hidden" name="delivery" value="${BSUtil.getString('delivery-charges')}">
                                    <input type="hidden" name="totalAmount" value="${total + BSUtil.getString('delivery-charges')}">
                                    <input type="hidden" name="checkoutType" value="${checkoutType}">
                                    <input type="hidden" name="itemCount" value="${itemCount}">

                                    <button type="submit" class="site-btn">PLACE ORDER</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- Checkout Section End -->

    </layout:put>
</layout:extends>
