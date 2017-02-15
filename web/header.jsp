<%-- 
    Document   : header
    Created on : Oct 20, 2016, 1:13:01 AM
    Author     : Chi Nguyen T-rex
--%>

<%@page import="entities.Item"%>
<%@page import="java.util.Map"%>
<%@page import="entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.User"%>
<%@page import="model.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="entities.Category"%>
<%@page import="model.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
    </head>
    <body>

        <%!
            public class View {

                private String title;
                private String link;

                public View(String title, String link) {
                    this.title = title;
                    this.link = link;
                }

                public String getTitle() {
                    return title;
                }

                public String getLink() {
                    return link;
                }
            }
        %>

        <%
            List<View> list2 = new ArrayList<>();
            User user = null;
            if (session.getAttribute("User") != null) {
                user = (User) session.getAttribute("User");
                list2.add(new View(user.getName(), ""));
                list2.add(new View("ĐĂNG XUẤT", "Authentication?todo=logout"));
            } else {
                list2.add(new View("ĐĂNG NHẬP", "login.jsp"));
                list2.add(new View("ĐĂNG KÝ", "register.jsp"));
            }
        %>

        <%
            Cart cart = null;
            if (session.getAttribute("Cart") == null) {
                cart = new Cart();
                session.setAttribute("Cart", cart);
            } else {
                cart = (Cart) session.getAttribute("Cart");
            }
            int number = cart.countItem();
        %>
        <div class="header">
            <div class="header-top">
                <div class="container">	
                    <div class="header-top-in">			
                        <div class="logo">
                            <a href="index.jsp"><img src="images/logo.png" alt=" " ></a>
                        </div>
                        <div class="header-in">
                            <ul class="icon1 sub-icon1">


                                <%
                                    for (View e : list2) {
                                %>
                                <li  ><a href="<%=e.getLink()%>"><%=e.getTitle()%></a> </li>
                                    <%
                                        }
                                    %>


                                <li><div class="cart">
                                        <a href="#" class="cart-in"> </a>
                                        <span> <%=number%></span>
                                    </div>
                                    <ul class="sub-icon1 list">
                                        <h3>Sản phẩm vừa thêm</h3>

                                        <div class="shopping_cart">

                                            <%
                                                for (Map.Entry<Integer, Item> entry : cart.getCartItem().entrySet()) {
                                            %>

                                            <div class="cart_box">
                                                <div class="message">
                                                    <div class="alert-close"><a class="remove" href="CartProcess?watchID=<%=entry.getValue().getWatch().getWatchId()%>&todo=remove"></a></div>
                                                    <div class="list_img"><img src="images/<%=entry.getValue().getWatch().getImage()%>" class="img-responsive" alt=""></div>
                                                    <div class="list_desc"><h4><a href="#"><%=entry.getValue().getWatch().getName()%></a></h4><%=entry.getValue().getQuantity()%> x<span class="actual">
                                                            <%=(int) entry.getValue().getWatch().getPrice()%>000 VNĐ</span></div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div> 

                                            <%
                                                }
                                            %>



                                        </div>
                                        <div class="total">
                                            <div class="total_left">Tổng giá: </div>
                                            <div class="total_right"><%=(int) cart.sumPrice()%>000 VNĐ</div>
                                            <div class="clearfix"> </div>
                                        </div>
                                        <div class="login_buttons">
                                            <div class="check_button"><a href="OrderProcess">Đặt hàng</a></div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom">
                <div class="container">
                    <div class="h_menu4">
                        <a class="toggleMenu" href="#">Menu</a>
                        <ul class="nav">
                            <li class="active"><a href="index.jsp"><i> </i>Trang chủ</a></li>
                            <li ><a href="#" >Đồng hồ</a>
                                <ul class="drop">

                                    <%
                                        CategoryDAO cate = new CategoryDAO();
                                        List<Category> list = cate.getCategoryList();

                                        for (Category category : list) {
                                    %>
                                    <li><a href="product.jsp?catego=<%=category.getCategoryId()%>"><%=category.getName()%></a></li>
                                        <%
                                        } // tham số catego được truyền sang product.jsp
%>

                                </ul>
                            </li> 						
                            <li><a href="" >  Máy tính bảng</a></li>            
                            <li><a href="" >Labtop</a></li>						  				 
                            <li><a href="" >Điện thoại</a></li>
                            <li><a href="" >Phần mềm</a></li>
                            <li><a href="" >Kỹ thuật số</a></li>
                            <li><a href="" >Liên hệ </a></li>

                        </ul>
                        <script type="text/javascript" src="js/nav.js"></script>
                    </div>
                </div>
            </div>


       
        </div>
    </body>
</html>
