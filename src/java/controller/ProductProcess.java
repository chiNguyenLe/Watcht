/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Category;
import entities.Watch;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryDAO;
import model.WatchDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class ProductProcess extends HttpServlet {

    private WatchDAO watchDAO;
    private CategoryDAO categoryDAO;
    private static final String UPLOAD_DIRECTORY = "images";
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    @Override
    public void init() throws ServletException {
        super.init();
        watchDAO = new WatchDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idWatch"));
        Watch watch = watchDAO.getWatchById(id);
        watchDAO.deleteWatch(watch);
        request.getRequestDispatcher("admin-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String fileName = processImage(request, response);

        String todo = request.getParameter("todo");
        String page = "";
        
        String name = (String) request.getAttribute("name");
        int quantity = Integer.parseInt((String) request.getAttribute("quantity"));
        double price = Double.parseDouble((String) request.getAttribute("price"));
        int categoryID = Integer.parseInt((String) request.getAttribute("category"));
        String description = (String) request.getAttribute("description");
        System.out.println(description);
        
        Category c = categoryDAO.getCategoryById(categoryID);
        
        switch(todo) {
            case "add":
                
                Watch w = new Watch(c, name, price);
                w.setDescription(description);
                w.setQuantity(quantity);
                w.setImage(fileName);
                watchDAO.addOrUpdateWatch(w);
                page = "admin-addProduct.jsp";
                break;
            case "edit":
                String image = request.getParameter("imageLink");
                int id = Integer.parseInt(request.getParameter("idWatch"));
                Watch w1 = new Watch(c, name, price);
                w1.setDescription(description);
                w1.setQuantity(quantity);
                w1.setImage(image);
                w1.setWatchId(id);
                watchDAO.addOrUpdateWatch(w1);
                page = "admin-product.jsp";
                break;
        }
        
        request.getRequestDispatcher(page).forward(request, response);
    }

    public String processImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
    
        if (!ServletFileUpload.isMultipartContent(request)) {
            PrintWriter writer = response.getWriter();
            writer.print("error");
            return "";
        }
        String pathh = "";
        DiskFileItemFactory factory
                = new DiskFileItemFactory(MEMORY_THRESHOLD, new File(System.getProperty("java.io.tmpdir")));
        

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            List<FileItem> formItems = upload.parseRequest(request);
       
            if (formItems != null && formItems.size() > 0) {
                for (FileItem formItem : formItems) {
                    if (!formItem.isFormField()) {
                        String a = formItem.getName();
                        String fileName = new File(a).getName();
                        pathh = fileName;
                        String filePath = uploadPath + File.separator + fileName;
                  
                        File storeFile = new File(filePath);
           

                        formItem.write(storeFile);
                    } else {
                        String nameAttribute = formItem.getFieldName();
                        String valueAttribute = formItem.getString("UTF-8");
                        request.setAttribute(nameAttribute, valueAttribute);
                    }
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        
        return pathh;             
    }

}
