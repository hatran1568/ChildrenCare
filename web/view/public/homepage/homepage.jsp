<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Children Care</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="Tooplate">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <link href="<%=request.getContextPath()%>/assets/css/toolplate-iso.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap-iso.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/animate.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/owl.carousel.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/tooplate-style.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/custom.css" />
    </head>
    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->



        <!-- HEADER -->
        <header>
            <div class="container">
                <div class="row">

                    <div class="col-md-4 col-sm-5">
                        <p>Welcome to a Professional Health Care</p>
                    </div>

                    <div class="col-md-8 col-sm-7 text-align-right">
                        <span class="phone-icon"><i style="color:#4267b2" class="fa fa-phone"></i> 010-060-0160</span>
                        <span class="date-icon"><i style="color:#4267b2" class="fa fa-calendar"></i> 6:00 AM - 10:00 PM (Mon-Fri)</span>
                        <span class="email-icon"><i style="color:#4267b2" class="fa fa-envelope-o"></i> <a href="#">info@company.com</a></span>
                    </div>

                </div>
            </div>
        </header>


        <!-- MENU -->
        <div  class="toolplate-iso bootstrap-iso">
            <section class="navbar navbar-default navbar-static-top" role="navigation">
                <div class="container">

                    <div class="navbar-header">
                        <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon icon-bar"></span>
                            <span class="icon icon-bar"></span>
                            <span class="icon icon-bar"></span>
                        </button>

                        <!-- lOGO TEXT HERE -->
                        <a href="home" class="navbar-brand">Children Care</a>
                    </div>

                    <!-- MENU LINKS -->
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="home" class="smoothScroll dropdown">Home</a></li>
                            <li><a href="service/list" class="smoothScroll dropdown">Services</a></li>
                            <li><a href="blog/list" class="smoothScroll dropdown">Blog</a></li>
                                <c:if test="${ empty sessionScope.user}">
                                <li><a style="font-size: 25px;color: #00aeef" href="cart/list" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                                <li class="appointment-btn"><a class="login-trigger" href="login">Login</a></li>
                                <li class="appointment-btn"><a class="login-trigger" href="register">Sign up</a></li>

                            </c:if>
                            <c:if test="${not empty sessionScope.user}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Personal <i style="margin-left: 3px" class="fa fa-caret-down" aria-hidden="true"></i></a>
                                    <div class="dropdown-menu">
                                        <p class="dropdown-link dropdown-item"> <a href="customer/reservation/my" class="smoothScroll">My Reservation</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="customer/myprescription/exams" class="smoothScroll">My Prescriptions</a></p>
                                    </div>
                                </li>
                                <c:if test="${sessionScope.user.role.name == 'Manager' || sessionScope.user.role.name == 'Admin'}">

                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Manage <i style="margin-left: 3px" class="fa fa-caret-down" aria-hidden="true"></i></a>
                                        <div class="dropdown-menu">
                                            <p class="dropdown-link dropdown-item"> <a href="manager/customer/list">Customers</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/reservation/list">Reservations</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/feedback/list">Feedbacks</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/post/list">Posts</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/slider/list">Sliders</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/service/list">Services</a></p>
                                        </div>
                                    </li>
                                    <c:if test="${sessionScope.user.role.name == 'Admin'}">
                                        <li class="dropdown"><a href="admin/dashboard/view" class="smoothScroll">Dashboard</a></li>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role.name == 'Staff'}">

                                    <li class="dropdown">
                                    <li><a href="staff/reservation/list" class="smoothScroll dropdown">Reservations list</a></li>
                                    </li>
                                </c:if>
                                <li><a style="font-size: 25px;color: #00aeef" href="cart/list" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                                <div class="dropdown ">
                                    <img class="avatar" src="<%=request.getContextPath()%>/${sessionScope.user.imageLink}">

                                    <div class="dropdown-content">
                                        <p style="text-align: left"> <a href="customer/userprofile"><i style="margin-right: 5px" class="fas fa-info-circle"></i>Profile</a></p>
                                        <p style="text-align: left; margin-bottom: 0"> <a href="logout"><i style="margin-right: 5px" class="fas fa-sign-out-alt"></i>Log Out</a></p>
                                    </div>
                                </div>
                                <p class="dropdown-name" style="margin:auto; color: black">${sessionScope.user.fullName}</p>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </section>
        </div>


        <!-- HOME -->
        <section id="home" class="slider" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row">
                    <div class="owl-carousel owl-theme" id="my_slider">
                        <c:forEach items="${requestScope.sliders}" var="s">
                            <div class="item carousel-item" style="background-image: url(<%=request.getContextPath()%>/${s.imageLink})">
                                <div class="caption">
                                    <div class="col-md-offset-1 col-md-10">

                                        <h1>${s.title}</h1>
                                        <h3>${s.notes}</h3>
                                        <a href="${s.backlink}" class="section-btn btn btn-default smoothScroll">Read more</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </section>



        <!-- TEAM -->
        <section id="team" data-stellar-background-ratio="1">
            <div class="container">
                <div class="col-md-12 col-sm-12" style="text-align: center">
                    <!--SECTION TITLE--> 
                    <div>
                        <h2>Our services</h2>
                    </div>
                </div>
                <div class="row" style="display: flex">

                    <c:forEach items="${requestScope.services}" var="s">
                        <div class="col-md-4 col-sm-6" style="padding: 15px; flex: 1">
                            <div>
                                <img src="<%=request.getContextPath()%>/${s.thumbnailLink}" class="img-responsive" alt="">

                                <div class="team-info">
                                    <h3><a href="service/details?id=${s.id}">${s.fullname}</a></h3>
                                    <p>${s.description}</p>
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                    <div class="clearfix"></div>

                </div>
                <div style="display: flex;align-items: center;justify-content: center;"><button type="button" class="btn" id="more-service" onclick="window.location.href = 'service/list'">More services</button></div>
            </div>

        </section><!--

        
        <!-- NEWS -->
        <!--        <section id="news" data-stellar-background-ratio="2.5">
                    <div class="container">
                        <div class="col-md-12 col-sm-12">
                             SECTION TITLE 
                            <div class="section-title wow fadeInUp" data-wow-delay="0.1s">
                                <h2>Latest posts</h2>
                            </div>
                        </div>
                        <div class="row">
        
        <c:forEach items="${requestScope.posts}" var="p">
            <div class="col-md-4 col-sm-6">
                 NEWS THUMB 
                <div class="news-thumb wow fadeInUp" data-wow-delay="0.4s">
                    <a href="">
                        <img src="${p.thumbnailLink}" class="img-responsive" alt="">
                    </a>
                    <div class="news-info">
                        <span>${s.updatedDate}</span>

                        <h3><a href="post/details?id=${p.id}">${p.title}</a></h3>
                        <p>${p.description}</p>
                        <div class="author">
                            <div class="author-info">
                                <h5>${p.author.fullName}</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>   
    </div>
</div>
</section>-->

        <section id="news" data-stellar-background-ratio="2.5">
            <div class="container">
                <div class="col-md-12 col-sm-12">
                    <div>
                        <h2 style="text-align: center">Featured posts</h2>
                    </div>
                </div>
                <c:if test="${requestScope.posts.size()>=5}">
                <div class="row">
                    <div class="col-md-6">
                        <div style="padding:15px">
                            <img src="<%=request.getContextPath()%>/${requestScope.posts[0].thumbnailLink}" height="260" class="img-responsive" alt="">
                            <div class="featured-post-info">
                                <p class="featured-post-category">${requestScope.posts[0].category.name}</p>
                            </div>
                            <h3 style="margin-top:0">
                                <a href="blog/details?pid=${requestScope.posts[0].id}">${requestScope.posts[0].title}</a>
                            </h3> 
                            <div class="post-author-date">
                                <span >${requestScope.posts[0].author.fullName}</span>
                                <span> - </span>
                                <span><fmt:formatDate pattern="dd MMM yyyy" value="${requestScope.posts[0].updatedDate}"/></span>
                            </div>
                            <div class="post-description">
                                <p>${requestScope.posts[0].description}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 post-column">
                        <c:forEach var="i" begin="1" end="4">
                            <div class="featured-post-info" style="display: flex;flex-direction: row;">
                                <div class="thumb"><img src="<%=request.getContextPath()%>/${requestScope.posts[i].thumbnailLink}" width="140" height="110"></div>
                                <div style="padding-left: 15px">
                                    <p class="featured-post-category" style="font-size: 10px">${requestScope.posts[i].category.name}</p>
                                    <h3 style="margin-top:0; font-size: 18px">
                                        <a href="blog/details?pid=${requestScope.posts[i].id}">${requestScope.posts[i].title}</a>
                                    </h3>
                                    <div class="post-author-date">
                                <span >${requestScope.posts[i].author.fullName}</span>
                                <span> - </span>
                                <span><fmt:formatDate pattern="dd MMM yyyy" value="${requestScope.posts[i].updatedDate}"/></span>
                            </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="more-post"><a href="blog/list"><span class="arrow"></span>More posts <i style="size: 2px;margin-left: 5px" class="fas fa-arrow-right"></i></a></div>
                    </div>
                </div>
                            </c:if>
            </div>
        </section>
        <!-- FOOTER -->
        <footer data-stellar-background-ratio="5">
            <div class="container">
                <div class="row">

                    <div class="col-md-4 col-sm-4">
                        <div class="footer-thumb"> 
                            <h4 class="wow fadeInUp" data-wow-delay="0.4s">Contact Info</h4>
                            <p>Fusce at libero iaculis, venenatis augue quis, pharetra lorem. Curabitur ut dolor eu elit consequat ultricies.</p>

                            <div class="contact-info">
                                <p><i class="fa fa-phone"></i> 010-070-0170</p>
                                <p><i class="fa fa-envelope-o"></i> <a href="#">info@company.com</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-4"> 
                        <!--                        <div class="footer-thumb"> 
                                                    <h4 class="wow fadeInUp" data-wow-delay="0.4s">Latest News</h4>
                                                    <div class="latest-stories">
                                                        <div class="stories-image">
                                                            <a href="#"><img src="images/news-image.jpg" class="img-responsive" alt=""></a>
                                                        </div>
                                                        <div class="stories-info">
                                                            <a href="#"><h5>Amazing Technology</h5></a>
                                                            <span>March 08, 2018</span>
                                                        </div>
                                                    </div>
                        
                                                    <div class="latest-stories">
                                                        <div class="stories-image">
                                                            <a href="#"><img src="images/news-image.jpg" class="img-responsive" alt=""></a>
                                                        </div>
                                                        <div class="stories-info">
                                                            <a href="#"><h5>New Healing Process</h5></a>
                                                            <span>February 20, 2018</span>
                                                        </div>
                                                    </div>
                                                </div>-->
                    </div>

                    <div class="col-md-4 col-sm-4"> 
                        <div class="footer-thumb">
                            <div class="opening-hours">
                                <h4 class="wow fadeInUp" data-wow-delay="0.4s">Opening Hours</h4>
                                <p>Monday - Friday <span>06:00 AM - 10:00 PM</span></p>
                                <p>Saturday <span>09:00 AM - 08:00 PM</span></p>
                                <p>Sunday <span>Closed</span></p>
                            </div> 

                            <ul class="social-icon">
                                <li><a href="#" class="fa fa-facebook-square" attr="facebook icon"></a></li>
                                <li><a href="#" class="fa fa-twitter"></a></li>
                                <li><a href="#" class="fa fa-instagram"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-2 text-align-center">
                        <div class="angle-up-btn"> 
                            <a href="#top" class="smoothScroll wow fadeInUp" data-wow-delay="1.2s"><i class="fa fa-angle-up"></i></a>
                        </div>
                    </div>


                </div>
            </div>
        </footer>

        <!-- SCRIPTS -->
        <script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/jquery.sticky.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/jquery.stellar.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/wow.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/smoothscroll.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/owl.carousel.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/custom-new.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
                    $('ul.nav li.dropdown').hover(function () {
                        $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
                    }, function () {
                        $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
                    });
        </script>
        <style>
            #more-service{
                background: #00aeef;
                border-radius: 3px;
                color: #ffffff;
                font-weight: 600;
                padding-top: 12px;
                padding-bottom: 12px;
                transition: all ease-in-out 0.4s;
            }
            #more-service:hover{
                background: #337ab7;
            }
            .team-info h3 a:hover{
                color:  #337ab7;
            }
            .team-info p{
                
                height: 75px;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .featured-post-info{
                padding: 15px 0 0 0;
            }
            .featured-post-category{
                padding: 0px;
                text-align: center;
                display: inline-block;
                /*                font-family: Rubik !important;*/
                font-size: 13px;
                line-height: 1 !important;
                font-weight: 400 !important;
                text-transform: uppercase !important;
                color: #3a3737;
            }
            .post-author-date{
                /*font-family: Rubik !important;*/
                font-size: 14px !important;
                line-height: 1 !important;
                font-weight: 400 !important;
                text-transform: capitalize !important;
                margin-top: 0.75em;
            }
            .post-description p{
                margin: 12px 0 0 0;
                display: block;
                font-size: 14px !important;
                line-height: 1.4 !important;
                text-align: justify;
            }
            .post-column{
                display: flex;
                flex-direction: column;
            }
            .more-post{
                margin-top: 20px;
                text-transform: uppercase;
                
            }
        </style>
    </body>
</html>