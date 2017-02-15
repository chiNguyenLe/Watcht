<%-- 
    Document   : detail
    Created on : Oct 21, 2016, 1:34:57 AM
    Author     : Chi Nguyen T-rex
--%>

<%@page import="entities.Watch"%>
<%@page import="model.WatchDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
        <link rel="stylesheet" href="css/etalage.css">
        <script src="js/jquery.etalage.min.js"></script>
        <script>
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    source_image_width: 900,
                    source_image_height: 1200,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
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
            WatchDAO watchDAO = new WatchDAO();
            int id = 0;
            String s = request.getParameter("watchId");
            if(s != null) {
                id = Integer.parseInt(s);
            }
            
            Watch watch = watchDAO.getWatchById(id);
        %>
            <div class="container">
                <div class="single">
                    <div class="col-md-9 top-in-single">
                        <div class="col-md-5 single-top">	
                            <ul id="etalage">
                                <li>
                                    <a href="#">
                                        <img class="etalage_thumb_image img-responsive" src="images/<%=watch.getImage()%>" alt="" >
                                        <img class="etalage_source_image img-responsive" src="images/<%=watch.getImage()%>" alt="" >
                                    </a>
                                </li>
                                <li>
                                    <img class="etalage_thumb_image img-responsive" src="images/<%=watch.getImage()%>" alt="" >
                                    <img class="etalage_source_image img-responsive" src="images/<%=watch.getImage()%>" alt="" >
                                </li>
                                <li>
                                    <img class="etalage_thumb_image img-responsive" src="images/<%=watch.getImage()%>" alt=""  >
                                    <img class="etalage_source_image img-responsive" src="images/<%=watch.getImage()%>" alt="" >
                                </li>
                                <li>
                                    <img class="etalage_thumb_image img-responsive" src="images/<%=watch.getImage()%>"  alt="" >
                                    <img class="etalage_source_image img-responsive" src="images/<%=watch.getImage()%>" alt="" >
                                </li>
                            </ul>

                        </div>	
                        <div class="col-md-7 single-top-in">
                            <div class="single-para">
                                <h4>Đồng hồ <%=watch.getName()%></h4>
                                <div class="para-grid">
                                    <span  class="add-to"><%=(int) watch.getPrice()%>000 VNĐ</span>
                                    <a href="CartProcess?page=detail.jsp?watchId=<%=watch.getWatchId()%>&watchID=<%=watch.getWatchId()%>&todo=add" class="hvr-shutter-in-vertical cart-to">+ GIỎ HÀNG</a>					
                                    <div class="clearfix"></div>
                                </div>
                                <h5>Số lượng còn: <%=watch.getQuantity()%> cái</h5>
                                
                                <p><%=watch.getDescription()%></p>

                            

                            </div>
                        </div>
                        <div class="clearfix"> </div>
                         
             
                    </div>
                    
               
                    
                    <div class="clearfix"> </div>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
