
<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css" integrity="sha512-usVBAd66/NpVNfBge19gws2j6JZinnca12rAe2l+d+QkLU9fiG02O1X8Q6hepIpr/EYKZvKx/I9WsnujJuOmBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="assets/css/stylelogin.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/font.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <meta name="robots" content="noindex, follow">
    </head>
    <body>
        <div class="main">



            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <div style=" display: inline-block; margin-bottom: 30px"><a href="home"><i class="fas fa-home"></i></a><i style="margin : 5px;" class="fas fa-angle-right"></i><span >Reset Password</span></div>
                            <figure><img src="assets/images/signin-image.jpg" alt="sing up image"></figure>

                        </div>
                        <div class="signin-form">
                            <c:if test="${not empty requestScope.mess}">
                                <div class="alert alert-danger" role="alert">
                                    ${requestScope.mess}
                                </div>
                            </c:if>
                            <h2 class="form-title">Sign in</h2>
                            <form novalidate="true" method="POST" action="resetoldpassword" class="register-form needs-validation" id="login-form">

                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input pattern="[^ @]*@[^ @]*" required="true" type="text" name="email" id="your_name" placeholder="Your Email" />
                                    <div class="invalid-feedback">
                                        Please enter valid email
                                    </div>
                                </div>
                                
                              
                                <div class="form-group form-button">
                                   
                                   <input type="submit" name="signup" id="signup" class="form-submit" value="Submit"/>
                                    
                                </div>
                                
                            </form>

                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="assets/js/main.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-23581568-13');
        </script>
        <script>
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
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"6724f2742ee73c2e","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2021.7.0","si":10}'></script>
    </body>
</html> 