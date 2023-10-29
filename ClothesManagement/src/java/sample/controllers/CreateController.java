/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.users.UserDAO;
import sample.users.UserDTO;
import sample.users.UserError;

/**
 *
 * @author minht
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        boolean check = true;
        try {
            UserDAO dao = new UserDAO();
            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");

            if (userName.length() < 5 || userName.length() > 25) {
                check = false;
                userError.setUserNameError("Full Name in range [5,20]");
            }

            try {
                InternetAddress internetAddress = new InternetAddress(email, false);
                internetAddress.validate();
            } catch (AddressException e) {
                check = false;
                if (e.toString().contains("@")) {
                    userError.setEmailError("Please include an '@' in the email address. '" + email + "' is missing an '@'.");
                } else {
                    userError.setEmailError(email + " is a valid email.");
                }
            }
            boolean checkEmail = dao.checkDuplicate(email);
            if (checkEmail) {
                check = false;
                userError.setEmailError("This email address is already associated with an account");
            }

            if (!password.equals(confirm)) {
                check = false;
                userError.setConfirmError("Those passwords didn’t match. Try again.");
            }
            if (check) {
                boolean checkInsert = dao.insert(new UserDTO(userName, email, password, roleID, "1"));
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    userError.setError("Unknown error");
                    request.setAttribute("USER_ERROR", userError);
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
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
