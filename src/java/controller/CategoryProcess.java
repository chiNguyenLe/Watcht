/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Category;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryDAO;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class CategoryProcess extends HttpServlet {
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        categoryDAO = new CategoryDAO();
    }
    
    


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("idCategory"));       
        categoryDAO.deleteCategory(categoryDAO.getCategoryById(id));
        request.getRequestDispatcher("admin-category.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String todo = request.getParameter("todo");
        String categoryName = request.getParameter("category");
        String page = "";
        
        switch(todo) {
            case "add":
                categoryDAO.addOrUpdateCategory(new Category(categoryName));
                page = "admin-addCategory.jsp";
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("idCategor"));
                Category cate = new Category(categoryName);
                cate.setCategoryId(id);
                categoryDAO.addOrUpdateCategory(cate);
                page = "admin-category.jsp";
                break;
        }
        
        request.getRequestDispatcher(page).forward(request, response);
   
    }


}
