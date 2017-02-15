<%-- 
    Document   : login
    Created on : Oct 20, 2016, 1:51:29 AM
    Author     : Chi Nguyen T-rex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <script src="js/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link rel="stylesheet" type="text/css" href="css/font-face.css">
        <!--//fonts-->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
       
        <script>$(document).ready(function (c) {
                $('.alert-close').on('click', function (c) {
                    $('.message').fadeOut('slow', function (c) {
                        $('.message').remove();
                    });
                });
            });
        </script>
        <script>$(document).ready(function (c) {
                $('.alert-close1').on('click', function (c) {
                    $('.message1').fadeOut('slow', function (c) {
                        $('.message1').remove();
                    });
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <%
            String user = (String) request.getAttribute("checkUsername");
            user = user == null ? "" : user;
            String pass = (String) request.getAttribute("checkPass");
            pass = pass == null ? "" : pass;
        %>

        <div class="container">
            <div class="account">
                <h2 class="account-in">Đăng nhập</h2>
                <form method="post" action="Authentication?todo=login">
                    <div>
                        <span>Username</span>
                        <input type="text" name="username" required >
                        <span style="color:red;font-size:16px;font-style:italic;margin-left:12px;"><%=user%></span>
                    </div> 	
                    <div> 
                        <span class="word">Password</span>
                        <input type="password" name="password" required >
                        <span style="color:red;font-size:16px;font-style:italic;margin-left:12px;"><%=pass%></span>
                    </div>				
                    <input type="submit" value="Login"> 
                </form>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
