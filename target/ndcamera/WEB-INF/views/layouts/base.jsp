<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope}">
    <c:redirect url="./" />
</c:if>
<%--
  Created by IntelliJ IDEA.
  User: NUWAA
  Date: 6/9/2023
  Time: 1:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<%--    <title>NDCamera</title>--%>
    <layout:block name="title"></layout:block>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="${BASE_URL}/assets/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${BASE_URL}/assets/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${BASE_URL}/assets/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${BASE_URL}/assets/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${BASE_URL}/assets/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${BASE_URL}/assets/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${BASE_URL}/assets/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${BASE_URL}/assets/css/style.css" type="text/css">
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="./"><img class="logo_img" src="${BASE_URL}/assets/img/${BSUtil.getString('logo')}" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="wish-list"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="shopping-cart"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="${BASE_URL}/assets/img/language.png" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">Spanis</a></li>
                <li><a href="#">English</a></li>
            </ul>
        </div>
        <div class="header__top__right__auth header__top__right__language">
                <c:if test="${empty sessionScope.user}">
                    <a href="login"><i class="fa fa-user"></i>Sign In</a>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <a href="profile"><i class="fa fa-user"></i>Hi, ${sessionScope.user.name}</a>
                    <ul>
                        <li><a href="profile">Profile</a></li>
                        <li><a href="orders">Orders</a></li>
                        <li><a href="shopping-cart">Cart</a></li>
                        <li><a href="wish-list">Wish List</a></li>
                        <div class="border-top my-4"></div>
                        <li><a href="login/logout">Sign Out</a></li>
                    </ul>
                </c:if>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="./">Home</a></li>
            <li><a href="shop">Shop</a></li>
            <li><a href="#">Pages</a>
                <ul class="header__menu__dropdown">
                    <li><a href="wish-list">Wish List</a></li>
                    <li><a href="shopping-cart">Shoping Cart</a></li>
                    <li><a href="orders">Orders</a></li>
                </ul>
            </li>
            <li><a href="blog">Blog</a></li>
            <li><a href="contact">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> ${BSUtil.getString('email')}</li>
            <li>${BSUtil.getString('nav-caption')}</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> ${BSUtil.getString('email')}</li>
                            <li>${BSUtil.getString('nav-caption')}</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                        <div class="header__top__right__language">
                            <img src="${BASE_URL}/assets/img/language.png" alt="">
                            <div>English</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">Spanis</a></li>
                                <li><a href="#">English</a></li>
                            </ul>
                        </div>
                        <div class="header__top__right__auth header__top__right__language">
                                <c:if test="${empty sessionScope.user}">
                                    <a href="login"><i class="fa fa-user"></i>Sing In</a>
                                </c:if>
                                <c:if test="${not empty sessionScope.user}">
                                <a href="profile"><i class="fa fa-user"></i>Hi, ${sessionScope.user.name}</a>
                                    <ul>
                                        <li><a href="profile">Profile</a></li>
                                        <li><a href="orders">Orders</a></li>
                                        <li><a href="shopping-cart">Cart</a></li>
                                        <li><a href="wish-list">Wish List</a></li>
                                        <li><a href="login/logout">Sign Out</a></li>
                                    </ul>
                                </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="./"><img class="logo_img" src="${BASE_URL}/assets/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="./">Home</a></li>
                        <li><a href="shop">Shop</a></li>
                        <li><a href="#">Pages</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="wish-list">Wish List</a></li>
                                <li><a href="shopping-cart">Shoping Cart</a></li>
                                <li><a href="orders">Orders</a></li>
                            </ul>
                        </li>
                        <li><a href="blog">Blog</a></li>
                        <li><a href="contact">Contact</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="wish-list"><i class="fa fa-heart"></i>
                            <span>
                                <c:set var="c" value="0"/>
                                <c:if test="${not empty sessionScope.wishListItemList}">
                                    <c:forEach items="${sessionScope.wishListItemList}" var="wishListItem" varStatus="status">
                                        <c:set var="c" value="${status.count}" />
                                    </c:forEach>
                                </c:if>
                                 ${c}
                            </span>
                        </a></li>
                        <li><a href="shopping-cart"><i class="fa fa-shopping-cart"></i>
                            <span>
                                <c:set var="c" value="0"/>
                                <c:if test="${not empty sessionScope.cartItemList}">
                                <c:forEach items="${sessionScope.cartItemList}" var="cartItem" varStatus="status">
                                    <c:set var="c" value="${status.count}" />
                                </c:forEach>
                                </c:if>
                                 ${c}
                            </span>
                        </a></li>
                    </ul>
<%--                    <div class="header__cart__price">item: <span>$150.00</span></div>--%>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Brands</span>
                    </div>
                    <ul>
                        <li><a href="shop/get-product-by-name?search=">All</a></li>
                        <c:forEach items="${sessionScope.brandList}" var="brand">
                            <li><a href="shop/get-product-by-brand?brandId=${brand.id}">${brand.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="shop/get-product-by-name">
                            <input type="text" placeholder="What do you need?" name="search">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>${BSUtil.getString('contact-number')}</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Error -->

        <c:if test="${not empty sessionScope.success}">
            <div class="alert alert-success mt-3 mb-0" role="alert">
                <span class="text-success">Successful - ${sessionScope.success}!</span>
                <c:remove var="success" scope="session"/>
            </div>
        </c:if>
        <c:if test="${not empty sessionScope.warning}">
            <div class="alert alert-warning mt-3 mb-0" role="alert">
                <span class="text-warning">Warning - ${sessionScope.warning}!</span>
                <c:remove var="warning" scope="session"/>
            </div>
        </c:if>
        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-danger mt-3 mb-0" role="alert">
                <span class="text-danger">Error - ${sessionScope.error}!</span>
                <c:remove var="error" scope="session"/>
            </div>
        </c:if>
    </div>
</section>
<!-- Hero Section End -->



<layout:block name="contents"></layout:block>

<!-- Footer Section Begin -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                    <ul>
                        <li>${BSUtil.getString('address')}</li>
                        <li>Phone: ${BSUtil.getString('contact-number')}</li>
                        <li>Email: ${BSUtil.getString('email')}</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>Useful Links</h6>
                    <ul>
                        <li><a href="blog">About Us</a></li>
                        <li><a href="#">About Our Shop</a></li>
                        <li><a href="shop">Secure Shopping</a></li>
                        <li><a href="#">Delivery infomation</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Our Sitemap</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">Who We Are</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="#">Projects</a></li>
                        <li><a href="contact">Contact</a></li>
                        <li><a href="#">Innovation</a></li>
                        <li><a href="#">Testimonials</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Join Our Newsletter Now</h6>
                    <p>Get E-mail updates about our latest shop and special offers.</p>
                    <form action="#">
                        <input type="text" placeholder="Enter your mail">
                        <button type="submit" class="site-btn">Subscribe</button>
                    </form>
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa fa-facebook footer_icon_element"></i></a>
                        <a href="#"><i class="fa fa-instagram footer_icon_element"></i></a>
                        <a href="#"><i class="fa fa-twitter footer_icon_element"></i></a>
                        <a href="#"><i class="fa fa-pinterest footer_icon_element"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text"><p>
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> M.R.P.N Tharuksha Rajapaksha</p></div>
                    <div class="footer__copyright__payment"><img src="${BASE_URL}/assets/img/payment-item.png" alt=""></div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="${BASE_URL}/assets/js/jquery-3.3.1.min.js"></script>
<script src="${BASE_URL}/assets/js/bootstrap.min.js"></script>
<script src="${BASE_URL}/assets/js/jquery.nice-select.min.js"></script>
<script src="${BASE_URL}/assets/js/jquery-ui.min.js"></script>
<script src="${BASE_URL}/assets/js/jquery.slicknav.js"></script>
<script src="${BASE_URL}/assets/js/mixitup.min.js"></script>
<script src="${BASE_URL}/assets/js/owl.carousel.min.js"></script>
<script src="${BASE_URL}/assets/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>


<layout:block name="script"></layout:block>

</body>

</html>
