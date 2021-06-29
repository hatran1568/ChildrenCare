<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>${requestScope.user.fullName}</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="Tooplate">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <script src="https://kit.fontawesome.com/561d0dd876.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="../../assets/css/animate.css">
        <link rel="stylesheet" href="../../assets/css/owl.carousel.css">
        <link rel="stylesheet" href="../../assets/css/owl.theme.default.min.css">
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="../../assets/css/tooplate-style.css">
        <link rel="stylesheet" href="../../assets/css/custom.css" />

    </head>
    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->



        <!-- HEADER -->



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
                    <a href="../../home" class="navbar-brand">Children Care</a>
                </div>

                <!-- MENU LINKS -->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="../../home" class="smoothScroll dropdown">Home</a></li>
                        <li><a href="../../service/list" class="smoothScroll dropdown">Services</a></li>
                        <li><a href="../../blog/list" class="smoothScroll dropdown">Blog</a></li>
                        <c:if test="${ empty sessionScope.user}">
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

                        </c:if>
                        <c:if test="${not empty sessionScope.user}">
                            <li class="dropdown"><a href="../../customer/reservation/my" class="smoothScroll">My reservation</a></li>
                                <c:if test="${sessionScope.user.role.name == 'Manager' || sessionScope.user.role.name == 'Admin'}">

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Manage</a>
                                    <div class="dropdown-menu">
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/customer/list">Customers</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/reservation/list">Reservations</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/feedback/list">Feedbacks</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/post/list">Posts</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/slider/list">Sliders</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/service/list">Services</a></p>
                                    </div>
                                </li>
                                <c:if test="${sessionScope.user.role.name == 'Admin'}">
                                    <li class="dropdown"><a href="../../admin/dashboard/view" class="smoothScroll">Dashboard</a></li>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.user.role.name == 'Staff'}">

                                <li class="dropdown">
                                    <li><a href="../../staff/reservation/list" class="smoothScroll dropdown">Reservations list</a></li>
                                </li>

                            </c:if>

                            <li><a style="font-size: 25px;color: #00aeef" href="#" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                            <div class="dropdown ">
                                <img class="avatar" src="${sessionScope.user.imageLink}">

                                <div class="dropdown-content">
                                    <p> <a href="../../userprofile">Profile</a></p>
                                    <p> <a href="#">Change Password</a></p>
                                    <p> <a href="#">Log Out</a></p>
                                </div>
                            </div>
                            <p class="dropdown-name ">${sessionScope.user.fullName}</p>
                        </c:if>
                    </ul>
                </div>

            </div>
        </section>


        <!-- End Banner -->
        <!-- section -->
        <div class="container">
            <!--<div><i class="fas fa-home"></i><i style="margin : 5px;" class="fas fa-angle-right"></i>Dashboard<i style="margin : 5px;"  class="fas fa-angle-right"></i>User List<i style="margin : 5px;"  class="fas fa-angle-right"></i>Edit</div>-->
            <form action="update" method="POST" >
                <input type="text" name="id" value="${requestScope.user.id}" hidden>
                <input type="text" name="status" value="${requestScope.user.status.id}" hidden>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email" value="${requestScope.user.email}" readonly>
                </div>
                <div class="form-group">
                    <label for="full-name">Full name</label>
                    <input type="text" class="form-control" name="full-name" value="${requestScope.user.fullName}">
                </div>
                <input type="text" class="form-control" name="image-link" value="${requestScope.user.imageLink}" hidden>
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select class="form-control" name="gender">
                        <option value="male" <c:if test="${requestScope.user.gender==true}">selected</c:if>>Male</option>
                        <option value="female" <c:if test="${requestScope.user.gender==false}">selected</c:if>>Female</option>
                    </select>

                    </div>
                    <div class="form-group">
                        <label for="mobile">Mobile</label>
                        <input type="text" class="form-control" name="mobile" value="${requestScope.user.mobile}">
                    </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" name="address" value="${requestScope.user.address}">
                </div>
                

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>


        <!-- Start Footer -->
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
        <script src="../../assets/js/jquery.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
        <script src="../../assets/js/jquery.sticky.js"></script>
        <script src="../../assets/js/jquery.stellar.min.js"></script>
        <script src="../../assets/js/wow.min.js"></script>
        <script src="../../assets/js/smoothscroll.js"></script>
        <script src="../../assets/js/owl.carousel.min.js"></script>
        <script src="../../assets/js/custom-new.js"></script>
        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
                                                    $('ul.nav li.dropdown').hover(function () {
                                                        $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
                                                    }, function () {
                                                        $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
                                                    });
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