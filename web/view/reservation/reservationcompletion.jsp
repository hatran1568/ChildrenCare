<%-- 
    Document   : ReservationCompletion
    Created on : June 1, 2021, 4:13:03 AM
    Author     : PieRow
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Completion</title>
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
                                            <li><a class="nav-link" href="#">Home</a></li>
                                            <li><a class="nav-link" href="#">About</a></li>
                                            <li><a class="nav-link" href="#">Services</a></li>
                                            <li><a class="nav-link" href="">Blog</a></li>
                                            <li><a class="nav-link" href="../user/list">Users</a></li>
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
                            <h3>ChildrenCare</h3>
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
                                <h2><span class="theme_color"></span>Reservation Submitted</h2>    
                            </div>
                        </div>
                    </div>
                </div>
                
                <div>
                    <div>
                        <div class="full news_blog" style="border-radius: 20px; padding: 2%">
                            <div>
                                <h3>Reservation Details</h3>
                                <div>Reservation ID: ${requestScope.reservation.getId()}</div>
                                <div>Reserved Date: ${requestScope.reservation.getReservation_date()}</span>
                                <span>Checkup Time: ${requestScope.reservation.getCheckup_time()}</span>
                                <div>Number of Patients: ${requestScope.reservation.getNumber_of_person()}</div>
                                <div>Assigned Staff: ${requestScope.reservation.getStaff().getFullName()}</div>
                                <div>Staff Contact Email: ${requestScope.reservation.getStaff().getEmail()}</div>
                                <div>Staff Contact Number: ${requestScope.reservation.getStaff().getMobile()}</div>
                                <img src="${requestScope.reservation.getStaff().getImageLink()}" alt="Profile Image">
                                <h3>Reserved Services</h3>
                                <c:forEach items="${requestScope.reservation_services}" var="rs">
                                    <span style="margin-left: 30%; float: left">Service: ${rs.getFullname()}</span>
                                    <span style="margin-right: 30%; float: right">Price: ${rs.getSalePrice()}</span>
                                    <br>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
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
    </body>
</html>
