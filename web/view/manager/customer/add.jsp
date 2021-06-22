<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new customer</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Site Metas -->

        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="../../assets/css/footer.css" rel="stylesheet" type="text/css"/>
        <!-- Site Icons -->

        <link rel="apple-touch-icon" href="#" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
        <script src="https://kit.fontawesome.com/2c55db574f.js" crossorigin="anonymous"></script>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css" />
        <!-- Pogo Slider CSS -->
        <link rel="stylesheet" href="../../assets/css/fontawesome.css"/>
        <link rel="stylesheet" href="../../assets/css/pogo-slider.min.css" />

        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="../../assets/css/style.css" />
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="../../assets/css/responsive.css" />
        <!-- Custom CSS -->
        <link rel="stylesheet" href="../../assets/css/custom.css" />
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
                                            <li><a class="nav-link" href="#">Blog</a></li>
                                            <li><a class="nav-link" href="#">Users</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>


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

        <!-- Start section -->
        <div class="container">
            <!--<div><i class="fas fa-home"></i><i style="margin : 5px;" class="fas fa-angle-right"></i>Dashboard<i style="margin : 5px;"  class="fas fa-angle-right"></i>User List<i style="margin : 5px;"  class="fas fa-angle-right"></i>Edit</div>-->
            <form action="new" method="POST" >
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email">
                </div>
                <div class="form-group">
                    <label for="full-name">Full name</label>
                    <input type="text" class="form-control" name="full-name" >
                </div>
                <input type="text" class="form-control" name="image-link" value="#" hidden>
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select class="form-control" name="gender">
                        <option value="male" >Male</option>
                        <option value="female" >Female</option>
                    </select>

                    </div>
                    <div class="form-group">
                        <label for="mobile">Mobile</label>
                        <input type="text" class="form-control" name="mobile">
                    </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" name="address" >
                </div>

                <!--                                <div class="form-group">
                                                    <label for="role">Role</label>
                                                    <select class="form-control" name="role">
                <%--<c:forEach items="${requestScope.roles}" var="r">--%>
                    <option <c:if test="${requestScope.user.role.id == r.id}">selected</c:if> value="${r.id}">${r.name}</option>
                <%--</c:forEach>--%>
            </select>
        </div>-->

<!--                <div class="form-group">
                    <label for="status">Status</label>
                    <select class="form-control" name="status">
                        <option value="0" <c:if test="${requestScope.user.status==false}">selected</c:if>>Not Verified</option>
                        <option value="1" <c:if test="${requestScope.user.status==true}">selected</c:if>>Verified</option>
                    </select>
                </div>-->

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <!-- end section -->

        <!-- Start Footer -->
        <footer id="footer" class="site-footer">

            <div class="container" >
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
            <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
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


