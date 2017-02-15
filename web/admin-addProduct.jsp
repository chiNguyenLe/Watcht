<%-- 
    Document   : add-product
    Created on : Oct 23, 2016, 7:51:21 PM
    Author     : Chi Nguyen T-rex
--%>

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
                    <h3><a href="admin-product.jsp">Danh sách sản phẩm</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addUser.jsp">Thêm mới sản phẩm</a></h3>

                    <form method="post" action="ProductProcess?todo=add" enctype="multipart/form-data">
                        <table width="95%">
                            <tr><td><b>Tên sản phẩm</b></td><td><input type="text" class="sedang" required name="name" ></td></tr>
                            <tr><td><b>Số lượng</b></td><td><input type="number" class="panjang" required name="quantity"></td></tr>
                            <tr><td><b>Đơn giá</b></td><td><input type="number" class="panjang" required name="price"></td></tr>
                            <tr><td><b>Ảnh sản phẩm</b></td><td><input type="file" class="panjang" name="file"></td></tr>
                            <tr><td><b>Thương hiệu</b></td><td>
                                    <select name="category" required>
                                        <option >Thương hiệu</option>
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
                            <tr><td><b>Mô tả</b></td><td><textarea name="description"></textarea></td></tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <input type="submit" class="button" value="Thêm mới">
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
