<%--
  Created by IntelliJ IDEA.
  User: CHAMA COMPUTERS
  Date: 1/16/2025
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
                        <a class="nav-link" href="user.jsp">User</a>
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

<!--Order Page-->
<section class="container-order" id="order_section">
    <div class="container">
        <br><br>
        <section>
            <div class="form-floating mb-3" style="width: 100%; font-size: 40px; font-weight: 600; margin-left: 20px;margin-top: 50px;">
                <a class="navbar-brand" href="#">
                    <img src="assets/images/order.png" alt="customer" style="width: 60px; height: 60px;">
                    Order
                </a>
            </div>
        </section>


        <div class="card mb-4 shadow-sm">
            <div class="card-body">
                <h5 class="card-title">Select Customer</h5>
                <div class="row">
                    <div class="col-md-6">
                        <select id="selectCustomer" class="form-select" required>
                            <option selected disabled value="" >Select a Customer</option>
                        </select>
                    </div>
                    <div class="col-md-6" style="display: flex;">
                        <input style="width: 200px; margin-left: 20px;" type="text" class="form-control" id="customerFirstName" placeholder="Customer First Name" disabled>
                        <input style="width: 200px; margin-left: 20px;" type="text" class="form-control" id="customerLastName" placeholder="Customer Last Name" disabled>
                    </div>
                </div>
            </div>

            <!--<div class="card mb-4 shadow-sm">-->
            <div class="card-body">
                <h5 class="card-title">Select Item</h5>
                <div class="row mb-4">
                    <div class="col-md-8">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <select id="selectItem" class="form-select">
                                    <option value="" disabled selected>Select an Item</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="description" placeholder="Description" disabled>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <input type="number" class="form-control" id="qtyOnHand" placeholder="Qty On Hand" disabled>
                            </div>
                            <div class="col-md-4">
                                <input type="number" class="form-control" id="unitPrice" placeholder="Unit Price" disabled>
                            </div>
                            <div class="col-md-4">
                                <input type="number" class="form-control" id="quantity" placeholder="Enter quantity" required>
                            </div>
                        </div>
                    </div>


                    <div class="d-flex justify-content-end mt-2">
                        <button id="addToCart" class="btn btn-primary" >Add to Cart</button>
                    </div>
                </div>
                <!--</div>-->
            </div>
        </div>

        <div class="card-body">
            <h3 class="card-title">Order List</h3>
            <table class="table table-bordered table-striped mt-3">
                <thead>
                <tr>
                    <th>Order Id</th>
                    <th>Description</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody id="cartTableBody"></tbody>
            </table>
            <div class="d-flex justify-content-between mt-3">
                <h4>Total Amount: <span id="totalAmount">0.00</span></h4>
                <button class="btn btn-success" id="placeOrder" >Place Order</button>
            </div>
        </div>

    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
