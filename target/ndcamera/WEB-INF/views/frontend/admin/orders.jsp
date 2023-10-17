<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="processingOrderCount" value="0" />
<c:set var="deleveredOrderCount" value="0" />
<c:set var="completedOrderCount" value="0" />
<c:set var="returnedOrderCount" value="0" />
<c:forEach items="${sessionScope.orderList}" var="order">
    <c:if test="${order.status == 'PROCESSING'}">
        <c:set var="processingOrderCount" value="${processingOrderCount + 1}" /> <!-- Increment the counter -->
    </c:if>
    <c:if test="${order.status == 'DELIVERED'}">
        <c:set var="deleveredOrderCount" value="${deleveredOrderCount + 1}" /> <!-- Increment the counter -->
    </c:if>
    <c:if test="${order.status == 'COMPLETED'}">
        <c:set var="completedOrderCount" value="${completedOrderCount + 1}" /> <!-- Increment the counter -->
    </c:if>
    <c:if test="${order.status == 'RETURNED'}">
        <c:set var="returnedOrderCount" value="${returnedOrderCount + 1}" /> <!-- Increment the counter -->
    </c:if>
</c:forEach>
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
        <title>${BSUtil.getString('app-name')} - Admin - Orders</title>
    </layout:put>

    <layout:put block="contents" type="REPLACE">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 fw-bold">Orders</h1>

                <div class="border-top my-4"></div>
                <div class="row">

                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-warning text-white mb-4">
                            <div class="card-body d-flex align-items-center justify-content-between fs-4">PROCESSING
                                <span class="fw-bold">
                                    ${processingOrderCount}
                                </span>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-between"></div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body d-flex align-items-center justify-content-between fs-4">DELIVERED
                                <span class="fw-bold">
                                    ${deleveredOrderCount}
                                </span>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-between"></div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body d-flex align-items-center justify-content-between fs-4">COMPLETED
                                <span class="fw-bold">
                                    ${completedOrderCount}
                                </span>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-between"></div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-danger text-white mb-4">
                            <div class="card-body d-flex align-items-center justify-content-between fs-4">RETURNED
                                <span class="fw-bold">
                                        ${returnedOrderCount}
                                </span>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-between"></div>
                        </div>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Orders
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
                                <th>Date</th>
                                <th>Contact Details</th>
                                <th>Address Details</th>
                                <th>Order Note</th>
                                <th>Products</th>
                                <th>Charges</th>
                                <th>Status</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty sessionScope.orderList}">
                                <c:forEach items="${sessionScope.orderList}" var="order">
                                    <form action="admin-orders/update-order" method="post">
                                        <tr>
                                            <td>
                                                <input type="hidden" class="form-control" name="orderId" value="${order.id}">
                                                    ${order.id}
                                            </td>
                                            <td>
                                                 Created: ${order.createdAt}
                                                <div class="border-top my-4"></div>
                                                 Updated: ${order.updatedAt}
                                            </td>
                                            <td>
                                                ${order.user.id}
                                                <div class="border-top my-4"></div>
                                                ${order.name}
                                                <div class="border-top my-4"></div>
                                                ${order.email}
                                                <div class="border-top my-4"></div>
                                                ${order.contact_number}
                                            </td>

                                            <td>
                                                ${order.address}
                                                <div class="border-top my-4"></div>
                                                ${order.city}
                                                <div class="border-top my-4"></div>
                                                ${order.postal_code}
                                            </td>
                                            <td>
                                                    ${order.note}
                                            </td>
                                            <td>
                                                <c:forEach items="${sessionScope.orderItemList}" var="orderItem">
                                                    <c:if test="${orderItem.order.id == order.id}" >
                                                        ${orderItem.product.name}<br>
                                                        Price: LKR ${orderItem.product.price}0<br>
                                                        Qty: ${orderItem.qty}<br>
                                                        Total: LKR ${orderItem.product.price*orderItem.qty}0
                                                        <div class="border-top my-4"></div>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                Item Count: ${order.item_count}
                                                <div class="border-top my-4"></div>
                                                Delivery: LKR ${order.delivery}0
                                                <div class="border-top my-4"></div>
                                                Total Amount: LKR ${order.totalAmount}0
                                                <div class="border-top my-4"></div>
                                                Payment Type : ${order.paymentType}
                                            </td>
                                            <td>
                                                    <select class="form-select" aria-label="Default select example" name="status" required>
                                                        <option value="PROCESSING" ${order.status == 'PROCESSING' ? 'selected' : ''}>PROCESSING</option>
                                                        <option value="DELIVERED" ${order.status == 'DELIVERED' ? 'selected' : ''}>DELIVERED</option>
                                                        <option value="COMPLETED" ${order.status == 'COMPLETED' ? 'selected' : ''}>COMPLETED</option>
                                                        <option value="RETURNED" ${order.status == 'RETURNED' ? 'selected' : ''}>RETURNED</option>
                                                    </select>
                                            </td>
                                            <td>
                                                <div class="col-6">
                                                    <input type="image" src="${BASE_URL}/assets/img/icon/update-icon.png" class="p-1" alt="Submit">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="col-6 text-right">
                                                    <a href="admin-orders/remove-order?orderId=${order.id}" class="text-black-50 p-1"><i class="fa fa-trash"></i></a>
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