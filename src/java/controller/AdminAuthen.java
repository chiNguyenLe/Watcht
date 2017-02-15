/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDAO;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class AdminAuthen extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("User", null);
        session.invalidate();
        request.getRequestDispatcher("admin-login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String page = "";
        HttpSession session = request.getSession();

        User user = userDAO.getUserByUsernameAndPassword(username, password);
        if (user == null || user.getRole().equals("CUSTOMER")) {
            page = "admin-login.jsp";
        } else {
            session.setAttribute("User", user);
            page = "ChartProcess";
        }

        request.getRequestDispatcher(page).forward(request, response);
    }

}
