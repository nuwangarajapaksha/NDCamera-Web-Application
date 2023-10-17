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
<layout:extends name="admin-base">
    <layout:put block="title" type="REPLACE">
        <title>${BSUtil.getString('app-name')} - Admin - Business Settings</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 fw-bold">Business Settings</h1>

                <section class="mt-4">
                    <div class="checkout__form">
                        <h4>Update Business Settings</h4>
                        <form action="admin-business-settings/update-business-settings" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-lg-8 col-md-6">
                                    <h5 class="mt-2">Application</h5>
                                    <div class="border-top my-4 mt-0"></div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Application Name<span>*</span></p>
                                                <input type="text" name="appName" value="${BSUtil.getString('app-name')}" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Logo</p>
                                                <input type="file" class="form-control" name="logoImg" value="${BSUtil.getString('logo')}" accept=".jpg, .jpeg, .png">
                                            </div>
                                        </div>
                                    </div>
                                    <h5 class="mt-4">Contacts</h5>
                                    <div class="border-top my-4 mt-0"></div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="checkout__input">
                                                <p>Email<span>*</span></p>
                                                <input type="email" name="email" value="${BSUtil.getString('email')}" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="checkout__input">
                                                <p>Phone<span>*</span></p>
                                                <input type="tel" name="contactNumber" value="${BSUtil.getString('contact-number')}" accept=".jpg, .jpeg, .png" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="checkout__input">
                                                <p>Open Time</p>
                                                <input type="text" name="openTime" value="${BSUtil.getString('open-time')}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="checkout__input">
                                        <p>Address</p>
                                        <input type="text"  name="address" value="${BSUtil.getString('address')}">
                                    </div>
                                    <div class="checkout__input">
                                        <p>Location</p>
                                        <input type="url" name="location" value="${BSUtil.getString('location')}">
                                    </div>
                                    <h5 class="mt-5">Slider</h5>
                                    <div class="border-top my-4 mt-0"></div>
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="checkout__input">
                                                <p>Slider Title<span>*</span></p>
                                                <input type="text" name="sliderTitle" value="${BSUtil.getString('slider-title')}" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="checkout__input">
                                                <p>Slider Subtitle<span>*</span></p>
                                                <input type="text" name="sliderSubTitle" value="${BSUtil.getString('slider-subtitle')}" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="checkout__input">
                                                <p>Slider Caption</p>
                                                <input type="text" name="sliderCaption" value="${BSUtil.getString('slider-caption')}">
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="checkout__input">
                                                <p>Slider Image</p>
                                                <input type="file" class="form-control" name="sliderImg" value="${BSUtil.getString('slider-img')}" accept=".jpg, .jpeg, .png">
                                            </div>
                                        </div>
                                    </div>
                                    <h5 class="mt-4">Banner</h5>
                                    <div class="border-top my-4 mt-0"></div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="checkout__input">
                                                <p>Home Banner 1</p>
                                                <input type="file" class="form-control" name="homeBanner1Img" value="${BSUtil.getArray('home-banner-img',',')[0]}" accept=".jpg, .jpeg, .png">
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="checkout__input">
                                                <p>Home Banner 2</p>
                                                <input type="file" class="form-control" name="homeBanner2Img" value="${BSUtil.getArray('home-banner-img',',')[1]}" accept=".jpg, .jpeg, .png">
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="checkout__input">
                                                <p>Bread Crumb</p>
                                                <input type="file" class="form-control" name="breadCrumbImg" value="${BSUtil.getString('breadcrumb-img')}" accept=".jpg, .jpeg, .png">
                                            </div>
                                        </div>
                                    </div>
                                    <h5 class="mt-4">Delivery</h5>
                                    <div class="border-top my-4 mt-0"></div>
                                    <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Nav Caption<span>*</span></p>
                                            <input type="text" name="navCaption" value="${BSUtil.getString('nav-caption')}" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Delivery Charges<span>*</span></p>
                                            <input type="number"  name="deliveryCharges" value="${BSUtil.getString('delivery-charges')}" accept=".jpg, .jpeg, .png" required>
                                        </div>
                                    </div>
                                    </div>
                                    <button type="submit" class="site-btn">Update</button>
                                    <br>
                                    <br>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </main>
    </layout:put>
</layout:extends>
