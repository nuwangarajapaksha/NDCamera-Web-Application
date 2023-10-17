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
        <title>${BSUtil.getString('app-name')} - Product View</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="${BASE_URL}/assets/img/${BSUtil.getString('breadcrumb-img')}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Product View</h2>
                            <div class="breadcrumb__option">
                                <a href="./">Home</a>
                                <a href="./shop">Shop</a>
                                <span>Product View</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__item">
                                <img class="product__details__pic__item--large"
                                     src="${BASE_URL}/assets/img/product/${sessionScope.product.img}" alt="">
                            </div>
                            <div class="product__details__pic__slider owl-carousel">
                                <img data-imgbigurl="img/product/details/product-details-2.jpg"
                                     src="${BASE_URL}/assets/img/product/${sessionScope.product.img}" alt="">
                                <img data-imgbigurl="img/product/details/product-details-3.jpg"
                                     src="${BASE_URL}/assets/img/product/${sessionScope.product.img}" alt="">
                                <img data-imgbigurl="img/product/details/product-details-5.jpg"
                                     src="${BASE_URL}/assets/img/product/${sessionScope.product.img}" alt="">
                                <img data-imgbigurl="img/product/details/product-details-4.jpg"
                                     src="${BASE_URL}/assets/img/product/${sessionScope.product.img}" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <form action="checkout/single-product" method="get">
                        <div class="product__details__text">
                            <h3>${sessionScope.product.name}</h3>
                            <div class="product__details__rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-o"></i>
                                <span>(18 reviews)</span>
                            </div>
                            <div class="product__details__price">LKR ${sessionScope.product.price}0</div>
                            <p>${sessionScope.product.description}</p>
                            <div class="product__details__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" name="qty" value="1" readonly>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="productId" value="${sessionScope.product.id}"/>
                            <button type="submit" class="btn primary-btn"><i class="fa fa-shopping-bag mr-2"></i> Buy Now</button>
                            <a href="shopping-cart/add-product-to-cart?productId=${sessionScope.product.id}" class="heart-icon"><span class="icon_cart_alt"></span></a>
                            <a href="wish-list/add-product-to-wish-list?productId=${sessionScope.product.id}" class="heart-icon"><span class="icon_heart_alt"></span></a>
                            <ul>
                                <li><b>Availability</b> <span>${sessionScope.product.available ? 'In Stock' : 'Out of Stock'}</span></li>
                                <li><b>Shipping</b> <span>1 week shipping.</span></li>
                                <li><b>Share on</b>
                                    <div class="share">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        </form>
                    </div>
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                       aria-selected="true">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                       aria-selected="false">Information</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                       aria-selected="false">Reviews <span>(1)</span></a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="product__details__tab__desc">
                                        <h6>Products Infomation</h6>
                                        <p>${sessionScope.product.description}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Details Section End -->

        <!-- Related Product Section Begin -->
        <section class="related-product">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title related__product__title">
                            <h2>Related Product</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${sessionScope.productList}" var="product" begin="0" end="11">
                    <div class="col-lg-3 col-md-4 col-sm-6">
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
            </div>
        </section>
        <!-- Related Product Section End -->

    </layout:put>
</layout:extends>
