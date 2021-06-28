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
        <link href="../assets/css/mobile-style.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="../assets/css/animate.css">
        <link rel="stylesheet" href="../assets/css/owl.carousel.css">
        <link rel="stylesheet" href="../assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="../assets/css/tooplate-style.css">
        <link rel="stylesheet" href="../assets/css/custom.css" />
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
        <section class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="container">

                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>

                    <!-- lOGO TEXT HERE -->
                    <a href="#" class="navbar-brand">Children Care</a>
                </div>

                <!-- MENU LINKS -->
                <div class="collapse navbar-collapse">
                    <c:if test="${ empty sessionScope.user}">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#top" class="smoothScroll">Home</a></li>
                            <li><a href="#" class="smoothScroll">Services</a></li>
                            <li><a href="#" class="smoothScroll">Blog</a></li>
                            <li><a style="font-size: 25px;color: #00aeef" href="#" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                            <li class="appointment-btn"><a class="login-trigger" href="#" data-target="#login" data-toggle="modal">Login</a></li>
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

                            <li class="appointment-btn"><a class="login-trigger" href="#" data-target="#register" data-toggle="modal">Sign up</a></li>
                            <div id="register" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <div class="modal-content">
                                        <div class="modal-body ">
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

                            <c:if test="${ not empty sessionScope.user}">
                                <p class="dropdown-name ">${sessionScope.user.fullName}</p>
                                <div class="dropdown ">
                                    <img class="avatar" src="${sessionScope.user.imageLink}">

                                    <div class="dropdown-content">
                                        <p> <a href="#">Profile</a></p>
                                        <p> <a href="#">Change Password</a></p>
                                        <p> <a href="#">Log Out</a></p>
                                    </div>
                                </div>
                            </c:if>
                        </ul>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <ul class="nav navbar-nav navbar-right">
                            <c:if test="${sessionScope.user.role.name == 'Manager'}">
                                <li class="dropdown"><a href="#" class="smoothScroll">Home</a></li>
                                <li class="dropdown"><a href="#" class="smoothScroll">My reservation</a></li>
                                <!--<li><a href="#" class="smoothScroll">Services</a></li>-->
                                
                                
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Manage</a>
                                    <div class="dropdown-menu">
                                        <p class="dropdown-link dropdown-item"> <a href="#">Customers</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="#">Reservations</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="#">Feedbacks</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="#">Blogs</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="#">Sliders</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="#">Services</a></p>

                                    </div>
                                </li>
                                <li><a style="font-size: 25px;color: #00aeef" href="#" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                            </c:if>
                            <c:if test="${sessionScope.user.role.name == 'Staff'}">
                                <li><a href="#top" class="smoothScroll">Home</a></li>
                                <li><a href="#" class="smoothScroll">Services</a></li>
                                <li><a href="#" class="smoothScroll">Blog</a></li>
                               <li class="dropdown">
                                    <a href="#" class="smoothScroll dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" >Reservations</a>
                                    <div class="dropdown-menu">
                                        <p class="dropdown-link dropdown-item"> <a href="#">My reservation</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="#">reservations List</a></p>

                                    </div>
                                </li>
                                <li><a style="font-size: 25px;color: #00aeef" href="#" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>

                            </c:if>
                            <c:if test="${sessionScope.user.role.name == 'Customer'}">
                                <li><a href="#" class="smoothScroll">Home</a></li>
                                <li><a href="#" class="smoothScroll">Services</a></li>
                                <li><a href="#" class="smoothScroll">Blog</a></li>
                                <li><a style="font-size: 25px;color: #4267b2" href="#" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                            </c:if>
                            <p class="dropdown-name ">${sessionScope.user.fullName}</p>
                            <div class="dropdown ">
                                <img class="avatar" src="../${sessionScope.user.imageLink}">

                                <div class="dropdown-content">
                                    <p> <a href="#">Profile</a></p>
                                    <p> <a href="#">Change Password</a></p>
                                    <p> <a href="#">Log Out</a></p>
                                </div>
                            </div>

                        </ul>
                    </c:if>
                </div>

            </div>
        </section>


        <!-- HOME -->
        <section id="home" class="slider" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row">
                    <div class="col-2" style="padding-top: 0%; float: left; margin-left: 20%; margin-top: 5%">
                        <div class="d-flex justify-content-start">
                            <div class="image-container">
                                <img src="../${sessionScope.user.imageLink}" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
<!--                                <div class="middle">
                                    <input type="button" class="btn btn-secondary" id="btnChangePicture" value="Change" />
                                    <input type="file" style="display: none;" id="profilePicture" name="file" />
                                </div>-->
                            </div>
                        </div>
                    </div>
                    <form action="update" method="POST" enctype="multipart/form-data">
                    <div class="tab-content ml-1" id="myTabContent" style="margin-left: 32%; margin-top: 5% ">
                        <b>Change Profile Picture</b>
                        <input type="file" name="imageLink" accept="image/*,.jpg" style="margin-top: "/><br>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 col-5">
                                <label style="font-weight:bold;">Full Name</label>
                            </div>
                            <div class="col-md-8 col-6">
                                <input style="max-width: 50%; margin-top:-1%" type="text" class="form-control" name="fullName" value="${requestScope.user.fullName}">
                            </div>
                        </div>
                        <hr />
                        <div class="row" style="margin-top: -5%">
                            <div class="col-sm-3 col-md-2 col-5">
                                <label style="font-weight:bold;">Gender</label>
                            </div>
                            <div class="col-md-8 col-6">
                                <select class="form-control" name="gender" style="max-width: 50%; margin-top:-1%">
                                        <option <c:if test="${sessionScope.user.gender eq true}">selected</c:if> value="true">Male</option>
                                        <option <c:if test="${sessionScope.user.gender eq false}">selected</c:if> value="false">Female</option>
                                </select>
                                </div>
                            </div>
                            <hr />

                            <div class="row" style="margin-top: -1%">
                                <div class="col-sm-3 col-md-2 col-5">
                                    <label style="font-weight:bold;">Email</label>
                                </div>
                                <div class="col-md-8 col-6">
                                <input style="max-width: 50%; margin-top:-1%" type="text" class="form-control" name="email" value="${requestScope.user.email}" readonly>
                            
                            </div>
                        </div>
                        <hr />


                        <div class="row" style="margin-top: -1%">
                            <div class="col-sm-3 col-md-2 col-5">
                                <label style="font-weight:bold;">Mobile</label>
                            </div>
                            <div class="col-md-8 col-6">
                                <input style="max-width: 50%; margin-top:-1%" type="text" class="form-control" name="mobile" value="${requestScope.user.mobile}">
                            
                            </div>
                        </div>
                        <hr />
                        <div class="row" style="margin-top: -1%">
                            <div class="col-sm-3 col-md-2 col-5">
                                <label style="font-weight:bold;">Address</label>
                            </div>
                            <div class="col-md-8 col-6">
                                <input style="max-width: 50%; margin-top:-1%" type="text" class="form-control" name="address" value="${requestScope.user.address}">
                            
                            </div>
                        </div><br>
                            <button type="submit" style="margin-right: 15%" class="btn btn-primary">Submit</button>
                    </div>
                    </form>
                        </table>
                            </div>
                    
                    </div>
                </div>
            </div>
        </section>
        <br>


        


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
                        <div class="footer-thumb"> 
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
                        </div>
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

                    <div class="col-md-12 col-sm-12 border-top">
                        <div class="col-md-4 col-sm-6">
                            <div class="copyright-text"> 
                                <p>Copyright &copy; 2018 Your Company 

                                    | Design: Tooplate</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <div class="footer-link"> 
                                <a href="#">Laboratory Tests</a>
                                <a href="#">Departments</a>
                                <a href="#">Insurance Policy</a>
                                <a href="#">Careers</a>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 text-align-center">
                            <div class="angle-up-btn"> 
                                <a href="#top" class="smoothScroll wow fadeInUp" data-wow-delay="1.2s"><i class="fa fa-angle-up"></i></a>
                            </div>
                        </div>   
                    </div>

                </div>
            </div>
        </footer>

        <!-- SCRIPTS -->
        <script src="../assets/js/jquery.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/jquery.sticky.js"></script>
        <script src="../assets/js/jquery.stellar.min.js"></script>
        <script src="../assets/js/wow.min.js"></script>
        <script src="../assets/js/smoothscroll.js"></script>
        <script src="../assets/js/owl.carousel.min.js"></script>
        <script src="../assets/js/custom-new.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            $('ul.nav li.dropdown').hover(function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
            }, function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
            });
        </script>
        <script>
            var loadFile = function (event) {
                var output = document.getElementById('output');
                output.src = URL.createObjectURL(event.target.files[0]);
                output.onload = function () {
                    URL.revokeObjectURL(output.src) // free memory
                }
            };
        </script>
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