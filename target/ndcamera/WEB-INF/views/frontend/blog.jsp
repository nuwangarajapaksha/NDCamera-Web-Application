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
        <title>${BSUtil.getString('app-name')} - Blog Details</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <!-- Blog Details Hero Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="${BASE_URL}/assets/img/${BSUtil.getString('breadcrumb-img')}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Blog</h2>
                            <div class="breadcrumb__option">
                                <a href="./">Home</a>
                                <span>Blog</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Details Hero End -->

        <!-- Blog Details Section Begin -->
        <section class="blog-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-5 order-md-1 order-2">
                        <div class="blog__sidebar">
                            <div class="blog__sidebar__search">
                                <form action="shop/get-product-by-name">
                                    <input type="text" placeholder="Search..." name="search">
                                    <button type="submit"><span class="icon_search"></span></button>
                                </form>
                            </div>
                            <div class="blog__sidebar__item">
                                <h4>Brands</h4>
                                <ul>
                                    <li><a href="shop/get-product-by-name?search=">All</a></li>
                                    <c:forEach items="${sessionScope.brandList}" var="brand">
                                        <li><a href="shop/get-product-by-brand?brandId=${brand.id}">${brand.name}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7 order-md-1 order-1">
                        <div class="blog__details__text">
                            <img src="img/blog/details/details-pic.jpg" alt="">
                            <h3 class="mb-3">About</h3>
                            <p class="text-justify">Capture every moment in stunning detail with NDCamera, the ultimate destination for all
                                your camera needs. Whether you're a professional photographer or an enthusiastic
                                hobbyist, our e-commerce application offers a wide range of cutting-edge cameras and
                                accessories to help you unlock your creativity and take your photography to new heights.
                                With a user-friendly interface, secure payment options, and exceptional customer service,
                                NDCamera is the go-to platform for all your camera shopping desires.</p>
                            <h3 class="mb-3">Browse our Extensive Collection:</h3>
                            <p class="text-justify">At NDCamera, we understand that every photographer has unique preferences and requirements.
                                That's why we curate an extensive collection of cameras from renowned brands,
                                ensuring that you find the perfect fit for your needs. From DSLRs and mirrorless
                                cameras to compact point-and-shoots and action cameras, we have it all. Discover
                                the latest models with innovative features, high-resolution sensors, advanced autofocus
                                systems, and powerful image processors, all designed to deliver exceptional image
                                quality and unrivaled performance.</p>
                            <h3 class="mb-3">Accessories for Every Occasion:</h3>
                            <p class="text-justify">Enhance your photographic capabilities with our wide selection of camera accessories.
                                We offer an array of lenses, tripods, camera bags, filters, memory cards, and more,
                                allowing you to customize your gear to match your shooting style and capture every
                                scene with precision. Whether you're a landscape photographer, a portrait artist,
                                or an adventure enthusiast, our comprehensive range of accessories will help you
                                elevate your craft and achieve professional-grade results.
                            </p>
                            <h3 class="mb-3">Seamless Shopping Experience:</h3>
                            <p class="text-justify">NDCamera is committed to providing a seamless and enjoyable shopping experience for
                                our customers. Our user-friendly interface allows you to effortlessly navigate through
                                our catalog, filter your search based on brand, price range, or specifications, and
                                make informed decisions. With detailed product descriptions, customer reviews, and
                                sample images, you can gain valuable insights before making a purchase. Our secure
                                payment options ensure that your transactions are protected, giving you peace of mind
                                while shopping with us.</p>
                            <h3 class="mb-3">Exceptional Customer Service:</h3>
                            <p class="text-justify">At NDCamera, we prioritize customer satisfaction above all else. Our dedicated and
                                knowledgeable customer service team is always ready to assist you with any inquiries
                                or concerns you may have. Whether you need advice on choosing the right camera,
                                assistance with order tracking, or guidance on troubleshooting, we are here to
                                help. We strive to provide prompt and effective solutions, ensuring that your experience
                                with NDCamera is nothing short of exceptional.</p>
                            <h3 class="mb-3">Stay Connected with NDCamera Community:</h3>
                            <p class="text-justify">Join a thriving community of photography enthusiasts by engaging with NDCamera's
                                vibrant online platform. Connect with like-minded individuals, share your work,
                                participate in contests and challenges, and gain inspiration from talented
                                photographers worldwide. Stay up to date with the latest industry news,
                                photography tips, and tutorials through our blog section, designed to fuel
                                your passion and help you stay at the forefront of the ever-evolving world of photography.</p>
                            <h3 class="mb-3">Experience the NDCamera Difference:</h3>
                            <p class="text-justify">Discover the perfect camera for your creative vision and elevate your photography
                                to new heights with NDCamera. With our vast selection, user-friendly interface, secure
                                transactions, exceptional customer service, and vibrant community, we strive to be
                                your one-stop destination for all your camera-related needs. Join us on this exciting
                                journey and unlock a world of endless photographic possibilities with NDCamera!</p>

                        </div>
                        <div class="blog__details__content">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="blog__details__author">
                                        <div class="blog__details__author__pic">
                                            <img src="img/blog/details/details-author.jpg" alt="">
                                        </div>
                                        <div class="blog__details__author__text">
                                            <h6>M.R.P.N.Tharuksha Rajapaksha</h6>
                                            <span>Admin</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="blog__details__widget">
                                        <ul>
                                            <li><span>Categories:</span> Nikon, Sony, Canon</li>
                                            <li><span>Tags:</span> All, Cameras</li>
                                        </ul>
                                        <div class="blog__details__social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                            <a href="#"><i class="fa fa-envelope"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Details Section End -->

        <!-- Related Blog Section Begin -->
        <section class="related-blog spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title related-blog-title">
                            <h2>Post You May Like</h2>
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
                                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
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
                                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
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
                                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
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
        <!-- Related Blog Section End -->

    </layout:put>
</layout:extends>
