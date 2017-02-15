<%-- 
    Document   : deliveryAddress
    Created on : Oct 28, 2016, 5:11:43 PM
    Author     : Chi Nguyen T-rex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Địa chỉ giao hàng</title>
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
        <!--slider-script-->
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider1").responsiveSlides({
                    auto: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <!--//slider-script-->
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
            <div class="container">
                <div class="account">
                    <h2 class="account-in">Địa chỉ giao hàng</h2>
                    <form action="OrderProcess" method="post">
                        <div>
                            <span>Số nhà*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <input type="text" required name="number">
                        </div> 	
                        <div>			
                            <span class="name-in">Tên đường*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <input type="text" required name="street"> 
                        </div>			
                        <div> 	
                            <span class="mail">Quận*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <input type="text" required name="district"> 
                        </div>
                        <div> 
                            <span class="word">Tỉnh/Thành phố*</span>
                            <input type="text" required name="city">
                        </div>				
                        <input type="submit" value="Đặt mua"> 
                    </form>
                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
