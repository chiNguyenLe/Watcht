<%-- 
    Document   : add-product
    Created on : Oct 23, 2016, 7:51:21 PM
    Author     : Chi Nguyen T-rex
--%>

<%@page import="entities.Watch"%>
<%@page import="model.WatchDAO"%>
<%@page import="java.util.List"%>
<%@page import="entities.Category"%>
<%@page import="model.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm mới sản phẩm</title>

        <link rel="stylesheet" type="text/css" href="css/admin-style.css"> 
    </head>
    <body>
        <jsp:include page="admin-header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="admin-banner.jsp"></jsp:include>
                <div id="rightContent">
                    <h3><a href="#">Sửa thông tin sản phẩm</a></h3>
                    <%
                        int id = Integer.parseInt(request.getParameter("idWatch"));
                        WatchDAO wdao = new WatchDAO();
                        Watch watch = wdao.getWatchById(id);
                    %>

                    <form method="post" action="ProductProcess?todo=edit&imageLink=<%= watch.getImage() %>&idWatch=<%= id %>" enctype="multipart/form-data">
                        <table width="95%">
                            <tr><td><b>Tên sản phẩm</b></td><td><input type="text" class="sedang" required name="name" value="<%= watch.getName() %>"></td></tr>
                            <tr><td><b>Số lượng</b></td><td><input type="number" class="panjang" required name="quantity" value="<%= watch.getQuantity() %>"></td></tr>
                            <tr><td><b>Đơn giá</b></td><td><input type="number" class="panjang" required name="price" value="<%=(int) watch.getPrice() %>"></td></tr>
                            
                            <tr><td><b>Thương hiệu</b></td><td>
                                    <select name="category" required>
                                        <option value="" >Thương hiệu</option>
                                    <%
                                        CategoryDAO categoryDAO = new CategoryDAO();
                                        List<Category> list = categoryDAO.getCategoryList();
                                        for (Category cate : list) {
                                    %>   
                                    <option value="<%= cate.getCategoryId()%>"><%= cate.getName()%></option>
                                    <%
                                        }
                                    %>

                                </select>
                            </td>
                        </tr>
                        <tr><td><b>Mô tả</b></td><td><textarea name="description"><%= watch.getDescription() %></textarea></td></tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="submit" class="button" value="Submit">
                            </td>
                        </tr>
                    </table>
                </form>

            </div>
            <div class="clear"></div>
            <jsp:include page="admin-footer.jsp"></jsp:include>
        </div>
    </body>
</html>
