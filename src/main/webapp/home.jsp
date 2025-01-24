<%--
  Created by IntelliJ IDEA.
  User: CHAMA COMPUTERS
  Date: 1/16/2025
  Time: 7:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Style/normalize.css">
    <style>
        .container-home>section {
            display: flex;
            justify-content: center;
            margin-left: 20px;
            margin-right: 20px;
        }

        .container-home>section>div {
            width: 300px;
            margin-left: 30px;
            margin-right: 30px;
            margin-top: 100px;
        }

        span {
            font-weight: bold;
            color: deeppink;
        }

    </style>
</head>
<body>
<!--Nav Bar-->
<nav class="navbar bg-body-tertiary fixed-top">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#"><span>SHOP</span>PING</a>

        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel"><span>SHOP</span>PING</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-start flex-grow-1 pe-3">
                    <li class="nav-item">
                        <span id="home-nav" class="nav-link active" >Home</span>
                    </li>
                    <li class="nav-item">
                        <!--<span id="product-nav" class="nav-link">Product</span>-->
                        <a class="nav-link" href="product.jsp">Product</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="category.jsp">Category</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="order.jsp">Order</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="user-save">User</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex mt-3" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </div>
</nav>

<!--Home Page-->
<section class="container-home" id="home_section">
    <section>
        <div class="card">
            <img src="assets/images/customer.png" class="card-img-top" alt="..." style="height: 300px">
            <div class="card-body">
                <h5 class="card-title" style="font-size: 28px; font-weight: bold">Customer Count</h5>
                <p class="card-text" style="font-weight: bold; font-size: 40px">10</p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/item.png" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title" style="font-size: 28px; font-weight: bold">Item Count</h5>
                <p class="card-text" style="font-weight: bold; font-size: 40px">10</p>
            </div>
        </div>

        <div class="card">
            <img src="assets/images/order.png" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title" style="font-size: 28px; font-weight: bold">Order Count</h5>
                <p class="card-text" style="font-weight: bold; font-size: 40px">10</p>
            </div>
        </div>
    </section>

</section>

<!------------------------JQuery---------------------------------->
<script src="assets/lib/jquery-3.7.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<script src="assets/controller/HomeController.js" type="module"></script>
</body>
</html>
