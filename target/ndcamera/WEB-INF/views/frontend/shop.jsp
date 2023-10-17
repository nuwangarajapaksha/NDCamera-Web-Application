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
        <title>${BSUtil.getString('app-name')} - Shop</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="${BASE_URL}/assets/img/${BSUtil.getString('breadcrumb-img')}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Shop</h2>
                            <div class="breadcrumb__option">
                                <a href="./">Home</a>
                                <span>Shop</span>
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
                                <h4>Brands</h4>
                                <ul>
                                    <li><a href="shop/get-product-by-name?search=">All</a></li>
                                    <c:forEach items="${sessionScope.brandList}" var="brand">
                                        <li><a href="shop/get-product-by-brand?brandId=${brand.id}">${brand.name}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="sidebar__item">
                                <h4>Price</h4>
                                <div class="price-range-wrap">
                                    <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                         data-min="1000" data-max="10000000">
                                        <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                        <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                        <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    </div>
                                    <div class="range-slider">
                                        <div class="price-input text-danger font-weight-bold">
                                            <form action="shop/get-product-by-price" method="get">
                                            <input type="text" id="minamount" name="minAmount">
                                            <input type="text" id="maxamount" name="maxAmount">
                                            <input type="image" class="ml-3" src="${BASE_URL}/assets/img/icon/update-icon.png" alt="Submit">
<%--                                            <button class="btn btn-danger" type="submit">Search</button></a>--%>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                        <div class="product__discount">
                            <div class="section-title product__discount__title">
                                <h2>Sale Off</h2>
                            </div>
                            <div class="row">
                                <div class="product__discount__slider owl-carousel">
                                    <c:forEach items="${sessionScope.productList}" var="product" begin="0" end="11">
                                    <div class="col-lg-4">
                                        <div class="product__discount__item">
                                            <div class="product__discount__item__pic set-bg" data-setbg="${BASE_URL}/assets/img/product/${product.img}">
                                                <div class="product__discount__percent">-20%</div>
                                                <ul class="product__item__pic__hover">
                                                    <li><a href="product-view/get-product-by-id?productId=${product.id}"><i class="fa fa-shopping-bag card_icon_element"></i></a></li>
                                                    <li><a href="shopping-cart/add-product-to-cart?productId=${product.id}"><i class="fa fa-shopping-cart card_icon_element"></i></a></li>
                                                    <li><a href="wish-list/add-product-to-wish-list?productId=${product.id}"><i class="fa fa-heart card_icon_element"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="product__discount__item__text">
                                                <span>${product.brand.name}</span>
                                                <h5><a href="product-view/get-product-by-id?productId=${product.id}">${product.name}</a></h5>
                                                <div class="product__item__price">LKR ${product.price}0<span></span></div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
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
                                                <c:forEach items="${sessionScope.productList}" var="product" varStatus="status">
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
                            <c:forEach items="${sessionScope.productList}" var="product">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="${BASE_URL}/assets/img/product/${product.img}">
                                        <ul class="product__item__pic__hover">
                                            <li><a href="product-view/get-product-by-id?productId=${product.id}"><i class="fa fa-shopping-bag card_icon_element"></i></a></li>
                                            <li><a href="shopping-cart/add-product-to-cart?productId=${product.id}"><i class="fa fa-shopping-cart card_icon_element"></i></a></li>
                                            <li><a href="wish-list/add-product-to-wish-list?productId=${product.id}"><i class="fa fa-heart card_icon_element"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="product-view/get-product-by-id?productId=${product.id}">${product.name}</a></h6>
                                        <h5>LKR ${product.price}0</h5>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
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
