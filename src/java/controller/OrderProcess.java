/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Cart;
import entities.Invoice;
import entities.InvoiceDetail;
import entities.Item;
import entities.User;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.InvoiceDAO;
import model.InvoiceDetailDAO;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class OrderProcess extends HttpServlet {
    private InvoiceDAO invoiceDAO;
    private InvoiceDetailDAO detailDAO;

    @Override
    public void init() throws ServletException {
        super.init(); 
        invoiceDAO = new InvoiceDAO();
        detailDAO = new InvoiceDetailDAO();
    }
    
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        if (session.getAttribute("User") == null) {
            request.getRequestDispatcher("beforeBuy.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("deliveryAddress.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        Cart cart = (Cart) session.getAttribute("Cart");
        
        String numberHouse = request.getParameter("number");
        String street = request.getParameter("street");
        String district = request.getParameter("district");
        String city = request.getParameter("city");
        
        String address = numberHouse + " " + street + ", " + district + ", " + city;
        Invoice invoice = new Invoice(user, new Date(), null, address, null);
        invoiceDAO.addOrUpdateInvoice(invoice);
        for(Map.Entry<Integer, Item> entry : cart.getCartItem().entrySet()) {
            detailDAO.addOrUpdateInvoiceDetail(new InvoiceDetail(invoice, entry.getValue().getWatch(), entry.getValue().getQuantity()));
        }
        
        SendMailMachine.sendMail(cart, user.getEmail());
        
        request.getRequestDispatcher("orderSuccess.jsp").forward(request, response);

    }

}
