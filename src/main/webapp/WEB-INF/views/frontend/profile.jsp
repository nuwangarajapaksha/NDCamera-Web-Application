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
        <title>${BSUtil.getString('app-name')} - Profile</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="${BASE_URL}/assets/img/${BSUtil.getString('breadcrumb-img')}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Profile</h2>
                            <div class="breadcrumb__option">
                                <a href="./">Home</a>
                                <span>Profile</span>
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
                <div class="checkout__form">
                    <h4>Profile Details</h4>
                    <form action="profile/update-profile" method="post">
                        <div class="row">
                            <div class="col-lg-8 col-md-6">
                                <div class="checkout__input">
                                    <p>Name<span>*</span></p>
                                    <input type="text" name="name" value="${sessionScope.user.name}" required>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <input type="email" name="email" value="${sessionScope.user.email}" disabled required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Phone</p>
                                            <input type="tel" name="contactNumber" value="${sessionScope.user.contact_number}">
                                        </div>
                                    </div>
                                </div>
                                <div class="checkout__input">
                                    <p>Address</p>
                                    <input type="text" name="address" value="${sessionScope.user.address}">
                                </div>
                                <div class="checkout__input">
                                    <p>Town/City</p>
                                    <input type="text" name="city" value="${sessionScope.user.city}">
                                </div>
                                <div class="checkout__input">
                                    <p>Postal Code / ZIP</p>
                                    <input type="text" name="postalCode" value="${sessionScope.user.postal_code}">
                                </div>
                                <input type="hidden" name="userId" value="${sessionScope.user.id}">
                                <button type="submit" class="site-btn">UPDATE</button>
                                <br>
                                <br>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- Checkout Section End -->
        <!-- Checkout Section Begin -->
        <section >
            <div class="container">
                <div class="checkout__form">
                    <h4>Change Password</h4>
                    <form action="profile/change-password" method="post">
                        <div class="row">
                            <div class="col-lg-8 col-md-6">
                                <div class="checkout__input">
                                    <p>Current Password<span>*</span></p>
                                    <input type="password" name="currentPassword" value="" required>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>New Password<span>*</span></p>
                                            <input type="password" name="newPassword" value="" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Confirm New Password<span>*</span></p>
                                            <input type="password" name="confirmNewPassword" value="" required>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="userId" value="${sessionScope.user.id}">
                                <button type="submit" class="site-btn">Change Password</button>
                                <br>
                                <br>
                                <a href="profile/deactivate-user?userId=${sessionScope.user.id}" class="text-primary">Deactivate</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- Checkout Section End -->
    </layout:put>
</layout:extends>
