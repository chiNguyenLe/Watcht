/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Cart;
import entities.Item;
import entities.Watch;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.WatchDAO;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class CartProcess extends HttpServlet {

    private WatchDAO watchDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        watchDAO = new WatchDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String page = request.getParameter("page");
        if(page!=null) {
            session.setAttribute("page", page);
        }
        String toDo = request.getParameter("todo");
        int watchID = Integer.parseInt(request.getParameter("watchID"));

        Cart cart = (Cart) session.getAttribute("Cart");

        try {
            Watch watch = watchDAO.getWatchById(watchID);

            switch (toDo) {
                case "add" :
                    if (cart.getCartItem().containsKey(watchID)) {
                        int oldQuantity = cart.getCartItem().get(watchID).getQuantity();
                        cart.addToCart(watchID, new Item(watch, oldQuantity));
                    } else cart.addToCart(watchID, new Item(watch, 1));
                    
                    break;
                case "sub" :
                    break;
                case "remove" :
                    cart.removeItem(watchID);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        session.setAttribute("Cart", cart);
        request.getRequestDispatcher((String) session.getAttribute("page")).forward(request, response);
    }


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
