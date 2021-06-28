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
                                            <form action="../login" method="POST">
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
                                            <form action="../register" method="GET">
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
                                
                                <div class="dropdown ">
                                    <img class="avatar" src="${sessionScope.user.imageLink}">

                                    <div class="dropdown-content">
                                        <p> <a href="admin/setting/list">Profile</a></p>
                                        <p> <a href="#">Change Password</a></p>
                                        <p> <a href="#">Log Out</a></p>
                                    </div>
                                </div>
                                <p class="dropdown-name ">${sessionScope.user.fullName}</p>
                            </c:if>
                        </ul>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <ul class="nav navbar-nav navbar-right">
                            <c:if test="${sessionScope.user.role.name == 'Manager' || sessionScope.user.role.name == 'Admin'}">
                                <li class="dropdown"><a href="../../home" class="smoothScroll">Home</a></li>
                                <li class="dropdown"><a href="../../customer/reservation/my" class="smoothScroll">My reservation</a></li>
                                <!--<li><a href="#" class="smoothScroll">Services</a></li>-->


                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Manage</a>
                                    <div class="dropdown-menu">
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/customer/list">Customers</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="#">Reservations</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="#">Feedbacks</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/post/list">Posts</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/slider/list">Sliders</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../manager/service/list">Services</a></p>

                                    </div>
                                </li>
                                <c:if test="${sessionScope.user.role.name == 'Admin'}">
                                    <li class="dropdown"><a href="../../admin/dashboard/view" class="smoothScroll">Dashboard</a></li>
                                    </c:if>
                                <li><a style="font-size: 25px;color: #00aeef" href="#" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role.name == 'Staff'}">
                                <li><a href="#top" class="smoothScroll">Home</a></li>
                                <li><a href="#" class="smoothScroll">Services</a></li>
                                <li><a href="#" class="smoothScroll">Posts</a></li>
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
                            
                            <div class="dropdown ">
                                <img class="avatar" src="${sessionScope.user.imageLink}">

                                <div class="dropdown-content">
                                    <p> <a href="#">Profile</a></p>
                                    <p> <a href="#">Change Password</a></p>
                                    <p> <a href="#">Log Out</a></p>
                                </div>
                            </div>
                            <p class="dropdown-name ">${sessionScope.user.fullName}</p>
                        </ul>
                    </c:if>
                </div>

            </div>
        </section>


        <!-- End Banner -->
        <!-- section -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card" style="margin: 20px; min-height: 600px">

                        <div class="card-body">
                           

                            <div class="row">
                                <div class="col-2">
                                    <div class="d-flex justify-content-start">
                                        <div class="image-container">
                                            <img src="../../${requestScope.user.imageLink}" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
                                            
                                        </div>

                                    </div>
                                </div>
                                <div class="col-10">
                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">Basic Info</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="historyOfChange-tab" data-toggle="tab" href="#historyOfChange" role="tab" aria-controls="historyOfChange" aria-selected="false">Changes history</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content ml-1" id="myTabContent">
                                        <div class="tab-pane active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">


                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Full Name</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    ${requestScope.user.fullName}
                                                </div>
                                            </div>
                                            <hr />

                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Gender</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <c:if test="${requestScope.user.gender eq true}">Male</c:if>
                                                    <c:if test="${requestScope.user.gender eq false}">Female</c:if>
                                                    </div>
                                                </div>
                                                <hr />

                                                <div class="row">
                                                    <div class="col-sm-3 col-md-2 col-5">
                                                        <label style="font-weight:bold;">Email</label>
                                                    </div>
                                                    <div class="col-md-8 col-6">
                                                    ${requestScope.user.email}
                                                </div>
                                            </div>
                                            <hr />


                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Mobile</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    ${requestScope.user.mobile}
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Address</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    ${requestScope.user.address}
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Status</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    ${requestScope.user.status.name}
                                                </div>
                                            </div>
                                            <hr />
                                            <button id="edit-btn" class="btn pull-right" onclick="window.location.href = 'edit?uid=${requestScope.user.id}'">Edit</button>
                                        </div>
                                        <div class="tab-pane" id="historyOfChange" role="tabpanel" aria-labelledby="historyOfChange-tab">
                                            <div class="row" style="margin:0">
                                                <table id="user-history" class="table table-hover" style="margin-top: 10px">
                                                    <thead class="thead-dark" style="text-align: center">
                                                        <tr>
                                                            <th class="col-md-2">Email</th>
                                                            <th class="col-md-2">Full name</th>
                                                            <th class="col-md-1">Gender</th>
                                                            <th class="col-md-1">Mobile</th>
                                                            <th class="col-md-2">Address</th>
                                                            <th class="col-md-2">Updated by</th>
                                                            <th class="col-md-2">Updated date</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.history}" var="h">
                                                            <tr>
                                                                <td>${h.email}</td>
                                                                <td>${h.fullName}</td>
                                                                <td><c:if test="${h.gender eq true}">Male</c:if>
                                                                    <c:if test="${h.gender eq false}">Female</c:if>
                                                                    </td>
                                                                    <td>${h.mobile}</td>
                                                                <td>${h.address}</td>
                                                                <td>${h.updatedBy.fullName}</td>
                                                                <td>${h.updatedDate}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
            <style>
                #user-history thead th{
                    text-align: center;
                }
                #user-history tbody td{
                    text-align: left;
                }
            </style>
    </body>
</html> 