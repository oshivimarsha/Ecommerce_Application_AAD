let home_nav = document.getElementById("home-nav");
let product_nav = document.getElementById("product-nav");
let item_nav = document.getElementById("item-nav");
let order_nav = document.getElementById("order-nav");
let orderDetail_nav = document.getElementById("orderDetail-nav")


let home_section = document.getElementById("home_section");
let product_section = document.getElementById("product_section");
let item_section = document.getElementById("item_section");
let order_section = document.getElementById("order_section");
let orderDetail_section = document.getElementById("orderDetail_section")


document.getElementById("product_section").style.display = "none";
document.getElementById("item_section").style.display = "none";
document.getElementById("order_section").style.display="none";
document.getElementById("orderDetail_section").style.display="none";


home_nav.addEventListener('click', function () {
    document.getElementById("home_section").style.display="block"
    document.getElementById("product_section").style.display = "none";
    document.getElementById("item_section").style.display = "none";
    document.getElementById("order_section").style.display="none";
    document.getElementById("orderDetail_section").style.display="none";
});

product_nav.addEventListener('click', function () {
    document.getElementById("home_section").style.display="none"
    document.getElementById("product_section").style.display = "block";
    document.getElementById("item_section").style.display = "none";
    document.getElementById("order_section").style.display="none";
    document.getElementById("orderDetail_section").style.display="none";
});

item_nav.addEventListener('click', function () {
    document.getElementById("home_section").style.display="none"
    document.getElementById("product_section").style.display = "none";
    document.getElementById("item_section").style.display = "block";
    document.getElementById("order_section").style.display="none";
    document.getElementById("orderDetail_section").style.display="none";
});

order_nav.addEventListener('click', function () {
    document.getElementById("home_section").style.display="none"
    document.getElementById("product_section").style.display = "none";
    document.getElementById("item_section").style.display = "none";
    document.getElementById("order_section").style.display="block";
    document.getElementById("orderDetail_section").style.display="none";
});

orderDetail_nav.addEventListener('click', function () {
    document.getElementById("home_section").style.display="none"
    document.getElementById("product_section").style.display = "none";
    document.getElementById("item_section").style.display = "none";
    document.getElementById("order_section").style.display="none";
    document.getElementById("orderDetail_section").style.display="block";
});