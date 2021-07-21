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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="../../assets/css/toolplate-iso.css" rel="stylesheet" type="text/css"/>
        <link rel ="stylesheet" href="../../assets/css/bootstrap-iso.css">
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
                                <li class="appointment-btn"><a class="login-trigger" href="../../showlogin">Login</a></li>
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
                                    <img class="avatar" src="${sessionScope.user.imageLink}">

                                    <div class="dropdown-content">
                                        <p> <a href="../../userprofile">Profile</a></p>
                                        <p> <a href="../../customer/changepassword">Change Password</a></p>
                                        <p> <a href="../../logout">Log Out</a></p>
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
        <div class="section" id="main-body">
            <div class="container" style="min-height: 600px">
                <form id="form" class="needs-validation" action="update" method="POST" enctype="multipart/form-data" novalidate>

                    <input type="text" value="${requestScope.post.id}" name="pid" hidden>
                    <div class="row">
                        <div class="col-md-3">Thumbnail</div>
                        <div class="col-md-9">

                            <img src="../../${requestScope.post.thumbnailLink}" id="output" style="max-width: 500px"><br>
                            <input class="form-control" onchange="loadFile(event)"  name="file" type="file" accept="image/*,.jpg">
                            <div style="display: none; color: red" id="alertfile">
                                File size exceeded 50MB!
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-3">Category</div>
                        <div class="col-md-9">
                            <select class="form-control"  name="postCategory">
                                <c:forEach items="${requestScope.categories}" var="c">
                                    <option value="${c.id}" <c:if test="${c.id == requestScope.post.category.id}">selected</c:if>>${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div> 
                    <hr />
                    <div class="row">
                        <div class="col-md-3">Title</div>
                        <div class="col-md-9">
                            <input class="form-control"  value="${requestScope.post.title}" style="width: 100%" type="text" name="title" required>
                        </div>
                        <div class="invalid-feedback">
                            Post title can't be blank!
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-3">Description</div>
                        <div class="col-md-9">
                            <textarea class="form-control" style="width: 100%" type="text" name="description">${requestScope.post.description}</textarea>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-3">Content</div>
                        <div class="col-md-9">
                            <textarea class="form-control" style="width: 100%; height: 300px" type="text" name="content">${requestScope.post.content}</textarea>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-3">Featured</div>
                        <div class="col-md-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="featured"  value="true" <c:if test="${requestScope.post.featured eq true}">checked</c:if>>True
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="featured"  value="false" <c:if test="${requestScope.post.featured eq false}">checked</c:if>>False
                                </div>
                            </div>
                        </div>
                        <hr />
                        <input type="text" value="" id="status" name="status" hidden>
                        <input id="submit_handle" type="submit" style="display: none">
                        <button type="button" class="btn btn-primary pull-right" onclick="saveDraftPost()" id="saveDraft">Save draft</button>
                        <button type="button" class="btn btn-primary pull-right" onclick="savePost()" id="save">Save</button>
                    </form>
                </div>
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
            <script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
            <script src="../../assets/js/wow.min.js"></script>
            <script src="../../assets/js/smoothscroll.js"></script>
            <script src="../../assets/js/owl.carousel.min.js"></script>
            <script src="../../assets/js/custom-new.js"></script>

          
            <script>
                CKEDITOR.replace('content');
            </script>
            <script>
                var maxFileSize = 1024 * 1024;
                function savePost() {
                    document.getElementById("status").value = "25";
                    
                    $('#submit_handle').click();
                }
                function saveDraftPost() {
                    document.getElementById("status").value = "24";

                    $('#submit_handle').click();
                }
                var loadFile = function (event) {
                    //alert(event.target.files[0].size);
                    if (event.target.files[0].size <= maxFileSize) {
                        var output = document.getElementById('output');
                        output.src = URL.createObjectURL(event.target.files[0]);
                        output.onload = function () {
                            URL.revokeObjectURL(output.src) // free memory
                        }
                        document.getElementById('alertfile').style.display = 'none';
                    } else {
                        document.getElementById('alertfile').style.display = 'block';
                    }
                };
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
            #main-body{
                margin-top: 50px;
                margin-bottom: 50px;
            }
            #save{
                margin: 20px;
            }
            #saveDraft{
                margin: 20px;
            }
        </style>
    </body>
</html> 