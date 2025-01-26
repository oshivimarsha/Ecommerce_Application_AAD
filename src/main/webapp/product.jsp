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
            color: #f12f67;
            font-size: 35px;
            letter-spacing: 2px;
        }

        #navbarSupportedContent {
            text-align: center;
            justify-items: center;
            justify-content: space-between;
            margin-left: 100px;
            letter-spacing: 2px;
            color: black;
        }

        .hero {
            background-color: #f3d4dd;
            padding: 0 15%;
        }

        .icons {
            font-size: 25px;
            color: #f12f67;
            gap: 20px;
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

        /* Footer ------------------------------------------------------------------------------------------------------- */
        .footer {
            background: #d32759;
            color: #ffffff;
            padding: 20px 0;
            text-align: center;
        }

        .footer .social-links {
            list-style: none;
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .footer .social-links li {
            margin: 0 10px;
        }

        .footer .social-links a {
            color: #fff;
            font-size: 1.5rem;
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
                    <a class="nav-link" href="shop.jsp" style="color: black;">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product-list" style="color: black;">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category-save" style="color: black;">Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user-save" style="color: black;">User</a>
            </ul>

            <div class="icons d-flex align-items-center ms-3">
                <a href="login.jsp" class="me-2"><i class='bx bx-log-in-circle' style="color: #000000; font-size: 1.5rem;"></i></a>
                <a href="userProfile.jsp" class="me-2"><i class='bx bxs-user-circle' style="color: #000000; font-size: 1.5rem;"></i></a>
                <a href="#" class="me-2"><i class='bx bxs-cart-add' style="color: #000000; font-size: 1.5rem;"></i></a>
                <a href="#"><i class='bx bx-log-out-circle' style="color: #000000; font-size: 1.5rem;"></i></a>
            </div>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <section>
        <div class="form-floating mb-3" style="font-size: 40px; font-weight: 600;">
            <a class="navbar-brand" href="#">
                <img src="assets/images/customer.png" alt="Customer" style="width: 60px; height: 60px;">
                Product Management
            </a>
        </div>
    </section>
</div>

<div class="container mt-5">

    <div style="display: flex;">
        <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="height: 40px; margin-top: 10px; margin-left: 74px;">
            <button class="btn btn-btn btn-outline-success" type="submit" style="background-color: #f3d4dd; border-color: deeppink; color: deeppink; width: 200px; height: 40px">Search</button>
        </form>
        <button type="button" class="btn btn-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="width: 250px; height: 40px">Add New Product</button>
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
            <td><img src="<%=request.getContextPath()%>/uploads/<%=product.getImage()%>" alt="Image" width="100"></td>

            <%--<%
                String message = request.getContextPath();
            %>
            <p>The message is: <%= message %></p>
--%>
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
                        <label for="productId" class="form-label">Id</label>
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
<!-- Delete User Modal -->
<div class="modal fade" id="deleteProductModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deleteUserModalLabel">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="deleteUserModalLabel">Are you sure?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                You won't be able to revert this!
            </div>
            <form id="deleteUserForm" action="product-delete" method="post">
                <!-- Hidden input for User ID -->
                <input type="hidden" id="product_id" name="productId">
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-outline-danger">Yes, delete it!</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Footer-->
<%--<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <p>© 2025 FloraShop. All Rights Reserved.</p>
            <ul class="social-links">
                <li><a href="#"><i class="bx bxl-facebook"></i></a></li>
                <li><a href="#"><i class="bx bxl-instagram"></i></a></li>
                <li><a href="#"><i class="bx bxl-twitter"></i></a></li>
                <li><a href="#"><i class="bx bxl-pinterest"></i></a></li>
            </ul>
        </div>
    </div>
</footer>--%>


<!-- Include jQuery -->
<script src="JQ/jquery-3.7.1.min.js"></script>

<script>

    // Handle Update Modal Population
    $(document).on('click', '#update-btn', function () {
        // Extract data from the clicked button
        const userId = $(this).data('id');
        const name = $(this).data('username');
        const email = $(this).data('email');
        const position = $(this).data('position');

        // Populate the Update Modal fields
        $('#user_id').val(userId);
        $('#user_name').val(name);
        $('#user_email').val(email);
        $('#user_position').val(position);
    });

    // Handle Delete Modal Population
    const deleteProductModal = document.getElementById('deleteProductModal');
    deleteProductModal.addEventListener('show.bs.modal', function (event) {
        // Button that triggered the modal
        const button = event.relatedTarget;

        // Extract User ID from data-id attribute
        const product_id = button.getAttribute('data-id');

        // Set the hidden input value in the Delete Modal
        document.getElementById('product_id').value = product_id;

    });




</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="JQ/jquery-3.7.1.min.js"></script>
</body>
</html>
