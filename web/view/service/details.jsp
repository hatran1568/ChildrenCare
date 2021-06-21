<%-- 
    Document   : AccountList
    Created on : May 23, 2021, 8:23:45 PM
    Author     : HP
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Site Metas -->
        <title>Exchange Currency - Responsive HTML5 Template</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="../assets/css/footer.css" rel="stylesheet" type="text/css"/>
        <!-- Site Icons -->
        
        <link rel="apple-touch-icon" href="#" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
        <!-- Pogo Slider CSS -->
        <link rel="stylesheet" href="../assets/css/pogo-slider.min.css" />
        <!-- Site CSS -->
        <link rel="stylesheet" href="../assets/css/style.css" />
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="../assets/css/responsive.css" />
        <!-- Custom CSS -->
        <link rel="stylesheet" href="../assets/css/custom.css" />

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body id="inner_page" data-spy="scroll" data-target="#navbar-wd" data-offset="98">


        <!-- Start header -->
        <header class="top-header">

            <div class="header_bottom">
                <div class="container">
                    <div class="col-sm-12">
                        <div class="menu_orange_section" style="background: #013582;">
                            <nav class="navbar header-nav navbar-expand-lg"> 
                                <div class="menu_section">
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </button>
                                    <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                                        <ul class="navbar-nav">
                                            <li><a class="nav-link" href="../home">Home</a></li>
                                            <li><a class="nav-link" href="#">About</a></li>
                                            <li><a class="nav-link" href="list" style="color: white;">Services</a></li>
                                            <li><a class="nav-link" href="">Blog</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <div class="search-box">
                                <a href="../cart/list" class="search-btn">
                                    <img style="width: 70px;" src="../assets/images/cart.png" alt="#" />
                                </a>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>

        </header>
        <!-- End header -->

        <!-- Start Banner -->
        <div class="section inner_page_banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="banner_title">
                            <h3>ChildrenCare</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Banner -->
        <!-- section -->

        <div class="section layout_padding" style="width: 15%; padding-left: 3%;" >
            
            <div style="padding-bottom: 100px; padding-top: 100px;">
                <form action="list">
                    
                </a>
                    <input type="search" placeholder="Search" name="search">
                
                </form>
            </div> 
            <c:forEach items="${requestScope.categories}" var="c">
                <div class="sider"><h3><a href="list?category=${c.id}">${c.name}</a></h3></div>
            </c:forEach>
                <div class="staticlink"><h3><a href="#">Static links</a></h3></div>
        </div>
        <div class="section layout_padding" style="width: 85%;" >
            <div class="container" >
                <div class="row">
                    <div class="col-md-6">
                    <div class="full text_align_right_img">
                        <img src="../${requestScope.service.thumbnailLink}" alt="#" style="width: 100%;"/>
                    </div>
                </div>
                <div class="col-md-6 layout_padding">
                    <div class="full paddding_left_15">
                        <div class="heading_main text_align_left">
                            <h2><span class="theme_color">${requestScope.service.id}. </span>${requestScope.service.fullname}</h2>	
                        </div>
                    </div>
                        <div class="full paddding_left_15">
                        <p>Category: ${requestScope.service.category.name}</p>
                    </div>
                    <div class="full paddding_left_15">
                        <p>${requestScope.service.description}</p>
                    </div>
                    
                    <div class="full paddding_left_15">
                        <span font-size: 150%;>$  </span>
                        <span style="text-decoration: line-through; font-size: 150%; font-family: 'Roboto'">${requestScope.service.originalPrice}</span>
                        <span style="text-decoration: white; font-size: 150%;">  -  ${requestScope.service.salePrice}</span>
                    </div>
                        <%--<div class="full paddding_left_15">
                        <a class="main_bt" href="#">About more ></a>
                    </div>--%>
                </div>
                </div>


            </div>
                    <div class="container" style="font-family: 'Roboto'; font-size: 120%;">
                        </br>
                        ${requestScope.service.details}
                    </div>       
        </div>
        <!-- end section -->

        <!-- Start Footer -->
        <footer id="footer" class="site-footer">

            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-sm-6 col-xs-12">
                        <p class="copyright-text">Copyright &copy; 2021 All Rights Reserved by
                            <a href="#">Giangtt</a>.
                        </p>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <ul class="social-icons">
                            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End Footer -->



            <a href="#" id="scroll-to-top" class="hvr-radial-out"><i class="fa fa-angle-up"></i></a>

            <!-- ALL JS FILES -->
            <script src="../assets/js/jquery.min.js"></script>
            <script src="../assets/js/popper.min.js"></script>
            <script src="../assets/js/bootstrap.min.js"></script>
            <!-- ALL PLUGINS -->
            <script src="../assets/js/jquery.magnific-popup.min.js"></script>
            <script src="../assets/js/jquery.pogo-slider.min.js"></script>
            <script src="../assets/js/slider-index.js"></script>
            <script src="../assets/js/smoothscroll.js"></script>
            <script src="../assets/js/form-validator.min.js"></script>
            <script src="../assets/js/contact-form-script.js"></script>
            <script src="../assets/js/isotope.min.js"></script>
            <script src="../assets/js/images-loded.min.js"></script>
            <script src="../assets/js/custom.js"></script>
            
            <style>
                .staticlink{
                    padding-bottom: 5%;
                    padding-top: 40%;
                    text-decoration: underline; 
                    float: bottom;
                }
                .sider{
                    padding-bottom: 5%; 
                    padding-top: 20%; 
                    border-bottom: dashed #013582;
                }
                .pagination{
                    display: inline-block;
                }
                .pagination a {
                    color: black;
                    float: left;
                    padding: 8px 16px;
                    text-decoration: none;
                }

                .pagination a.active {
                    background-color: #4CAF50;
                    color: white;
                    border-radius: 5px;
                }

                .pagination a:hover:not(.active) {
                    background-color: #ddd;
                    border-radius: 5px;
                }
                .dropdown {
                    color: white;
                    margin-right: 150px;
                    position: relative;
                    display: inline-block;
                }

                .dropdown-content {

                    text-align: center;
                    display: none;
                    position: absolute;
                    background-color: #f9f9f9;
                    min-width: 160px;
                    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                    padding: 12px 16px;
                    z-index: 1;
                }

                .dropdown:hover .dropdown-content {
                    display: block;
                }
                .avatar{

                    width: 50px;
                    height: 50px;
                    border-radius: 50%;
                }

            </style>
    </body>
</html>
