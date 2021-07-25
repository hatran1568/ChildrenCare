<!DOCTYPE html>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Add a User</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"
            integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q="
            crossorigin="anonymous"
            />
        <link href="../../assets/css/custom.css" rel="stylesheet" type="text/css"/>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"
            integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ="
            crossorigin="anonymous"
            />
        
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>

        <link rel="stylesheet" href="../../assets/css/style.css" />
        <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
        <script type="text/javascript">
        $(document).ready(function () {
            $('#users').DataTable({
                "searching": true,
                "paging": true,
                'columnDefs': [
                    {'className': 'text-center', 'targets': 0},
                    {'className': 'text-center', 'targets': 4},
                    {'className': 'text-center', 'targets': 5},
                    {'orderable': false, 'targets' : 4},
                    {'orderable': false, 'targets' : 5},
                ],
                columns: [
                    null,
                    { data: "Type", title:"Type", className: "dt-filter" },
                    null,
                    { data: "Status", title:"Status", className: "dt-filter" },
                    null,
                    null
                ],
                initComplete: function () {
                    this.api().columns('.dt-filter').every( function () {
                        var column = this;
                        var select = $('<select style="width: 90%"><option value=""></option></select>')
                            .appendTo( $(column.footer()))
                            .on(
                                'change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).val()
                                    );
                                    column
                                        .search( val ? '^'+val+'$' : '', true, false )
                                        .draw();
                                }
                            );

                        column.data().unique().sort().each( function ( d, j ) {
                            select.append( '<option value="'+d+'">'+d+'</option>' )
                        } );
                    } );
                }
            });
        });
        </script>
    </head>

    <body>
        <!-- sidebar -->
        <div style="top: 25px;" class="ui sidebar inverted vertical menu sidebar-menu" id="sidebar">
            <div class="item">
                <div class="header">General</div>
                <div class="menu">
                    <a class="item" href="../dashboard/view">
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
          
        </div>

        <!-- sidebar -->
        <!-- top nav -->

        <nav class="ui top fixed inverted menu">
            <div class="left menu">
                <a href="#" class="sidebar-menu-toggler item" data-target="#sidebar">
                    <i class="sidebar icon"></i>
                </a>
                <a href="../../home" class="header item">
                    ChildrenCare
                </a>
            </div>

            <div class="right menu">
                <a href="#" class="item">
                    <i class="bell icon"></i>
                </a>
                <div class="ui dropdown item">
                    <img style="width: 50px" class="avatar" src="../../${sessionScope.user.imageLink}">
                    <div class="menu">
                        <a href="../../customer/userprofile" class="item">
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
                <div class="container-fluid">
                    <br><br>
                    <div><i class="fas fa-home"></i><i style="margin : 5px;" class="fas fa-angle-right"></i><a href="../dashboard/view">Dashboard</a><i style="margin : 5px;"  class="fas fa-angle-right"></i><a href="../user/list">User List</a><i style="margin : 5px;"  class="fas fa-angle-right"></i>Add a User</div>
                            <br>
                            <form action="../../admin/user/insert" method="POST" novalidate class="needs-validation">
                                <div class="form-group">
                                    <label for="email">Email</label><br>
                                    <input type="email" class="form-control" name="email" onchange="checkExistingEmail()" required placeholder="email@domain" style="width: 35%; display: inline;">
                                </div>
                                <div class="invalid-feedback">
                                        Please enter an email.
                                </div>
                                <div id="email-notify" style="display: none">
                                    Email already exists in DB
                                </div>
                                <div class="form-group">
                                    <label for="full-name">Full Name</label><br>
                                    <input type="text" class="form-control" name="full-name" required placeholder="Enter name" style="width: 35%; display: inline;">
                                </div>
                                <div class="invalid-feedback">
                                        Please enter a name.
                                </div>
                                    <!--<input type="text" class="form-control" name="password">-->
<!--                                    <input type="text" class="form-control" name="image-link" hidden>-->
                                <div class="form-group">
                                    <label for="gender" style="margin-right: 3%">Gender</label>
                                    Male <input type="radio" name="gender" value="male" checked style="margin-right: 3%">
                                    Female <input type="radio" name="gender" value="female">
                                </div>
                                <div class="form-group">
                                        <label for="mobile">Mobile</label><br>
                                        <input type="text" class="form-control" name="mobile" required pattern="[0-9]{10}" placeholder="123-45-678" style="width: 35%; display: inline;">
                                </div>
                                <div class="invalid-feedback">
                                        Please enter a valid phone number.
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label><br>
                                    <input type="text" class="form-control" name="address" required placeholder="Enter Address" style="width: 35%; display: inline;">
                                </div>
                                <div class="invalid-feedback">
                                    Please enter an address.
                                </div>
                                <div class="form-group">
                                    <label for="role">Role</label><br>
                                    <select class="form-control" name="role" style="width: 35%; height: 7%; display: inline">
                                        <c:forEach items="${requestScope.roles}" var="r">
                                            <option value="${r.id}">${r.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="Status">Status</label><br>
                                    <select class="form-control" name="status" style="width: 35%; height: 7%; display: inline">
                                        <option value="13" >Not Verified</option>
                                        <option value="14" >Active</option>
                                        <option value="15" >Contact</option>
                                        <option value="16" >Potential</option>
                                        <option value="17" >Customer</option>
                                        <option value="18" >Inactive</option>
                                        </select>
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
            </div>

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
        </style>
        <script>
            $(document).ready(function (){
                $("#male").prop("checked", true);
            });
            
// Example starter JavaScript for disabling form submissions if there are invalid fields
// Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict'

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('.needs-validation')

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms)
                        .forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (!form.checkValidity()) {
                                    event.preventDefault()
                                    event.stopPropagation()
                                }

                                form.classList.add('was-validated')
                            }, false)
                        })
            })()
        </script>
    </body>
</html>
