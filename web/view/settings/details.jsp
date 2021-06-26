
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
        <script src="https://kit.fontawesome.com/2c55db574f.js" crossorigin="anonymous"></script>
        <title>Setting Information</title>

        <!-- Bootstrap core CSS -->
        <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!--
    Ramayana CSS Template
    https://templatemo.com/tm-529-ramayana
        -->

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="../../assets/css/footer.css">
        <link rel="stylesheet" href="../../assets/css/fontawesome.css">
        <link rel="stylesheet" href="../../assets/css/templatemo-style.css">
        <link rel="stylesheet" href="../../assets/css/owl.css">

    </head>

    <body class="is-preload">

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Main -->
            <div id="main">
                <div class="inner">

                    <!-- Header -->
                    <header id="header">
                        <div class="logo">
                            <div class="dropdown">
                                <img class="avatar" src="${sessionScope.user.imageLink}"/>
                                <div class="dropdown-content">
                                    <p>Profile</p>
                                    <p>Change Password</p>
                                    <p>Log out</p>

                                </div>
                            </div>
                    </header>

                    <!-- Right Image -->
                    <section class="right-image">
                        <div class="container-fluid">
                            <div><i class="fas fa-home"></i><i style="margin : 5px;" class="fas fa-angle-right"></i>Dashboard<i style="margin : 5px;"  class="fas fa-angle-right"></i>Setting Information</div>
                            <div>
                                <a href="edit?id=${requestScope.setting.id}"><button class="btn-success" style="margin: 10px;" >Edit Setting Information</button></a>
                            </div>
                            <form>
                                <br><div class="form-group">
                                    <label for="id">Setting ID</label>
                                    <input type="text" class="form-control" name="id" value="${requestScope.setting.id}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="type">Type</label>
                                    <input type="text" class="form-control" name="type" value="${requestScope.setting.type}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" name="settingname" value="${requestScope.setting.name}" readonly>
                                </div>
                                <div class="form-group">
                                        <label for="description">Description</label>
                                        <input type="text" class="form-control" name="description" value="${requestScope.setting.description}" readonly>
                                </div>
                                <div class="form-group">
                                        <label for="status">Status</label>
                                        <input type="text" class="form-control" name="status" value="${requestScope.setting.status}" readonly>
                                </div>
                            </form>
                        </div>
                    </section>

                </div>
            </div>

            <!-- Sidebar -->
            <div id="sidebar">

                <div class="inner">

                    <!-- Search Box -->
                    <section id="search" class="alt">
                        <div>

                            <a class="icon-home" href="#">Children Care</a>

                        </div>
                    </section>

                    <!-- Menu -->
                    <nav id="menu">
                        <ul>
                            <li><a href="../../home">Homepage</a></li>
                            <li><a href="#">User</a></li>
                            <li><a href="../post/list">Blog</a></li>
                            <li><a href="#">Chart</a></li>
                            <li><a href="../../admin/setting/list">Settings</a></li>
                            <li>
                                <span class="opener">Service</span>
                                <ul>
                                    <li><a href="#">Examination</a></li>
                                    <li><a href="#">Second Service</a></li>
                                    <li><a href="#">Third Service</a></li>
                                </ul>
                            </li>
                            <li>
                                <span class="opener">Other</span>
                                <ul>
                                    <li><a href="#">Se</a></li>
                                    <li><a href="#">Second Service</a></li>
                                    <li><a href="#">Third Service</a></li>
                                </ul>
                            </li>

                        </ul>
                    </nav>




                    <!-- Footer -->


                </div>
            </div>
            <!-- Site footer -->

        </div>
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
        </footer>
        <!-- Scripts -->
        <!-- Bootstrap core JavaScript -->
        <script src="../../vendor/jquery/jquery.min.js"></script>
        <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script src="../../assets/js/browser.min.js"></script>
        <script src="../../assets/js/breakpoints.min.js"></script>
        <script src="../../assets/js/transition.js"></script>
        <script src="../../assets/js/owl-carousel.js"></script>
        <script src="../../assets/js/custom.js"></script>
        <style>

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
