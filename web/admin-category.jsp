<%-- 
    Document   : category-manager
    Created on : Oct 23, 2016, 7:15:23 PM
    Author     : Chi Nguyen T-rex
--%>

<%@page import="java.util.List"%>
<%@page import="model.CategoryDAO"%>
<%@page import="entities.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý danh mục</title>
        <link rel="stylesheet" type="text/css" href="css/admin-style.css"> 
    </head>
    <body>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> list = categoryDAO.getCategoryList();
            int i = 1;
        %>
        <jsp:include page="admin-header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="admin-banner.jsp"></jsp:include>


                <div id="rightContent">
                    <h3><a href="admin-category.jsp">Danh mục thương hiệu</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addCategory.jsp">Thêm mới thương hiệu</a></h3>
                  
                    <table class="data">
                        <tr class="data">
                            <th class="data" width="50px">STT</th>
                            <th class="data" width="200px">Mã thương hiệu</th>
                            <th class="data">Thương hiệu</th>
                            <th class="data" width="75px">Hành động</th>
                        </tr>
                        
                    <%
                        for(Category c : list) {
                    %>
                        <tr class="data">
                            <td class="data" width="30px" style="text-align: center;"><%= i++ %></td>
                            <td class="data" style="text-align: center;"><%=c.getCategoryId()%></td>
                            <td class="data"><%=c.getName()%></td>

                            <td class="data" width="75px" style="text-align: center;">
                                <center>
                                    <a href="admin-editCategory.jsp?idCategory=<%= c.getCategoryId() %>"><img src="css/img/oke.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="CategoryProcess?idCategory=<%= c.getCategoryId() %>" onClick="return confirm('Tất cả những sản phẩm thuộc danh mục này củng bị xóa. Bạn có chắc muốn xóa mục này không?')" ><img src="css/img/detail.png"></a>
                                </center>
                            </td>
                        </tr>                  
                    <%        
                        }
                    %>
                    </table>
                </div>
                <div class="clear"></div>
            <jsp:include page="admin-footer.jsp"></jsp:include>
        </div>
    </body>
</html>
