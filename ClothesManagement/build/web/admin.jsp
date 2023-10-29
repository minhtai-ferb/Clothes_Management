<%-- 
    Document   : admin
    Created on : Sep 19, 2023, 11:41:45 AM
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
        <title>ADMIN Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <style>
        header {
            position: fixed;
            background-color: white;
            border-bottom: 1px solid #cecdcd;
            color: black;

        }

        a {
            text-decoration: none;
        }

        #item {
            color: #000000;
            font-size: 1.5rem;
            padding: auto;
            margin: auto;
        }


        .button {
            background-color: transparent;
            border: 0px solid transparent;
            padding: 0;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .nav-item {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .main {
            padding-top: 100px;
        }

    </style>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
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
        <main>
            <div class="container-fluid text-center d-flex align-items-center justify-content-center main"  >
                <div class="">
                    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
                        <c:redirect url="login.html"></c:redirect>
                    </c:if>
                    <h1>Welcome: ${sessionScope.LOGIN_USER.userName}</h1>

                    <c:url var="logout" value="MainController">
                        <c:param name="action" value="Logout"></c:param>
                    </c:url>

                    <br/><a href="${logout}">Logout</a>

                    <form action="MainController" method="POST">
                        Search<input type="text" name="search" value="${param.search}"/>
                        <input type="submit" name="action" value="Search"/>
                    </form>
                    <c:if test="${requestScope.LIST_USER != null}">
                        <c:if test="${not empty requestScope.LIST_USER}">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>User ID</th>
                                        <th>User Name</th>
                                        <th>Email</th>
                                        <th>Password</th>
                                        <th>Role ID</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                    <form action="MainController" method="POST">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td><input type="text" name="userID" value="${user.userID}" readonly=""/></td>
                                            <td><input type="text" name="userName" value="${user.userName}" required=""/></td>
                                            <td><input type="text" name="email" value="${user.email}" required=""/></td>
                                            <td>${user.password}</td>
                                            <td><input type="text" name="roleID" value="${user.roleID}" required=""/></td>                          
                                            <td>
                                                <input type="submit" name="action" value="Update"/>
                                                <input type="hidden" name="search" value="${param.search}"/>
                                            </td>
                                            <td>
                                                <c:url var="delete" value="MainController">
                                                    <c:param name="action" value="Delete"></c:param>
                                                    <c:param name="userID" value="${user.userID}"></c:param>
                                                    <c:param name="search" value="${param.search}"></c:param> 
                                                </c:url>
                                                <a href="${delete}">Delete</a>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                            ${requestScope.ERROR}
                        </c:if>
                    </c:if>
                </div>
            </div>
        </main>

        <script>
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>