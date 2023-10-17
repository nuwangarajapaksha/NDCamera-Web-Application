<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  product: NUWAA
  Date: 8/9/2023
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<layout:extends name="admin-base">
    <layout:put block="title" type="REPLACE">
        <title>${BSUtil.getString('app-name')} - Admin - Brands</title>
    </layout:put>

    <layout:put block="contents" type="REPLACE">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 fw-bold">Brands</h1>
                    <%--                Add New Brand--%>
                <section class="mt-4">
                    <div class="checkout__form">
                        <h4>Add New Brand</h4>
                        <form action="admin-brands/add-new-brand" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-lg-8 col-md-6">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Brand Name<span>*</span></p>
                                                <input type="text" name="name" value="" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Brand Image<span>*</span></p>
                                                <input class="form-control" type="file" name="img" accept=".jpg, .jpeg, .png" required>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="site-btn">Add Brand</button>
                                    <br>
                                    <br>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
                <div class="border-top my-4"></div>
                    <%--                Brand table--%>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Brands
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">

                            <div class="col-md-8">
                                <div class="dropdown">
                                    <button class="btn btn-light dropdown-toggle" type="button" id="rowCountDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Rows per Page
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="rowCountDropdown">
                                        <li><a class="dropdown-item" href="#" data-value="5">5</a></li>
                                        <li><a class="dropdown-item" href="#" data-value="10">10</a></li>
                                        <li><a class="dropdown-item" href="#" data-value="20">20</a></li>
                                        <li><a class="dropdown-item" href="#" data-value="50">50</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="searchInput" placeholder="Search...">
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Created Date</th>
                                <th>Updated Date</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty sessionScope.brandList}">
                                <c:forEach items="${sessionScope.brandList}" var="brand">
                                    <form action="admin-brands/update-brand" method="post" enctype="multipart/form-data">
                                        <tr>
                                            <td>
                                                <input type="hidden" class="form-control" name="brandId" value="${brand.id}">
                                                    ${brand.id}
                                            </td>
                                            <td>${brand.createdAt}</td>
                                            <td>${brand.updatedAt}</td>
                                            <td>
                                                <input type="text" class="form-control" name="name" value="${brand.name}" required>
                                            </td>
                                            <td>
                                                <input type="file" class="form-control" name="img" value="${brand.img}" accept=".jpg, .jpeg, .png">
                                            </td>
                                            <td>
                                                <div class="col-6">
                                                    <input type="image" src="${BASE_URL}/assets/img/icon/update-icon.png" class="p-1" alt="Submit">

                                                </div>
                                            </td>
                                            <td>
                                                <div class="col-6 text-right">
                                                    <a href="admin-brands/remove-brand?brandId=${brand.id}" class="text-black-50 p-1"><i class="fa fa-trash"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                        <nav class="d-flex justify-content-end">
                            <ul class="pagination">
                                <!-- Pagination links will be added dynamically -->
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </main>
    </layout:put>
</layout:extends>