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
                                <a class="nav-link" href="MainController?action=Account">
                                    <i class="fas fa-user" id="item"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="">
                                    <i class="fas fa-search" id="item"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <button id="myBtn" class="button">
                                    <i class="fas fa-shopping-cart" id="item"></i>
                                </button>
                            </li>                       
                        </ul>                                 
                    </nav>
                </div>               
            </div>  
        </header>

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
