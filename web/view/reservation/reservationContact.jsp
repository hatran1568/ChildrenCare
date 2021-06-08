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
        <script src="https://kit.fontawesome.com/561d0dd876.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="../assets/css/footer.css" rel="stylesheet" type="text/css"/>
        <!-- Site Icons -->
        <link rel="shortcut icon" href="#" type="image/x-icon" />
        <link rel="apple-touch-icon" href="#" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
        <!-- Pogo Slider CSS -->
        <link rel="stylesheet" href="../assets/css/pogo-slider.min.css" />
        <!-- owl carousel css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4//assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4//assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!-- Site CSS -->
        <link rel="stylesheet" href="../assets/css/style.css" />
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="../assets/css/responsive.css" />
        <!-- Custom CSS -->
        <link rel="stylesheet" href="../assets/css/custom.css" />
        <!--        <link href="../assets/css/slider.css" rel="stylesheet" type="text/css"/>-->
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
                            <a class="login-trigger" href="#" data-target="#register" data-toggle="modal">Register</a>

                            <div id="register" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <button data-dismiss="modal" class="close">&times;</button>
                                            <h4>Register</h4>
                                            <form action="../register" method="POST">
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
        <div class="container" >

            <c:if test="${not empty requestScope.list}">
                <form id="form" action="contact/forward" method="POST">
                    <table class="table" id="reservation-detail">
                        <thead  class="thead-dark">
                            <tr>
                                <td class="col-md-1">Id</td>
                                <td class="col-md-2">Title</td>
                                <td class="col-md-2">Price</td>
                                <td class="col-md-5">Receiver</td>
                                <td ><input hidden type="text" id="cur-row"></td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" items="${requestScope.list}">
                                <c:forEach var="i" begin="1" end="${list.quantity}">
                                    <c:if test="${ not empty sessionScope.user}">
                                        <tr>
                                            <td>${list.service.id}</td>
                                            <td>${list.service.fullname}</td>
                                            <td>${list.service.salePrice}</td>
                                            <td class="receiver-info">Name: ${sessionScope.receivers[0].fullName}<br>
                                                Gender: <c:if test="${sessionScope.receivers[0].gender == true}">Male</c:if><c:if test="${requestScope.receivers[0].gender == false}">Female</c:if><br>
                                                Email: ${sessionScope.receivers[0].email}<br>
                                                Mobile: ${sessionScope.receivers[0].mobile}<br>
                                                Address: ${sessionScope.receivers[0].address}<br>
                                                <input hidden type="text" name="receiver" value="${sessionScope.receivers[0].id}">
                                            </td>   
                                            <td><button type="button" class="btn receiver-select" data-toggle="modal" data-target="#change-receiver">Change receiver</button></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                            <tr><td></td>
                                <td>Total Cost : </td>
                                <td class="total-cost" rowspan="5"><h3>${requestScope.totalcost}</h3></td></tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-primary"><a href="../cart/list">Change</a></button>
                    <button type="submit" class="btn btn-primary float-right">Submit</button>  
                </form>

            </c:if>
            <c:if test="${empty requestScope.list}">
                <div class="container" style="height:800px;">
                    <h1>You have nothing in cart!</h1>
                </div>

            </c:if>

            <!--            <h2>Total Cost:</h2>-->
        </div>
        <div class="modal fade" id="change-receiver" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <h5 class="modal-title" id="exampleModalLabel">Choose a receiver</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form>
                        <div class="modal-body">
                            <c:forEach items="${sessionScope.receivers}" var="r">
                                <button type="button" id="receiver-select-${r.id}" class="btn receiver-choice" style="width: 100%; margin: 10px 0px; text-align: left;">
                                    Name: ${r.fullName}<br>
                                    Gender: <c:if test="${r.gender == true}">Male</c:if><c:if test="${r.gender == false}">Female</c:if><br>
                                    Email: ${r.email}<br>
                                    Mobile: ${r.mobile}<br>
                                    Address: ${r.address}<br></button>
                                </c:forEach>
                        </div>
                        <div class="modal-footer border-top-0 d-flex justify-content-center">
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#add-receiver">Add receiver</button>
                            <!--                            <button type="submit" class="btn btn-success">Submit</button>-->
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="add-receiver" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0">
                        <h5 class="modal-title" id="exampleModalLabel">Choose a receiver</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="contact/add" method="POST">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="fullName">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName">
                            </div>
                            <label>Gender</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="gender1" value="male">
                                <label class="form-check-label" for="gender1">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="gender2" value="female">
                                <label class="form-check-label" for="gender2">Female</label>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="mobile">Mobile</label>
                                <input type="text" class="form-control" id="mobile" name="mobile">
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address">
                            </div>
                        </div>
                        <div class="modal-footer border-top-0 d-flex justify-content-center">
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </form>
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
            <script>
                $(document).ready(function () {
                    var rowNum;
                    var curRow;
                    $('.receiver-select').click(function () {
                        curRow = this.closest('tr');
                        rowNum = $('#reservation-detail tr').index(curRow) - 1;
                    });
                    $('.receiver-choice').click(function () {
                        var receiverID = this.id.substr(16);
                        var receiverInfo = this.innerHTML;
                        receiverInfo += '<input hidden type="text" name="receiver" value="' + receiverID.toString() + '">';
                        document.getElementsByClassName('receiver-info')[parseInt(rowNum)].innerHTML = receiverInfo;
                        $('#change-receiver').modal('hide');
                    });
                });


            </script>

    </body>
</html>

</body>
</html>

</body>
</html>
