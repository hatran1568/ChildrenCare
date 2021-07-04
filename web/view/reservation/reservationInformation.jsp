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
        <script src="https://kit.fontawesome.com/561d0dd876.js" crossorigin="anonymous"></script>
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
                                            <form action="../../login" method="POST">
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
                                            <form action="../../register" method="GET">
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
        <div class="container" style="min-height: 700px; height: auto;">
            <c:if test="${requestScope.reservation.status.name eq 'Submited'}">
                <a  class="collapsebtn btn btn-primary" href="../../cart/list?rid=${requestScope.reservation.id}" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Edit Reservation  
                </a>
                <a  class="collapsebtn btn btn-primary"  href="../../customer/reservation/cancel?id=${requestScope.reservation.id}" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Cancel Reservation 
                </a>
            </c:if>
            <h3>Reservation</h3>
            <table class="table" id="reservation-detail">
                <thead  class="thead-dark">
                    <tr>
                        <td class="col-md-1">Id</td>
                        <td class="col-md-2">Date</td>
                        <td class="col-md-2">Time to check up</td>
                        <td class="col-md-2">Status</td>
                        <td class="col-md-2">Total Cost</td>



                </thead>
                <tbody>

                    <tr>
                        <td class="col-md-1">${reservation.id}</td>
                        <td  class="col-md-2"> <p><input  class="date" type="date" value="${reservation.reservation_date}" readonly="true"></p></td>
                        <td class="col-md-2"><input class="date" type="date" value="${reservation.checkup_time}" readonly="true"></td>
                        <td class="col-md-2">${reservation.status.name}</td>
                        <td class="col-md-2">${reservation.total_cost}</td>  


                    </tr>


                </tbody>
            </table>

            <h3>Receiver</h3>

            <div style="display: flex;" >
                <h5 style="flex-grow: 1;min-width: 260px">Name : </h5>
                <h5 style="flex-grow: 4">${requestScope.reservation.receiver.fullName}</h5>
            </div>
            <div style="display: flex;" >
                <h5 style="flex-grow: 1;min-width: 260px">Gender : </h5>
                <h5 style="flex-grow: 4"> <c:if test="${requestScope.reservation.receiver.gender eq 'true'}">Male</c:if><c:if test="${requestScope.reservation.receiver.gender eq 'false'}">Female</c:if></h5>
                </div>
                <div style="display: flex;" >
                    <h5 style="flex-grow: 1;min-width:  260px">Email : </h5>
                        <h5 style="flex-grow: 4">${requestScope.reservation.receiver.email}</h5>
            </div>
            <div style="display: flex;" >
                <h5 style="flex-grow: 1;min-width: 260px">Mobile : </h4>
                <h5 style="flex-grow: 4">${requestScope.reservation.receiver.mobile}</h5>
            </div>

            <h3>Service</h3> 


            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">ID</th>
                        <th scope="col">FullName</th>
                        <th scope="col">Category</th>
                        <th scope="col">Original Price</th>
                        <th scope="col">Sale Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Feedback</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.list}" var ="list">
                        <tr>
                            <td > <img style="min-height: 80px; max-height: 80px; max-width: 100px;" src="../../${list.service.thumbnailLink}"></td>
                            <td>${list.service.id}</td>
                            <td>${list.service.fullname}</td>
                            <td>${list.service.category.name}</td>
                            <td>${list.service.originalPrice}</td>
                            <td>${list.service.salePrice}</td>  
                            <td>${list.quantity}</td>
                            <td><a href="#"><i class="fas fa-flag fa-2x"></i></a></td>


                        </tr>
                    </c:forEach>


                </tbody>
            </table>      
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
    <script>
            function generatePagger(id, pageindex, totalpage, gap, page)
            {
                var container = document.getElementById(id);
                if (pageindex > gap + 1)
                    container.innerHTML += "<a href='" + page + "?page=1'>First</a>";
                for (var i = pageindex - gap; i < pageindex; i++)
                {
                    if (i >= 1)
                    {
                        container.innerHTML += "<a href='" + page + "?page=" + i + "'>" + i + "</a>";
                    }
                }

                container.innerHTML += "<a class='active'>" + pageindex + "</a>";
                for (var i = pageindex + 1; i <= pageindex + gap; i++)
                {
                    if (i <= totalpage)
                    {
                        container.innerHTML += "<a href='" + page + "?page=" + i + "'>" + i + "</a>";
                    }
                }

                if (pageindex < totalpage - gap)
                    container.innerHTML += "<a href='" + page + "?page=" + totalpage + "'>Last</a>"
            }
            generatePagger("pagination",${requestScope.index},${requestScope.totalPage}, 2, "${requestScope.url}");
            function changeStatus(param) {
                var id = param.id;
                $.ajax({
                    url: "change",
                    type: "GET",
                    data: {id: id},
                    success:
                            function (data) {

                                var b = JSON.parse(JSON.stringify(data));

                                if (b["status"] == false) {
                                    console.log(b["status"])
                                    param.innerHTML = '<i  class="fas fa-eye-slash icon-change" aria-hidden="true"></i>';

                                }
                                if (b["status"] == true) {

                                    console.log(b["status"])
                                    param.innerHTML = '<i  class="fas fa-eye icon-change   " aria-hidden="true"></i>';
                                }




                            }

                });

            }
            function submit() {
                document.getElementById("myForm").submit();

            }

    </script>
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

        .pagination{
            display: inline-block;
            margin: 0 auto;
            position: relative;
            left: 45%;
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

        .avatar{

            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        .sli{
            margin: 0 auto;
            width: 300px;
        }
        .in-text{
            position: absolute;
            top: 70px;
            left: 40%;
            visibility: hidden;

        }
        .news_blog:hover > .in-text{

            visibility: visible;

        }

        .in-text:hover{
            display: block;
        }

        .news_blog:hover{
            opacity: 0.4;
        }
        .btn{
            bottom: 0;
        }
        nav{

        }
        table,th,td{
            text-align: center;

        }
        td{
            min-height: 120px;
        }
        .icon-change{

            cursor: pointer;
        }
        .date{
            border-top-style: hidden;
            border-right-style: hidden;
            border-left-style: hidden;
            border-bottom-style: hidden;
            outline: none;
            text-align: center;

        }
        input[type=date]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            display: none;
        }



        input[type=date]::-webkit-calendar-picker-indicator {
            -webkit-appearance: none;
            display: none;
        }
        h5{
            text-align: center;
            color: black;
        }
    </style>

</body>
</html> 