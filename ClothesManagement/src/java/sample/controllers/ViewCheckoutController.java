/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
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

/**
 *
 * @author minht
 */
@WebServlet(name = "ViewCheckoutController", urlPatterns = {"/ViewCheckoutController"})
public class ViewCheckoutController extends HttpServlet {

    private static final String ERROR = "home.jsp";
    private static final String SUCCESS = "viewCheckout.jsp";
    private static final String LOGIN = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (cart != null) {
                if (!cart.getCart().isEmpty()) {
                    if (loginUser == null) {
                        session.setAttribute("MESSEGES", "You need login");
                        url = LOGIN;
                    } else {
                        AddressDAO daoAddress = new AddressDAO();
                        AddressDTO userAddress = daoAddress.getAddress(loginUser.getUserID(), "PRIMARY");
                        if (userAddress != null) {
                            session.setAttribute("ADDRESS", userAddress);                          
                        }
                        url = SUCCESS;
                    }
                } else {
                    session.setAttribute("MESSEGES", "There are no products in the cart!");
                }
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
