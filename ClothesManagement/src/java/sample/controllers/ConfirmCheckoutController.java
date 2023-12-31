/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.address.AddressDAO;
import sample.address.AddressDTO;
import sample.order.Cart;
import sample.users.UserDTO;
import sample.utils.Config;

/**
 *
 * @author minht
 */
@WebServlet(name = "ConfirmCheckoutController", urlPatterns = {"/ConfirmCheckoutController"})
public class ConfirmCheckoutController extends HttpServlet {

    private static final String ERROR = "viewCheckout.jsp";
    private static final String SUCCESS = "PayNowController";

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String bankCode = req.getParameter("payment");
        try {
            HttpSession session = req.getSession();
            double total = Double.parseDouble(req.getParameter("totalCart"));
            session.setAttribute("TOTAL_PRICE", total);
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            
            //handle address
            AddressDTO userAddress = (AddressDTO) session.getAttribute("ADDRESS");
            AddressDAO daoAddress = new AddressDAO();
            int userID = loginUser.getUserID();
            String fullName = req.getParameter("fullName");
            String phone = req.getParameter("phone");
            String city = req.getParameter("city");
            String district = req.getParameter("district");
            String wards = req.getParameter("wards");
            String addressHouse = req.getParameter("address");
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
                if (bankCode.equalsIgnoreCase("delivery")) {
                    session.setAttribute("PAYMENT_TYPE", bankCode);
                    req.setAttribute("PAYMENT_TYPE", "Payment on delivery");
                    url = SUCCESS;
                } else if (bankCode.equalsIgnoreCase("VNBANK")) {
                    session.setAttribute("PAYMENT_TYPE", bankCode);
                    req.setAttribute("PAYMENT_TYPE", "Payment via ATM card/Domestic account");

                    String vnp_Version = "2.1.0";
                    String vnp_Command = "pay";
                    String orderType = "other";
                    
                    session.setAttribute("TOTAL_PRICE", total);
                    long amount = (long) (total * 100000);

                    String vnp_TxnRef = Config.getRandomNumber(8);
                    String vnp_IpAddr = Config.getIpAddress(req);

                    String vnp_TmnCode = Config.vnp_TmnCode;

                    Map<String, String> vnp_Params = new HashMap<>();
                    vnp_Params.put("vnp_Version", vnp_Version);
                    vnp_Params.put("vnp_Command", vnp_Command);
                    vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                    vnp_Params.put("vnp_Amount", String.valueOf(amount));
                    vnp_Params.put("vnp_CurrCode", "VND");

                    if (bankCode != null && !bankCode.isEmpty()) {
                        vnp_Params.put("vnp_BankCode", bankCode);
                    }
                    vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                    vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
                    vnp_Params.put("vnp_OrderType", orderType);

                    String locate = "en";
                    if (locate != null && !locate.isEmpty()) {
                        vnp_Params.put("vnp_Locale", locate);
                    } else {
                        vnp_Params.put("vnp_Locale", "vn");
                    }
                    vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
                    vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                    Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                    String vnp_CreateDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                    cld.add(Calendar.MINUTE, 15);
                    String vnp_ExpireDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

                    List fieldNames = new ArrayList(vnp_Params.keySet());
                    Collections.sort(fieldNames);
                    StringBuilder hashData = new StringBuilder();
                    StringBuilder query = new StringBuilder();
                    Iterator itr = fieldNames.iterator();
                    while (itr.hasNext()) {
                        String fieldName = (String) itr.next();
                        String fieldValue = (String) vnp_Params.get(fieldName);
                        if ((fieldValue != null) && (fieldValue.length() > 0)) {
                            //Build hash data
                            hashData.append(fieldName);
                            hashData.append('=');
                            hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                            //Build query
                            query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                            query.append('=');
                            query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                            if (itr.hasNext()) {
                                query.append('&');
                                hashData.append('&');
                            }
                        }
                    }
                    String queryUrl = query.toString();
                    String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
                    queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
                    String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
                    url = paymentUrl;
                } else {
                    req.setAttribute("ERROR_CONFIRM", "Can't confirm checkout");
                }
            } else {
                session.setAttribute("ERROR_CONFIRM", "Can't insert address into database");
            }
        } catch (Exception e) {
            log("Error at SearchServlet " + e.toString());
        } finally {
            if (bankCode.equalsIgnoreCase("delivery")) {
                req.getRequestDispatcher(url).forward(req, resp);
            } else {
                resp.sendRedirect(url);
            }
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
