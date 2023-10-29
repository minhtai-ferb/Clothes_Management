<%-- 
    Document   : newjspviewCheckOut
    Created on : Oct 22, 2023, 6:04:48 PM
    Author     : minht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

            .back-button {
                background-color: transparent;
                color: #000000;
                border: none;
                padding: 10px 20px;
                font-size: 20px;
                font-weight: 500;
                cursor: pointer;
                position: absolute;
                top: 90px;
                left: 10px;
            }
        </style>
    </head>
    <body>
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
            <button class="back-button" onclick="goBack()">
                <i class="fas fa-chevron-left"></i> Back
            </button>

            <form action="MainController" method="POST">
                <div class="container-fluid" style="display: flex; justify-content: space-between; width: 100hv; height: 100vh; padding: 0; margin: 0;">
                    <div class="container-fluid" style="width: 50hv; padding: 0; padding: 0; display: flex; justify-content: end;">
                        <div style="width: 550px; padding: 0; margin: 30px 40px 0 20px; display: flex; flex-direction: column; justify-content: end; align-self: start;">
                            <c:set var="address" value="${sessionScope.ADDRESS}"/>
                            <c:set var="user" value="${sessionScope.LOGIN_USER}"/>
                            <h4>Contact</h4> 
                            <div class="form-floating mb-3" style="width: 100%;">
                                <input type="email" name="gmail" value="${user.email}" class="form-control" readonly="" id="floatingInputValue" placeholder="name@example.com"/>
                                <label for="floatingInputValue">Email address</label>
                            </div>
                            <h4>Delivery</h4>
                            <div class="form-floating mb-3" style="width: 100%;">
                                <input type="text" name="fullName" value="${address.fullName}" class="form-control" id="floatingInputValue" placeholder="Full Name"/>
                                <label for="floatingInputValue">Full Name</label>
                            </div>
                            <div class="form-floating mb-3" style="width: 100%;">
                                <input type="text" name="address" value="${address.addressHouse}" class="form-control" id="floatingInputValue" placeholder="Address"/>
                                <label for="floatingInputValue">Address</label>
                            </div>              
                            <div class="form-floating mb-3" style="width: 100%;">
                                <input type="text" name="city" value="${address.city}" class="form-control" id="floatingInputValue" placeholder="City"/>
                                <label for="floatingInputValue">City</label>
                            </div>
                            <div class="form-floating mb-3" style="width: 100%;">
                                <input type="text" name="district" value="${address.district}" class="form-control" id="floatingInputValue" placeholder="District"/>
                                <label for="floatingInputValue">District</label>
                            </div>
                            <div class="form-floating mb-3" style="width: 100%;">
                                <input type="text" name="wards" value="${address.wards}" class="form-control" id="floatingInputValue" placeholder="Wards"/>
                                <label for="floatingInputValue">Wards</label>
                            </div>
                            <div class="form-floating mb-3" style="width: 100%;">
                                <input type="text" name="phone" value="${address.phone}" class="form-control" id="floatingInputValue" placeholder="Phone"/>
                                <label for="floatingInputValue">Phone</label>
                            </div>

                            <button class="payNow-button" style="width: 100%;" type="submit" name="action" value="Pay_Now">Pay Now</button>
                        </div>
                    </div>
                    <div class="container-fluid" style="padding: 0; margin: 0; width: 50hv; display: flex; flex-direction: column; align-self: center; justify-content: start; margin: 0; border-left: 0.5px solid rgb(165, 165, 165); height: 100%; background-color: #e8e8e8;">
                        <table border="1" style="border: none; margin: 30px 280px 0 40px;">  
                            <tbody style="">          
                                <c:forEach items="${sessionScope.CART.getCart()}" var="cartOrder" varStatus="counter">                                                  
                                    <tr style="height: 100px;">
                                        <td style="width: 100px; height: 100px;">
                                            <div class="position-relative" style="width: 80px; height: 80px;">
                                                <div style="width: 80px; height: 80px; border: 1px solid #b0b0b0; background-color: rgba(222, 222, 222, 0.84); border-radius: 7px; overflow: hidden; position: relative; display: flex; align-items: center; justify-content: center;">
                                                    <img style="height: 100%; object-fit: cover;" src="${cartOrder.value.colorIMG}">                                               
                                                </div>  
                                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dark">
                                                    ${cartOrder.value.quantityOrder}
                                                    <span class="visually-hidden">unread messages</span>
                                                </span>   
                                            </div>                                                                              
                                        </td>
                                        <td style="padding-left: 20px; text-align: start;">
                                            <p style="margin: 0; font-size: 13px; font-weight: 640; color: #000;">${cartOrder.value.proName}</p>
                                            <p style="margin: 0; padding: 0; font-size: 12.5px; font-weight: 400; color: #848484;">${cartOrder.value.colorDe}/${cartOrder.value.sizeDe}</p>
                                        </td>
                                        <td style="text-align: end; width: 50px;">    
                                            <p style="margin: 0; padding: 0; font-size: 14px; font-weight: 400; color: #636363;">$${cartOrder.value.priceOrder * cartOrder.value.quantityOrder}</p>
                                        </td>
                                    </tr>
                                    <c:set var="price" value="${cartOrder.value.priceOrder * cartOrder.value.quantityOrder}"/>
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
            </form>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script>
                function goBack() {
                    window.location.href = document.referrer;
                }
        </script>
    </body>

</html>
