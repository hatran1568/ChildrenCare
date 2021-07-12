<%-- 
    Document   : AccountList
    Created on : May 23, 2021, 8:23:45 PM
    Author     : HP
--%>
<%--  
    View ref: 143
    Edit ref: 144
    Thumbnail: 141
    Link to users list: 92
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

        <!-- Site Icons -->
        <link rel="shortcut icon" href="#" type="image/x-icon" />
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
            <div class="header_top">

                <div class="container">
                    <div class="row">
                        <div class="logo_section">
                            <a class="navbar-brand" href="index.html"><img src="../assets/images/logo.png" alt="image"></a>
                        </div>
                        <div class="site_information">
                            <ul>
                                <li><a href="mailto:exchang@gmail.com"><img src="../assets/images/mail_icon.png" alt="#" />exchang@gmail.com</a></li>
                                <li><a href="tel:exchang@gmail.com"><img src="../assets/images/phone_icon.png" alt="#" />+7123569847</a></li>
                                <li><a class="join_bt" href="#">Join us</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <div class="header_bottom">
                <div class="container">
                    <div class="col-sm-12">
                        <div class="menu_orange_section" style="background: #ff880e;">
                            <nav class="navbar header-nav navbar-expand-lg"> 
                                <div class="menu_section">
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </button>
                                    <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                                        <ul class="navbar-nav">
                                            <li><a class="nav-link" href="#">Home</a></li>
                                            <li><a class="nav-link" href="#">About</a></li>
                                            <li><a class="nav-link" href="#">Services</a></li>
                                            <li><a class="nav-link" href="">Blog</a></li>
                                            <li><a class="nav-link" href="#">Users</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <div class="search-box">
                                <input type="text" class="search-txt" placeholder="Search">
                                <a class="search-btn">
                                    <img src="../assets/images/search_icon.png" alt="#" />
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
                            <h3>News</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Banner -->
        <!-- section -->

        <div class="section layout_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="full">
                            <div class="heading_main text_align_center">
                                <h2><span class="theme_color"></span><a href="add">+Add Post</a></h2>    
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <c:forEach items="${requestScope.posts}" var="p">
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="full news_blog">
                                <img class="img-responsive" src="${p.thumbnail_link}" alt="#" />
                                <div class="overlay">
                                    <a class="main_bt transparent" href="details?postid=${p.id}">View</a>
                                    <%--<a class="main_bt transparent" href="#">Edit</a>--%>
                                    <a class="main_bt transparent" href="delete?id=${p.id}">Delete</a>
                                </div>

                                <div class="blog_details">
                                    <h3>${p.id}. ${p.title}</h3>
                                    <p>${p.description}</p>
                                    <p>sunt in culpa qui officia deserunt mollit anim id est laborum</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                
                
                </div>

            </div>
        </div>
        <!-- end section -->

        <!-- Start Footer -->
        <footer class="footer-box">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 white_fonts">
                        <div class="row">
                            <div class="col-sm-6 col-md-6 col-lg-3">
                                <div class="full">
                                    <img class="img-responsive" src="../assets/images/footer_logo.png" alt="#" />
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-3">
                                <div class="full">
                                    <h3>Quick Links</h3>
                                </div>
                                <div class="full">
                                    <ul class="menu_footer">
                                        <li><a href="home.html">> Home</a></li>
                                        <li><a href="about.html">> About</a></li>
                                        <li><a href="exchange.html">> Exchange</a></li>
                                        <li><a href="services.html">> Services</a></li>
                                        <li><a href="new.html">> New</a></li>
                                        <li><a href="contact.html">> Contact</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-3">
                                <div class="full">
                                    <div class="footer_blog full white_fonts">
                                        <h3>Newsletter</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do</p>
                                        <div class="newsletter_form">
                                            <form action="index.html">
                                                <input type="email" placeholder="Your Email" name="#" required="">
                                                <button>Submit</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-3">
                                <div class="full">
                                    <div class="footer_blog full white_fonts">
                                        <h3>Contact us</h3>
                                        <ul class="full">
                                            <li><img src="../assets/images/i5.png"><span>London 145<br>United Kingdom</span></li>
                                            <li><img src="../assets/images/i6.png"><span>demo@gmail.com</span></li>
                                            <li><img src="../assets/images/i7.png"><span>+12586954775</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer -->

        <div class="footer_bottom">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <p class="crp">© Copyrights 2019 design by html.design</p>
                    </div>
                </div>
            </div>
        </div>

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
    </body>
</html>
