<%-- 
    Document   : login
    Created on : Oct 23, 2016, 7:43:35 PM
    Author     : Chi Nguyen T-rex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/admin-style.css"> 
        <title>Đăng nhập trang quản trị</title>
    </head>
    <body>
        <div id="header">
            <div class="inHeaderLogin"></div>
        </div>

        <div id="loginForm">
            <div class="headLoginForm">
                Login Administrator
            </div>
            <div class="fieldLogin">
                <form method="POST" action="AdminAuthen">
                    <label>Username</label><br>
                    <input type="text" class="login" name="username"><br>
                    <label>Password</label><br>
                    <input type="password" class="login" name="password"><br>
                    <input type="submit" class="button" value="Login">
                </form>
            </div>
        </div>
    </body>
</html>
