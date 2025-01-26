<%@ page import="lk.ijse.assignment_01_aad.dto.UserDTO" %>
<%@ page import="java.util.List" %>
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
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
        }

        footer a {
            color: deeppink;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
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
                User Management
            </a>
        </div>
    </section>
</div>

<div class="table">
    <div style="display: flex;">
        <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="height: 40px; margin-top: 10px; margin-left: 74px;">
            <button class="btn btn-btn btn-outline-success" type="submit" style="background-color: #f3d4dd; border-color: deeppink; color: deeppink;">Search</button>
        </form>
        <button type="button" class="btn btn-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Add New User</button>
    </div>


    <div class="card-body">
        <table class="table table-bordered">
            <thead class="table-light">
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Position</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="userTableBody">
            <%
                List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (UserDTO userDTO : users) {
            %>

            <!-- Dynamic rows will be added here -->
            <tr>
                <td><%= userDTO.getUser_id() %></td>
                <td><%= userDTO.getName() %></td>
                <td><%= userDTO.getEmail() %></td>
                <td><%= userDTO.getPosition() %></td>
                <td>
                    <button id="update-btn" class="btn btn-outline-success"
                            data-bs-toggle="modal"
                            data-bs-target="#UpdateUserModal"
                            data-id="<%= userDTO.getUser_id() %>"
                            data-username="<%= userDTO.getName() %>"
                            data-email="<%= userDTO.getEmail() %>"
                            data-position="<%= userDTO.getPosition() %>">
                        <i class="bi bi-pencil"></i> Update
                    </button>
                    <button id="delete-btn" class="btn btn-outline-danger"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteUserModal"
                            data-id="<%= userDTO.getUser_id() %>">
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
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">User Form</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="row g-3 needs-validation" action="user-save" method="post" novalidate>
                        <div class="col-md-12">
                            <label for="userName" class="form-label">User Name</label>
                            <input type="text" class="form-control" id="userName" name="userName" required>
                        </div>
                        <div class="col-md-12">
                            <label for="userEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="userEmail" name="userEmail" required>
                        </div>
                        <div class="col-md-12">
                            <label for="userPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="userPassword" name="userPassword" required>
                        </div>
                        <div class="mb-3">
                            <label for="userPosition" class="form-label">Position</label>
                            <select class="form-select" id="userPosition" name="userPosition" required>
                                <option value="Admin">Admin</option>
                                <option value="User">User</option>
                            </select>
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
    <div class="modal fade" id="UpdateUserModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="UpdateUserModalLabel">User Form</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="row g-3 needs-validation" action="user-update" method="post" novalidate>

                        <div class="col-md-12">userId
                            <label for="user_id" class="form-label">User Id</label>
                            <input type="text" class="form-control" id="user_id" name="userId" required>
                        </div>
                        <div class="col-md-12">
                            <label for="user_name" class="form-label">User Name</label>
                            <input type="text" class="form-control" id="user_name" name="userName" required>
                        </div>
                        <div class="col-md-12">
                            <label for="user_email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="user_email" name="userEmail" required>
                        </div>
                        <div class="col-md-12">
                            <label for="user_position" class="form-label">Position</label>
                            <input type="text" class="form-control" id="user_position" name="userPosition" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-outline-success">Update</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete User Modal -->
    <div class="modal fade" id="deleteUserModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deleteUserModalLabel">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="deleteUserModalLabel">Are you sure?</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    You won't be able to revert this!
                </div>
                <form id="deleteUserForm" action="user-delete" method="post">
                    <!-- Hidden input for User ID -->
                    <input type="hidden" id="UserId" name="userId">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-outline-danger">Yes, delete it!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

<!-- Footer -->
<footer class="mt-5">
    <div class="container text-center">
        <p>&copy; 2025 Flora | All Rights Reserved. <a href="#">Privacy Policy</a></p>
    </div>
</footer>

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
    const deleteUserModal = document.getElementById('deleteUserModal');
    deleteUserModal.addEventListener('show.bs.modal', function (event) {
        // Button that triggered the modal
        const button = event.relatedTarget;

        // Extract User ID from data-id attribute
        const userId = button.getAttribute('data-id');

        // Set the hidden input value in the Delete Modal
        document.getElementById('UserId').value = userId;
    });


</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
