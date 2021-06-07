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
        <title>HomePage</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="assets/css/footer.css" rel="stylesheet" type="text/css"/>
        <!-- Site Icons -->
        <link rel="shortcut icon" href="#" type="image/x-icon" />
        <link rel="apple-touch-icon" href="#" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <!-- Pogo Slider CSS -->
        <link rel="stylesheet" href="assets/css/pogo-slider.min.css" />
        <!-- owl carousel css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!-- Site CSS -->
        <link rel="stylesheet" href="assets/css/style.css" />
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="assets/css/responsive.css" />
        <!-- Custom CSS -->
        <link rel="stylesheet" href="assets/css/custom.css" />
        <link href="assets/css/slider.css" rel="stylesheet" type="text/css"/>
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
                                            <li><a class="nav-link" href="user/list">Users</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <div class="search-box">
                                <input type="text" class="search-txt" placeholder="Search">
                                <a class="search-btn">
                                    <img src="assets/images/search_icon.png" alt="#" />
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
                                            <form action="login" method="GET">
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
        <div class="container" style="height: 700px;">
            <div class="banner_section">
            <div class="container-fluid padding_0">
               <div id="my_slider" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                     <div class="carousel-item active">
                        <div class="row">
                           <div class="col-md-6">
                              <div class="padding_left_0">
                                  <h1 class="retailer_text">${requestScope.sliders[0].title}</h1>
                                  <p class="search_text">${requestScope.sliders[0].notes}</p>
                                 <div class="btn_main">
                                    <div class="more_bt"><a href="${requestScope.sliders[0].backlink}">Read More </a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-md-6">
                               <div><img src="${requestScope.sliders[0].imageLink}" class="image_1"/></div>
                           </div>
                        </div>
                     </div>
                     <c:forEach var="i" begin="1" end="${requestScope.sliders.size()-1}">
                     <div class="carousel-item">
                        <div class="row">
                           <div class="col-md-6">
                              <div class="padding_left_0">
                                 <h1 class="retailer_text">${requestScope.sliders[i].title}</h1>
                                 <p class="search_text">${requestScope.sliders[i].notes}</p>
                                 <div class="btn_main">
                                     <div class="more_bt"><a href="${requestScope.sliders[i].backlink}">Read More </a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-md-6">
                               <div><img src="${requestScope.sliders[i].imageLink}" class="image_1"/></div>
                           </div>
                        </div>
                     </div>
                     </c:forEach>
                  </div>
                  <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
                  <i class="fa fa-left fa-arrow-left"></i>
                  </a>
                  <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
                  <i class="fa fa-right fa-arrow-right"></i>
                  </a>
               </div>
            </div>
         </div>
        </div>
        
        <!--Service list-->
        <div class="categories-area section-padding30">
            <div class="container">
                <div class="row justify-content-sm-center">
                    <div class="cl-xl-7 col-lg-8 col-md-10">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center">
                            <h1>Our services</h1>
                        </div> 
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${requestScope.services}" var="s">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-cat mb-50">
                            <img src="${s.thumbnailLink}" alt="Image" class="img-fluid">
                            <div class="cat-cap">
                                <h5 class="service-title"><a  href="#">${s.fullname}</a></h5>
                                <p>${s.description}</p>
                                <a  href="#" class="read-more1">Read More ></a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    
                    
                </div>
                <!-- Section Button -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="browse-btn2 text-center mt-50">
                            <a href="#" class="btn">Find More Services</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Post list-->
            <div class="site-section">
      <div class="container">
          <div class="row justify-content-sm-center">
                    <div class="cl-xl-7 col-lg-8 col-md-10">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center">
                            <h1>Latest posts</h1>
                        </div> 
                    </div>
                </div>
        <div class="row">
          <div class="col-lg-12">
<!--            <div class="row">
              <div class="col-12">
                <div class="section-title">
                  <h2>Latest posts</h2>
                </div>
              </div>
            </div>-->
            <div class="row">
              <div class="col-md-6">
                <div class="post-entry-1">
                  <a href="post-single.html"><img src="${requestScope.posts[0].thumbnailLink}" alt="Image" class="img-fluid"></a>
                  <h2><a href="blog-single.html">${requestScope.posts[0].title}</a></h2>
                  <p>${requestScope.posts[0].description}</p>
                  <div class="post-meta">
                    <span class="d-block"><a href="#">${requestScope.posts[0].author.fullName}</a> in <a href="#">${requestScope.posts[0].category.name}</a></span>
                    
                  </div>
                </div>
              </div>
              
              <div class="col-md-6">
                  <c:forEach var="i" begin="1" end="${requestScope.posts.size()-1}">
                <div class="post-entry-2 d-flex bg-light">
                  <div class="thumbnail" style="background-image: url('${requestScope.posts[i].thumbnailLink}')"></div>
                  <div class="contents">
                      <h2><a href="#">${requestScope.posts[i].title}</a></h2>
                    <div class="post-meta">
                      <span class="d-block"><a href="#">${requestScope.posts[i].author.fullName}</a> in <a href="#">${requestScope.posts[i].category.name}</a></span>
                      <span class="date-read">${requestScope.posts[i].description}</span>
                    </div>
                  </div>
                </div>
                </c:forEach>
                  <p>
              <a href="#" class="more">See More Posts <span class="icon-keyboard_arrow_right"></span></a>
            </p>
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
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/js/popper.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <!-- ALL PLUGINS -->
            <script src="assets/js/jquery.magnific-popup.min.js"></script>
            <script src="assets/js/jquery.pogo-slider.min.js"></script>
            <script src="assets/js/slider-index.js"></script>
            <script src="assets/js/smoothscroll.js"></script>
            <script src="assets/js/form-validator.min.js"></script>
            <script src="assets/js/contact-form-script.js"></script>
            <script src="assets/js/isotope.min.js"></script>
            <script src="assets/js/images-loded.min.js"></script>
            <script src="assets/js/custom.js"></script>
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
                
    </body>
</html>

</body>
</html>

</body>
</html>
