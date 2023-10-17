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
        <title>${BSUtil.getString('app-name')} - Orders</title>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <!-- Blog Details Hero Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="${BASE_URL}/assets/img/${BSUtil.getString('breadcrumb-img')}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Orders</h2>
                            <div class="breadcrumb__option">
                                <a href="./">Home</a>
                                <span>Orders</span>
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
                    <div class="col-lg-12 col-md-7 order-md-1 order-1">
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
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Contact Details</th>
                                <th>Address Details</th>
                                <th>Order Note</th>
                                <th>Products</th>
                                <th>Charges</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty sessionScope.orderList}">

                                <c:forEach items="${sessionScope.orderList}" var="order">
                                    <c:if test="${order.user.id == sessionScope.user.id}" >
                                    <form action="admin-orders/update-order" method="post">
                                        <tr>
                                            <td>
                                                <input type="hidden" class="form-control" name="orderId" value="${order.id}">
                                                    ${order.id}
                                            </td>
                                            <td>${order.createdAt}</td>
                                            <td>
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
                                                    Delivery: LKR ${order.delivery}0
                                                    <div class="border-top my-4"></div>
                                                    Total Amount: LKR ${order.totalAmount}0
                                                    <div class="border-top my-4"></div>
                                                    Payment Type : ${order.paymentType}
                                            </td>
                                            <td>
                                                    ${order.status}
                                            </td>
                                        </tr>
                                    </form>
                                    </c:if>
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
        </section>
    </layout:put>
        <!-- Blog Details Section End -->
    <layout:put block="script" type="REPLACE">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.js"></script>
        <script>
            $(document).ready(function() {
                var itemsPerPage = 5;
                var table = $('table tbody');
                var allRows = table.find('tr');
                var numRows = allRows.length;
                var numPages = Math.ceil(numRows / itemsPerPage);

                function updateTable(startIndex) {
                    var endIndex = startIndex + itemsPerPage;
                    allRows.hide().slice(startIndex, endIndex).show();
                }

                $('.pagination').pagination({
                    items: numRows,
                    itemsOnPage: itemsPerPage,
                    displayedPages: 3,
                    onPageClick: function(pageNumber) {
                        var startIndex = (pageNumber - 1) * itemsPerPage;
                        updateTable(startIndex);
                    }
                });

                $('#searchInput').keyup(function() {
                    var searchTerm = $(this).val().toLowerCase();
                    var filteredRows = allRows.filter(function() {
                        return $(this).text().toLowerCase().indexOf(searchTerm) > -1;
                    });
                    numRows = filteredRows.length;
                    numPages = Math.ceil(numRows / itemsPerPage);
                    updateTable(0);
                    $('.pagination').pagination('updateItems', numRows);
                });

                $('.dropdown-menu a').click(function() {
                    itemsPerPage = parseInt($(this).attr('data-value'));
                    numPages = Math.ceil(numRows / itemsPerPage);
                    updateTable(0);
                    $('.pagination').pagination('updateItems', numRows);
                });

                updateTable(0);
            });
        </script>
        <script>
            $(document).ready(function() {
                var itemsPerPage = 5
                var table = $('table tbody');
                var numRows = table.find('tr').length;
                var numPages = Math.ceil(numRows / itemsPerPage);

                $('.pagination').pagination({
                    items: numRows,
                    itemsOnPage: itemsPerPage,
                    displayedPages: 3,
                    onPageClick: function(pageNumber) {
                        var start = (pageNumber - 1) * itemsPerPage;
                        var end = start + itemsPerPage;
                        table.find('tr').hide().slice(start, end).show();
                    }
                });

                $('#searchInput').keyup(function() {
                    var searchTerm = $(this).val().toLowerCase();
                    table.find('tr').hide().filter(function() {
                        return $(this).text().toLowerCase().indexOf(searchTerm) > -1;
                    }).show();
                    $('.pagination').pagination('drawPage', 1); // Reset pagination
                });

                $('.dropdown-menu a').click(function() {
                    itemsPerPage = parseInt($(this).text());
                    numPages = Math.ceil(numRows / itemsPerPage);
                    $('.pagination').pagination('destroy');
                    $('.pagination').pagination({
                        items: numRows,
                        itemsOnPage: itemsPerPage,
                        displayedPages: 3,
                        onPageClick: function(pageNumber) {
                            var start = (pageNumber - 1) * itemsPerPage;
                            var end = start + itemsPerPage;
                            table.find('tr').hide().slice(start, end).show();
                        }
                    });
                });
            });
        </script>

    </layout:put>
</layout:extends>
