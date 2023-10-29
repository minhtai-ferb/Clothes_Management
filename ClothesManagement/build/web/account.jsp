<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <script src="https://kit.fontawesome.com/d5af567b99.js" crossorigin="anonymous"></script>
        <title>Bootstap 5 Responsive Admin Dashboard</title>
        <style>
            :root {
                --main-bg-color: #000000;
                --main-text-color: #000000;
                --second-text-color: #bbbec5;
                --second-bg-color: #ffffff;
            }

            .primary-text {
                color: var(--main-text-color);
            }

            .second-text {
                color: var(--second-text-color);
            }

            .primary-bg {
                background-color: var(--main-bg-color);
            }

            .secondary-bg {
                background-color: var(--second-bg-color);
            }

            .rounded-full {
                border-radius: 100%;
            }

            #wrapper {
                overflow-x: hidden;
                background-image: linear-gradient(
                    to right,
                    #ffffff,
                    #ffffff,
                    #ffffff,
                    #ffffff,
                    #ffffff
                    );
            }

            .logo {
                margin: 0;
                padding: 0;
            }

            #sidebar-wrapper {
                min-height: 100vh;
                margin-left: -15rem;
                -webkit-transition: margin 0.25s ease-out;
                -moz-transition: margin 0.25s ease-out;
                -o-transition: margin 0.25s ease-out;
                transition: margin 0.25s ease-out;
                border-right: 1px solid black;
            }

            #sidebar-wrapper .sidebar-heading {
                padding: 0.875rem 1.25rem;
                font-size: 1.2rem;
            }

            #sidebar-wrapper .list-group {
                width: 15rem;
            }

            #page-content-wrapper {
                min-width: 100vw;
            }

            #wrapper.toggled #sidebar-wrapper {
                margin-left: 0;
            }

            #menu-toggle {
                cursor: pointer;
            }

            .list-group-item {
                border: none;
                padding: 20px 30px;
            }

            .list-group-item.active {
                background-color: transparent;
                color: var(--main-text-color);
                font-weight: bold;
                border: none;
            }

            @media (min-width: 768px) {
                #sidebar-wrapper {
                    margin-left: 0;
                }

                #page-content-wrapper {
                    min-width: 0;
                    width: 100%;
                }

                #wrapper.toggled #sidebar-wrapper {
                    margin-left: -15rem;
                }
            }

            *{
                padding: 0;
                margin: 0;
            }

            main{
                widows: 70%;
                height: auto;
                padding: 20px;
                margin: 50px auto;
                background: whitesmoke;
                font-family: system-ui;
                color: #ffffff;
            }
            .header{
                width: 90%;
                height: 100px;
                margin: auto;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .items-controller,
            .search{
                flex-shrink: 0;
                display: flex;
                align-content: center;
                align-items: center;

            }
            select{
                padding: 2px;
                margin: 0 10px;
                outline: none;
                cursor: pointer;
                border: none;
                background: transparent;
            }
            .search > input{
                padding: 8px;
                border: none;
                outline: navajowhite;
                margin: 0 0 0 20px;
                background: white;
            }
            .field{
                width: 90%;
                height: auto;
                margin: auto;
            }
            table{
                width: 100%;
                margin: 2px auto;
                table-layout: auto;
                color: #757575;
                background-color: #ffff;
                border-collapse: collapse;
                border-spacing: 0;
                text-align: left;
            }
            table tr th,td{
                padding: 5px;
                border: 1px solid #ccc;
            }



            .bottom-field{
                width: 100%;
                padding: 20px;
                margin-top: 20px;
            }
            .pagination{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .pagination li{
                list-style: none;
                padding: 2px;
                margin: 10px;
                flex-shrink: 0;
                text-align: center;
                border-radius: 5px;
                border: 1px solid #999;
                color: #999;
            }
            .pagination li.active{
                background: #ffffff00;
                color: rgb(0, 0, 0);
                border-color: #000000;

            }
            .pagination li a{
                text-decoration: none;
                padding: 3px 8px;
                color: inherit;
                display: block;
                font-family: sans-serif;
                font-size: 13px;
            }
            i.fa-edit{color: lime;}
            i.fa-trash{color: red;}

        </style>
    </head>

    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar -->
            <div class="bg-white" id="sidebar-wrapper">
                <div class="logo text-center primary-text fs-4 fw-bold text-uppercase border-bottom" style="height: 70px;">
                    <a href="MainController?action=Home">
                        <img class="logo" src="https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_125x.png?v=1614720781" alt="">
                    </a>
                </div>
                <div class="list-group list-group-flush my-3">
                    <a href="MainController?action=Dashboard" class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                    </a>
                    <a href="MainController?action=Account_Admin" class="list-group-item list-group-item-action bg-transparent second-text active">
                        <i class="fas fa-user me-2"></i>Account
                    </a>
                    <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class="fas fa-tshirt me-2"></i>Products
                    </a>
                    <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class="fas fa-cash-register me-2"></i>Orders
                    </a>
                    <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
                        <i class="fas fa-store me-2"></i>Depots
                    </a>
                    <c:url var="logout" value="MainController">
                        <c:param name="action" value="Logout"></c:param>
                    </c:url>
                    <a href="${logout}" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold">
                        <i class="fas fa-power-off me-2"></i>Logout
                    </a>
                </div>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4" style="border-bottom: 1px solid #cccccc; height: 70px;">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                        <h2 class="fs-2 m-0">Account Management</h2>
                    </div>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                                   role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-user me-2"></i>${sessionScope.LOGIN_USER.userName}
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Profile</a></li>
                                    <li><a class="dropdown-item" href="#">Settings</a></li>
                                    <li><a class="dropdown-item" href="${logout}">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>


                <section class="header" >
                    <div class="items-controller">
                        <h5>Show</h5>
                        <select name="" id="itemperpage">
                            <option value="04">04</option>
                            <option value="05">05</option>
                            <option value="08" selected>08</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                        </select>
                        <h5>Per Page</h5>
                    </div>
                    <form action="MainController" method="POST">
                        <div class="search">
                            <input type="text" name="search" value="${param.search}" id="search"  placeholder="Search">
                            <input type="submit" name="action" value="Search"/>
                        </div>
                    </form>
                </section>
                ${requestScope.ERROR}
                <c:if test="${requestScope.LIST_USER != null}">
                    <c:if test="${not empty requestScope.LIST_USER}">
                        <section class="field">
                            <table>
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">No.</th>
                                        <th style="text-align: center;">User ID</th>
                                        <th>Full Name</th>
                                        <th>Email</th>
                                        <th style="text-align: center;">Password</th>
                                        <th style="text-align: center;">Role ID</th>
                                        <th style="text-align: center;">Status</th>
                                        <th>Edit</th> 
                                        <th>Delete</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                    <form action="MainController" method="POST">
                                        <tr>
                                            <td style="width: 3rem;  text-align: center;">${counter.count}</td>
                                            <td style="width: 5rem;">
                                                <input style="width: 100%; border: none;  text-align: center;" type="text" name="userID" value="${user.userID}" readonly=""/>
                                            </td>
                                            <td style="width: 15rem;">
                                                <input style="width: 100%; border: none;" type="text" name="userName" value="${user.userName}" required=""/>
                                            </td>
                                            <td style="width: 20rem;">
                                                <input style="width: 100%; border: none;" type="text" name="email" value="${user.email}" required=""/>
                                            </td>
                                            <td style="width: 7rem;">
                                                <input style="width: 100%; border: none;  text-align: center;"  type= "password" name="password" value="${user.password}" readonly=""/>
                                            </td>
                                            <td style="width: 5rem;">
                                                <input style="width: 100%; border: none; text-align: center;" type="text" name="roleID" value="${user.roleID}" required=""/>
                                            </td>
                                            <td style="width: 5rem;">
                                                <input style="width: 100%; border: none; " type="checkbox" name="roleID" value="${user.status}"  id="myCheckbox" ${user.status == 1 ? 'checked' : ''} required=""/>
                                            </td>
                                            <td style="width: 5rem;">
                                                <input style="width: 100%; border: none; " type="submit" name="action" value="Update"/>
                                                <input type="hidden" name="search" value="${param.search}"/>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop-${user.userID}">
                                                    Delete
                                                </button>
                                                <c:url var="delete" value="MainController">
                                                    <c:param name="action" value="Delete"></c:param>
                                                    <c:param name="userID" value="${user.userID}"></c:param>
                                                    <c:param name="search" value="${param.search}"></c:param> 
                                                </c:url>  
                                                <div class="modal fade" id="staticBackdrop-${user.userID}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Confirm Deletion.</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                When you delete this account, all information related to this account will be deleted. Are you sure you want to delete this account?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                <button type="button" class="btn btn-primary"><a style="color: white" href="${delete}">Delete</a></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="bottom-field">
                                <ul class="pagination">
                                    <li class="prev"><a href="#" id="prev">&#139;</a></li>
                                    <!-- page number here -->
                                    <li class="next"><a href="#" id="next">&#155;</a></li>
                                </ul>
                            </div>
                        </section>
                    </c:if>
                </c:if>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };

        var tbody = document.querySelector("tbody");
        var pageUl = document.querySelector(".pagination");
        var itemShow = document.querySelector("#itemperpage");
        var tr = tbody.querySelectorAll("tr");
        var emptyBox = [];
        var index = 1;
        var itemPerPage = 8;

        for (let i = 0; i < tr.length; i++) {
            emptyBox.push(tr[i]);
        }

        itemShow.onchange = giveTrPerPage;
        function giveTrPerPage() {
            itemPerPage = Number(this.value);
            displayPage(itemPerPage);
            pageGenerator(itemPerPage);
            getpagElement(itemPerPage);
        }

        function displayPage(limit) {
            tbody.innerHTML = '';
            for (let i = 0; i < limit; i++) {
                tbody.appendChild(emptyBox[i]);
            }
            const  pageNum = pageUl.querySelectorAll('.list');
            pageNum.forEach(n => n.remove());
        }
        displayPage(itemPerPage);

        function pageGenerator(getem) {
            const num_of_tr = emptyBox.length;
            if (num_of_tr <= getem) {
                pageUl.style.display = 'none';
            } else {
                pageUl.style.display = 'flex';
                const num_Of_Page = Math.ceil(num_of_tr / getem);
                for (i = 1; i <= num_Of_Page; i++) {
                    const li = document.createElement('li');
                    li.className = 'list';
                    const a = document.createElement('a');
                    a.href = '#';
                    a.innerText = i;
                    a.setAttribute('data-page', i);
                    li.appendChild(a);
                    pageUl.insertBefore(li, pageUl.querySelector('.next'));
                }
            }
        }
        pageGenerator(itemPerPage);
        let pageLink = pageUl.querySelectorAll("a");
        let lastPage = pageLink.length - 2;

        function pageRunner(page, items, lastPage, active) {
            for (button of page) {
                button.onclick = e => {
                    const page_num = e.target.getAttribute('data-page');
                    const page_mover = e.target.getAttribute('id');
                    if (page_num != null) {
                        index = page_num;

                    } else {
                        if (page_mover === "next") {
                            index++;
                            if (index >= lastPage) {
                                index = lastPage;
                            }
                        } else {
                            index--;
                            if (index <= 1) {
                                index = 1;
                            }
                        }
                    }
                    pageMaker(index, items, active);
                }
            }

        }
        var pageLi = pageUl.querySelectorAll('.list');
        pageLi[0].classList.add("active");
        pageRunner(pageLink, itemPerPage, lastPage, pageLi);

        function getpagElement(val) {
            let pagelink = pageUl.querySelectorAll("a");
            let lastpage = pagelink.length - 2;
            let pageli = pageUl.querySelectorAll('.list');
            pageli[0].classList.add("active");
            pageRunner(pagelink, val, lastpage, pageli);
        }



        function pageMaker(index, item_per_page, activePage) {
            const start = item_per_page * index;
            const end = start + item_per_page;
            const current_page = emptyBox.slice((start - item_per_page), (end - item_per_page));
            tbody.innerHTML = "";
            for (let j = 0; j < current_page.length; j++) {
                let item = current_page[j];
                tbody.appendChild(item);
            }
            Array.from(activePage).forEach((e) => {
                e.classList.remove("active");
            });
            activePage[index - 1].classList.add("active");
        }





        // search content 

    </script>
</body>

</html>