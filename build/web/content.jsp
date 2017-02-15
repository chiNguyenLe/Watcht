<%-- 
    Document   : content
    Created on : Oct 20, 2016, 1:47:24 AM
    Author     : Chi Nguyen T-rex
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Watch"%>
<%@page import="model.WatchDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>content</title>
    </head>
    <body>

        <%
            WatchDAO watchDAO = new WatchDAO();

        %>
        <div class="container">
            <div class="content">
                <div class="content-top">
                    <h3 class="future">SIÊU PHẨM</h3>
                    <div class="content-top-in">


                        <%                        // phân trang
                            int pageOrder = 1, start, range;
                            if (request.getParameter("pageOrder") != null) {
                                pageOrder = Integer.parseInt(request.getParameter("pageOrder"));
                            }
                            // Một trang đặt 12 sản phẩm
                            int numberOfProduct = watchDAO.getWatchList().size();
                            if (numberOfProduct <= 12) {
                                start = 0;
                                range = numberOfProduct;
                            } else {
                                start = (pageOrder-1)* 12;
                                range = 12;
                            }

                            List<Watch> list = watchDAO.getWatchList(start, range);
                        %>
                        <%
                           for (Watch w : list) {
                        %>  

                        <div class="col-md-3 md-col">
                            <div class="col-md">
                                <a href="detail.jsp?watchId=<%=w.getWatchId()%>"><img  src="images/<%=w.getImage()%>" alt="" /></a>	
                                <div class="top-content">
                                    <h5><a href="detail.jsp?watchId=<%=w.getWatchId()%>"><%=w.getName()%></a></h5>
                                    <div class="white">
                                        <a href="CartProcess?page=index.jsp&watchID=<%=w.getWatchId()%>&todo=add" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">+ GIỎ HÀNG</a>
                                        <p class="dollar"><span class="in-dollar">VNĐ</span><span><%=(int)w.getPrice()%></span><span>000</span></p>
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
               
                    <%
                           for(int i = 1; i <= numberOfProduct/12 + 1; i++) {
                    %>
                    <li class="arrow"><a href="index.jsp?pageOrder=<%= i %>"><%= i %></a></li>
                    <%
                    }
                    %>
                
                    <li ><a href="#"><i  class="next"> </i></a></li>
                </ul>
            </div>
        </div>
    </body>
</html>
