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
        <title>${BSUtil.getString('app-name')} - Checkout Complete</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="${BASE_URL}/assets/img/${BSUtil.getString('breadcrumb-img')}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Checkout Complete</h2>
                            <div class="breadcrumb__option">
                                <a href="./">Home</a>
                                <span>Checkout Complete</span>
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
                        <div class="shoping__cart__btns">
                            <a href="shop" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                            <a href="orders" class="primary-btn cart-btn ml-4">VIEW ORDERS</a>
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
