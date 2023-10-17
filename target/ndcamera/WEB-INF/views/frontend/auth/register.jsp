<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: NUWAA
  Date: 5/18/2023
  Time: 9:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${BSUtil.getString('app-name')} - Register</title>
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

            <p class="h1 m-5 text-danger text-center fw-bold">Sign Up</p>

                    <form action="user-register/register-user" method="post">

                        <!-- Name input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="registerName">Name</label>
                            <input type="text" id="registerName" class="form-control" name="name" required/>
                        </div>

                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="registerEmail">Email</label>
                            <input type="email" id="registerEmail" class="form-control" name="email" required/>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="registerPassword">Password</label>
                            <input type="password" id="registerPassword" class="form-control" name="password" required/>
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="registerPassword">Confirm Password</label>
                            <input type="password" id="registerConfirmPassword" class="form-control" name="confirmPassword" required/>
                        </div>

                        <!-- Checkbox -->
                        <div class="form-check d-flex justify-content-center mb-4">
                            <input class="form-check-input me-2" type="checkbox" value="" id="registerCheck" checked
                                   aria-describedby="registerCheckHelpText" />
                            <label class="form-check-label" for="registerCheck">
                                I have read and agree to the terms
                            </label>
                        </div>
                        <input type="hidden" id="registerUserType" class="form-control" name="userType" value="USER"/>
                        <!-- Submit button -->
                        <button type="submit" class="btn btn-danger btn-block mb-4 fw-semibold col-12">Sign Up</button>

                        <!-- SIGN UP buttons -->
                        <div class="text-center">
                            <p>Already have an account? <a href="login">Sign In</a></p>
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
