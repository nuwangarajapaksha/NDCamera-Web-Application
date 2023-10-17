<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope}">
    <c:redirect url="./" />
</c:if>
<%--
  Created by IntelliJ IDEA.
  User: NUWAA
  Date: 8/9/2023
  Time: 1:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
<%--    <title>Dashboard - SB Admin</title>--%>
    <layout:block name="title"></layout:block>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${BASE_URL}/assets/css/style.css" type="text/css">
    <link href="${BASE_URL}/assets/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-red">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3 fw-bolder" href="admin">${BSUtil.getString('app-name')}</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>

    <!-- Navbar-->
    <ul class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0 navbar-nav">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="profile/admin-profile" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i> Hi, ${sessionScope.user.name}</a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="admin-profile">Profile</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="login/logout">Sign Out</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav pt-4">
<%--                    <a class="nav-link" href="admin">--%>
<%--                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>--%>
<%--                        Dashboard--%>
<%--                    </a>--%>
                    <a class="nav-link" href="admin-orders">
                        <div class="sb-nav-link-icon"><i class="fas fa-arrow-up-wide-short"></i></div>
                        Orders
                    </a>
                    <a class="nav-link" href="admin-products">
                        <div class="sb-nav-link-icon"><i class="fas fa-boxes-stacked"></i></div>
                        Products
                    </a>
                    <a class="nav-link" href="admin-brands">
                        <div class="sb-nav-link-icon"><i class="fas fa-building-wheat"></i></div>
                        Brands
                    </a>
                    <a class="nav-link" href="admin-users">
                        <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                        Users
                    </a>
                    <a class="nav-link" href="admin-business-settings">
                        <div class="sb-nav-link-icon"><i class="fas fa-sliders"></i></div>
                        Business Settings
                    </a>
                </div>
            </div>
        </nav>
    </div>


    <div id="layoutSidenav_content">
        <!-- Error -->
        <c:if test="${not empty sessionScope.success}">
        <main class="ps-4 pe-4 pt-2">
            <div class="alert alert-success mt-3 mb-0" role="alert">
                <span class="text-success">Successful - ${sessionScope.success}!</span>
                <c:remove var="success" scope="session"/>
            </div>
        </main>
        </c:if>
        <c:if test="${not empty sessionScope.warning}">
        <main class="ps-4 pe-4 pt-2">
            <div class="alert alert-warning mt-3 mb-0" role="alert">
                <span class="text-warning">Warning - ${sessionScope.warning}!</span>
                <c:remove var="warning" scope="session"/>
            </div>
        </main>
        </c:if>
        <c:if test="${not empty sessionScope.error}">
            <main class="ps-4 pe-4 pt-2">
                <div class="alert alert-danger mt-3 mb-0" role="alert">
                    <span class="text-danger">Error - ${sessionScope.error}!</span>
                    <c:remove var="error" scope="session"/>
                </div>
            </main>
        </c:if>
        <!-- Error -->

        <layout:block name="contents"></layout:block>
    <footer class="py-4 bg-light mt-auto">
        <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
                <div class="text-muted">Copyright &copy; M.R.P.N Tharuksha Rajapaksha</div>
            </div>
        </div>
    </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${BASE_URL}/assets/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="${BASE_URL}/assets/demo/chart-area-demo.js"></script>
<script src="${BASE_URL}/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="${BASE_URL}/assets/js/datatables-simple-demo.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.js"></script>
<script>
    $(document).ready(function() {
        var itemsPerPage = 10;
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
        var itemsPerPage = 10;
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
<layout:block name="script"></layout:block>
</body>
</html>
