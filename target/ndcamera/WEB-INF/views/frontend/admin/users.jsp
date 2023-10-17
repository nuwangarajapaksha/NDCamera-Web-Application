<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: NUWAA
  Date: 8/9/2023
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<layout:extends name="admin-base">
    <layout:put block="title" type="REPLACE">
        <title>${BSUtil.getString('app-name')} - Admin - Users</title>
    </layout:put>

    <layout:put block="contents" type="REPLACE">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 fw-bold">Users</h1>
                <section class="mt-4">
                        <div class="checkout__form">
                            <h4>Add New Admin</h4>
                            <form action="admin-users/register-admin" method="post">
                                <div class="row">
                                    <div class="col-lg-8 col-md-6">
                                        <div class="checkout__input">
                                            <p>Name<span>*</span></p>
                                            <input type="text" name="name" value="" required>
                                        </div>
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <input type="email" name="email" value="" required>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="checkout__input">
                                                    <p>Password<span>*</span></p>
                                                    <input type="password" name="password" value="" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="checkout__input">
                                                    <p>Confirm Password<span>*</span></p>
                                                    <input type="password" name="confirmPassword" value="" required>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="userType" value="ADMIN">
                                        <button type="submit" class="site-btn">Add Admin</button>
                                        <br>
                                        <br>
                                    </div>
                                </div>
                            </form>
                        </div>
                </section>
                <div class="border-top my-4"></div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Users
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

<%--                        <table id="datatablesSimple">--%>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Created Date</th>
                                <th>Updated Date</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>Postal Code / ZIP</th>
                                <th>User Type</th>
<%--                                <th>Active</th>--%>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty sessionScope.userList}">
                                <c:forEach items="${sessionScope.userList}" var="user">
                            <form action="admin-users/update-user" method="post">
                            <tr>
                                <td>
                                    <input type="hidden" class="form-control" name="userId" value="${user.id}">
                                        ${user.id}
                                </td>
                                <td>${user.createdAt}</td>
                                <td>${user.updatedAt}</td>
                                <td>
                                    <input type="text" class="form-control" name="name" value="${user.name}" required>
                                </td>
                                <td>${user.email}</td>
                                <td>
                                    <input type="tel" class="form-control" name="contactNumber" value="${user.contact_number}">
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="address" value="${user.address}">
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="city" value="${user.city}">
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="postalCode" value="${user.postal_code}">
                                </td>
                                <td>
                                    <c:if test="${user.id == sessionScope.user.id}">
                                        <input type="text" class="form-control" name="userType" value="${user.userType}" readonly>
                                    </c:if>
                                    <c:if test="${user.id != sessionScope.user.id}">
                                    <select class="form-select" aria-label="Default select example" name="userType" required>
                                        <option value="ADMIN" ${user.userType == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                                        <option value="USER" ${user.userType == 'USER' ? 'selected' : ''}>USER</option>
                                    </select>
                                    </c:if>
                                </td>
<%--                                <td>--%>
<%--                                    <c:if test="${user.id == sessionScope.user.id}">--%>
<%--                                        <input type="text" class="form-control" name="active" value="${user.active ? 'True' : 'False'}" readonly>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${user.id != sessionScope.user.id}">--%>
<%--                                    <select class="form-select" aria-label="Default select example" name="active" required>--%>
<%--                                        <option value="true" ${user.active ? 'selected' : ''}>True</option>--%>
<%--                                        <option value="false" ${!user.active ? 'selected' : ''}>False</option>--%>
<%--                                    </select>--%>
<%--                                    </c:if>--%>
<%--                                </td>--%>
                                <td>
                                        <div class="col-6">
                                                <input type="image" src="${BASE_URL}/assets/img/icon/update-icon.png" class="p-1" alt="Submit">

                                        </div>
                                </td>
                                <td>
                                        <div class="col-6 text-right">
                                            <a href="admin-users/remove-user?userId=${user.id}" class="text-black-50 p-1"><i class="fa fa-trash"></i></a>
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