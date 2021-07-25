<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Posts List</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="Tooplate">

        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <script src="https://kit.fontawesome.com/561d0dd876.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
        <link href="../../assets/css/toolplate-iso.css" rel="stylesheet" type="text/css"/>

        <link href="../assets/css/toolplate-iso.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href="../../assets/css/bootstrap-iso.css">
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
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
                    </div>

                    <!-- MENU LINKS -->
                    <div class="collapse navbar-collapse">

                        <a href="home" class="navbar-brand">Children Care</a>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="../../home" class="smoothScroll dropdown">Home</a></li>
                            <li><a href="../../service/list" class="smoothScroll dropdown">Services</a></li>
                            <li><a href="../../blog/list" class="smoothScroll dropdown">Blog</a></li>
                                <c:if test="${ empty sessionScope.user}">
                                <li><a style="font-size: 25px;color: #00aeef" href="../cart/list" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                                <li class="appointment-btn"><a class="login-trigger" href="../login">Login</a></li>
                                <li class="appointment-btn"><a class="login-trigger" href="../register">Sign up</a></li>

                            </c:if>
                            <c:if test="${not empty sessionScope.user}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Personal<i style="margin-left: 3px" class="fa fa-caret-down" aria-hidden="true"></i></a>
                                    <div class="dropdown-menu">
                                        <p class="dropdown-link dropdown-item"> <a href="../../customer/reservation/my" class="smoothScroll">My Reservation</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="../../customer/myprescription/exams" class="smoothScroll">My Prescriptions</a></p>
                                    </div>
                                </li>
                                <c:if test="${sessionScope.user.role.name == 'Manager' || sessionScope.user.role.name == 'Admin'}">

                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Manage<i style="margin-left: 3px" class="fa fa-caret-down" aria-hidden="true"></i></a>
                                        <div class="dropdown-menu">
                                            <p class="dropdown-link dropdown-item"> <a href="../customer/list">Customers</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="../reservation/list">Reservations</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="../feedback/list">Feedbacks</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="../post/list">Posts</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="../slider/list">Sliders</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="../service/list">Services</a></p>
                                        </div>
                                    </li>
                                    <c:if test="${sessionScope.user.role.name == 'Admin'}">
                                        <li class="dropdown"><a href="../../admin/dashboard/view" class="smoothScroll">Dashboard</a></li>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role.name == 'Staff'}">

                                    <li class="dropdown">
                                    <li><a href="../staff/reservation/list" class="smoothScroll dropdown">Reservations list</a></li>
                                    </li>
                                </c:if>
                                <li><a style="font-size: 25px;color: #00aeef" href="../../cart/list" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                                <div class="dropdown ">
                                    <img class="avatar" src="${sessionScope.user.imageLink}">

                                    <div class="dropdown-content">
                                        <p style="text-align: left"> <a href="../../userprofile"><i style="margin-right: 5px" class="fas fa-info-circle"></i>Profile</a></p>
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
        <div class="container" style="height: max-content; vertical-align: middle; min-height: 600px; margin-top: 0">
            <h2 style="text-align: center; margin: 3%; color: #0064af;">Posts</h2>
            <div>
                <button onclick="window.location.href = 'add'" class="btn btn-primary pull-left" >Add New Post</button>
            </div>
            <table id="posts" >
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Category</th>
                        <th>Thumbnail</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Updated</th>
                        <th>Status</th>
                        <th>View</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td style="font-weight: bold;">Filters:</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>

                <tbody>
                    <c:forEach items="${requestScope.posts}" var="p">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.category.name}</td>
                            <td><a href="details?pid=${p.id}"><img style="width: 100px; height: auto;" class="rounded img-thumbnail" src="../../${p.thumbnailLink}"></a></td>
                            <td style="font-weight: bold;"><a href="details?pid=${p.id}">${p.title}</a></td>
                            <td>${p.author.fullName}</td>
                            <td>${p.updatedDate}</td>
                            <td>${p.status.name}</td>
                            <td><a href="details?pid=${p.id}"><i class="fas fa-eye"></i></a></td>
                            <td><a href="edit?pid=${p.id}"><i class="fas fa-pen"></i></a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


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

        <script>
            $(document).ready(function () {
                var sitetable = $('#posts').DataTable({
                    retrieve: true,
                    "searching": true,
                    "paging": true,
                    "sPaginationType": "full_numbers",
                    "bJQueryUI": true,
                    'columnDefs': [
                        {'max-width': '10%', 'targets': 3},
                        {'className': 'text-center', 'targets': 0},
                        {'className': 'text-center', 'targets': 6},
                        {'className': 'text-center', 'targets': 7},
                        {'className': 'text-center', 'targets': 8},
                        {'orderable': false, 'targets': [2, 7, 8]},
                    ],
                    columns: [
                        null,
                        {data: "Category", title: "Category", className: "dt-filter"},
                        null,
                        null,
                        {data: "Author", title: "Author", className: "dt-filter"},
                        null,
                        {data: "Status", title: "Status", className: "dt-filter"},
                        null,
                        null,
                    ],
                    "bInfo": false,
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
        <style>
            table.dataTable tfoot {
                display: table-header-group;
                border-bottom: gray 1px;
                padding: 0;
                margin: 0;
            }
            table.dataTable tfoot td {
                text-align: center;
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
/*            table.dataTable img{
                max-width: 100px;
                height: auto;
                border-radius: 5px;
                border: solid gray 2px;
                padding: 0;
            }*/
            table.dataTable thead{
                border: none;
                padding-bottom: 0;
                margin-bottom: 0;
            }
            a:hover{
                color: #0064af;
            }
            
            table.dataTable {
                margin-bottom: 30px;
            }
            td{
                border-bottom: 1px solid lightgray;
            }
        </style> 
    </body>
</html> 