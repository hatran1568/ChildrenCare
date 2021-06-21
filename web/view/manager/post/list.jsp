<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


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
        <link rel="shortcut icon" href="#" type="image/x-icon" />
        <link rel="apple-touch-icon" href="#" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css" />
        <!-- Pogo Slider CSS -->
        <link rel="stylesheet" href="../../assets/css/pogo-slider.min.css" />
        <!-- Site CSS -->
        <link rel="stylesheet" href="../../assets/css/style.css" />
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="../../assets/css/responsive.css" />
        <!-- Custom CSS -->
        <link rel="stylesheet" href="../../assets/css/custom.css" />
        <link href="../../assets/css/slider.css" rel="stylesheet" type="text/css"/>
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
        <script>
            function myFunction() {
                // Declare variables
                var input, filter, ul, li, a, i, txtValue;
                input = document.getElementById('myInput');
                filter = input.value.toUpperCase();
                ul = document.getElementById("myUL");
                li = ul.getElementsByTagName('li');

                // Loop through all list items, and hide those who don't match the search query
                for (i = 0; i < li.length; i++) {
                    a = li[i].getElementsByTagName("h3")[0];
                    txtValue = a.textContent || a.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        li[i].style.display = "";
                    } else {
                        li[i].style.display = "none";
                    }
                }
            }

            function hide(id) {
                var x = document.getElementById(id);
                x.style.display = "none";
            }

            

        </script>


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
                                            <li><a class="nav-link" href="../../home" >Home</a></li>
                                            <li><a class="nav-link" href="#">About</a></li>
                                            <li><a class="nav-link" href=""style="color: white;">Services</a></li>
                                            <li><a class="nav-link" href="">Blog</a></li>
                                            <li><a class="nav-link" href="">Users</a></li>
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
        <!-- section -->


        <div class="section layout_padding">

            <div class="container">
                
                <select class="category">
                    <option value="all">Category</option>
                    <c:forEach items="${requestScope.categories}" var="c">
                        <option value="${c.name}">${c.name}</option>
                    </c:forEach>
                </select>
                <select class="status">
                    <option value="all">Status</option>
                    <option value="true">1</option>
                    <option value="false">0</option>
                </select>
                <select class="author">
                    <option value="all">Author</option>
                    <c:forEach items="${requestScope.authors}" var="a">
                        <option value="${a.fullName}">${a.fullName}</option>
                    </c:forEach>
                </select>
                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by title..">


                <ul id="myUL">
                    <c:forEach items="${requestScope.posts}" var="p">
                        <li class="list-group gallery__item js-filterable"  data-color="yellow" data-id="${p.id}" data-category="${p.category.name}" data-author="${p.author.fullName}" data-status="${p.status}">
                            <div class="card mb-3 " id="${p.id}" >
                                <div class="row">
                                    <div class="col-md-3" style="text-align: center;">
                                        <img src="../../assets/images/service/s2.jpg" class="img-fluid rounded" alt="" />
                                    </div>
                                    <div class="col-md-9">
                                        <div class="card-body">
                                            <h3 class="card-title"><a class="title" href="details?pid=${p.id}">${p.title}</a></h3>
                                            <p class="card-text text-truncate" style="font-size: 100%;">${p.description} </p>
                                            <p class="card-text"><small class="text-muted">Author: ${p.author.fullName}, Category: ${p.category.name}</small>
                                                <br><small class="text-muted">Featured: ${p.featured}, Status: ${p.status}</small></p>
                                            <p class="card-text">
                                                <a style="float: right; color: white; margin: 0;" type="button" class="btn btn-secondary btn-sm" onclick="hide(${p.id})">Hide</a>
                                                <a style="float: right; color: white; margin: 0;" type="button" class="btn btn-secondary btn-sm" onclick="hide(${p.id})">Edit</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </li>

                    </c:forEach></ul>

            </div></div>
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
            <script src="../../assets/js/jquery.min.js"></script>
            <script src="../../assets/js/popper.min.js"></script>
            <script src="../../assets/js/bootstrap.min.js"></script>
            <!-- ALL PLUGINS -->
            <script src="../../assets/js/jquery.magnific-popup.min.js"></script>
            <script src="../../assets/js/jquery.pogo-slider.min.js"></script>
            <script src="../../assets/js/slider-index.js"></script>
            <script src="../../assets/js/smoothscroll.js"></script>
            <script src="../../assets/js/form-validator.min.js"></script>
            <script src="../../assets/js/contact-form-script.js"></script>
            <script src="../../assets/js/isotope.min.js"></script>
            <script src="../../assets/js/images-loded.min.js"></script>
            <script src="../../assets/js/custom.js"></script>
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
                $('.js-filter').on('click', function () {

                    var $color = $(this).attr('data-author');

                    if ($color == 'all') {
                        $('.js-filterable').removeClass('is-hidden');
                    } else {
                        $('.js-filterable').addClass('is-hidden');
                        $('.js-filterable[data-author =' + $color + ']').removeClass('is-hidden');
                    }

                });

                $("select.category").change(function () {
                    var selectedCategory = $(this).children("option:selected").val();

                    if (selectedCategory == 'all') {
                        $('.js-filterable').removeClass('is-hidden');
                    } else {
                        $('.js-filterable').addClass('is-hidden');
                        $('.js-filterable[data-category =' + selectedCategory + ']').removeClass('is-hidden');
                    }
                });

                $("select.status").change(function () {
                    var selectedStatus = $(this).children("option:selected").val();

                    if (selectedStatus == 'all') {
                        $('.js-filterable').removeClass('is-hidden');
                    } else {
                        $('.js-filterable').addClass('is-hidden');
                        $('.js-filterable[data-status =' + selectedStatus + ']').removeClass('is-hidden');
                    }
                });

                $("select.author").change(function () {
                    var selectedAuthor = $(this).children("option:selected").val();

                    if (selectedAuthor == 'all') {
                        $('.js-filterable').removeClass('is-hidden');
                    } else {
                        $('.js-filterable').addClass('is-hidden');
                        $('.js-filterable[data-author =' + selectedAuthor + ']').removeClass('is-hidden');
                    }
                });
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

                #myInput {
                    background-image: url('/css/searchicon.png'); /* Add a search icon to input */
                    background-position: 10px 12px; /* Position the search icon */
                    background-repeat: no-repeat; /* Do not repeat the icon image */
                    width: 100%; /* Full-width */
                    font-size: 16px; /* Increase font-size */
                    padding: 12px 20px 12px 40px; /* Add some padding */
                    border: 1px solid #ddd; /* Add a grey border */
                    margin-bottom: 12px; /* Add some space below the input */
                }
                .is-hidden {
                    display: none;
                }

            </style>
    </body>
</html>
