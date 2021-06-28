
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
        <title>Edit User Info</title>

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
                            <div><i class="fas fa-home"></i><i style="margin : 5px;" class="fas fa-angle-right"></i>Dashboard<i style="margin : 5px;"  class="fas fa-angle-right"></i>User List<i style="margin : 5px;"  class="fas fa-angle-right"></i>Edit</div>
                            <form action="../../admin/user/update" method="POST">
                                <br><div class="form-group">
                                    <label for="email">User ID</label>
                                    <input type="text" class="form-control" name="id" value="${requestScope.user.id}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" value="${requestScope.user.email}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="full-name">Full name</label>
                                    <input type="text" class="form-control" name="full-name" value="${requestScope.user.fullName}" readonly>
                                </div>
                                    <input type="text" class="form-control" name="image-link" value="${requestScope.user.imageLink}" hidden>
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <input type="text" class="form-control" name="full-name" value="<c:if test="${requestScope.user.gender==true}">Male</c:if><c:if test="${requestScope.user.gender==false}">Female</c:if>" readonly>
                                </div>
                                <div class="form-group">
                                        <label for="mobile">Mobile</label>
                                        <input type="text" class="form-control" name="mobile" value="${requestScope.user.mobile}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" name="address" value="${requestScope.user.address}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="role">Role</label>
                                    <select class="form-control" name="role">
                                        <c:forEach items="${requestScope.roles}" var="r">
                                            <option <c:if test="${requestScope.user.role.id==r.id}">selected</c:if> value="${r.id}">${r.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" name="status">
                                        <option <c:if test="${requestScope.user.status.id==13}">selected</c:if> value="13">Not Verified</option>
                                        <option <c:if test="${requestScope.user.status.id==14}">selected</c:if> value="14">Active</option>
                                        <option <c:if test="${requestScope.user.status.id==15}">selected</c:if> value="15">Contact</option>
                                        <option <c:if test="${requestScope.user.status.id==16}">selected</c:if> value="16">Potential</option>
                                        <option <c:if test="${requestScope.user.status.id==17}">selected</c:if> value="17">Customer</option>
                                        <option <c:if test="${requestScope.user.status.id==18}">selected</c:if> value="18">Inactive</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
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
