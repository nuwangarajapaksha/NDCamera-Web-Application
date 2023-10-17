<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: NUWAA
  Date: 5/18/2023
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${BSUtil.getString('app-name')} - Login</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${BASE_URL}/assets/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row justify-content-center mt-4">
        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-danger" role="alert">
                <span class="text-danger">${sessionScope.error}!</span>
                <c:remove var="error" scope="session"/>
            </div>
        </c:if>
    <div class="col-5 align-self-center border border-danger rounded p-5">

        <p class="h1 m-5 text-danger text-center fw-bold">Sign In</p>

        <form action="login/login-action" method="post">
            <!-- Email input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="loginName">Email</label>
                <input type="email" id="loginName" class="form-control" name="email" required/>
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="loginPassword">Password</label>
                <input type="password" id="loginPassword" class="form-control" name="password" required/>
            </div>

            <!-- 2 column grid layout -->
            <div class="row mb-4">
                <div class="col-md-6 d-flex justify-content-center">
                    <!-- Checkbox -->
                    <div class="form-check mb-3 mb-md-0">
                        <input class="form-check-input" type="checkbox" value="" id="loginCheck" checked />
                        <label class="form-check-label" for="loginCheck"> Remember me </label>
                    </div>
                </div>

                <div class="col-md-6 d-flex justify-content-center">
                    <!-- Simple link -->
                    <a href="#!">Forgot password?</a>
                </div>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-danger btn-block mb-4 fw-semibold col-12">Sign In</button>

            <!-- SIGN UP buttons -->
            <div class="text-center">
                <p>Don't have an account? <a href="user-register">Sign Up</a></p>
            </div>
        </form>

<!-- Pills content -->
</div>
</div>
</div>

<!-- Bootstrap JS -->
<script src="${BASE_URL}/assets/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
