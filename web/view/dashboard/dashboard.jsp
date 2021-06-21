
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
                                <img class="avatar" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxQHBg0QEBIPEA4QEBEQFRgQDRcQExAaFhUWFiATFRUYHSggGB4lGxgWITEhJSkrLi4uFx8zODMsNygtLisBCgoKDQ0NFQ0NDy0ZFRkrLSs3Ky0tLisrKzctNy0rNystLS0rKysrKy0rLSsrKysrKysrKysrKysrKysrKysrK//AABEIAOEA4QMBIgACEQEDEQH/xAAbAAEAAwEBAQEAAAAAAAAAAAAAAwQFAgYBB//EADQQAQACAAMFBQcCBwEAAAAAAAABAgMEEQUSITFhQVFxgbETIlKRocHRFDQyQnKCkuHxJP/EABYBAQEBAAAAAAAAAAAAAAAAAAABAv/EABYRAQEBAAAAAAAAAAAAAAAAAAABEf/aAAwDAQACEQMRAD8A/TAGkAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAHVKTiW0iJmegOX2I1nSOM9F2mzL25zWv1lo5fLVy9eEce2Z5yauMzC2de8cdKx15/KE9dld9p8qtITVZ07Kj4p/wAUd9l2jlaJ8Y0aoaMHFyl8LnWdO+OMIHpVTNZGuNEzHu2747fGDUxijvFwpwbzW0aT69YcKgAAAAAAAAAAAAAAAAAA3Mjl/YYMfFPGfwx8vTfzFI77Q9ClWACKAAAAAAgzmXjMYWn80cpYUxuzMTzjg9IyNq4W5jxaOVo+sLEqiAqAAAAAAAAAAAAAAAALOz41zlPP0luMPZv7yvn6S3EqwARQAAAAABS2rTeyuvwzE/b7rqttGf8Ax316esAwwGmQAAAAAAAAAAAAAAAFrZ37ynn6S22FkJ0zlPH7S3UqwARQAAAAABibStM5u0azpGmnHlwhtsHPTrnL+P2WCABWQAAAAAAAAAAAAAAAE+SiZzNJiJmItHZybyHJ03MtSI7on5pkrQAgAAAAAAMDNxP6m+sTGtp5xz4t9U2nTeylp7Y0mPmsGKArIAAAAAAAAAAAAAAADc2fffylOnD5LLN2PicL1/uj0/DSZaAAAAAAAAFLa193LafFMR8uK6ydr4m9jVr8MeqwUAFZAAAAAAAAABQAAAAAEmXxpwMWLR/1t5XH/UYMW005xprrowGnsfE4Xr/d9vwlGkAigAAAAAIM3mP02Frprx056MPExJxMSbTzmdWhti/GlfGft+Wa1EAAAAAAAAAAABAAAAAABNlMb2GPW3ZynwlCA9LE6wKWysSb5eYn+WdIXWWgAAAAFbaN5plLadI+YMrOYvtszaezlHhCAGkABAAAAAAAAAAAAAAAAAAGxsmNMtPW0+kLqts+m5k6ddZ+c6rLLQAAAArbRjXJ38p+sLKPMU38C8d9Zj6A88A0yAAAAAAAAAAAAAAAAAAOqV37xEc5nQpSb20iJmejVyGS9jO9b+L0FXaxu1iO6NH0GVAAAAAAefzWH7LMWjrrHhKJt57KfqK6xwtHLr0lj4mHOFbS0TEtRHAAgAAAAAAAAAAAAPsRvTpHGei9l9mzfjf3Y7o5/wChVGtd+2kRMz0X8vsybcbzpHdHP5tHBwK4NdKxEes+aRNMR4WDXBrpWIhICKAAAAAAAAOcTDjErpaImOroBmZjZnbSfKftLPxMOcO2lomJ6vRuMTDjFrpaImOq6jzo0cxszTjSdek/aVC9JpbSYmJ6qOQBAAAAAH2OMg+LeVyNsbjPu1+s+ELeSyG5EWvxt2R2R+ZX01cRYGXrgR7sce+eMz5pQRQAAAAAAAAAAAAAAABHjYNcaulo19Y80gDIzOzpw+Nfej6x+VF6VTzmRjHiZrwv9J8VlTGMOrVmlpieEw5VAABpbKy2vvz4V/LOrG9aIjnM6PRYVPZ4cVjlEaFWOgGVAAAAAAAAAAAAAAAAAAAAAAUdqZffw9+P4q8+sMh6WY1h57Hw/ZY1q90rEqMBUTZX9zh/1R6t8EqwARQAAAAAAAAAAAAAAAAAAAAABibS/eW8vSAWJVUBUf/Z">
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

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card">

                                        <div style="text-align: center" class="header">
                                            <h4 class="title">Email Statistics</h4>
                                            <p class="category">Last Campaign Performance</p>
                                            <canvas id="myChart" style=" width:100%;max-width:700px;height: 300px;"></canvas>
                                        </div>




                                    </div>
                                </div>  

                                <div  style="margin: 10px 0;" class=" col-md-6">
                                    <div class="card">

                                        <div style="height: max-content; min-height: 380px ;text-align: center" class="header">
                                            <h4 class="title">Total Revenue ${requestScope.sum}</h4>
                                            <ul style="text-decoration: none">
                                                <c:forEach items="${requestScope.service}" var="list">
                                                    <li>
                                                        ${list.fullname} : ${requestScope.revernue[list.id -1]}
                                                    </li>
                                                </c:forEach>
                                            </ul>

                                        </div>


                                    </div>
                                </div>
                                <div  class="col-md-6">
                                    <div class="card">

                                        <div style="height: max-content; min-height: 380px ;text-align: center" class="header">
                                            <h4 id="0" class="title">Total Revenue : </h4>
                                            <script>
                                                $(document).ready(function () {
                                                    drawRate(${requestScope.tostar}, 0)
                                                });

                                            </script>
                                            <ul style="text-decoration: none">
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
                                <div  style="margin: 10px 0;" class=" col-md-6">
                                    <div class="card">

                                        <div style="height: max-content; min-height: 380px ;text-align: center" class="header">

                                            <h4>Total Customer : ${requestScope.Customer}</h4>
                                        </div>


                                    </div>
                                </div>
                                <div  style="margin: 10px 0;" class=" col-md-12">
                                    <div class="card">

                                        <div style="text-align: center" class="header">
                                            <h4 class="title">Trend</h4>

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
                                                        var xValues = ["Submited", "Cancel", "Success"];
                                                        var yValues = [${requestScope.Submit},${requestScope.Cancel},${requestScope.Success}];
                                                        var barColors = [
                                                            "#00aba9",
                                                            "#b91d47",

                                                            "#2b5797",
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
                                                        });


</script>
<script>
    var xValues = [1,2,3,4,5,6,7];

    new Chart("Chart1", {
        type: "line",
        data: {
            labels: xValues,
            datasets: [{
                    data: [2,11,5,6,2,1,2],
                    borderColor: "green",
                    fill: false
                }, {
                    data: [2,4,1,3,2,1,1],
                    borderColor: "red",
                    fill: false
                }]
        },
        options: {
            legend: {display: false}
        }
    });</script>

<script>
    function drawRate(star, ele) {

        for (var i = 0; i < star; i++) {
            document.getElementById(ele.toString()).innerHTML += "<span class='fa fa-star checked'></span>"
        }
        for (var i = 0; i < 5 - star; i++) {
            document.getElementById(ele.toString()).innerHTML += "<span class='fa fa-star'></span>"
        }
    }
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
</style>
</body>

</html>
