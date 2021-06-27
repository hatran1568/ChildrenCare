
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


        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
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
                                <img class="avatar" src="../../${sessionScope.user.imageLink}">
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
                            <table class="table"></table> 
                            <div class="row">
                                <div style="margin-bottom: 10px;" class="col-md-6">
                                    <div class="card">

                                        <div style="text-align: center" class="header">
                                            <h3 class="title">Reservation Statistics</h3>

                                            <canvas id="myChart" style=" width:100%;max-width:700px;height: 300px;"></canvas>
                                        </div>




                                    </div>
                                </div>  

                                <div  style="margin-bottom: 10px;" class=" col-md-6">
                                    <div class="card">

                                        <div style="height: max-content; min-height: 380px ;text-align: center" class="header">
                                            <h4 class="title">Total Revenue ${requestScope.sum}</h4>
                                            <ul style="list-style-type: none;">
                                                <c:forEach items="${requestScope.service}" var="list">
                                                    <li>
                                                        ${list.fullname} : ${requestScope.revernue[list.id -1]}
                                                    </li>
                                                </c:forEach>
                                            </ul>

                                        </div>


                                    </div>
                                </div>
                                <div style="margin-bottom: 10px;" class="col-md-6">
                                    <div class="card">

                                        <div style="height: max-content; min-height: 380px ;text-align: center" class="header">
                                            <h4 id="0" class="title">Average Rating : </h4>
                                            <script>
                                                $(document).ready(function () {
                                                drawRate(${requestScope.tostar}, 0)
                                                });
                                            </script>
                                            <ul style="list-style-type: none;">
                                                <c:forEach items="${requestScope.service}" var="list">
                                                    <li id="${list.id}">
                                                        ${list.fullname} : 
                                                    </li>
                                                    <script>
                                                        $(document).ready(function () {
                                                        drawRate(${star[list.id -1]},${list.id})
                                                        });
                                                    </script>
                                                </c:forEach>
                                            </ul>
                                        </div>


                                    </div>
                                </div>
                                <div  style="margin-bottom: 10px;" class=" col-md-6">
                                    <div class="card">

                                        <div style="height: max-content; min-height: 380px ;text-align: center" class="header">

                                            <h4>Total Customer : ${requestScope.Customer}</h4>
                                            <ul style="list-style-type: none;">

                                                <li id="${list.id}">
                                                    Newly Registed  : ${requestScope.registed} : 
                                                </li>

                                                Newly Reserved : ${requestScope.reserved} : 
                                                </li>


                                            </ul>
                                        </div>


                                    </div>
                                </div>
                                <div  style="margin: 10px 0;" class=" col-md-12">
                                    <div class="card">

                                        <div style="text-align: center" class="header">
                                            <h3 class="title">Trend</h3>
                                            <form id="myForm" action="view" method="GET">
                                                <input onchange="submit()" id="start" type="date" name="start" max="No">
                                                <input id="end" onchange="submit()" type="date" name="end">
                                            </form>
                                            <canvas id="Chart1" style=" width:100%;max-width: 600px; margin: 0 auto;height: 300px;"></canvas>
                                        </div>

                                    </div>
                                </div>
                            </div>
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
                            <li><a href="../../admin/user/list">User</a></li>
                            
                            <li><a href="#">Chart</a></li>
                            <li><a href="../../admin/setting/list">Settings</a></li>
                           
                           


                        </ul>
                    </nav>




                    <!-- Footer -->


                </div>
            </div>
            <!-- Site footer -->

        </div>
    </div>
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


<script>
                                                       


</script>
<script>
    var xValues = ["Submited", "Cancel", "Success", "Pending", "Approve", "Reject"];
    var yValues = [${requestScope.Submit},${requestScope.Cancel},${requestScope.Success},${requestScope.Pending},${requestScope.Approve},${requestScope.Reject}];
    var barColors = [
            "#00aba9",
            "#b91d47",
            "#2b5797",
            "#f7ef02",
            "#0026ff",
            "#ff0000"
    ];
    new Chart("myChart", {
    type: "pie",
            data: {
            labels: xValues,
                    datasets: [{
                    backgroundColor: barColors,
                            data: yValues
                    }]
            },
            options: {
            title: {
            display: true,
                    text: "World Wide Wine Production 2018"
            }
            }
    });</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script>
    $(document).ready(function () {

    });
    var xValues = [<c:forEach var = "i" begin="1" end="${requestScope.listre.size()}">
        ${i},
    </c:forEach>];
    new Chart("Chart1", {
    type: "line",
            data: {
            labels: xValues,
                    datasets: [{
                    data: [<c:forEach var = "i" items="${requestScope.listre}">
        ${i},
    </c:forEach>],
                            borderColor: "green",
                            fill: false
                    }, {
                    data: [<c:forEach var = "i" items="${requestScope.listre}">
        ${i},
    </c:forEach>],
                            borderColor: "red",
                            fill: false
                    }]
            },
            options: {
            legend: {display: false}
            }
    });
    function submit(){
        document.getElementById("myForm").submit();
    }
    </script>

<script>
    function drawRate(star, ele) {

    for (var i = 0; i < star; i++) {
    document.getElementById(ele.toString()).innerHTML += "<span class='fa fa-star checked'></span>"
    }
    for (var i = 0; i < 5 - star; i++) {
    document.getElementById(ele.toString()).innerHTML += "<span class='fa fa-star'></span>"
    }
    }


   
    var date = new Date();
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10){
    dd = '0' + dd
    }
    if (mm < 10){
    mm = '0' + mm
    }

    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("end").valueAsDate = date;
    ;
    date.setDate(date.getDate() - 7);
    document.getElementById("start").valueAsDate = date
            document.getElementById("start").setAttribute("max", today);
                        document.getElementById("end").setAttribute("max", today);

   </script>


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
    .checked {
        color: orange;
    }
    .card{
        min-height: 430px;
    }
    h4{
        margin-top: 30% !important;
    </style>
</body>

</html>
