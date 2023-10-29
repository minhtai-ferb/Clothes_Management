/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author minht
 */
public class MainController extends HttpServlet {

    private static final String HOME_PAGE = "Home";
    private static final String WELCOME_PAGE = "LoadProductController";

    private static final String ERROR = "error.jsp";

    private static final String ACCOUNT = "Account";
    private static final String ACCOUNT_CONTROLLER = "AccountController";

    private static final String LOGIN_PAGE = "Login_Page";
    private static final String LOGIN_PAGE_VIEW = "login.html";

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";

    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";

    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";

    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";

    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";

    private static final String CREATE_PAGE = "Create_Page";
    private static final String CREATE_PAGE_VIEW = "create.jsp";

    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "CreateController";

    private static final String VIEW_PRODUCT = "View_Product";
    private static final String VIEW_PRODUCT_CONTROLLER = "ViewProductController";

    private static final String ADD_CART = "Add_Cart";
    private static final String ADD_CART_CONTROLLER = "AddCartController";
   
    private static final String VIEW_CART = "Edit_Product";
    private static final String VIEW_CART_CONTROLLER = "ViewCartController";
    
    private static final String SEARCH_PRODUCT = "Sreach_Product";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SreachProductController";

    private static final String REMOVE_PRODUCT = "Remove_Product";
    private static final String REMOVE_PRODUCT_CONTROLLER = "RemoveProductController";

    private static final String UPDATE_PRODUCT = "Update_Product";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";

    private static final String VIEW_CHECKOUT = "View_Checkout_Cart";
    private static final String VIEW_CHECKOUT_CONTROLLER = "ViewCheckoutController";

    private static final String PAY_NOW = "Pay_Now";
    private static final String PAY_NOW_CONTROLLER = "PayNowController";
    
    private static final String ACCOUNT_ADMIN = "Account_Admin";
    private static final String ACCOUNT_ADMIN_CONTROLLER = "account.jsp";       
    
    private static final String DASHBOARD = "Dashboard";
    private static final String DASHBOARD_CONTROLLER = "dashboard.jsp";        


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = WELCOME_PAGE;
            } else if (HOME_PAGE.equals(action)) {
                url = WELCOME_PAGE;
            } else if (ACCOUNT.equals(action)) {
                url = ACCOUNT_CONTROLLER;
            } else if (LOGIN_PAGE.equals(action)) {
                url = LOGIN_PAGE_VIEW;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (CREATE_PAGE.equals(action)) {
                url = CREATE_PAGE_VIEW;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (VIEW_PRODUCT.equals(action)) {
                url = VIEW_PRODUCT_CONTROLLER;
            } else if (ADD_CART.equals(action)) {
                url = ADD_CART_CONTROLLER;
            } else if (REMOVE_PRODUCT.equals(action)) {
                url = REMOVE_PRODUCT_CONTROLLER;
            } else if (UPDATE_PRODUCT.equals(action)) {
                url = UPDATE_PRODUCT_CONTROLLER;
            } else if (VIEW_CHECKOUT.equals(action)) {
                url = VIEW_CHECKOUT_CONTROLLER;
            } else if (PAY_NOW.equals(action)) {
                url = PAY_NOW_CONTROLLER;
            } else if (SEARCH_PRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_CONTROLLER;
            } else if (ACCOUNT_ADMIN.equals(action)) {
                url = ACCOUNT_ADMIN_CONTROLLER;
            } else if (DASHBOARD.equals(action)) {
                url = DASHBOARD_CONTROLLER;
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
