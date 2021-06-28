
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
        <title>Users List</title>
        
        <script src="../../vendor/jquery/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>

        <!-- Bootstrap core CSS -->
        <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!--
    Ramayana CSS Template
    https://templatemo.com/tm-529-ramayana
        -->
      
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="../../assets/css/footer.css"/>
        <link rel="stylesheet" href="../../assets/css/fontawesome.css"/>
        <link rel="stylesheet" href="../../assets/css/templatemo-style.css"/>
        <link rel="stylesheet" href="../../assets/css/owl.css"/>
        <script type="text/javascript">
        $(document).ready(function () {
            var sitetable = $('#users').DataTable({
                "searching": true,
                "paging": true, 
                'columnDefs': [
                    {'max-width': '10%', 'targets': 3},
                    {'className': 'text-center', 'targets': 0},
                    {'className': 'text-center', 'targets': 6},
                    {'className': 'text-center', 'targets': 7},
                    {'className': 'text-center', 'targets': 8},
                    {'orderable': false, 'targets' : 7},
                    {'orderable': false, 'targets' : 8},
                ],
                columns: [
                    null,
                    null,
                    { data: "Gender", title:"Gender", className: "dt-filter" },
                    null,
                    null,
                    { data: "Role", title:"Role", className: "dt-filter" },
                    { data: "Status", title:"Status", className: "dt-filter" },
                ],
//                initComplete: function () {
//                    this.api().columns('.dt-filter').every( function () {
//                        var column = this;
//                        var select = $('<select multiple="multiple" class="mSelect"><option value=""></option></select>')
//                            .appendTo( $(column.header()) )
//                            .on( 'change', function () {
//                                if ( $(this).val() == undefined) {
//                                    val = "";
//                                } else {
//                                    var val = $.fn.dataTable.util.escapeRegex(
//                                        $(this).val().join("zzz")
//                                    );
//                                    val = val.replace(/zzz/g,"|");
//                                }
//                                column
//                                    .search( val ? '^' + val + '$'  : '' , true, false )
//                                .draw();
//                        } );
//                        column.data().unique().sort().each( function ( d, j ) {
//                                        select.append( '<option value="' +d+'">' +d+'</option>'  )
//                        } );
//                    } );
//                }
                initComplete: function () {
                    this.api().columns('.dt-filter').every( function () {
                        var column = this;
                        var select = $('<select><option value=""></option></select>')
                            .appendTo( $(column.footer()))
                            .on( 'change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search( val ? '^'+val+'$' : '', true, false )
                                    .draw();
                            } );

                        column.data().unique().sort().each( function ( d, j ) {
                            select.append( '<option value="'+d+'">'+d+'</option>' )
                        } );
                    } );
                }
            });
        });
        </script>
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

                        </div>
                    </header>



                    <!-- Right Image -->
                    <section class="right-image">
                        <div class="container-fluid">
                            <div><i class="fas fa-home"></i><i style="margin : 5px;" class="fas fa-angle-right"></i>Dashboard<i style="margin : 5px;"  class="fas fa-angle-right"></i>User List</div>

                            <div>
                                <button onclick="window.location.href = 'new'" class="btn-success" style="margin: 10px;" >Add New User</button>
                            </div>
<!--                            <div style="margin-left: 3%">Filter:</div>
                            <span id="filterGender" style="font-size: 15px; margin-left: 5%; margin-right: 1%"><b>Gender:</b></span>
                            <span id="filterRole" style="font-size: 15px; margin-right: 1%"><b>Role:</b></span>
                            <span id="filterStatus" style="font-size: 15px; margin-right: 1%"><b>Status:</b></span>-->
                            <table id="users">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Email</th>
                                        <th>Mobile</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th>View</th>
                                        <th>Edit</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Filters:</th>
                                        <th></th>
                                        <th>Gender</th>
                                        <th></th>
                                        <th></th>
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${requestScope.users}" var="a">
                                    <tr>
                                        <td>${a.id}</td>
                                        <td>${a.fullName}</td>
                                        <td><c:if test="${a.gender == true}">Male</c:if>
                                            <c:if test="${a.gender == false}">Female</c:if></td>
                                        <td>${a.email}</td>
                                        <td>${a.mobile}</td>
                                        <td>${a.role.name}</td>
                                        <td><c:if test="${a.status.id == 13}">Not Verified</c:if>
                                            <c:if test="${a.status.id == 14}">Active</c:if>
                                            <c:if test="${a.status.id == 15}">Contact</c:if>
                                            <c:if test="${a.status.id == 16}">Potential</c:if>
                                            <c:if test="${a.status.id == 17}">Customer</c:if>
                                            <c:if test="${a.status.id == 18}">Inactive</c:if></td>
                                        <td><a href="details?id=${a.id}"><i class="fas fa-eye"></i></a></td>
                                        <td><a href="edit?id=${a.id}"><i class="fas fa-pen"></i></a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--<div id="pagination" class="pagination"></div>-->

                        </div>
<!--                        <script>
                            generatePagger("pagination",${requestScope.pageindex},${requestScope.totalpage}, 2, "${requestScope.paggerUrl}");

                        </script>-->

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
                            <li><a href="../../admin/user/list">User</a></li>
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
        <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script src="../../assets/js/browser.min.js"></script>
        <script src="../../assets/js/breakpoints.min.js"></script>
        <script src="../../assets/js/transition.js"></script>
        <script src="../../assets/js/owl-carousel.js"></script>
        <script src="../../assets/js/custom.js"></script>
<!--        <script>
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
                            generatePagger("pagination",${requestScope.pageindex},${requestScope.totalpage}, 2, "${requestScope.paggerUrl}");

        </script>-->
        <style>
            tfoot {
                display: table-header-group;
            }
            table.dataTable tfoot th {
                border-bottom: 2px solid #111;
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
