

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
<link href="../assets/css/slider.css" rel="stylesheet" type="text/css"/>
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
                                            <li><a class="nav-link" href="../home" >Home</a></li>
                                            <li><a class="nav-link" href="#">About</a></li>
                                            <li><a class="nav-link" href=""style="color: white;">Services</a></li>
                                            <li><a class="nav-link" href="">Blog</a></li>
                                            <li><a class="nav-link" href="">Users</a></li>
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
            <div class="container" style="margin-right: 20px">
                <div class="row">
                    <div class="col-md-12">
                        <c:if test="${ empty sessionScope.user}">

                            <a class="login-trigger" href="#" data-target="#login" data-toggle="modal">Login</a>

                            <div id="login" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <button data-dismiss="modal" class="close">&times;</button>
                                            <h4>Login</h4>
                                            <form action="login" method="POST">
                                                <input type="text" name="email" class="username form-control" placeholder="Email"/>
                                                <input type="password" name="pass" class="password form-control" placeholder="password"/>
                                                <input class="login-trigger" type="submit" value="Login" />
                                                <a class="login-trigger" href="#" data-target="#" data-toggle="modal">ForgetPassword</a>
                                            </form>
                                        </div>
                                    </div>
                                </div>  
                            </div>
                            <a class="login-trigger" href="#" data-target="#register" data-toggle="modal">Register</a>

                            <div id="register" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <button data-dismiss="modal" class="close">&times;</button>
                                            <h4>Register</h4>
                                            <form action="register" method="GET">
                                                <input type="text" name="fullname" class="username form-control" placeholder="Full Name"/>
                                                Male <input type="radio" name="gender" value="male" style="margin-right: 20px;">
                                                Female <input type="radio" name="gender" value="female">
                                                <input type="text" name="email" class="username form-control" placeholder="Email"/>
                                                <input type="text" name="phone" class="username form-control" placeholder="Phone"/>                                                    
                                                <input type="text" name="address" class="username form-control" placeholder="Address"/>
                                                <input type="password" name="pass" class="password form-control" placeholder="password"/>
                                                <input class="login-trigger" type="submit" value="Register" />
                                            </form>
                                        </div>
                                    </div>
                                </div>  
                            </div>

                        </c:if>
                        <c:if test="${ not empty sessionScope.user}">
                            <h2 class="dropdown-name ">${sessionScope.user.fullName}</h2>
                            <div class="dropdown ">
                                <img class="avatar" src="${sessionScope.user.imageLink}">

                                <div class="dropdown-content">
                                    <p> <a href="#">Profile</a></p>
                                    <p> <a href="#">Change Password</a></p>
                                    <p> <a href="#">Log Out</a></p>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Banner -->
        <!-- section -->

        <div class="section layout_padding" style="width: 15%; padding-left: 3%;" >
            
            <div style="padding-bottom: 50%; padding-top: 50%;">
                <form action="list">
                    
                
                    <input type="search" placeholder="Search" name="search" style="width: 100%;">
                
                </form>
            </div> 
            <c:forEach items="${requestScope.categories}" var="c">
                <div class="sider" ><h3><a href="?category=${c.id}">${c.name}</a></h3></div>
            </c:forEach>
                <div class="staticlink" ><h3><a href="#">Static links</a></h3></div>
        </div>
        <div class="section layout_padding" style="width: 85%;" >
            <div class="container" >
                <div class="row">
                    <div class="col-md-12">
                        <div class="full">
                            <div class="heading_main text_align_center">
                                <h2><span class="theme_color"></span>Services List</h2>    
                            </div>
                        </div>
                    </div>
                </div>
                <div>Results: ${requestScope.services.size()}</div>
                <div class="row">
                    <c:forEach items="${requestScope.services}" var="s">
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="full news_blog" style="border: #013582;">
                                <img class="img-responsive" src="../${s.thumbnailLink}" alt="#" />



                                <div style="background: #7f93db; height: 100%;">
                                    <h2><a href="details?id=${s.id}">${s.id}. ${s.fullname}</a></h2>
                                    <p><c:if test="${s.description.length() >= 41}">
                                        ${s.description.substring(0, 40)}...
                                    </c:if>
                                        <c:if test="${s.description.length() < 41}">
                                        ${s.description}
                                    </c:if>
                                        </p>
                                    <p>
                                        <span style="text-decoration: line-through;">${s.originalPrice}</span>
                                        <span style="text-decoration: white;">  -  ${s.salePrice}vnd</span>
                                    </p>
                                </div>
                                <div>
                                    <button><a href="../cart/add?serviceid=${s.id}">Add to Cart</a></button>
                                    
                                    <button><a href="#">Feedback</a></button>
                                </div>

                            </div>

                        </div>
                    </c:forEach>



                </div>
                <div id="pagination" class="pagination"></div>
                <script>
                    generatePagger("pagination",${requestScope.pageindex},${requestScope.totalpage}, 2, "${requestScope.paggerUrl}");

                </script>


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
            <c:if test="${empty sessionScope.mess}">
            <c:if test="${ not empty sessionScope.alert}">
                <script>
                    $(document).ready(function () {
                        let note = "${sessionScope.alert}"
                        alert(note);
                    
                    });
                </script>
                <c:remove var="alert" scope="session" />

            </c:if>
            </c:if>
                <c:if test="${ not empty sessionScope.mess}">
                     <script>
                    $(document).ready(function () {
                        let mess = "${sessionScope.mess}"
                        alert(mess);
                    
                    });
                </script>
                <c:remove var="mess" scope="session" />
                </c:if>
            <script>
                    function generatePagger(id, pageindex, totalpage, gap, page)
                    {
                        var container = document.getElementById(id);
                        if (pageindex > gap + 1)
                            container.innerHTML += "<a href='" + page + "?page=1'>First</a>";

                        for (var i = pageindex - gap; i < pageindex; i++)
                        {
                            if (i >= 1)
                            {
                                container.innerHTML += "<a href='" + page + "?page=" + i + "'>" + i + "</a>";
                            }
                        }

                        container.innerHTML += "<a class='active'>" + pageindex + "</a>";

                        for (var i = pageindex + 1; i <= pageindex + gap; i++)
                        {
                            if (i <= totalpage)
                            {
                                container.innerHTML += "<a href='" + page + "?page=" + i + "'>" + i + "</a>";
                            }
                        }

                        if (pageindex < totalpage - gap)
                            container.innerHTML += "<a href='" + page + "?page=" + totalpage + "'>Last</a>"
                    }
                    generatePagger("pagination",${requestScope.pageindex},${requestScope.totalpage}, 2, "${requestScope.paggerUrl}");

            </script>
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
