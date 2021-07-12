
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Tooplate">
        <meta name="author" content="">

        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
        <script src="https://kit.fontawesome.com/2c55db574f.js" crossorigin="anonymous"></script>
        <title>Reservations List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="../../vendor/jquery/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>

        <!-- Bootstrap core CSS -->



        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="../../assets/css/footer.css"/>
        <link rel="stylesheet" href="../../assets/css/fontawesome.css"/>
        <link rel="stylesheet" href="../../assets/css/templatemo-style.css"/>
        <link rel="stylesheet" href="../../assets/css/owl.css"/>

        <script type="text/javascript">
            $(document).ready(function () {
                var sitetable = $('#reservations').DataTable({
                    "searching": true,
                    "paging": true,
                    'columnDefs': [
                        {'orderable': false, 'targets': 3},
                        {'orderable': false, 'targets': 6},
                        {'orderable': false, 'targets': 7},
                    ],
                    columns: [
                        null,
                        {data: "ReservationDate", title: "ReservationDate", className: "dt-filter"},
                        null,
                        null,
                        null,
                        {data: "Status", title: "Status", className: "dt-filter"},
                        null, null
                    ],

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
    </head>

    <body class="is-preload">

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
                </div>

                <!-- MENU LINKS -->
                <div class="collapse navbar-collapse">

                    <a href="home" class="navbar-brand">Children Care</a>
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
                                            <form action="login" method="POST">
                                                <input type="text" name="email" class="username form-control" placeholder="Email"/>
                                                <input type="password" name="pass" class="password form-control" placeholder="password"/>
                                                <input class="login-trigger" type="submit" value="Login" />
                                                <a class="login-trigger" href="#" data-target="#" data-toggle="modal">Forget Password</a>
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
                        <c:if test="${not empty sessionScope.user}">
                            <li class="dropdown"><a href="customer/reservation/my" class="smoothScroll">My Reservation</a></li>
                            <li class="dropdown"><a href="customer/myprescription/exams" class="smoothScroll">My Prescriptions</a></li>
                                <c:if test="${sessionScope.user.role.name == 'Manager' || sessionScope.user.role.name == 'Admin'}">

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Manage</a>
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
                                    <li class="dropdown"><a href="admin/dashboard/view" class="smoothScroll">Dashboard</a></li>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.user.role.name == 'Staff'}">

                                <li class="dropdown">
                                <li><a href="staff/reservation/list" class="smoothScroll dropdown">Reservations list</a></li>
                                </li>
                            </c:if>
                            <li><a style="font-size: 25px;color: #00aeef" href="#" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                            <div class="dropdown ">
                                <img class="avatar" src="${sessionScope.user.imageLink}">

                                <div class="dropdown-content">
                                    <p> <a href="userprofile">Profile</a></p>
                                    <p> <a href="#">Change Password</a></p>
                                    <p> <a href="../../logout">Log Out</a></p>
                                </div>
                            </div>
                            <p class="dropdown-name ">${sessionScope.user.fullName}</p>
                        </c:if>
                    </ul>
                </div>
            </div>
        </section>


        <!-- HOME -->
        <section>
            <div class="container">

                <h2 style="text-align: center; margin: 3%; color: blue;">Reservations List</h2>
                <table id="reservations">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Reservation Date</th>
                            <th>Customer</th>
                            <th>Service(s)</th>
                            <th>Total Cost</th>
                            <th>Status</th>
                            <th>Actions</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Filters:</th>
                            <th>Reservation Date </th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>Status </th>
                            <th></th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <c:forEach items="${requestScope.reservations}" var="r">
                            <tr>
                                <td><a href="details?rid=${r.id}">${r.id}</a></td>
                                <td>${r.reservationDate}</td>
                                <td>${r.customer.fullName}</td>
                                <td>${f.ratedStar} 
                                    <c:forEach items="${r.listReservationService}" var="s">
                                        <a href="../service/edit?sid=${s.service.id}">${s.service.fullname}</a> - ${s.quantity} <br>
                                    </c:forEach>
                                </td>
                                <td>${r.totalCost}</td>
                                <td>${r.status.name}</td>
                                <td><c:if test="${r.status.name == 'Submitted'}">
                                        <button id="${r.id}" <c:if test="${r.enough == true}">onclick="changeStatus(this)"</c:if><c:if test="${r.enough == false}">onclick="display_lowquantity(${r.id});"</c:if>>Approve</button>
                                    </c:if>
                                    
                                </td>
                                <td><c:if test="${r.status.name == 'Submitted'}">
                                        <button onclick="display_modal(${r.id});">Reject</button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
            
        </section>

<div id="id01" class="container modal modal-dialog-centered">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-dialog-centered container" id="body" action="">
    <div class="b1">
        <div id="head-modal"><h4>Reject Reservation?</h4></div>
      <p>Are you sure you want to reject this reservation?</p>
    
      <div class="clearfix">
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
        <button type="button" onclick="reject()" class="deletebtn">Reject</button>
      </div>
    </div>
  </form>
</div>
        
<div id="notenough" class="container modal modal-dialog-centered">
  <form class="modal-dialog-centered container" id="body" action="">
    <div class="b1">
        <div id="head-modal"><h3>!</h3><h4>Low Quantity</h4></div>
      <p>The services supply is not enough for this reservation!</p>
    
      <div class="clearfix">
        <button type="button" onclick="document.getElementById('notenough').style.display='none'" class="deletebtn">OK</button>
      </div>
    </div>
  </form>
</div>
<!-- Button trigger modal -->
<style>

    #body{
        width: 40%;
    }
    .b1{
        background-color: white;
        text-align: center;
        padding-top: 0;
        padding-bottom: 30px;
        border: #535ba0 solid;
        margin-top: 40%;
        border-top: white;
    }
    .b1 h4, p{
        padding: 10px;
        
    }
    
    #notenough h3, h4{
        display: inline-block;
    }
    #notenough h3{
        color: red;
    }
    #head-modal{
        background-color: #535ba0;
        margin: 0;
        border-top: #535ba0 solid;
    }
    h4{
        text-color: black;
    }
    
</style>
<script>
    function reject(){
        document.getElementById('id01').style.display='none';
        window.location.href='reject?id='.concat(current_rs);
    }
    var current_rs = 0;
    function display_modal(id){
        current_rs = id;
        document.getElementById('id01').style.display='block';
    }
    
    function display_lowquantity(id){
        current_rs = id;
        document.getElementById('notenough').style.display='block';
    }
    
    function changeStatus(param) {
                var id = param.id;
                $.ajax({
                    url: "approve",
                    data: {id: id},
                    success: function () {
                        setInterval('location.reload()', 100); 
                    }
                            

                });

            }
    
</script>









        <!-- FOOTER -->
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
        <!-- Scripts -->
        <!-- Bootstrap core JavaScript -->
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
            .checked{
                color: orange;
            }
            tfoot {
                display: table-header-group;
            }
            table.dataTable tfoot th {
                border-bottom: 2px solid #111;
                text-align: left;
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
            

        </style>

        <link rel="stylesheet" href="../../assets/css/tooplate-style.css">
        <link rel="stylesheet" href="../../assets/css/custom.css" />
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="../../assets/css/animate.css">
        <link rel="stylesheet" href="../../assets/css/owl.carousel.css">
        <link rel="stylesheet" href="../../assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="../../assets/css/tooplate-style.css">
        <link rel="stylesheet" href="../../assets/css/custom.css" />
        
        <style>
            a:hover{
        color: blue;
    }
        </style>
    </body>

</html>
