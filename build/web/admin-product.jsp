<%-- 
    Document   : product
    Created on : Oct 23, 2016, 7:38:24 PM
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
        <title>Quản lý sản phẩm</title>

        <link rel="stylesheet" type="text/css" href="css/admin-style.css"> 
        <style>
            .page{
                float: left;
                font-size: 16px;
                margin-right: 20px;
                margin-bottom: 30px;
                padding: 5px;
                border: 1px solid #D1D1D1;
            }
            ul {
                text-decoration: none;
                list-style: none;
                margin-left: 0px;
                padding: 0;
            }
        </style>
    </head>
    <body>
        <jsp:include page="admin-header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="admin-banner.jsp"></jsp:include>
                <div id="rightContent">
                    <h3><a href="admin-product.jsp">Danh sách sản phẩm</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addProduct.jsp">Thêm mới sản phẩm</a></h3>
                <%
                    WatchDAO watchDAO = new WatchDAO();

                    int i = 1;
                     if(request.getParameter("i") != null) {
                        i = Integer.parseInt((String) request.getParameter("i"));
                    }

                    int pageOrder = 1, start, range;
                    if (request.getParameter("pageOrder") != null) {
                        pageOrder = Integer.parseInt(request.getParameter("pageOrder"));
                    }
                    int numberOfProduct = watchDAO.getWatchList().size();
                    if (numberOfProduct <= 10) {
                        start = 0;
                        range = numberOfProduct;
                    } else {
                        start = (pageOrder - 1) * 10;
                        range = 10;
                    }
                    List<Watch> list = watchDAO.getWatchList(start, range);
                %>


                <table class="data">
                    <tr class="data">
                        <th class="data" width="30px">STT</th>
                        <th class="data">Mã sản phẩm</th>
                        <th class="data">Tên sản phẩm</th>
                        <th class="data">Thương hiệu</th>
                        <th class="data">Đơn giá</th>
                        <th class="data">Hình ảnh</th>
                        <th class="data" width="75px">Hành động</th>
                    </tr>

                    <%
                        for (Watch watch : list) {
                    %>
                    <tr class="data">
                        <td class="data" style="text-align: center;" width="30px"><%=i++%></td>
                        <td class="data" style="text-align: center;" ><%= watch.getWatchId()%></td>
                        <td class="data"><%= watch.getName()%></td>
                        <td class="data"><%= watch.getCategory().getName()%></td>
                        <td class="data"><%= (int) watch.getPrice()%>000 VNĐ</td>
                        <td class="data" width="50px"><img class="watchImage" src="images/<%= watch.getImage()%>" height="80px" width="50px"></td>
                        <td class="data" width="75px">
                    <center>
                        <a href="admin-editProduct.jsp?idWatch=<%= watch.getWatchId()%>"><img src="css/img/oke.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="ProductProcess?idWatch=<%= watch.getWatchId()%>"><img src="css/img/detail.png"></a>
                    </center>
                    </td>
                    </tr>
                    <%
                         }
                      %>
                </table>
                <ul>
                    <%
                          for(int j = 1; j <= numberOfProduct/10 + 1; j++) {
                    %>
                    <li class="page"><a href="admin-product.jsp?pageOrder=<%= j %>&i=<%= i %>"><%= j %></a></li>
                        <%
                        }
                        %>


                </ul>
            </div>
            <div class="clear"></div>

         

            <jsp:include page="admin-footer.jsp"></jsp:include>
        </div>
    </body>
</html>
