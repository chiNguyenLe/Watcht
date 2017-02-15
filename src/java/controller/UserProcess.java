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
import model.UserDAO;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class UserProcess extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idUser"));
        User user = userDAO.getUserById(id);
        userDAO.deleteUser(user);
        request.getRequestDispatcher("admin-user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String todo = request.getParameter("todo");

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String page = "";
  
        switch(todo) {
            
            case "add":
                User user = new User(username, password, name);
                user.setEmail(email);
                user.setRole(role);
                userDAO.addOrUpdateUser(user);               
                page = "admin-addUser.jsp";
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("idUser"));
                User user1 = new User(username, password, name);
                user1.setEmail(email);
                user1.setRole(role);
                user1.setUserId(id);
                userDAO.addOrUpdateUser(user1);
                page = "admin-user.jsp";
                break;
        }
        
        request.getRequestDispatcher(page).forward(request, response);

    }

}
