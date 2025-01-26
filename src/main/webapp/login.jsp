<%--
  Created by IntelliJ IDEA.
  User: CHAMA COMPUTERS
  Date: 1/22/2025
  Time: 12:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>


        body {
            background-color: #f3d4dd;
        }

        span {
            font-weight: bold;
            color: deeppink;
            font-size: 35px;
            letter-spacing: 2px;
        }

        #navbarSupportedContent {
            text-align: center;
            justify-items: center;
            justify-content: space-between;
            margin-left: 100px;
            letter-spacing: 2px;
        }

        .icons {
            font-size: 25px;
            color: deeppink;
            display: flex;
            justify-content: space-between;
            margin-right: 100px;
            gap: 15px;
        }

        .container {

        }
        .card {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .nav-tabs {
            border-bottom: none;
        }
        .nav-link {
            border: 1px solid transparent;
            border-radius: 0;
        }
        .nav-link.active {
            background-color: #e7e7e7;
            border-color: #dee2e6 #dee2e6 #fff;
        }
    </style>
</head>
<body>
<!--Nav Bar-->
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container">
        <a class="navbar-brand" href="#"><span style="color: deeppink; font-weight: bold;">Flora</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp" style="color: black;">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shop1.jsp" style="color: black;">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: black;">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: black;">Category</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" style="color: black;">
                        Manage
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="customer-list.jsp">Customer</a></li>
                        <li><a class="dropdown-item" href="product-list">Product</a></li>
                        <li><a class="dropdown-item" href="category-save">Category</a></li>
                        <li><a class="dropdown-item" href="user-save">User</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
            <div class="icons d-flex align-items-center ms-3">
                <a href="login.jsp" class="me-2"><i class='bx bx-log-in-circle' style="color: #000000; font-size: 1.5rem;"></i></a>
                <a href="#" class="me-2"><i class='bx bxs-user-circle' style="color: #000000; font-size: 1.5rem;"></i></a>
                <a href="#" class="me-2"><i class='bx bxs-cart-add' style="color: #000000; font-size: 1.5rem;"></i></a>
                <a href="#"><i class='bx bx-log-out-circle' style="color: #000000; font-size: 1.5rem;"></i></a>
            </div>
        </div>
    </div>
</nav>

<!--login and register card-->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header p-0">
                    <!-- Tabs in the card header -->
                    <ul class="nav nav-tabs" id="authTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true">
                                Login
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab" aria-controls="register" aria-selected="false">
                                Register
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <!-- Tab content -->
                    <div class="tab-content" id="authTabsContent">
                        <!-- Login Tab -->
                        <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                            <h1 class="text-center">Login</h1>
                            <form action="login" method="post">
                                <div class="mb-3">
                                    <label for="loginEmail" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="loginEmail" placeholder="Enter your email" name="loginEmail" required>
                                </div>
                                <div class="mb-3">
                                    <label for="loginPassword" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="loginPassword" placeholder="Enter your password" name="loginPassword" required>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Login</button>
                            </form>
                        </div>
                    <%--    <%
                            String message =  request.getParameter("loginError");
                            if (message != null) {
                                System.out.println(message);
                        %>

                        <script>
                            Swal.fire({
                                icon: "error",
                                title: "Oops...",
                                text: "Login Failed!",
                            });
                        </script>
                        <%
                            }
                        %>--%>

                        <!-- Register Tab -->
                        <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                            <h1 class="text-center">Register</h1>
                            <form action="register" method="post">
                                <div class="mb-3">
                                    <label for="registerName" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="registerName" placeholder="Enter your full name" name="registerName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="registerEmail" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="registerEmail" placeholder="Enter your email" name="registerEmail" required>
                                </div>
                                <div class="mb-3">
                                    <label for="registerPassword" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="registerPassword" placeholder="Create a password" name="registerPassword" required>
                                </div>
                                <div class="mb-3">
                                    <label for="registerConfirmPassword" class="form-label">Confirm Password</label>
                                    <input type="password" class="form-control" id="registerConfirmPassword" placeholder="Confirm your password" name="registerConfirmPassword" required>
                                </div>
                                <button type="submit" class="btn btn-success w-100">Register</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
