<%-- 
    Document   : paySuccess
    Created on : Oct 27, 2023, 1:55:04 PM
    Author     : minht
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">

        <title>Checkout</title>
        <style>
            .form-floating {
                width: 500px;
                height: 50px;
            }

            .payNow-button {
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
                width: 500px;
                height: 50px;
            }
            .payNow-button:hover {
                background-position: 0%; 
                color: #000; 
            }
        </style>
    </head>
    <body class="container-fluid">
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <header class="container-fluid" style="border-bottom: 0.5px solid rgb(165, 165, 165);">
            <div class="d-flex align-items-center justify-content-center">
                <div class="logo">
                    <a class="text-center" href="MainController?action=Home" >
                        <img id="logo" src="https://elpisclothing.com/cdn/shop/files/output-onlinepngtools_125x.png?v=1614720781" alt="">
                    </a>
                </div>  
        </header>
        <main class="container-fluid" style="padding: 0; margin: 0;">
            <div class="container-fluid" style="display: flex; justify-content: space-between; width: 100hv; height: 100vh; padding: 0; margin: 0;">
                <div class="container-fluid" style="width: 50hv; padding: 0; padding: 0; display: flex; justify-content: end;">
                    <div style="width: 550px; padding: 0; margin: 30px 40px 0 20px; display: flex; flex-direction: column; justify-content: end; align-self: start;">
                        <c:set var="address" value="${sessionScope.ADDRESS}"/>
                        <c:set var="user" value="${sessionScope.LOGIN_USER}"/>
                        <c:set var="order" value="${sessionScope.ORDER}"/>
                        <c:set var="paymentType" value="${requestScope.PAYMENT_TYPE}"/>
                        <h1>Pay Success</h1>
                        <p>Thank you, ${user.userName}</p>
                        <h4>Order</h4>
                        <p>Order Day: ${order.orderDate}</p>                      
                        <h4>Contact</h4> 
                        <p>Email address: ${user.email}</p>                   
                        <h4>Delivery</h4>
                        <p>Full Name: ${address.fullName}</p>
                        <p>Address: ${address.addressHouse}  </p>
                        <p>City: ${address.city}</p>
                        <p>District: ${address.district}</p>
                        <p>Wards: ${address.wards}</p>
                        <p>Phone: ${address.phone}</p>
                        <h4>Payment</h4>
                        <p>Pay with: ${paymentType}</p>
                        <p>Status: ${order.status}</p>
                    </div>
                </div>
                <div class="container-fluid" style="padding: 0; margin: 0; width: 50hv; display: flex; flex-direction: column; align-self: center; justify-content: start; margin: 0; border-left: 0.5px solid rgb(165, 165, 165); height: 100%; background-color: #e8e8e8;">
                    <table border="1" style="border: none; margin: 30px 280px 0 40px;">  
                        <tbody style="">          
                            <c:forEach items="${order.orderDetail}" var="orderDetail" varStatus="counter">                                                  
                                <tr style="height: 100px;">
                                    <td style="width: 100px; height: 100px;">
                                        <div class="position-relative" style="width: 80px; height: 80px;">
                                            <div style="width: 80px; height: 80px; border: 1px solid #b0b0b0; background-color: rgba(222, 222, 222, 0.84); border-radius: 7px; overflow: hidden; position: relative; display: flex; align-items: center; justify-content: center;">
                                                <img style="height: 100%; object-fit: cover;" src="${orderDetail.colorIMG}">                                                
                                            </div>  
                                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dark">
                                                ${orderDetail.quantityOrder}
                                                <span class="visually-hidden">unread messages</span>
                                            </span>   
                                        </div>                                                                              
                                    </td>
                                    <td style="padding-left: 20px; text-align: start;">
                                        <p style="margin: 0; font-size: 13px; font-weight: 640; color: #000;">${orderDetail.proName}</p>                                   
                                        <p style="margin: 0; padding: 0; font-size: 12.5px; font-weight: 400; color: #848484;">${orderDetail.colorDe}/${orderDetail.sizeDe}</p>
                                    </td>
                                    <td style="text-align: end; width: 50px;">    
                                        <p style="margin: 0; padding: 0; font-size: 14px; font-weight: 400; color: #636363;">$${orderDetail.priceOrder * orderDetail.quantityOrder}</p>
                                    </td>
                                </tr>
                                <c:set var="price" value="${orderDetail.priceOrder * orderDetail.quantityOrder}"/>
                                <c:set var="total" value="${total + price}"/>
                            </c:forEach>
                            <tr style="height: 50px;">
                                <td>
                                    <p style="margin: 0; font-size: 18px; font-weight: 640; color: #000;">Total</p>
                                </td>
                                <td></td>
                                <td style="width: 100px; text-align: end;">
                                    <input type="hidden" name="totalCart" value="${total}"/>
                                    <span style="display: flex; align-items: center; justify-content: end;">
                                        <p style="margin: 0; padding: 0 5px 0 0; font-size: 13px; font-weight: 400; color: #636363;">VND<p style="margin: 0; padding: 0; font-size: 18px; font-weight: 640; color: #000000;">$${total}</p></p>
                                    </span>                                       
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

        <script>


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
                for (var i = 0; i < pname.length; i++) {
                    let match = product[i].getElementsByTagName("h6")[0];
                    console.log(match);
                    if (match) {
                        let textual = match.textContent || match.innerHTML
                        if (textual.toUpperCase().indexOf(searchbox) > -1) {
                            product[i].style.display = "";
                        } else {
                            product[i].style.display = "none";
                        }
                    }
                }
            }

        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
