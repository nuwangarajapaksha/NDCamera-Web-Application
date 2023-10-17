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
        <title>${BSUtil.getString('app-name')} - Wish List</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="${BASE_URL}/assets/img/${BSUtil.getString('breadcrumb-img')}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Wish List</h2>
                            <div class="breadcrumb__option">
                                <a href="./">Home</a>
                                <span>Wish List</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-5">
                        <div class="sidebar">
                            <div class="sidebar__item">
                                <div class="latest-product__text">
                                    <h4>Latest Products</h4>
                                    <div class="latest-product__slider owl-carousel">
                                        <div class="latest-prdouct__slider__item">
                                            <c:forEach items="${sessionScope.productList}" var="product" begin="0" end="2">
                                            <a href="product-view/get-product-by-id?productId=${product.id}" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="${BASE_URL}/assets/img/product/${product.img}" alt="">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${product.name}</h6>
                                                    <span>LKR ${product.price}0</span>
                                                </div>
                                            </a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-7">
                        <div class="filter__item">
                            <div class="row">
                                <div class="col-lg-4 col-md-5">
                                    <div class="filter__sort">
                                        <span>Sort By</span>
                                        <select>
                                            <option value="0">Default</option>
<%--                                            <option value="0">Default</option>--%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="filter__found">
                                        <h6>
                                            <span>
                                                <c:forEach items="${sessionScope.wishListItemList}" var="wishListItem" varStatus="status">
                                                    <c:set var="c" value="${status.count}" />
                                                </c:forEach>
                                                ${c}
                                            </span> Products found</h6>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-3">
                                    <div class="filter__option">
                                        <span class="icon_grid-2x2"></span>
                                        <span class="icon_ul"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <c:if test="${not empty sessionScope.user}">
                            <c:forEach items="${sessionScope.wishListItemList}" var="wishListItem">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="${BASE_URL}/assets/img/product/${wishListItem.product.img}">
                                        <ul class="product__item__pic__hover">
                                            <li><a href="product-view/get-product-by-id?productId=${wishListItem.product.id}"><i class="fa fa-shopping-bag card_icon_element"></i></a></li>
                                            <li><a href="shopping-cart/add-product-to-cart?productId=${wishListItem.product.id}"><i class="fa fa-shopping-cart card_icon_element"></i></a></li>
                                            <li><a href="wish-list/remove-product-from-wish-list?wishListItemId=${wishListItem.id}"><i class="fa fa-trash card_icon_element"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="product-view/get-product-by-id?productId=${wishListItem.product.id}">${wishListItem.product.name}</a></h6>
                                        <h5>LKR ${wishListItem.product.price}0</h5>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty sessionScope.user}">
                                <div class="col-5 mb-lg-5">
                                    <a href="login" class="primary-btn cart-btn">SIGN IN</a>
                                </div>
                            </c:if>
                        </div>
                        <div class="product__pagination">
                            <a href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Section End -->

    </layout:put>
</layout:extends>
