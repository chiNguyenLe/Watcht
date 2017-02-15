<%-- 
    Document   : addCategory
    Created on : Oct 23, 2016, 7:51:36 PM
    Author     : Chi Nguyen T-rex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm mới danh mục</title>

        <link rel="stylesheet" type="text/css" href="css/admin-style.css"> 
    </head>
    <body>
        <jsp:include page="admin-header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="admin-banner.jsp"></jsp:include>
                <div id="rightContent">
                    <h3><a href="#">Chỉnh sửa thương hiệu</a></h3>

                    <form method="post" action="CategoryProcess?idCategor=<%= request.getParameter("idCategory") %>&todo=edit" >
                        <table width="95%">
                            <tr>
                                <td width="125px"><b>Nhập tên mới</b></td>
                                <td><input type="text" class="pendek" name="category"></td>
                            </tr>

                            <tr>
                                <td>
                                </td>
                                <td>
                                    <input type="submit" class="button" value="Submit">
                                </td>
                            </tr>
                        </table>
                    </form>


                </div>
                <div class="clear"></div>
            <jsp:include page="admin-footer.jsp"></jsp:include>
        </div>
    </body>
</html>
