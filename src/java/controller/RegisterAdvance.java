/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserDAO;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class RegisterAdvance extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String todo = request.getParameter("todo");
        String username = "";
        String email = "";

        switch (todo) {
            case "checkUsername":
                username = request.getParameter("username");
                if (username.equals("")) {
                    response.getWriter().write("<i style=\"color:red;\">Không được để trống trường này.</i>");

                } else if (userDAO.getUserByUsername(username) != null) {
                    response.getWriter().write("<i style=\"color:red;\">Username này đã được đăng ký.</i>");
                } else {
                    response.getWriter().write("<img src=\"images/available.png\" />");
                }
                break;
            case "checkEmail":
                email = request.getParameter("email");
                if (email.equals("")) {
                    response.getWriter().write("<i style=\"color:red;\">Không được để trống trường này.</i>");
                } else if (userDAO.getUserByEmail(email) != null) {
                    response.getWriter().write("<i style=\"color:red;\">Email này đã được đăng ký.</i>");
                } else {
                    response.getWriter().write("<img src=\"images/available.png\" />");
                }
                break;

            case "register":
                String name = request.getParameter("name");
                String pass = request.getParameter("password");
                User user = new User(username, pass, name);
                user.setEmail(email);
                user.setRole("CUSTOMER");
                request.getRequestDispatcher("success.jsp").forward(request, response);
                break;
        }

    }

}
