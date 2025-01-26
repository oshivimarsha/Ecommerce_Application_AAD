<%@ page import="lk.ijse.assignment_01_aad.dto.UserDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment_01_aad.dto.CategoryDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
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
                Category Management
            </a>
        </div>
    </section>
</div>

<div class="table">
    <div style="display: flex;">
        <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="height: 40px; margin-top: 10px; margin-left: 74px;">
            <button class="btn btn-btn btn-outline-success" type="submit" style="width: 250px; height: 40px; background-color: #f3d4dd; border-color: deeppink; color: deeppink;">Search</button>
        </form>
        <button type="button" class="btn btn-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="width: 250px; height: 40px">Add New Category</button>
    </div>


    <div class="card-body">
        <table class="table table-bordered">
            <thead class="table-light">
            <tr>
                <th>Category ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="userTableBody">
            <%
                List<CategoryDTO> catogory = (List<CategoryDTO>) request.getAttribute("categories");
                if (catogory != null && !catogory.isEmpty()) {
                    for (CategoryDTO categoryDTO : catogory) {
            %>

            <!-- Dynamic rows will be added here -->
            <tr>
                <td><%= categoryDTO.getId() %></td>
                <td><%= categoryDTO.getName() %></td>
                <td><%= categoryDTO.getDescription() %></td>
                <td>
                    <button id="update-btn" class="btn btn-outline-success"
                            data-bs-toggle="modal"
                            data-bs-target="#UpdateCategoryModal"
                            data-id="<%= categoryDTO.getId() %>"
                            data-name="<%= categoryDTO.getName() %>"
                            data-description="<%= categoryDTO.getDescription() %>">
                        <i class="bi bi-pencil"></i> Update
                    </button>
                    <button id="delete-btn" class="btn btn-outline-danger"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteCategoryModal"
                            data-id="<%= categoryDTO.getId() %>">
                        <i class="bi bi-trash"></i> Delete
                    </button>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5" class="text-center">No users found</td>
            </tr>
            <%
                }
            %>

            </tbody>
        </table>

    </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Category Form</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="row g-3 needs-validation" action="category-save" method="post" novalidate>
                        <div class="col-md-12">
                            <label for="categoryName" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                        </div>
                        <div class="col-md-12">
                            <label for="categoryDescription" class="form-label">Description</label>
                            <input type="text" class="form-control" id="categoryDescription" name="categoryDescription" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="UpdateCategoryModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="UpdateCategoryModalLabel">C Form</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="row g-3 needs-validation" action="category-update" method="post" novalidate>

                        <div class="col-md-12">
                            <label for="category_id" class="form-label">Category Id</label>
                            <input type="text" class="form-control" id="category_id" name="categoryId" required>
                        </div>
                        <div class="col-md-12">
                            <label for="category_name" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="category_name" name="categoryName" required>
                        </div>
                        <div class="col-md-12">
                            <label for="category_description" class="form-label">Description</label>
                            <input type="text" class="form-control" id="category_description" name="categoryDescription" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete User Modal -->
    <div class="modal fade" id="deleteCategoryModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deleteUserModalLabel">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="deleteCategoryModalLabel">Are you sure?</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    You won't be able to revert this!
                </div>
                <form id="deleteCategoryForm" action="category-delete" method="post">
                    <!-- Hidden input for User ID -->
                    <input type="hidden" id="CategoryId" name="categoryId">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-outline-danger">Yes, delete it!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>



<script src="JQ/jquery-3.7.1.min.js"></script>

<script>

    $(document).on('click', '#update-btn', function () {
        const categoryId = $(this).data('id');
        const name = $(this).data('name');
        const description = $(this).data('description');

        $('#category_id').val(categoryId);
        $('#category_name').val(name);
        $('#category_description').val(description);
    });


    const deleteCategoryModal = document.getElementById('deleteCategoryModal');
    deleteCategoryModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        const categoryId = button.getAttribute('data-id');
        document.getElementById('CategoryId').value = categoryId;
    });


</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
