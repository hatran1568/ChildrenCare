<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Examination list</title>

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
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">

        <!-- MAIN CSS -->
        <link rel="stylesheet" href="../../assets/css/tooplate-style.css">
        <link rel="stylesheet" href="../../assets/css/custom.css" />
        
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
        <div class="container" style="margin: 75px auto">
            <div style="margin-bottom: 30px"><a href="../../home"><i class="fas fa-home"></i></a><i style="margin : 5px;" class="fas fa-angle-right"></i><a href="../reservation/details?rid=${requestScope.exams[0].reservationService.reservation.id}">Reservation details</a><i style="margin : 5px;"  class="fas fa-angle-right"></i>Examination list</div>

            
            <table id="prescription" class="table">
                <thead class="thead-dark">
                    <tr>
                        <td>Service</td>
                        <td>Receiver name</td>
                        <td>Gender</td>
                        <td>Email</td>
                        <td style="width:250px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">Prescription</td>
                        <td></td>
                    </tr>
                </thead>
                <tfoot>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                         
                        </tr>
                    </tfoot>
                <tbody>
                    <c:forEach items="${requestScope.exams}" var="e">
                        <tr>
                            <td>${e.reservationService.service.fullname}</td>
                            <td>${e.receiver.fullName}</td>
                            <td><c:if test="${e.receiver.gender eq true}">Male</c:if>
                                <c:if test="${e.receiver.gender eq false}">Female</c:if></td>
                            <td>${e.receiver.email}</td>
                            <td style="width:250px; overflow: hidden; display:block; white-space: nowrap; text-overflow: ellipsis;">${e.prescription}</td>
                            <td><a href="details?resid=${e.reservationService.reservation.id}&sid=${e.reservationService.service.id}&recid=${e.receiver.id}"><i class="fas fa-eye"></i></a></td>
                        </tr>
                    </c:forEach>
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
        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            $('ul.nav li.dropdown').hover(function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
            }, function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
            });
        </script>
        <script>
                $(document).ready(function () {
                    $("#prescription").dataTable({
                        retrieve: true,
                        "searching": true,
                        "paging": true,
                        "sPaginationType": "full_numbers",
                        "bJQueryUI": true,
                        columns: [
                            {data: "Service", title: "Service", className: "dt-filter"},
                            null,
                            null,
                            null,
                            null,
                            null,
                            
                        ],
                        'columnDefs': [
                            {'className': 'text-center', 'targets': [0,1,2,3,4,5]},
                            {'orderable': false, 'targets' : [0,1,2,3,4,5]},
                        ],
//                        "bInfo" : false,
                        "bLengthChange": false,
                        "sDom": 'W<"clear">Tlfrtip',
                        initComplete: function () {
                            this.api().columns('.dt-filter').every(function () {
                                var column = this;
                                var select = $('<select><option value=""></option></select>')
                                        .appendTo($(column.footer()))
                                        .on('change', function () {
                                            var val = $.fn.dataTable.util.escapeRegex(
                                                    $(this).val()
                                                    );
                                            column
                                                    .search(val ? '^' + val + '$' : '', true, false)
                                                    .draw();
                                        });
                                column.data().unique().sort().each(function (d, j) {
                                    select.append('<option value="' + d + '">' + d + '</option>')
                                });
                            });
                        }
                    });
                });
            </script> 
<!--        <style>
            .table{
                margin-top: 40px;
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
            tr:hover{
                background-color: lightgray;
            }
            thead{
                font-weight: bold;
                font-size: 16px;
                /*background-color: darkgrey !important;*/
            }
            thead:hover{
                background-color: darkgrey !important;
            }
            tfoot {
                display: table-header-group;
            }
            table.dataTable td {
                font-size: 15px;
            }
            table.dataTable th {
                
                font-size: 16px;
            }
            table.dataTable tbody tr:hover {
                background-color: #c7c7c7;
            }
            
            tbody, td, tfoot, th, thead, tr {
                border-style: hidden;
            }
            
            .table thead {
                border-bottom: 2px solid black;
                font-weight: bold;
                margin: 0px auto;
            }
            .table thead select{
                font-weight: normal;
                text-align: center;
            }
        </style>-->
<style>
            
            table.dataTable td {
                font-size: 15px;
            }
            table.dataTable th {
                
                font-size: 16px;
            }
            
            tfoot {
                display: table-header-group;
            }
            table.dataTable tbody tr:hover {
                background-color: #c7c7c7;
            }
            
            tbody, td, tfoot, th, thead, tr {
                border-style: hidden;
            }
             thead,tfoot{
                border-bottom: 2px solid black;
            }
            
            .table thead {
                /*border-bottom: 2px solid black;*/
                font-weight: bold;
                margin: 0px auto;
                
            }
            .table thead tr th{
                border-bottom: 1px solid black;
            }
            .table tfoot tr td{
                border-bottom: 2px solid black;
            }
            .table thead select{
                font-weight: normal;
                text-align: center;
            }
        </style> 
    </body>
</html> 