<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: NUWAA
  Date: 5/17/2023
  Time: 8:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<layout:extends name="base">
    <layout:put block="title" type="REPLACE">
        <title>${BSUtil.getString('app-name')} - Home</title>
    </layout:put>

    <layout:put block="contents" type="REPLACE">

 <!-- Slider Begin -->
 <div class="hero__item set-bg" data-setbg="${BASE_URL}/assets/img/hero/${BSUtil.getString('slider-img')}">
      <div class="hero__text">
           <span>${BSUtil.getString('slider-caption')}</span>
            <h2>${BSUtil.getString('slider-title')}</h2>
            <p class="text-dark">${BSUtil.getString('slider-subtitle')}</p>
            <a href="shop" class="primary-btn">SHOP NOW</a>
       </div>
</div>
<!-- Slider End -->
<br>
<!-- Categories Section Begin -->
<section class="categories">
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <c:forEach items="${sessionScope.brandList}" var="brand">
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="${BASE_URL}/assets/img/brands/${brand.img}">
                        <h5><a href="shop/get-product-by-brand?brandId=${brand.id}">${brand.name}</a></h5>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Featured Product</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <c:forEach items="${sessionScope.brandList}" var="brand">
                            <li data-filter=".${brand.name}">${brand.name}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <c:forEach items="${sessionScope.productList}" var="product" begin="0" end="11">
            <div class="col-lg-3 col-md-4 col-sm-6 mix ${product.brand.name}">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="${BASE_URL}/assets/img/product/${product.img}">
                        <ul class="featured__item__pic__hover">
                            <li><a href="product-view/get-product-by-id?productId=${product.id}"><i class="fa fa-shopping-bag card_icon_element"></i></a></li>
                            <li><a href="shopping-cart/add-product-to-cart?productId=${product.id}"><i class="fa fa-shopping-cart card_icon_element"></i></a></li>
                            <li><a href="wish-list/add-product-to-wish-list?productId=${product.id}"><i class="fa fa-heart card_icon_element"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="product-view/get-product-by-id?productId=${product.id}">${product.name}</a></h6>
                        <h5>LKR ${product.price}0</h5>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="${BASE_URL}/assets/img/banner/${BSUtil.getArray('home-banner-img',',')[0]}" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="${BASE_URL}/assets/img/banner/${BSUtil.getArray('home-banner-img',',')[1]}" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<!-- Blog Section Begin -->
<section class="from-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title from-blog__title">
                    <h2>From The Blog</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/blog-1.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2023</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5 class="text-justify"><a href="#">Nikon Cameras: Delivering Precision and
                            Reliability for Photography Enthusiasts</a></h5>
                        <p class="text-justify">Nikon cameras are renowned for their exceptional image quality,
                            advanced features, and robust build, making them a top choice for photography
                            enthusiasts who value precision and reliability in their equipment.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/blog-2.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 20,2023</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5 class="text-justify"><a href="#">Canon Cameras: Unleashing Creativity and Innovation
                            in Photography</a></h5>
                        <p class="text-justify">Canon cameras are synonymous with innovation and creativity,
                            empowering photographers to explore new horizons. With their cutting-edge technology,
                            versatile lenses, and user-friendly interfaces, Canon cameras are a favorite
                            among professionals and amateurs alike.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/blog-3.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> June 10,2023</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5 class="text-justify"><a href="#">Sony Cameras: Redefining Possibilities in Mirrorless Photography</a></h5>
                        <p class="text-justify">Sony cameras have revolutionized the photography industry with their
                            remarkable mirrorless systems. Offering exceptional image stabilization, lightning-fast
                            autofocus, and stunning video capabilities, Sony cameras have captured the attention
                            of professionals and content creators seeking groundbreaking tools for their craft.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->
    </layout:put>
</layout:extends>


