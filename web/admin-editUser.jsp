<%-- 
    Document   : addUser
    Created on : Oct 23, 2016, 7:51:47 PM
    Author     : Chi Nguyen T-rex
--%>

<%@page import="entities.User"%>
<%@page import="model.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm mới khách hàng</title>

        <link rel="stylesheet" type="text/css" href="css/admin-style.css"> 
    </head>
    <body>
        <jsp:include page="admin-header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="admin-banner.jsp"></jsp:include>
                <div id="rightContent">
                    <h3><a>Sửa thông tin tài khoản</a></h3>
                    <%
                        int id = Integer.parseInt(request.getParameter("idUser"));
                        UserDAO udao = new UserDAO();
                        User user = udao.getUserById(id);
                    %>

                    <form method="POST" action="UserProcess?todo=edit&idUser=<%= id %>">
                        <table width="95%">
                            <tr><td><b>Username</b></td><td><input type="text" class="sedang" name="username" value="<%= user.getUsername() %>"></td></tr>
                            <tr><td><b>Họ và tên</b></td><td><input type="text" class="sedang" name="name" value="<%= user.getName() %>"></td></tr>
                            <tr><td><b>Email</b></td><td><input type="text" class="sedang" name="email" value="<%= user.getEmail() %>" ></td></tr>
                            <tr><td><b>Mật khẩu</b></td><td><input type="text" class="sedang" name="password" value="<%= user.getPassword() %>"></td></tr>
                            <tr>
                                <td><b>Vai trò</b></td>
                                <td>
                                    <input type="radio" name="role" id="radio" value="ADMIN">Quản trị viên
                                    <input type="radio" name="role" id="radio" value="CUSTOMER">Tài khoản thường
                                </td>
                            </tr>

                            <tr>
                                <td></td>
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
