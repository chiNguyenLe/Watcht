<%-- 
    Document   : advance-register
    Created on : Oct 25, 2016, 5:50:22 PM
    Author     : Chi Nguyen T-rex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
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

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                
                $("#username").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });

                function check_username_ajax(username) {
                    $("#user-result").html('<img src="images/ajax-loader.gif" />');
                    $.post('RegisterAdvance?todo=checkUsername', {'username': username}, function (data) {
                        $("#user-result").html(data);
                    });
                }
                
                var y_timer;
                $("#email").keyup(function (e) {
                    clearTimeout(y_timer);
                    var e_mail = $(this).val();
                    y_timer = setTimeout(function () {
                        check_email_ajax(e_mail);
                    }, 1000);
                });

                function check_email_ajax(email) {
                    $("#email-result").html('<img src="images/ajax-loader.gif" />');
                    $.post('RegisterAdvance?todo=checkEmail', {'email': email}, function (data) {
                        $("#email-result").html(data);
                    });
                }
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="account">
                    <h2 class="account-in">Đăng ký</h2>
                    <form method="post" action="RegisterAdvance?todo=register">
                        <div>
                     

                        <span>Tài khoản*</span>
                        <input type="text" name="username" id="username" required autofocus>
                        <span id="user-result" style="margin-left: 15px;" ></span>

                    </div> 	
                    <div>			
                        <span class="name-in">Họ và tên*</span>
                        <input type="text" name="name" required> 
                    </div>			
                    <div> 	
                        <span class="mail">Email*</span>
                        <input type="text" name="email" id="email" required> 
                        <span id="email-result" style="margin-left: 15px;"></span>
                    </div>
                    <div> 
                        <span class="word">Password*</span>
                        <input type="password" name="password" required minlength="6">
                    </div>				
                    <input type="submit" value="Đăng ký"> 
                </form>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

