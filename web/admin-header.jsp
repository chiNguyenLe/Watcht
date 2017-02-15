<%-- 
    Document   : header
    Created on : Oct 23, 2016, 5:12:50 PM
    Author     : Chi Nguyen T-rex
--%>

<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
    </head>
    <body>
        <div id="header">
            <div class="inHeader">
                <div class="mosAdmin">
                    Adminitrator: <%= ((User) session.getAttribute("User")).getName() %> <a href="AdminAuthen">Đăng xuất</a> <br>
              
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html>
