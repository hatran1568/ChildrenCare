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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.min.js" integrity="sha512-a6ctI6w1kg3J4dSjknHj3aWLEbjitAXAjLDRUxo2wyYmDFRcz2RJuQr5M3Kt8O/TtUSp8n2rAyaXYy1sjoKmrQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link href="assets/css/toolplate-iso.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href="assets/css/bootstrap-iso.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" integrity="sha512-dqw6X88iGgZlTsONxZK9ePmJEFrmHwpuMrsUChjAw1mRUhUITE5QU9pkcSox+ynfLhL15Sv2al5A0LVyDCmtUw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" integrity="sha512-8bHTC73gkZ7rZ7vpqUQThUDhqcNFyYi2xgDgPDHc+GXVGHXq+xPjynxIopALmOPqzo9JZj0k6OqqewdGO3EsrQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="assets/css/tooplate-style.css">
        <link rel="stylesheet" href="assets/css/custom.css" />
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
                        <a href="home" class="navbar-brand">Children Care</a>
                    </div>

                    <!-- MENU LINKS -->
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="home" class="smoothScroll dropdown">Home</a></li>
                            <li><a href="service/list" class="smoothScroll dropdown">Services</a></li>
                            <li><a href="blog/list" class="smoothScroll dropdown">Blog</a></li>
                                <c:if test="${ empty sessionScope.user}">
                                <li><a style="font-size: 25px;color: #00aeef" href="cart/list" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                                <li class="appointment-btn"><a class="login-trigger" href="showlogin">Login</a></li>
                                <li class="appointment-btn"><a class="login-trigger" href="showregister">Sign up</a></li>

                            </c:if>
                            <c:if test="${not empty sessionScope.user}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Personal</a>
                                    <div class="dropdown-menu">
                                        <p class="dropdown-link dropdown-item"> <a href="customer/reservation/my" class="smoothScroll">My Reservation</a></p>
                                        <p class="dropdown-link dropdown-item"> <a href="customer/myprescription/exams" class="smoothScroll">My Prescriptions</a></p>
                                    </div>
                                </li>
                                <c:if test="${sessionScope.user.role.name == 'Manager' || sessionScope.user.role.name == 'Admin'}">

                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle"  data-toggle="dropdown">Manage</a>
                                        <div class="dropdown-menu">
                                            <p class="dropdown-link dropdown-item"> <a href="manager/customer/list">Customers</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/reservation/list">Reservations</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/feedback/list">Feedbacks</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/post/list">Posts</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/slider/list">Sliders</a></p>
                                            <p class="dropdown-link dropdown-item"> <a href="manager/service/list">Services</a></p>
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
                                <li><a style="font-size: 25px;color: #00aeef" href="cart/list" class="smoothScroll"><i class="fa fa-shopping-cart"></i></a></li>
                                <div class="dropdown ">
                                    <img class="avatar" src="${sessionScope.user.imageLink}">

                                    <div class="dropdown-content">
                                        <p> <a href="userprofile">Profile</a></p>
                                        <p> <a href="customer/changepassword">Change Password</a></p>
                                        <p> <a href="logout">Log Out</a></p>
                                    </div>
                                </div>
                                <p class="dropdown-name" style="margin:auto; color: black">${sessionScope.user.fullName}</p>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </section>
        </div>

        <!-- NEWS -->
        <div class="container" style="margin-top: 25px; height: max-content; min-height: 700px;">
            <form novalidate  id="form" enctype="multipart/form-data" action="feedback/add" method="POST" class="ui form">
                <h4 class="ui dividing header">Contact Information</h4>
                <div class="two fields">
                    <div class="twelve wide  field">
                        <label  for="validationCustom01">Name</label>

                        <input value="${sessionScope.user.fullName}" pattern="[A-Za-z]{6+}"  id="validationCustom01" required="true" type="text" name="fullname" placeholder="Bo Yates">

                        <div class="invalid-feedback">
                            Please input a valid name at least 6 characters
                        </div>
                    </div>
                    <div class="four wide  field">
                        <label>Gender</label>
                        <div class="two fields">
                            <div class="eight wide field"><label style="display: inline-block; margin-right: 5px;" >Male :</label> <input id="male"  type="radio" name="gender" gender checked="true" value="true"> </div>
                            <div class="eight wide  field"><label style="display: inline-block; margin-right: 5px;" >Female :</label> <input <c:if test="${sessionScope.user.gender eq 'false'}"> checked='true'</c:if>  type="radio" name="gender"  value="false"></div>
                            </div>




                        </div>
                    </div>

                    <div class="two fields">
                        <div class="field">
                            <label for="validationCustom02" >Email</label>

                            <input value="${sessionScope.user.email}" pattern="[^ @]*@[^ @]*"  id="validationCustom02" required="true" type="text" name="email" placeholder="Email@abc.com">

                        <div class="invalid-feedback">
                            Please input a valid email
                        </div>
                    </div>

                    <div class="field">
                        <label>Mobile</label>

                        <input value="${sessionScope.user.mobile}" required="true" pattern="[0-9]{10}" type="text" name="mobile" placeholder="01234456789">
                        <div class="invalid-feedback">
                            Please input a valid phone with 10 digits
                        </div>
                    </div>
                </div>

                <div class="two fields">
                    <div class="four wide field">
                        <label>Image</label>
                        <input  onchange="loadFile(event)"  name="file" type="file" accept="image/*,.jpg">
                        <img style="  box-sizing: border-box;
                             width: 100%; height: auto; 
                             " id="output"  > 
                    </div>
                    <div style="display: none; color: red" id="alertfile">
                        File size exceeded 10MB!
                    </div>
                    <div class="twelve wide field">
                        <label>Feedback</label>
                        <textarea required="true"  name="note"></textarea>
                        <div class="invalid-feedback">
                            Please input a valid email
                        </div>
                        <input hidden="true" id="star" type="text" name="star">
                        <input hidden="true" value="${requestScope.id}"  type="text" name="sid">
                    </div>
                </div>

                <div class="two fields">
                    <div class="twelve wide field">
                        <label>Rating</label>
                        <div class="card-body text-center"> 

                            <fieldset style="text-align: left" class="rating"> 
                                <input type="radio" id="star5" name="rating" value="5" />
                                <label class="full" for="star5" title="Awesome - 5 stars"></label> 

                                <input type="radio" id="star4" name="rating" value="4" />
                                <label class="full" for="star4" title="Pretty good - 4 stars"></label>

                                <input type="radio" id="star3" name="rating" value="3" />
                                <label class="full" for="star3" title="Meh - 3 stars"></label> 

                                <input type="radio" id="star2" name="rating" value="2" />
                                <label class="full" for="star2" title="Kinda bad - 2 stars"></label> 

                                <input type="radio" id="star1" name="rating" value="1" />
                                <label class="full" for="star1" title="Sucks big time - 1 star"></label>

                                <input type="radio" class="reset-option" name="rating" value="reset" /> </fieldset>
                        </div>
                    </div>
                    <div class="four wide field">
                        <label></label>
                        <input id="sub" hidden="true" type="submit" value="submit">
                        <div onclick="feedback()" class="ui button" tabindex="0">Submit Feedback</div>
                    </div>
                </div>


            </form>
        </div>




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

        <!-- SCRIPTS -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.sticky.js"></script>
        <script src="assets/js/jquery.stellar.min.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/smoothscroll.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/custom-new.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
                            $('ul.nav li.dropdown').hover(function () {
                                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
                            }, function () {
                                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
                            });

                            $(document).ready(function () {

                                $("input[type='radio']").click(function () {
                                    var sim = $("input[name='rating']:checked").val();
                                    console.log(sim);
                                    $("#star").val(sim)
                                    console.log($("#star").val());


                                });
                            });
                            function submit() {
                                document.getElementById("form").submit();

                            }

                            function feedback() {
                                

                                $('#sub').click();


                            }
        </script>
        <script>
            var loadFile = function (event) {
                var output = document.getElementById('output');
                output.src = URL.createObjectURL(event.target.files[0]);
                output.onload = function () {
                    URL.revokeObjectURL(output.src) // free memory
                }
            };
        </script>
        <script>
            (function () {
                'use strict'

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('form')


                // Loop over them and prevent submission
                Array.prototype.slice.call(forms)
                        .forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (!form.checkValidity()) {
                                    event.preventDefault()
                                    event.stopPropagation()
                                }

                                form.classList.add('was-validated')
                            }, false);
                            form.addEventListener('submit', function (event) {
                                if (document.getElementById('alertfile').style.display === 'block') {
                                    event.preventDefault()
                                    event.stopPropagation()
                                }
                                form.classList.add('was-validated')
                            }, false)
                        })
            })()
        </script>

        <style>
            .rating {
                position: relative;
                left: -70%;
                border: none;
                margin-right: 49px
            }

            .myratings {
                font-size: 85px;
                color: green
            }

            .rating>[id^="star"] {
                display: none
            }

            .rating>label:before {
                margin: 5px;
                font-size: 2.25em;
                font-family: FontAwesome;
                display: inline-block;
                content: "\f005"
            }

            .rating>.half:before {
                content: "\f089";
                position: absolute
            }

            .rating>label {
                color: #ddd;
                float: right
            }

            .rating>[id^="star"]:checked~label,
            .rating:not(:checked)>label:hover,
            .rating:not(:checked)>label:hover~label {
                color: #FFD700
            }

            .rating>[id^="star"]:checked+label:hover,
            .rating>[id^="star"]:checked~label:hover,
            .rating>label:hover~[id^="star"]:checked~label,
            .rating>[id^="star"]:checked~label:hover~label {
                color: #FFED85
            }

            .reset-option {
                display: none
            }

            .reset-button {
                margin: 6px 12px;
                background-color: rgb(255, 255, 255);
                text-transform: uppercase
            }

            .mt-100 {
                margin-top: 100px
            }

            .card {
                position: relative;
                display: flex;
                width: 350px;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid #d2d2dc;
                border-radius: 11px;
                -webkit-box-shadow: 0px 0px 5px 0px rgb(249, 249, 250);
                -moz-box-shadow: 0px 0px 5px 0px rgba(212, 182, 212, 1);
                box-shadow: 0px 0px 5px 0px rgb(161, 163, 164)
            }

            .card .card-body {
                padding: 1rem 1rem
            }

            .card-body {
                flex: 1 1 auto;
                padding: 1.25rem
            }



            .btn:focus {
                outline: none
            }

            .btn {
                border-radius: 22px;
                text-transform: capitalize;
                font-size: 13px;
                padding: 8px 19px;
                cursor: pointer;
                color: #fff;
                background-color: #D50000
            }

            .btn:hover {
                background-color: #D32F2F !important
            }
        </style>

    </body>

</html>