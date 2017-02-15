<%-- 
    Document   : index
    Created on : Oct 23, 2016, 5:12:15 PM
    Author     : Chi Nguyen T-rex
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entities.PieChart"%>
<%@page import="java.util.List"%>
<%@page import="model.PieChartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản trị nội dung</title>    
        <link rel="stylesheet" type="text/css" href="css/admin-style.css"> 
        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
        <script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)']
                    
            <c:forEach var="item" items="${listC}" >,['${item.name}', ${item.number}]</c:forEach>
                ]);
                // Set chart options
                var options = {
                    'title': 'Biểu đồ tròn: Thống kê sản phẩm theo danh mục',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('Chart2'));
                chart.draw(data, options);
            }
        </script>

        
        <script type="text/javascript">
            //load the Google Visualization API and the chart
            google.load('visualization', '1', {'packages': ['columnchart']});

            //set callback
            google.setOnLoadCallback(createChart);

            //callback function
            function createChart() {

                //create data table object
                var dataTable = new google.visualization.DataTable();

                //define columns
                dataTable.addColumn('string', 'Quarters 2009');
                dataTable.addColumn('number', 'Category');

                //define rows of data
                dataTable.addRows([
                    <c:forEach var="item" items="${listC}">
                        
                            ['${item.name}', ${item.number}],
                       
                    </c:forEach>
                 ]);
                

                //instantiate our chart object
                var chart = new google.visualization.ColumnChart(document.getElementById('chart'));

                //define options for visualization
                var options = {width: 700, height: 300, is3D: true, title: 'Biểu đồ cột: Thống kê sản phẩm theo danh mục'};

                //draw our chart
                chart.draw(dataTable, options);

            }
        </script>

    </head>
    <body>
        <jsp:include page="admin-header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="admin-banner.jsp"></jsp:include>
            <jsp:include page="admin-content.jsp"></jsp:include>
            <jsp:include page="admin-footer.jsp"></jsp:include>
        </div>
    </body>
</html>
