<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Reservation details</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="Tooplate">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <script src="https://kit.fontawesome.com/561d0dd876.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="../../assets/css/toolplate-iso.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href="../../assets/css/bootstrap-iso.css">
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="../../assets/css/animate.css">
        <link rel="stylesheet" href="../../assets/css/owl.carousel.css">
        <link rel="stylesheet" href="../../assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/../assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/../assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/../../assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/../../assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="../../assets/css/tooplate-style.css">
        <link rel="stylesheet" href="../../assets/css/custom.css" />
        <script>




        </script>
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
                        <a href="../../home" class="navbar-brand">Children Care</a>
                    </div>

                    <!-- MENU LINKS -->
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="../../home" class="smoothScroll dropdown">Home</a></li>
                            <li><a href="../../service/list" class="smoothScroll dropdown">Services</a></li>
                            <li><a href="../../blog/list" class="smoothScroll dropdown">Blog</a></li>
                                <c:if test="${ empty sessionScope.user}">
                                <li><a style="font-size: 25px;color: #00aeef" href="../../cart/list" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                                <li class="appointment-btn"><a class="login-trigger" href="../../login">Login</a></li>
                                <li class="appointment-btn"><a class="login-trigger" href="../../showregister">Sign up</a></li>

                            </c:if>
                            <c:if test="${not empty sessionScope.user}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Personal</a>
                                    <div class="dropdown-menu">
                                        <p class="dropdown-link dropdown-item"> <a href="../../customer/reservation/my" class="smoothScroll">My Reservation</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../customer/myprescription/exams" class="smoothScroll">My Prescriptions</a></p>
                                    </div>
                                </li>
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
                                <li><a style="font-size: 25px;color: #00aeef" href="../../cart/list" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                                <div class="dropdown ">
                                    <img class="avatar" src="../../${sessionScope.user.imageLink}">

                                    <div class="dropdown-content">
                                        <p style="text-align: left"> <a href="../../customer/userprofile"><i style="margin-right: 5px" class="fas fa-info-circle"></i>Profile</a></p>
                                        <p style="text-align: left; margin-bottom: 0"> <a href="../../logout"><i style="margin-right: 5px" class="fas fa-sign-out-alt"></i>Log Out</a></p>
                                    </div>
                                </div>
                                <p class="dropdown-name" style="margin:auto; color: black">${sessionScope.user.fullName}</p>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <!-- End Banner -->
        <!-- section -->
        <div class="container" style="margin-top: 75px">
            <div style="margin-bottom: 30px"><a href="../../home"><i class="fas fa-home"></i></a><i style="margin : 5px;" class="fas fa-angle-right"></i><a href="list">Reservation list</a><i style="margin : 5px;" class="fas fa-angle-right"></i>Detail</div>

            <div id="Info" class="col-md-8 justify-content-center" style="margin-left: 16.66%; margin-right: 16.66%">
                <h3 style="text-align: center">Reservation info</h3>
                <div class="row">
                    <p class="col-md-6">
                        <strong>Reservation ID: </strong>
                        <span>${requestScope.reservation.id}</span>
                    </p>
                    <p class="col-md-6">
                        <strong>Reservation date:</strong>
                        <span><fmt:formatDate pattern="dd-MM-yyyy" value = "${requestScope.reservation.reservationDate}" /></span>
                    </p>
                </div>
                <div class="row">
                    <p class="col-md-6">
                        <strong>Total cost: </strong>
                        <span>${requestScope.reservation.totalCost}</span>
                    </p>
                    <p class="col-md-6">
                        <strong>Checkup time:</strong>
                        <span><fmt:formatDate pattern="dd-MM-yyyy" value = "${requestScope.reservation.checkupTime}" /></span>
                    </p>
                </div> 
                
                        <strong>Status: </strong>
                        <span>${requestScope.reservation.status.name}</span>
                
                   <h3 style="text-align: center">Receiver info</h3> 
                
                <div class="row">
                    <p class="col-md-6">
                        <strong>Receiver name:</strong>
                        <span>${requestScope.reservation.receiver.fullName}</span>
                    </p>
                    <p class="col-md-6">
                        <strong>Gender:</strong>
                        <span><c:if test="${requestScope.reservation.receiver.gender eq true}">Male</c:if>
                            <c:if test="${requestScope.reservation.receiver.gender eq false}">Female</c:if></span>
                        </p>
                </div>
                <div class="row">
                    <p class="col-md-6">
                        <strong> Email:</strong>
                        <span>${requestScope.reservation.receiver.email}</span>
                    </p>
                    <p class="col-md-6">
                        <strong>Mobile</strong>
                        <span>${requestScope.reservation.receiver.mobile}</span>
                    </p>
                </div>
                    <p>
                        <strong>Address</strong>
                        <span>${requestScope.reservation.receiver.address}</span>
                    </p>
                    
            </div>
                    
                    
            <h3 style="text-align: center; margin-top: 50px">Service info</h3>
            <button type="button" class="btn btn-primary" onclick="window.location.href='../examination/list?rid=${requestScope.reservation.id}'">View prescription list</button>
            
            <table class="table thead-dark" id="reservation-detail">
                <thead style="font-weight:bold" class="thead-dark">
                    <tr>
                        <td style="width: 300px">Thumbnail</td>
                        <td >Title</td>
                        <td>Category</td>
                        <td >Unit price</td>
                        <td >Quantity</td>
                        <td>Number of exam done</td>
                        <td>Cost</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" begin="0" end="${requestScope.services.size()-1}">
                        <tr>
                            <td><img class="img-responsive" src="../../${requestScope.services[i].service.thumbnailLink}" alt="#" /></td>
                            <td>${requestScope.services[i].service.fullname}</td>
                            <td>${requestScope.services[i].service.category.name}</td>
                            <td><fmt:formatNumber type = "number" 
                                    pattern = "###,###,###" value = "${requestScope.services[i].unitPrice}" /></td>
                            <td>${requestScope.services[i].quantity}</td>
                            <td>${requestScope.examinationCount[i]}</td>
                            <td><fmt:formatNumber type = "number" 
                                    pattern = "###,###,###" value = "${requestScope.services[i].unitPrice * services[i].quantity}" /> </td>
                            <td><c:if test="${requestScope.examinationCount[i]<requestScope.services[i].quantity}">
                                    <button class="btn btn-primary" type="button" onclick="window.location.href = '../examination/new?rid=${requestScope.reservation.id}&sid=${requestScope.services[i].service.id}'">Add</button>
                                </c:if></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6" style="text-align: right">Total cost</td>
                        <td style="font-size: 16px"><fmt:formatNumber type = "number" 
                                    pattern = "###,###,###" value = "${requestScope.reservation.totalCost}" />đ</td>
                    </tr>
                </tbody>
            </table>
        </div>
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
        <script src="../../assets/js/jquery.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
        <script src="../../assets/js/jquery.sticky.js"></script>
        <script src="../../assets/js/jquery.stellar.min.js"></script>
        <script src="../../assets/js/wow.min.js"></script>
        <script src="../../assets/js/smoothscroll.js"></script>
        <script src="../../assets/js/owl.carousel.min.js"></script>
        <script src="../../assets/js/custom-new.js"></script>

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
        <style>
            .table{
                margin-top: 40px;
                border: none;

            }
            #reservation-detail{
                width:100%; 
                margin-top: 50px; 
/*                margin-left: 10%;
                margin-right: 10%;*/
            }
            .img-responsive{
                max-width: 300px;
                height: auto;
            }
            thead{
                font-weight: bold;
                font-size: 16px;
            }
            p strong,span{
                    font-size: 16px;
                    color:black;
                }
                #Info h3{
                    margin: 20px;
                }
                footer p span{
                    color: #757575;
                    font-size: 14px;
                }
        </style>
    </body>
</html> 