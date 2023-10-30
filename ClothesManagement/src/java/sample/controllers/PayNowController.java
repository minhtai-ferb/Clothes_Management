/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.address.AddressDAO;
import sample.address.AddressDTO;
import sample.depots.DepotsDAO;
import sample.depots.DepotsDTO;
import sample.order.Cart;
import sample.order.OrderDAO;
import sample.order.OrderDTO;
import sample.order.OrderDetailDAO;
import sample.order.OrderDetailDTO;
import sample.users.UserDTO;
import sample.utils.Email;

/**
 *
 * @author minht
 */
@WebServlet(name = "PayNowController", urlPatterns = {"/PayNowController"})
public class PayNowController extends HttpServlet {

    private static final String ERROR = "viewCheckout.jsp";
    private static final String SUCCESS = "paySuccess.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            Cart cart = (Cart) session.getAttribute("CART");
            String paymentType = (String) session.getAttribute("PAYMENT_TYPE");
            String typePaying = null;
            //handle address
            AddressDTO userAddress = (AddressDTO) session.getAttribute("ADDRESS");
            AddressDAO daoAddress = new AddressDAO();
            int userID = loginUser.getUserID();
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String city = request.getParameter("city");
            String district = request.getParameter("district");
            String wards = request.getParameter("wards");
            String addressHouse = request.getParameter("address");
            boolean checkInsert = false;
            
            if (userAddress == null) {
                String status = "PRIMARY";
                checkInsert = daoAddress.insertAddress(new AddressDTO(userID, fullName, phone, city, district, wards, addressHouse, status));
                userAddress = daoAddress.getAddress(loginUser.getUserID(), "PRIMARY");
                session.setAttribute("ADDRESS", userAddress); 
            } else if (!daoAddress.checkDulicate(new AddressDTO(userID, fullName, phone, city, district, wards, addressHouse))) {
                String status = "NORMAL";
                checkInsert = daoAddress.insertAddress(new AddressDTO(userID, fullName, phone, city, district, wards, addressHouse, status));
                userAddress = daoAddress.getAddress(new AddressDTO(userID, fullName, phone, city, district, wards, addressHouse));
                session.setAttribute("ADDRESS", userAddress); 
            } else {
                userAddress = daoAddress.getAddress(new AddressDTO(userID, fullName, phone, city, district, wards, addressHouse));
                if (userAddress != null) {
                    checkInsert = true;
                    session.setAttribute("ADDRESS", userAddress); 
                }
            }

            if (checkInsert) {
                //handle order
                OrderDAO daoOrder = new OrderDAO();
                int orderID = daoOrder.countOrder() + 1;
                Date currentTime = new Date();
                String status = null;
                if (paymentType.equalsIgnoreCase("delivery")) {
                    typePaying = "Payment on delivery.";
                    status = "PAYING";
                } else if (paymentType.equalsIgnoreCase("VNBANK")) {
                    typePaying = "Payment via ATM card/Domestic account.";
                    status = "SUCCESS";
                }
                double total = Double.parseDouble(request.getParameter("totalCart"));
                OrderDTO order = new OrderDTO(orderID, loginUser.getUserID(), currentTime, total, userAddress.getAddressID(), status);
                boolean checkOrder = daoOrder.insert(order);
                if (checkOrder) {
                    //handle orderdetail - cart  
                    boolean checkDepots = false;
                    OrderDetailDAO daoDetail = new OrderDetailDAO();
                    List<OrderDetailDTO> orderDetail = new ArrayList<>();
                    for (Map.Entry<String, OrderDetailDTO> en : cart.getCart().entrySet()) {
                        String key = en.getKey();
                        OrderDetailDTO value = en.getValue();
                        boolean checkDetail = daoDetail.insert(value, orderID, loginUser.getUserID());
                        orderDetail.add(value);
                        if (checkDetail) {
                            //handle depots
                            DepotsDAO daoDepot = new DepotsDAO();
                            DepotsDTO product = daoDepot.getDepotsID(value.getDeProID());
                            product.setQuantity(product.getQuantity() - value.getQuantityOrder());
                            checkDepots = daoDepot.update(product);
                        } else {
                            session.setAttribute("PAY_ERROR", "Can't insert detai order into database");
                        }
                    }
                    if (checkDepots) {
                        order.setOrderDetail(orderDetail);
                        session.setAttribute("ORDER", order);
                        Email mail = new Email();
                        String content = mail.emailSample(loginUser.getUserName() , currentTime, total, loginUser.getEmail(), fullName, addressHouse, city, district, wards, phone, typePaying, status);
                        boolean checkMail = mail.sendEmail(loginUser.getEmail(), "Your order has been completed", content);
                        if (checkMail) {
                            cart.getCart().clear();
                            url = SUCCESS;
                        } else {
                            session.setAttribute("PAY_ERROR", "Can't send mail.");
                        }
                    } else {
                        session.setAttribute("PAY_ERROR", "Can't update depots into database");
                    }
                } else {
                    session.setAttribute("PAY_ERROR", "Can't insert order into database");
                }
            } else {
                session.setAttribute("PAY_ERROR", "Can't insert address into database");
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
