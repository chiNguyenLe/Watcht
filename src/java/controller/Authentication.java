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
public class Authentication extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String toDo = request.getParameter("todo");

        String pass = request.getParameter("password");
        String userName = request.getParameter("username");

        UserDAO userDAO = new UserDAO();

        boolean validUsername = userDAO.getUserByUsername(userName) == null; // true: username chưa được dùng
        // Đăng ký
        if (toDo.equals("register")) {
            String mail = request.getParameter("email");
            boolean validEmail = userDAO.getUserByEmail(mail) == null; // true: email chưa tồn tại

            if (validEmail) {
                request.setAttribute("checkEmail", "");
            } else {
                request.setAttribute("checkEMail", "Email này đã được sử dụng.");
            }

            if (validUsername) {
                request.setAttribute("checkUsername", "");
            } else {
                request.setAttribute("checkUsername", "Username này đã được sử dụng.");
            }

            if (validEmail && validUsername) {
                String name = request.getParameter("name");
                User user = new User(userName, pass, name);
                user.setEmail(mail);
                user.setRole("CUSTOMER");
                userDAO.addOrUpdateUser(user);

                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

            // Đăng nhập
        } else if (toDo.equals("login")) {

            if (validUsername) {
                request.setAttribute("checkUsername", "Username không tồn tại.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                
                request.setAttribute("checkUsername", "");

                User us = userDAO.getUserByUsernameAndPassword(userName, pass);
                if (us == null) {
                    request.setAttribute("checkPass", "Mật khẩu không đúng.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("checkPass", "");

                    HttpSession session = request.getSession();
                    session.setAttribute("User", us);

                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                
            }

        } else if(toDo.equals("logout")) {
            HttpSession session = request.getSession();
            session.setAttribute("User", null);
            session.invalidate();
            
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
