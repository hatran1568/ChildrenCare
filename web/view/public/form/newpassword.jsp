
<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>New Password</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.min.js" integrity="sha512-a6ctI6w1kg3J4dSjknHj3aWLEbjitAXAjLDRUxo2wyYmDFRcz2RJuQr5M3Kt8O/TtUSp8n2rAyaXYy1sjoKmrQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css" integrity="sha512-usVBAd66/NpVNfBge19gws2j6JZinnca12rAe2l+d+QkLU9fiG02O1X8Q6hepIpr/EYKZvKx/I9WsnujJuOmBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="../assets/css/stylelogin.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/font.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <meta name="robots" content="noindex, follow">
    </head>
    <body>
        <div class="main">



            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <div style=" display: inline-block; margin-bottom: 30px"><a href="../home"><i class="fas fa-home"></i></a><i style="margin : 5px;" class="fas fa-angle-right"></i><span >Reset Password</span></div>
                              <c:if test="${not empty requestScope.mess}">
                                <div class="alert alert-danger" role="alert">
                                    ${requestScope.mess}
                                </div>
                            </c:if>
                            <h2 class="form-title">Sign up</h2>
                            <form oninput='cpass.setCustomValidity(cpass.value !=npass.value ? "Passwords do not match." : "")' novalidate  method="POST" action="update" class="register-form needs-validation" id="register-form">
                               
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input pattern="[A-Za-z0-9]{8,12}" required="true"  type="password" name="npass" id="pass" placeholder="Password"/>
                                    <div class="invalid-feedback">
                                        Please input a valid password in range [8,12] characters
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input pattern="[A-Za-z0-9]{8,12}" type="password" name="cpass" id="re_pass" placeholder="Repeat your password"/>
                                    <div class="invalid-feedback">
                                       Passwords do not match
                                    </div>
                                </div>
                               
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Reset Password"/>
                                    
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="../assets/images/signup-image.jpg" alt="sing up image"></figure>

                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="assets/js/main.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


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

    </body>
</html> 