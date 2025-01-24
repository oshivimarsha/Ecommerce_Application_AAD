<%@ page import="lk.ijse.assignment_01_aad.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        body {
            background-color: #ffffff;
        }
        span {
            font-weight: bold;
            color: deeppink;
            font-size: 35px;
            letter-spacing: 2px;
        }
        #navbarSupportedContent {
            text-align: center;
            justify-content: space-between;
            margin-left: 100px;
            letter-spacing: 2px;
        }
        .btn-btn {
            width: 150px;
            background-color: transparent;
            border-color: deeppink;
            margin-left: 15px;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .btn-btn:hover {
            background-color: deeppink;
            color: white;
        }
        .table {
            margin-left: 75px;
            width: 1250px;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container">
        <a class="navbar-brand" href="#"><span>Flora</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">User</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Product</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Category</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Manage</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="customer-list.jsp">Customer</a></li>
                        <li><a class="dropdown-item" href="product.jsp">Product</a></li>
                        <li><a class="dropdown-item" href="category.jsp">Category</a></li>
                        <li><a class="dropdown-item" href="user-save">User</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex ms-auto">
                <input class="form-control me-2" type="search" placeholder="Search">
                <button class="btn btn-outline-success" type="submit" style="background-color: #f3d4dd; border-color: deeppink; color: deeppink;">Search</button>
            </form>
            <div class="icons">
                <a href="login.jsp"><i class='bx bx-log-in-circle' style="color: deeppink"></i></a>
                <a href="#"><i class='bx bxs-user-circle'></i></a>
                <a href="#"><i class='bx bxs-cart-add'></i></a>
                <a href="#"><i class='bx bx-log-out-circle'></i></a>
            </div>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2>Product Management</h2>
    <div class="d-flex justify-content-between mb-3">
        <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search">
            <button class="btn btn-outline-success btn-btn">Search</button>
        </form>
        <button type="button" class="btn btn-btn" data-bs-toggle="modal" data-bs-target="#addProductModal">Add New Product</button>
    </div>

    <table class="table table-bordered">
        <thead class="table-light">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Category</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (ProductDTO product : products) {
        %>
        <tr>
            <td><%= product.getProductId() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getCategory() %></td>
            <td><%= product.getPrice() %></td>
            <td><%= product.getQty() %></td>
            <td><img src="<%= request.getContextPath()%>/uploads/<%= product.getImage() %>" alt="Image" width="100"></td>
            <td>
                <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#editProductModal"
                        data-id="<%= product.getProductId() %>"
                        data-name="<%= product.getName() %>"
                        data-description="<%= product.getDescription() %>"
                        data-category="<%= product.getCategory() %>"
                        data-price="<%= product.getPrice() %>"
                        data-qty="<%= product.getQty() %>">
                    Update
                </button>
                <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteProductModal" data-id="<%= product.getProductId() %>">
                    Delete
                </button>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="8" class="text-center">No products found</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="product-save" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">

                    <div class="mb-3">
                        <label for="productId" class="form-label">Name</label>
                        <input type="text" class="form-control" id="productId" name="productId" required>
                    </div>
                    <div class="mb-3">
                        <label for="productName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="productName" name="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="productDescription" name="productDescription" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <input type="text" class="form-control" id="productCategory" name="productCategory" required>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="productPrice" name="productPrice" required>
                    </div>
                    <div class="mb-3">
                        <label for="productQty" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="productQty" name="productQty" required>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Image</label>
                        <input type="file" class="form-control" id="productImage" name="productImage" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Edit and Delete Modals -->
<!-- Similar structure to Add Modal -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="JQ/jquery-3.7.1.min.js"></script>
</body>
</html>
