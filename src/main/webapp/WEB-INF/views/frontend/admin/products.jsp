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
        <title>${BSUtil.getString('app-name')} - Admin - Products</title>
    </layout:put>

    <layout:put block="contents" type="REPLACE">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 fw-bold">Products</h1>
<%--                Add New Product--%>
                <section class="mt-4">
                    <div class="checkout__form">
                        <h4>Add New Product</h4>
                        <form action="admin-products/add-new-product" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-lg-8 col-md-6">
                                    <div class="checkout__input">
                                        <p>Product Name<span>*</span></p>
                                        <input type="text" name="name" value="" required>
                                    </div>
                                    <div class="checkout__input">
                                        <p>Image<span>*</span></p>
                                        <input type="file" class="form-control" name="img" value="" accept=".jpg, .jpeg, .png" required>
                                    </div>
                                    <div class="checkout__input">
                                        <p>Description</p>
                                        <textarea class="form-control" name="description"></textarea>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Brand<span>*</span></p>
                                                <select class="form-select" aria-label="Default select example" name="brandId" required>
                                                    <c:if test="${not empty sessionScope.brandList}">--%>
                                                        <c:forEach items="${sessionScope.brandList}" var="brand">
                                                            <option value="${brand.id}">${brand.name}</option>
                                                        </c:forEach>
                                                    </c:if>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Type</p>
                                                <input type="text" name="type" value="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="checkout__input">
                                        <p>Price<span>*</span></p>
                                        <input type="number" class="checkout__input__add" name="price" value="" required>
                                    </div>
                                    <button type="submit" class="site-btn">Add Product</button>
                                    <br>
                                    <br>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
                <div class="border-top my-4"></div>
<%--                Product Table--%>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Products
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
                                <th>Description</th>
                                <th>Brand</th>
                                <th>Type</th>
                                <th>Price</th>
                                <th>Available</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty sessionScope.productList}">
                                <c:forEach items="${sessionScope.productList}" var="product">
                                    <form action="admin-products/update-product" method="post" enctype="multipart/form-data">
                                        <tr>
                                            <td>
                                                <input type="hidden" class="form-control" name="productId" value="${product.id}">
                                                    ${product.id}
                                            </td>
                                            <td>${product.createdAt}</td>
                                            <td>${product.updatedAt}</td>
                                            <td>
                                                <input type="text" class="form-control" name="name" value="${product.name}" required>
                                            </td>
                                            <td>
                                                <input type="file" class="form-control" name="img" value="${product.img}" accept=".jpg, .jpeg, .png">
                                            </td>
                                            <td>
                                                <textarea class="form-control" name="description">${product.description}</textarea>
                                            </td>
                                            <td>
                                                     <select class="form-select" aria-label="Default select example" name="brandId" required>
                                                         <c:if test="${not empty sessionScope.brandList}">--%>
                                                         <c:forEach items="${sessionScope.brandList}" var="brand">
                                                         <option value="${brand.id}" ${product.brand == brand ? 'selected' : ''}>${brand.name}</option>
                                                         </c:forEach>
                                                         </c:if>
                                                     </select>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="type" value="${product.type}">
                                            </td>
                                            <td>
                                                <input type="number" class="form-control" name="price" value="${product.price}" required>
                                            </td>
                                            <td>
                                                    <select class="form-select" aria-label="Default select example" name="available" required>
                                                        <option value="true" ${product.available ? 'selected' : ''}>True</option>
                                                        <option value="false" ${!product.available ? 'selected' : ''}>False</option>
                                                    </select>
                                            </td>
                                            <td>
                                                <div class="col-6">
                                                    <input type="image" src="${BASE_URL}/assets/img/icon/update-icon.png" class="p-1" alt="Submit">

                                                </div>
                                            </td>
                                            <td>
                                                <div class="col-6 text-right">
                                                    <a href="admin-products/remove-product?productId=${product.id}" class="text-black-50 p-1"><i class="fa fa-trash"></i></a>
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
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </main>
    </layout:put>
</layout:extends>