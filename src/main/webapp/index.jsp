<%@ page import="lk.ijse.assignment_01_aad.dto.UserDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
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

    .hero {
      background-color: #f3d4dd;
      padding: 0 15%;
    }

    .icons {
      font-size: 25px;
      color: deeppink;
    }

    h1 {
      font-weight: bold;
      font-size: 50px;
    }

    .btn-pro i {
      margin-right: 10px;
      color: #FF1493FF;
      font-size: 20px;
    }

    .btn-pro a {
      position: relative;
      display: inline-block;
      font-size: 1.2em;
      letter-spacing: 0.1em;
      color: #FF1493FF;
      text-decoration: none;
      text-transform: uppercase;
      border: 2px solid #FF1493FF;
      padding: 10px 30px;
      z-index: 1;
      overflow: hidden;
      margin-bottom: 20px;
      margin-right: 10px;
      margin-left: 10px;
    }

    .btn-pro a:hover {
      color: #6c093e;
    }

    .btn-pro i:hover {
      color: deeppink;
    }

    .btn-pro a::before {
      content: '';
      position: absolute;
      top: 0;
      left: -50px;
      width: 0;
      height: 100%;
      background-color: deeppink;
      transform: skewX(35deg);
      z-index: -1;
      transition: 1s;
    }

    .btn-pro a:hover:before {
      width: 100%;
      background-color: deeppink;
    }

    .home {
      position: relative;
      width: 100%;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 30px;
    }

    .home-text h3 {
      margin-top: -20px;
    }

    .home p {
      margin-bottom: 30px;
    }


    /*-----------------------------------------*/
    #Service {
      margin-top: 140px;

    }

    .container-service {
      min-height: 50vh;
      width: 100%;
      background-color: #f3d4dd;
    }

    .service-wrapper {
      padding: 5% 8%;
    }

    .service {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .cards-service {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 30px;
      margin-top: -200px;
    }

    .card-service {
      height: 350px;
      width: 370px;
      background-color: #f3d4dd;
      padding: 3% 8%;
      border: 2px solid #f3d4dd;
      border-radius: 8px;
      transition: 0.6s;
      display: flex;align-items: center;
      flex-direction: column;
      position: relative;
      overflow: hidden;
    }

    .card-service:after {
      content: '';
      position: absolute;
      top: 150%;
      left: -200px;
      width: 120%;
      transform: rotate(50deg);
      background-color: #ffffff;
      height: 18px;
      filter: blur(30px);
      opacity: 0.5;
      transition: 1s;
    }

    .card-service:hover:after {
      width: 225%;
      top: -100%;
    }

    .card-service img {
      margin-top: 10px;
      margin-bottom: 20px;
      width: 150px;
    }

    .card-service h3 {
      color: black;
      font-size: 20px;
      font-weight: 600;
      letter-spacing: 1px;
    }

    .card-service p {
      text-align: center;
      width: 100%;
      margin: 10px 0;
      color: black;
    }

    .card-service:hover {
      background-color: transparent;
      transform: translateY(-8px);
      border-color: deeppink;
      /* box-shadow: 0 0 10px deeppink, 0 0 30px deeppink;*/
    }

    .card-service:hover i {
      color: #c79900;
    }

    @media screen and (max-width: 1200px) {
      .cards-service {
        grid-template-columns: repeat(2, 1fr);
      }
    }

    @media screen and (max-width: 900px) {
      .cards-service {
        grid-template-columns: repeat(1, 1fr);
      }

      .card-service {
        height: 280px;
        width: 300px;
      }
    }

    @media screen and (max-width: 425px) {
      .card-service h2 {
        margin-top: -20px;
      }

      .card-service p {
        margin-bottom: -500px;
      }
    }

    /* Hero Section */


    .hero h1 {
      font-size: 2.5rem;
      margin-bottom: 15px;
    }

    .hero p {
      font-size: 1.2rem;
      margin-bottom: 20px;
    }

    .hero .btn {
      background: #d93f6c;
      color: #fff;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      font-weight: bold;
    }

    .hero .btn:hover {
      background: #8f1e3f;
    }

    .special {
      position: relative;
      /*top: 1637px;*/
      top: -200px;
    }

    .container-special img {
      position: absolute;
      width: 1519px;
    }

    .container-special h1 {
      position: relative;
      top: 40px;
      font-weight: 1000;
      font-size: 130px;
      color: white;
      margin: 100px;
    }

    .container-special h4 {
      position: relative;
      top: 20px;
      left: 100px;
      font-size: 50px;
      color: white;
      margin: 100px;
    }

    .container-special h2 {
      position: relative;
      top: -90px;
      left: 60px;
      font-weight: 1000;
      font-size: 150px;
      color: white;
      margin: 100px;
    }

    .container-special .btn-pro {
      position: absolute;
      top: 550px;
      margin-left: 300px;
    }

    .container-special .btn-pro a {
      color: #ffffff;
      border: 2px solid #ffffff;
    }

    .container-special .btn-pro a::before {
      background-color: #ffffff;
    }

    .container-special .btn-pro a:hover {
      color: #330202;
    }

    /*@media screen and (max-width: 1200px) {
        .container-special img {
            width: 1200px;
        }
    }

    @media screen and (max-width: 900px) {
        .container-special img {
            width: 00px;
        }
    }

    @media screen and (max-width: 425px) {
        .card-service h2 {
            margin-top: -20px;
        }

        .card-service p {
            margin-bottom: -500px;
        }
    }*/

    .container-category {
      min-height: 100vh;
      width: 100%;
    }

    .container-category span {
      font-size: 70px;
    }

    #Category {
      margin-top: 80px;
      margin-bottom: 200px;
    }

    .heading-category {
      font-size: 55px;
      font-weight: bold;
      text-align: center;
      margin-top: 30px;
      margin-bottom: -30px;
    }


    .container-category {
      min-height: 100vh;
      width: 100%;
      background-color: #f3d4dd ;
    }

    .category-wrapper {
      padding: 5% 8%;
    }

    .category {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .cards-category {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 30px;
      margin-top: 80px;
    }

    .card-category {
      height: 350px;
      width: 270px;
      background-color: transparent;
      padding: 3% 8%;
      border: 0.2px solid deeppink;
      border-radius: 8px;
      transition: 0.6s;
      display: flex;align-items: center;
      flex-direction: column;
      position: relative;
      overflow: hidden;
    }

    .card-category h2 {
      color: #000000;
      font-size: 20px;
      font-weight: 600;
      letter-spacing: 1px;
    }

    .card-category p {
      text-align: center;
      width: 100%;
      margin: 28px 0;
      color: rgba(0, 0, 0, 0.6);
    }

    .card-category :hover i {
      color: #f3d4dd;
    }

    @media screen and (max-width: 1200px) {
      .cards-service {
        grid-template-columns: repeat(2, 1fr);
      }
    }

    @media screen and (max-width: 900px) {
      .cards-service {
        grid-template-columns: repeat(1, 1fr);
      }

      .heading-service {
        font-size: 3.5rem;
      }

      .card-service {
        height: 280px;
        width: 300px;
      }
    }

    @media screen and (max-width: 425px) {
      .heading-service {
        font-size: 35px;
      }

      .card-service i {
        margin-top: 5px;
      }

      .card-service h2 {
        margin-top: -20px;
      }

    }

    .addToCartBtn {
      width: 150px;
      background-color: transparent;
      border-color: deeppink;
    }

    .addToCartBtn:hover {
      background-color: deeppink;
      color: white;
    }

    .card-category img {
      margin-bottom: 20px;
    }

    .card-category i {
      margin-left: 200px;
      position: relative;
      left: -4px;
      bottom: -7px;
      margin-top: -10px;
      margin-bottom: 10px;
      font-size: 30px;
    }

    /* Products Section */
    .products {
      padding: 50px 0;
      background: #ffffff;
    }

    .products .section-title {
      text-align: center;
      margin-bottom: 40px;
      font-size: 3rem;
      color: #d32759;
      font-weight: 800;
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

    /* Footer */
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
    <a class="navbar-brand" href="#"><span>Flora</span></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" >
      <ul class="nav justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="shop.jsp">Shop</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Category</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle <!--disabled-->" href="#" role="button" data-bs-toggle="dropdown" aria-disabled="true">
            Manage
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="customer-list.jsp">Customer</a></li>
            <li><a class="dropdown-item" href="product-list">Product</a></li>
            <li><a class="dropdown-item" href="category.jsp">Category</a></li>
            <li><a class="dropdown-item" href="user-save">User</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>

      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit" style="background-color: #f3d4dd; border-color: deeppink; color: deeppink;">Search</button>
      </form>

      <div class="icons">
        <a href="login.jsp"><i class='bx bx-log-in-circle' style="color: deeppink"></i></a>
        <a href="#"><i class='bx bxs-user-circle'></i></a>
        <a href="#"><i class='bx bxs-cart-add' ></i></a>
        <a href="#"><i class='bx bx-log-out-circle' ></i></a>
        <br>
      </div>
    </div>
  </div>
</nav>

<!--Main Page-->
<div id="carouselExampleCaptions" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <main class="hero" id="Home">
        <a href="#">Admin Dashboard</a>
        <section class="home">
          <div class="home-text">
            <h1 class="animate__animated animate__pulse">Find your own  happiness</h1>
            <h3 class="animate__animated animate__pulse">Natural & Beautiful Flowers</h3>
            <p class="animate__animated animate__pulse">Blooms that enchant, bouquets that delight! Explore our exquisite flower shop for a touch of elegance and beauty.
            </p>

            <div class="btn-pro">
              <a href="#">Shop Now</a>
            </div>
          </div>

          <div class="home-img" data-aos="zoom-in">
            <img src="assets/images/flowerMain.png" title="my image" alt="my image" class="flower">
          </div>

        </section>

      </main>
    </div>

    <div class="carousel-item">
      <main class="hero" id="Home2">
        <a href="#">Admin Dashboard</a>
        <section class="home">
          <div class="home-text">
            <h1 class="animate__animated animate__pulse">Find your own  happiness</h1>
            <h3 class="animate__animated animate__pulse">Natural & Beautiful Flowers</h3>
            <p class="animate__animated animate__pulse">Blooms that enchant, bouquets that delight! Explore our exquisite flower shop for a touch of elegance and beauty.
            </p>

            <div class="btn-pro">
              <a href="#">Shop Now</a>
            </div>
          </div>

          <div class="home-img" data-aos="zoom-in">
            <img src="assets/images/vase.png" title="my image" alt="my image" class="flower" style="width: 400px;">
          </div>

        </section>

      </main>
    </div>

    <div class="carousel-item">
      <main class="hero" id="Home3">
        <a href="#">Admin Dashboard</a>
        <section class="home">
          <div class="home-text">
            <h1 class="animate__animated animate__pulse">Find your own  happiness</h1>
            <h3 class="animate__animated animate__pulse">Natural & Beautiful Flowers</h3>
            <p class="animate__animated animate__pulse">Blooms that enchant, bouquets that delight! Explore our exquisite flower shop for a touch of elegance and beauty.
            </p>

            <div class="btn-pro">
              <a href="#">Shop Now</a>
            </div>
          </div>

          <div class="home-img" data-aos="zoom-in">
            <img src="assets/images/wedding%20boq.png" title="my image" alt="my image" class="flower">
          </div>

        </section>

      </main>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!--Services-->
<main id="Service" class="service">
  <section class="container-service">
    <div class="service-wrapper">
      <div class="service">
        <div class="cards-service">
          <div class="card-service" data-aos="flip-left">
            <img src="assets/images/card1.png" title="my image" alt="my image" class="girl">
            <h3>FARM-FRESH QUALITY</h3>
            <p>Sourced from our very own farms, our flowers stay fresh for longer.</p>
          </div>

          <div class="card-service" data-aos="flip-left">
            <img src="assets/images/card2.png" title="my image" alt="my image" class="girl">
            <h3>ARTISAN BOUQUETS</h3>
            <p>Our handcrafted creations feature exquisite flowers nurtured in our farms, designed to meet global floral standards.</p>
          </div>

          <div class="card-service" data-aos="flip-left">
            <img src="assets/images/card3.png" title="my image" alt="my image" class="girl">
            <h3>FAST DELIVERY SERVICE</h3>
            <p>From last-minute celebrations to the most important moments of the year, we deliver flowers when it counts.</p>
          </div>

        </div>
      </div>
    </div>
  </section>
</main>

<!-- Products Section -->
<section class="products">
  <div class="container">
    <h2 class="section-title">Our Products</h2>
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
        <img src="assets/images/item8.png" alt="Tulips">
        <h3>Tulips</h3>
        <p>$18.00</p>
        <a href="#" class="btn">Add to Cart</a>
      </div>
      <div class="product-card">
        <img src="assets/images/Item1.png" alt="Lilies">
        <h3>Lilies</h3>
        <p>$22.00</p>
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
        <img src="assets/images/item5.png" alt="Tulips">
        <h3>Tulips</h3>
        <p>$18.00</p>
        <a href="#" class="btn">Add to Cart</a>
      </div>
      <div class="product-card">
        <img src="assets/images/item6.png" alt="Lilies">
        <h3>Lilies</h3>
        <p>$22.00</p>
        <a href="#" class="btn">Add to Cart</a>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
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