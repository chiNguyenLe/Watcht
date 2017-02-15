<%-- 
    Document   : product
    Created on : Oct 20, 2016, 2:09:39 AM
    Author     : Chi Nguyen T-rex
--%>

<%@page import="model.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="entities.Watch"%>
<%@page import="model.WatchDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
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
        
        <% 
            WatchDAO watchDAO = new WatchDAO();
            Integer id = 0;
            String cate = "";
           
            if(request.getParameter("catego") != null) {
                id = Integer.parseInt(request.getParameter("catego"));
                CategoryDAO categoryDAO = new CategoryDAO();
                cate = categoryDAO.getCategoryById(id).getName();
                    
            }
            
            
            
        %>
        <jsp:include page="header.jsp"></jsp:include>
        </br>
        </br>
        </br>
        <div class="container">
            <div class="content">
                <div class="content-top">
                    <h3 class="future" style="test-transform:uppercase;"><%=cate%></h3>
                    <div class="content-top-in">
                        
                    <%
                        for (Watch watch :  watchDAO.getWatchByCategory(id)) {
                    %>
                        <div class="col-md-3 md-col">
                            <div class="col-md">
                                <a href="detail.jsp?watchId=<%=watch.getWatchId()%>"><img  src="images/<%=watch.getImage()%>" alt="" /></a>	
                                <div class="top-content">
                                    <h5><a href="detail.jsp?watchId=<%=watch.getWatchId()%>"><%=watch.getName()%></a></h5>
                                    <div class="white">
                                        <a href="CartProcess?page=product.jsp?catego=<%=watch.getCategory().getCategoryId()%>&watchID=<%=watch.getWatchId()%>&todo=add" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">+ GIỎ HÀNG</a>
                                        <p class="dollar"><span class="in-dollar">VNĐ</span><span><%=(int)watch.getPrice()%></span><span>000</span></p>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>							
                            </div>
                        </div>
            
                    <%
                            }
                    %> 
                        
                        
                        <div class="clearfix"></div>
                    </div>
                </div>
                <!---->
            
                
                <ul class="start">
                    <li ><a href="#"><i></i></a></li>
                    <li><span>1</span></li>
                    <li class="arrow"><a href="#">2</a></li>
                    <li class="arrow"><a href="#">3</a></li>
                    <li class="arrow"><a href="#">4</a></li>
                    <li class="arrow"><a href="#">5</a></li>
                    <li ><a href="#"><i  class="next"> </i></a></li>
                </ul>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
