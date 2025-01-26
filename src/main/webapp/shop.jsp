<%--
  Created by IntelliJ IDEA.
  User: CHAMA COMPUTERS
  Date: 1/24/2025
  Time: 11:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shop</title>
    <link rel="icon" type="imge/x-icon" href="Image/Hot%20Chili%20logo%20design%20template.jpg">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="Style/normalize.css">
    <link rel="stylesheet" href="Style/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100..900;1,100..900&family=Philosopher:ital,wght@0,400;0,700;1,400;1,700&family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

    <style>
        body {
            background-color: #f3d4dd;

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

        .container {
            display: flex;
            gap: 20px;
            width: 100%;
            max-width: 1500px;
            margin: 0 auto;
            align-items: flex-start;
            padding: 20px;
        }

        /* Sidebar Filter */
        .filter {
            width: 25%;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-height: 600px;
            display: flex;
            flex-direction: column;
            overflow-y: auto; /* Enable vertical scrolling */
        }

        .filter h3 {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 15px;
        }

        .filter::-webkit-scrollbar {
            width: 8px;
        }

        .filter::-webkit-scrollbar-thumb {
            background-color: #ccc;
            border-radius: 4px;
        }

        .filter::-webkit-scrollbar-thumb:hover {
            background-color: #aaa;
        }

        .category-list {
            list-style: none;
            margin-bottom: 20px;
        }

        .category-list li {
            margin: 10px 0;
        }

        .category-list label {
            font-size: 0.9rem;
            color: #555;
        }

        .category-list input {
            margin-right: 10px;
        }

        .price-range {
            list-style: none;
            margin-top: auto; /* Push price range to the bottom */
            background: #fff;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .price-range li {
            margin: 10px 0;
        }

        .price-range label {
            font-size: 0.9rem;
            color: #555;
        }

        .price-range input {
            margin-right: 10px;
        }

        /* Product Section */
        .products {
            width: 75%;
            background: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .products h3 {
            font-size: 1.4rem;
            margin-bottom: 20px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .product-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
            padding: 15px;
            transition: transform 0.3s;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
            margin-bottom: 10px;
        }

        .product-card h3 {
            margin: 10px 0;
        }

        .product-card p {
            font-size: 1.1rem;
            color: #110f0f;
            margin-bottom: 10px;
        }

        .product-card .btn {
            background: #f12f67;
            color: #fff;
            padding: 8px 15px;
            text-decoration: none;
            border-radius: 5px;
        }

        .product-card .btn:hover {
            background: #ff006b;
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
            <%--<form class="d-flex" role="search">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit" style="background-color: #f3d4dd; border-color: deeppink; color: deeppink;">Search</button>
            </form>--%>
            <div class="icons d-flex align-items-center ms-3">
                <a href="login.jsp" class="me-2"><i class='bx bx-log-in-circle' style="color: #000000; font-size: 1.5rem;"></i></a>
                <a href="#" class="me-2"><i class='bx bxs-user-circle' style="color: #000000; font-size: 1.5rem;"></i></a>
                <a href="#" class="me-2"><i class='bx bxs-cart-add' style="color: #000000; font-size: 1.5rem;"></i></a>
                <a href="#"><i class='bx bx-log-out-circle' style="color: #000000; font-size: 1.5rem;"></i></a>
            </div>
        </div>
    </div>
</nav>

<div class="container">

    <aside class="filter">
        <h3>Filter by Category</h3>
        <ul class="category-list">
            <li><label><input type="radio" name="category" value="roses"> Roses</label></li>
            <li><label><input type="radio" name="category" value="tulips"> Tulips</label></li>
            <li><label><input type="radio" name="category" value="orchids"> Orchids</label></li>
            <li><label><input type="radio" name="category" value="lilies"> Lilies</label></li>
            <li><label><input type="radio" name="category" value="sunflowers"> Sunflowers</label></li>
            <li><label><input type="radio" name="category" value="daisies"> Daisies</label></li>
            <li><label><input type="radio" name="category" value="peonies"> Peonies</label></li>
            <li><label><input type="radio" name="category" value="carnations"> Carnations</label></li>
            <li><label><input type="radio" name="category" value="gardenias"> Gardenias</label></li>
            <li><label><input type="radio" name="category" value="marigolds"> Marigolds</label></li>
        </ul>

        <h3>Filter by Price</h3>
        <ul class="price-range">
            <li><label><input type="radio" name="price" value="0-500"> Under Rs. 500</label></li>
            <li><label><input type="radio" name="price" value="500-1000"> Rs. 500 - Rs. 1000</label></li>
            <li><label><input type="radio" name="price" value="1000-2000"> Rs. 1000 - Rs. 2000</label></li>
            <li><label><input type="radio" name="price" value="2000-5000"> Rs. 2000 - Rs. 5000</label></li>
            <li><label><input type="radio" name="price" value="5000+"> Over Rs. 5000</label></li>
        </ul>
    </aside>


    <main class="products filter">
        <h3>Selected Products will appear here</h3>
        <div id="product-display">
            <div class="product-grid">
                <div class="product-card">
                    <img src="assets/images/item9.png" alt="Rose Bouquet">
                    <h3>Rose Bouquet</h3>
                    <p>$25.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item6.png" alt="Sunflowers">
                    <h3>Sunflowers</h3>
                    <p>$20.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item3.png" alt="Rose Bouquet">
                    <h3>Rose Bouquet</h3>
                    <p>$25.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item4.png" alt="Sunflowers">
                    <h3>Sunflowers</h3>
                    <p>$20.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item5.png" alt="Rose Bouquet">
                    <h3>Rose Bouquet</h3>
                    <p>$25.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item7.png" alt="Sunflowers">
                    <h3>Sunflowers</h3>
                    <p>$20.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item8.png" alt="Rose Bouquet">
                    <h3>Rose Bouquet</h3>
                    <p>$25.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item10.png" alt="Sunflowers">
                    <h3>Sunflowers</h3>
                    <p>$20.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item9.png" alt="Rose Bouquet">
                    <h3>Rose Bouquet</h3>
                    <p>$25.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item6.png" alt="Sunflowers">
                    <h3>Sunflowers</h3>
                    <p>$20.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item9.png" alt="Rose Bouquet">
                    <h3>Rose Bouquet</h3>
                    <p>$25.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/item6.png" alt="Sunflowers">
                    <h3>Sunflowers</h3>
                    <p>$20.00</p>
                    <a href="#" class="btn">Add to Cart</a>
                </div>
            </div>
        </div>
    </main>
</div>

<!-- Footer-->
<footer class="footer">
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
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
