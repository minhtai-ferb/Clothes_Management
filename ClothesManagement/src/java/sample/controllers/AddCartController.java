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
import sample.depots.DepotsDAO;
import sample.order.Cart;
import sample.depots.DepotsDTO;
import sample.order.OrderDetailDTO;
import sample.product.ProductDTO;

/**
 *
 * @author minht
 */
@WebServlet(name = "AddCartController", urlPatterns = {"/AddCartController"})
public class AddCartController extends HttpServlet {

    private static final String ERROR = "viewProduct.jsp";
    private static final String SUCCESS = "viewProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession sesison = request.getSession();
            int detailID;
            int proID = Integer.parseInt(request.getParameter("proID"));
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            Cart cart = (Cart) sesison.getAttribute("CART");
            OrderDetailDTO detailOrder = null; 
            
            //check quantity
            DepotsDAO daoDepots = new DepotsDAO();
            DepotsDTO product = daoDepots.getProduct(proID, color, size);
            int depotsID = product.getDeProID();
            String img = product.getColorIMG();
            int quantity = product.getQuantity();
            int quantityCart;
            if (cart == null || cart.getCart().isEmpty()) {
                quantityCart = 0;
            } else {
                quantityCart = cart.getQuantity(depotsID);
            }           
            boolean checkQuantiry = true;
            if (quantity - 1 - quantityCart < 0) {
                checkQuantiry = false;
            }
       
            ProductDTO productSesison = (ProductDTO) sesison.getAttribute("PRODUCT");
            double price = productSesison.getPrice();
            String proName = productSesison.getProName();            
                    
            if (checkQuantiry) {
                if (productSesison != null) {
                    if (cart == null) {
                        cart = new Cart();
                        detailID = 1;
                    } else {
                        detailID = cart.getCart().size() + 1;
                    }
                    if (cart.checkDetail(depotsID)) {
                        detailOrder = cart.getDetailDuplicate(depotsID);
                    } else {
                        detailOrder = new OrderDetailDTO(detailID, 1, price, depotsID, proID, color, size, img, proName);
                    }
                    cart.add(detailOrder);
                    sesison.setAttribute("CART", cart);
                    request.setAttribute("MASSAGE", "Added - " + productSesison.getProName() + " - success!");
                    request.setAttribute("ERROR_ADD", "");
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("MASSAGE", "");
                request.setAttribute("ERROR_ADD", "Sorry. The product is " + color + " and size " + size + " is sold out.");
            }
        } catch (Exception e) {
            log("Error at AddController: " + e.toString());
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
