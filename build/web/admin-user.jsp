<%-- 
    Document   : user
    Created on : Oct 23, 2016, 7:38:35 PM
    Author     : Chi Nguyen T-rex
--%>

<%@page import="java.util.List"%>
<%@page import="entities.User"%>
<%@page import="model.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý khách hàng</title>

        <link rel="stylesheet" type="text/css" href="css/admin-style.css"> 
    </head>
    <body>
        <jsp:include page="admin-header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="admin-banner.jsp"></jsp:include>
                <div id="rightContent">
                    <h3><a href="admin-user.jsp">Danh sách tài khoản</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addUser.jsp">Thêm mới tài khoản</a></h3>

                    <%
                        UserDAO udao = new UserDAO();
                        List<User> list = udao.getUserList();
                        int i = 1;
                    %>

                    <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <th class="data">Mã tài khoản</th>
                            <th class="data">Tên tài khoản</th>
                            <th class="data">Tên người dùng</th>
                         
                            <th class="data" width="75px">Vai trò</th>
                            <th class="data" width="75px">Hành động</th>
                        </tr>
                        
                    <%
                        for(User user : list) {
                    %>
                        <tr class="data">
                            <td class="data" width="30px" style="text-align: center;"><%= i++ %></td>
                            <td class="data" style="text-align: center;"><%= user.getUserId() %></td>
                            <td class="data"><%= user.getUsername() %></td>
                            <td class="data"><%= user.getName() %></td>
                      
                            <td class="data"><%= user.getRole() %></td>
                            <td class="data" width="75px">
                                <center>
                                    <a href="admin-editUser.jsp?idUser=<%= user.getUserId() %>"><img src="css/img/oke.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="UserProcess?idUser=<%= user.getUserId() %>"><img src="css/img/detail.png"></a>
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
