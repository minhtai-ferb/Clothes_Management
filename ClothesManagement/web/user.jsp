<%-- 
    Document   : user
    Created on : Sep 19, 2023, 11:41:33 AM
    Author     : minht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
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
                    <div class="offcanvas-body" style="display: flex; align-items: center; justify-content: center; height: 100%;">
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
                                        <input type="hidden" name="idDetailCart" value="${cartOrder.value.proID}"/>
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

        <div class="container main">
            <c:url var="logout" value="MainController">
                <c:param name="action" value="Logout"></c:param>
            </c:url>
            <div class="container-fluid" style="margin: 30px 0 30px 0;"><a class="logout" href="${logout}">LOGOUT</a></div>
            <div class="container-fluid" ><h5 style="margin: 5px 0 5px 0;">MY ACCOUNT</h5></div>
            <div class="container-fluid"><p style="font-size: 14px;">Welcome back, ${sessionScope.LOGIN_USER.userName}!</p></div>
        </div>

        <main class="container"> 
            <div class="row">
                <div class="col-8 order">
                    <div class="container-fluid order-header">
                        <p>MY ORDERS</p>
                    </div>
                    <div class="container-fluid order-body">
                        <p>You haven't placed any orders yet</p>
                    </div>
                </div>
                <div class="col-1">
                </div>
                <div class="col-3 ">
                    <div class="container-fluid order-header">
                        <p>PRIMARY ADDRESS</p>
                    </div>
                    <div class="container-fluid order-body">
                        <p class="text-uppercase">${sessionScope.LOGIN_USER.userName}</p>
                    </div>

                </div>
            </div>
        </main>

        <footer class="container-fluid" style="padding: 5rem; border-top: 0.05px solid rgba(105, 105, 105, 0.507);;">
            <div class="container row">
                <div class="col-4">
                    <h6>NEWSLETTER</h6>
                    <form action="MainController" method="POST"></form>
                    <input type="email" name="gmail" placeholder="Enter your email address" style="background: transparent;border: none; color: black; outline: none; width: 300px; "/>
                    <input type="submit" name="action" value="Subscribe" style="background: transparent;border: none; color: black; outline: none;"/>
                    </form>
                </div>
                <div class="col-2">
                    <p style="font-size: 9.5px; color: rgb(91, 91, 91); margin: 5px 0 5px 0; padding: 0;">ABOUT ELPIS</p>
                    <p style="font-size: 9.5px; color: rgb(91, 91, 91); margin: 5px 0 5px 0; padding: 0;">CONTACT US</p>
                    <p style="font-size: 9.5px; color: rgb(91, 91, 91); margin: 5px 0 5px 0; padding: 0;">AS SEEN ON</p>
                </div>
                <div class="col-2">
                    <p style="font-size: 9.5px; color: rgb(91, 91, 91); margin: 5px 0 5px 0; padding: 0;">EXCHANGE & RETURNS</p>
                    <p style="font-size: 9.5px; color: rgb(91, 91, 91); margin: 5px 0 5px 0; padding: 0;">SHIPPING GUIDE</p>
                    <p style="font-size: 9.5px; color: rgb(91, 91, 91); margin: 5px 0 5px 0; padding: 0;">PAYMENT OPTION</p>
                </div>
                <div class="col-4">

                </div>
                <br class="col-12">
                <p>All Tags</p></br>    
                <p>Ao dai , Blouse , Bodycon dress , Bottom , Bralette , Color black , Color pink , Color red , Color white , Corset , Dress , Dress online , Formal , Formal dress , Knit , Lingerie , Maxi dress , Midi dress , Mini dress , New arrival , Pf20 , Top , Top and bottom , Traditional vietnamese dress</p>              
            </div>
            <div class="col-12">

            </div>
        </div>
    </footer>
    <script>
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>
