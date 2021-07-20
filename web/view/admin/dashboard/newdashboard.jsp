<!DOCTYPE html>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>FrontendFunn - Semantic UI - Sample Admin Dashboard Template</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"
            integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q="
            crossorigin="anonymous"
            />

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"
            integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ="
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="../../assets/css/style.css" />
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
    </head>

    <body>
        <!-- sidebar -->
        <div class="ui sidebar inverted vertical menu sidebar-menu" id="sidebar">
            <div class="item">
                <div class="header">General</div>
                <div class="menu">
                    <a class="item">
                        <div>
                            <i class="icon tachometer alternate"></i>
                            Dashboard
                        </div>
                    </a>
                </div>
            </div>
            <div class="item">
                <div class="header">
                    Administration
                </div>
                <div class="menu">
                    <a href='../setting/list' class="item">
                        <div><i class="cogs icon"></i>Settings</div>
                    </a>
                    <a href='../user/list' class="item">
                        <div><i class="users icon"></i>User</div>
                    </a>
                </div>
            </div>


            <div class="item">
                <div class="header">Other</div>
                <div class="menu">
                    <a href="../../home" class="item">
                        <div>
                            <i class="icon envelope"></i>
                            Homepage
                        </div>
                    </a>
                </div>
            </div>

            <div class="item">
                <form action="#">
                    <div class="ui mini action input">
                        <input type="text" placeholder="Search..." />
                        <button class="ui mini icon button">
                            <i class=" search icon"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="ui segment inverted">
                <div class="ui tiny olive inverted progress">
                    <div class="bar" style="width: 54%"></div>
                    <div class="label">Monthly Bandwidth</div>
                </div>

                <div class="ui tiny teal inverted progress">
                    <div class="bar" style="width:78%"></div>
                    <div class="label">Disk Usage</div>
                </div>
            </div>
        </div>

        <!-- sidebar -->
        <!-- top nav -->

        <nav class="ui top fixed inverted menu">
            <div class="left menu">
                <a href="#" class="sidebar-menu-toggler item" data-target="#sidebar">
                    <i class="sidebar icon"></i>
                </a>
                <a href="#" class="header item">
                    Semantic UI
                </a>
            </div>

            <div class="right menu">
                <a href="#" class="item">
                    <i class="bell icon"></i>
                </a>
                <div class="ui dropdown item">
                    <i class="user cirlce icon"></i>
                    <div class="menu">
                        <a href="../../userprofile" class="item">
                            <i class="info circle icon"></i> Profile</a
                        >
                        <a href="../../logout" class="item">
                            <i class="sign-out icon"></i>
                            Logout
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- top nav -->

        <div class="pusher">
            <div class="main-content">
                <div class="ui grid stackable padded">
                    <div
                        class="four wide computer eight wide tablet sixteen wide mobile column"
                        >
                        <div class="ui fluid card">
                            <div class="content">
                                

                                <div style="text-align: center" class="header">
                                    <h4 style="margin-top: 0;" class="title">Reservation Statistics</h4>

                                    <canvas id="myChart" style=" width:100%;max-width:700px;height: 300px;"></canvas>
                                </div>
                            </div>
                            <div class="extra content">
                                <div onclick="window.location.href='../../manager/reservation/list'" class="ui two buttons">
                                    <div class="ui red button">More Info</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div
                        class="four wide computer eight wide tablet sixteen wide mobile column"
                        >
                        <div class="ui fluid card">
                            <div class="content">
                                                               <div style="height: max-content; min-height: 350px ;text-align: center" class="header">
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
                            <div class="extra content">
                                <div onclick="window.location.href='../../manager/service/list'" class="ui two buttons">
                                    <div class="ui green button">More Info</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div
                        class="four wide computer eight wide tablet sixteen wide mobile column"
                        >
                        <div class="ui fluid card">
                            <div class="content">
                              
                                <div style="height: max-content; min-height: 350px ;text-align: center" class="header">

                                    <h4>Total Customer : ${requestScope.Customer}</h4>
                                    <ul style="list-style-type: none;">
                                        <li><br></li>
                                        <li>
                                            Newly registered : ${requestScope.registed}
                                        </li>
                                        <li>
                                            Newly Reserved : ${requestScope.reserved}
                                        </li>


                                    </ul>
                                </div>
                            </div>
                            <div class="extra content">
                                <div onclick="window.location.href='../../manager/customer/list'" class="ui two buttons">

                                    <div class="ui teal button">More Info</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div
                        class="four wide computer eight wide tablet sixteen wide mobile column"
                        >
                        <div class="ui fluid card">
                            <div class="content">

                                <div style="height: max-content; min-height: 350px ;text-align: center" class="header">
                                    <h4 id="0" class="title">Average Rating : <br></h4>
                                    <script>
                                        $(document).ready(function () {
                                        drawRate(${requestScope.tostar}, 0)
                                        });
                                    </script>
                                    <ul style="list-style-type: none;">
                                        <li></li>
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
                            <div class="extra content">
                                <div onclick="window.location.href='../../manager/feedback/list'" class="ui two buttons">
                                    <div class="ui purple button">More Info</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui grid stackable padded">
                    <div class="column">
                        <div style="text-align: center" class="header">
                            <h3 class="title">Trend</h3>
                            <form id="myForm" action="view" method="GET">
                                <input onchange="submit()" id="start" type="date" name="start" <c:if test="${not empty param.start}">value="${param.start}"</c:if> max="No">
                                    <input id="end" onchange="submit()" type="date"<c:if test="${not empty param.end}">value="${param.end}"</c:if> name="end">
                                </form>
                                <canvas id="Chart1" style=" width:100%;max-width: 600px; margin: 0 auto;height: 300px;"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="ui grid stackable padded">
                        <div
                            class="four wide computer eight wide tablet sixteen wide mobile  center aligned column"
                            >
                           
                        </div>
                     
                </div>
            </div>

            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
                integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
                crossorigin="anonymous"
            ></script>
            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"
                integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI="
                crossorigin="anonymous"
            ></script>
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
                                        if (dd < 10) {
                                        dd = '0' + dd
                                        }
                                        if (mm < 10) {
                                        mm = '0' + mm
                                        }

                                        today = yyyy + '-' + mm + '-' + dd;
            <c:if test="${empty param.start or empty param.end}">
                                        document.getElementById("end").valueAsDate = date;
                                        date.setDate(date.getDate() - 7);
                                        document.getElementById("start").valueAsDate = date
                                                document.getElementById("start").setAttribute("max", today);
                                        document.getElementById("end").setAttribute("max", today);
            </c:if>
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
                            text: ""
                    }
                    }
            });</script>
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
                                    borderColor: "red",
                                    fill: false
                            }, {
                            data: [<c:forEach var = "i" items="${requestScope.listSuccessre}">
                ${i},
            </c:forEach>],
                                    borderColor: "green",
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
        <script src="../../assets/js/script.js"></script>
    </body>
</html>
