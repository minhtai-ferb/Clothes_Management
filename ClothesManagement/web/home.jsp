<%-- 
    Document   : home
    Created on : Oct 24, 2023, 10:57:18 PM
    Author     : minht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <title>Home Page</title>

        <style>
            header {
                position: fixed;
                transition: background-color 0.3s;
                height: 4rem;
            }

            header:hover {
                background-color: white;
                border-bottom: 1px solid #cecdcd;
            }

            a {
                text-decoration: none;
            }

            #item {
                color: #ffffff;
                font-size: 1.5rem;
                padding: auto;
                margin: auto;
            }

            header:hover #item {
                color: black;
            }

            header.sticky #item {
                color: black;
            }

            header.sticky {
                background: white;
                border-bottom: 1px solid #cecdcd;
            }

            .banner {
                padding: 0;
                margin: 0;
                width: 100%;

            }

            .img-pro{
                margin: 0;
                padding: 0 0;
                width: 100%;
                height: auto;
            }

            .name-pro{
                padding: 0 1rem 0 0;
                margin: 0 0;
                font-size: small;
            }

            .price{
                padding: 0 0;
                margin: 0 0;
                font-size: smaller;
            }

            .pro {
                padding: 1rem 2rem;
            }

            .text-gmail {
                font-size: medium;
            }

            #gmail-sub {
                background-color: transparent;
                border: 0.5px solid #ffffff;
                color: #f8f8f8;
                width: 28rem;
                height: 2.8rem;               
                transition: background-color 0.3s, color 0.3s, border 0.3s;
            }

            #gmail-sub:focus {
                background-color: transparent;
                border: 0.5px solid #ffffff;
            }

            #SUBSCRIBE {
                background-color: #ffffff;
                border: 0.5px solid #ffffff;
                width: 8rem;
                height: 2.8rem;
                color: #000;
                font-weight: bold;
                cursor: pointer;
                background: linear-gradient(to right, rgba(253, 253, 253, 0) 50%, rgb(255, 255, 255) 50%);
                background-size: 200% 100%;
                background-position: 100% 0;
                transition: color 0.45s cubic-bezier(0.785, 0.135, 0.15, 0.86), border 0.45s cubic-bezier(0.785, 0.135, 0.15, 0.86), background-position 0.3s;

            }

            #SUBSCRIBE:hover {
                background-position: 0 0;
                background-color: transparent;
                color: white;
                border: 0.5px solid #ffffff;
                text-shadow: 0 1px rgba(0,0,0,.5);
            }

            .sub-title {
                font-family: 'Times New Roman', Times, serif;
                font-size: larger;
                font-weight: bold;
            }

            .sub-p {
                font-family: 'Times New Roman', Times, serif;
                font-size: medium;
                padding:1rem 10rem 1rem 10rem;
                font-weight: bold;
                text-shadow: 0 1px rgba(0,0,0,.5);
            }

            .sub-p1 {
                font-size: small;
                font-weight: bold;
                text-shadow: 0 1px rgba(0,0,0,.5);
            }

            .offcanvasbutton {
                background-color: transparent;
                border: 0px solid transparent;
                padding: 0;
                margin: 0 0 0 0;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .nav-item {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .checkout-button {
                background: linear-gradient(90deg, rgba(0, 0, 0, 0) 50%, #000 50% );
                background-size: 200% 100%; 
                background-position: 100%;
                border: 1px solid black;
                color: #ffffff;
                font-weight: 600;
                transition: background-position 0.3s, color 0.3s; 
                width: 100%;
                text-align: center;
                padding: 10px 0;
            }

            .checkout-button:hover {
                background-position: 0%; 
                color: #000; 
            }

            .pro-desrip {
                width: 400px;
                background-color: white;
            }
            .cart-img {
                width: 150px;
            }

            .cart-p {
                width: 200px;
            }

            .offcanvasheader {
                border-bottom: 1px solid #cecdcd;
                height: 70px;
            }


            .input-num {
                width: 30px;
            }

            .offcanvas-header .search-input {
                width: 100%;
                background: transparent;
                border: none; 
                color: black; 
                outline: none;
            }
            .offcanvas-header .search-input:focus {
                outline: none; 
            }

            .offcanvas-topp {
                padding-top: 85px;
            }
            :root {
                --custom-offcanvas-height: 20vh;
            }
            .offcanvas.offcanvas-top {
                height: var(--custom-offcanvas-height);
            }
            .search-body {
                display: none; 
            }
        </style>
    </head>
    <body>
        <header class="container-fluid text-center" id="header">
            <div class="row d-flex align-items-center">
                <div class="col text-start">
                    <a class="nav-link" href="">
                        <i class="fas fa-bars bar" id="item"></i>
                    </a> 
                </div>
                <div class="logo col">
                    <a class="text-center" href="MainController?action=Home" >
                        <img id="logo" src="https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_5928c853-b189-4927-af34-43b839cdfea8_125x.png?v=1614721042" alt="">
                    </a>
                </div>    
                <div class="col d-flex justify-content-end align-items-center">
                    <nav class="navbar navbar-expand-lg">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="MainController?action=Account" style="padding: 0; margin-right: 5px;">
                                    <i class="fas fa-user" id="item"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <button class="offcanvasbutton" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop" style="margin: 0 10px;">
                                    <i class="fas fa-search" id="item"></i>
                                </button>
                            </li>
                            <li class="nav-item">
                                <button class="offcanvasbutton" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" style="margin-right: 15px;">
                                    <i class="fas fa-shopping-cart" id="item"></i>
                                </button>
                            </li>                       
                        </ul>                                 
                    </nav>
                </div>               
            </div>  
        </header>

        <div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
            <header class="container-fluid text-center" id="header">
                <div class="row d-flex align-items-center">
                    <div class="col text-start">
                        <a class="nav-link" href="">
                            <i class="fas fa-bars bar" id="item"></i>
                        </a> 
                    </div>
                    <div class="logo col">
                        <a class="text-center" href="MainController?action=Home" >
                            <img id="logo" src="https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_125x.png?v=1614720781" alt="">
                        </a>
                    </div>    
                    <div class="col d-flex justify-content-end align-items-center">
                        <nav class="navbar navbar-expand-lg">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="MainController?action=Account" style="padding: 0; margin-right: 5px;">
                                        <i class="fas fa-user" id="item"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <button class="offcanvasbutton" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop" style="margin: 0 10px;">
                                        <i class="fas fa-search" id="item" ></i>
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button class="offcanvasbutton" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" style="margin-right: 20px;">
                                        <i class="fas fa-shopping-cart" id="item"></i>
                                    </button>
                                </li>                       
                            </ul>                                 
                        </nav>
                    </div>               
                </div>           
            </header>
            <div class="offcanvas-header offcanvas-topp">
                <input type="text" class="search-input" placeholder="Search..." id="searchInput" onkeyup="search()"/>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="offcanvas"
                    aria-label="Close"
                    ></button>
            </div>
            <div class="offcanvas-body search-body">
                <div class="container text-center">
                    <div class="row row-cols-4 list-pro" >   
                        <div id="noResultMessage" style="display: none;">We don't have this product!</div>                     
                        <c:if test="${sessionScope.LIST_PRODUCT == null || sessionScope.LIST_PRODUCT.size() == 0}">
                            <div class="offcanvas-body">
                                <p class="text-black text-center" style="top: 50%; left: 50%;">YOUR DEPOTS IS EMPTY</p>
                            </div> 
                        </c:if>
                        <c:if test="${sessionScope.LIST_PRODUCT != null}">
                            <c:if test="${not empty sessionScope.LIST_PRODUCT}">
                                <c:forEach var="product" varStatus="counter" items="${sessionScope.LIST_PRODUCT}" >
                                    <div class="col pro product">
                                        <a href="MainController?action=View_Product&value=${product.proName}" class="row row-cols-1">
                                            <c:forEach var="img" varStatus="counter" items="${product.imgURL}">
                                                <c:if test="${counter.index == 0}">
                                                    <img class="img-pro col" src="${img}">
                                                </c:if>
                                            </c:forEach>
                                            <h6 class="col name-pro text-body fw-bold text-sm-start" id="name-pro">${product.proName}</h6>
                                            <p class="col price text-secondary  text-sm-start">$${product.price}</p>
                                        </a>
                                    </div>
                                </c:forEach> 
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <form action="MainController" method="POST">
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                <div class="offcanvas-header offcanvasheader">
                    <h5 class="offcanvas-title" id="offcanvasRightLabel">CART</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <c:if test="${sessionScope.CART == null || sessionScope.CART.getCart().size() == 0}">
                    <div class="offcanvas-body container-fluid" style="display: flex; align-items: center; justify-content: center; height: 100%;">
                        <p class="text-black text-center">YOUR CART IS EMPTY</p>
                    </div> 
                </c:if>

                <c:if test="${sessionScope.CART != null}">
                    <c:if test="${sessionScope.CART.getCart().size() != 0}">
                        <div class="offcanvas-body container">                                                
                            <c:forEach items="${sessionScope.CART.getCart()}" var="cartOrder" varStatus="counter">
                                <div class="row row-cols-3" id="product-list" style="padding-left: 20px ;">
                                    <div class="col-1" style="width: 150px;">
                                        <img width="100%" src="${cartOrder.value.colorIMG} ">
                                    </div>  
                                    <div class="col-2 cart-p" style="margin-left: 10px; width: 180px; display: flex; flex-direction: column; align-items: start; justify-content: center;"> 
                                        <input type="hidden" name="idDetailCart" value="${cartOrder.value.detailID}"/>
                                        <p style="margin: 0; font-size: 14px; font-weight: 650;">${cartOrder.value.proName}</p>
                                        <p style="margin: 0; padding: 6px 0; font-size: 13px; font-weight: 550; color: #808080;">${cartOrder.value.colorDe}/${cartOrder.value.sizeDe}</p>
                                        <p style="margin: 0; padding: 0; font-size: 12.5px; font-weight: 550; color: #636363;">$${cartOrder.value.priceOrder}</p> 
                                        <div class="d-flex justify-content-between" style="margin: 0; padding-top: 30px; width: 180px;">
                                            <p style="margin: 0; text-align: center; display: flex; align-items: center; font-size: 14px; font-weight: 600; color: #636363;">Quantity: ${cartOrder.value.quantityOrder} piece</p>
                                            <button type="submit" class="btn" style="font-weight: 500; font-size: 12px; border-bottom: 0.5px solid grey; border-radius: 0; padding: 0;" name="action" value="Edit_Product">
                                                Edit
                                            </button>  
                                        </div>                                                                                                                      
                                        <c:set var="price" value="${cartOrder.value.priceOrder * cartOrder.value.quantityOrder}"></c:set>
                                        <c:set var="totalPrice" value="${totalPrice + price}"></c:set>
                                        </div>
                                    </div>
                            </c:forEach>
                        </div>
                        <div class="offcanvas-bottom container-fluid" style="border-top: 1px solid rgb(185, 185, 185);">
                            <div style="padding: 20px 30px 30px 30px;">
                                <p style="font-size: 14px; font-weight: 400; padding: 0; margin: 0;">Add Order Note</p>
                                <p style="font-size: 13px; color: #808080; margin: 4px 0 8px;">Shipping & taxes calculated at checkout</p>
                                <button type="submit" name="action" value="View_Checkout_Cart" class="container-fluid checkout-button" style="margin-top: 15px;">
                                    CHECKOUT - $${totalPrice}
                                </button> 
                            </div>                           
                        </div>           
                    </c:if>
                </c:if>
            </div>
        </form>

        <img class="img-fluid banner" src="https://elpisclothing.com/cdn/shop/files/2_1800x.jpg?v=1683539018">

        <main class="container align-items-center">
            <div class="container text-center list-pro">
                <div class="row row-cols-4" >

                    <c:if test="${sessionScope.LIST_PRODUCT == null || sessionScope.LIST_PRODUCT.size() == 0}">
                        <div class="offcanvas-body">
                            <p class="text-black text-center" style="top: 50%; left: 50%;">YOUR CART IS EMPTY</p>
                        </div> 
                    </c:if>
                    <c:if test="${sessionScope.LIST_PRODUCT != null}">
                        <c:if test="${not empty sessionScope.LIST_PRODUCT}">
                            <c:forEach var="product" varStatus="counter" items="${sessionScope.LIST_PRODUCT}" >
                                <div class="col pro">
                                    <a href="MainController?action=View_Product&value=${product.proName}" class="row row-cols-1">
                                        <c:forEach var="img" varStatus="counter" items="${product.imgURL}">
                                            <c:if test="${counter.index == 0}">
                                                <img class="img-pro col" src="${img}">
                                            </c:if>
                                        </c:forEach>
                                        <p class="col name-pro text-body fw-bold text-sm-start">${product.proName}</p>
                                        <p class="col price text-secondary  text-sm-start">$${product.price}</p>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                </div>
            </div>                    
        </main>

        <div class="position-relative">            
            <img class="img-fluid banner" src="https://elpisclothing.com/cdn/shop/files/aaa_1500x.jpg?v=1685526745">
            <div class="container-fluid text-gmail text-white text-gmail col-12 mx-auto text-center position-absolute top-50 start-50 translate-middle">
                <h6 class="sub-title">KEEP IN TOUCH</h6>
                <div class="sub-div"><p class="sub-p">Leave the email address that is convenient for you to receive all the latest update from us.</p></div>
                <p class="sub-p1">Thank you & Love you!</p>
                <div>
                    <input id="gmail-sub" type="text" name="gmail" placeholder="Enter your email"/>
                    <input id="SUBSCRIBE" type="submit" name="gmail" value="SUBSCRIBE" >
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                    const logo = document.getElementById("logo");
                    const header = document.getElementById("header");
                    window.addEventListener("scroll", function () {
                        if (window.scrollY > 0) {
                            header.classList.add("sticky");
                            logo.src = "https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_125x.png?v=1614720781";
                        } else {
                            header.classList.remove("sticky");
                            logo.src = "https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_5928c853-b189-4927-af34-43b839cdfea8_125x.png?v=1614721042";
                        }
                    });

                    var scrolled = false;

                    header.addEventListener("mouseover", function () {
                        if (!scrolled) {
                            logo.src = "https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_125x.png?v=1614720781";
                        }
                    });

                    header.addEventListener("mouseout", function () {
                        if (!scrolled) {
                            logo.src = "https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_5928c853-b189-4927-af34-43b839cdfea8_125x.png?v=1614721042";
                        }
                    });

                    window.addEventListener("scroll", function () {
                        scrolled = true;
                        logo.src = "https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_125x.png?v=1614720781";
                    });


                    window.addEventListener("scroll", function () {
                        if (window.scrollY === 0) {
                            logo.src = "https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_5928c853-b189-4927-af34-43b839cdfea8_125x.png?v=1614721042";
                            scrolled = false;
                        }
                    });

                    const searchInput = document.getElementById('searchInput');
                    const offcanvasBody = document.querySelector('.search-body');

                    searchInput.addEventListener('input', function () {
                        if (searchInput.value.trim() === '') {
                            offcanvasBody.style.display = 'none';
                        } else {
                            offcanvasBody.style.display = 'block';
                        }
                    });

                    searchInput.addEventListener('input', function () {
                        if (searchInput.value.trim() === '') {
                            document.documentElement.style.setProperty('--custom-offcanvas-height', '20vh');
                            offcanvasBody.style.display = 'none';
                        } else {
                            document.documentElement.style.setProperty('--custom-offcanvas-height', '90vh');
                            offcanvasBody.style.display = 'block';
                        }
                    });

                    const search = () => {
                        const searchbox = document.getElementById("searchInput").value.toUpperCase();
                        const storiette = document.getElementById("product-list")
                        const product = document.querySelectorAll(".product")
                        const pname = document.getElementsByTagName("h6")
                        let hasResults = false;
                        for (var i = 0; i < pname.length; i++) {
                            let match = product[i].getElementsByTagName("h6")[0];
                            if (match) {
                                let textual = match.textContent || match.innerHTML
                                if (textual.toUpperCase().indexOf(searchbox) > -1) {
                                    product[i].style.display = "";
                                    hasResults = true;
                                } else {
                                    product[i].style.display = "none";
                                }
                            }
                        }                       
                        const noResultMessage = document.getElementById("noResultMessage");
                        console.log(noResultMessage);
                        if (!hasResults) {
                            noResultMessage.style.display = "";
                        } else {
                            noResultMessage.style.display = "none";
                        }
                    }

        </script>

    </body>
</html>
