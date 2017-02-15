<%-- 
    Document   : addUser
    Created on : Oct 23, 2016, 7:51:47 PM
    Author     : Chi Nguyen T-rex
--%>

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
                    <h3><a href="admin-user.jsp">Danh sách tài khoản</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addUser.jsp">Thêm mới tài khoản</a></h3>




                    <form method="POST" action="UserProcess?todo=add">
                    <table width="95%">
                        <tr><td><b>Username</b></td><td><input type="text" class="sedang" name="username" required></td></tr>
                        <tr><td><b>Họ tên</b></td><td><input type="text" class="sedang" name="name" required></td></tr>
                        <tr><td><b>Email </b></td><td><input type="email" class="sedang" name="email" required></td></tr>
                        <tr><td><b>Mật khẩu </b></td><td><input type="text" class="sedang" name="password" required></td></tr>
                        <tr>
                            <td><b>Vai trò</b></td>
                            <td>
                                <input type="radio" name="role" id="radio" value="ADMIN" required>Quản trị viên
                                <input type="radio" name="role" id="radio" value="CUSTOMER" required>Tài khoản thường
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
