<%-- 
    Document   : login
    Created on : Jun 21, 2023, 6:17:33 AM
    Author     : tanki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>Login</title>
    </head>
    <body>
        <style>
            .bg-custom {
                background-color: #282d32;

            }
            .navbar .nav-item:hover .nav-link {
                background-color: white;
                color: tomato;
                border-radius: 20px;
            }
            body {
                background-color: tan;

                font-family: 'Oswald', sans-serif;
                .field-icon {
                    float: right;
                    margin-left: -25px;
                    margin-top: -30px;
                    position: relative;
                    z-index: 2;
                    color: black;
                }

            }
        </style>
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
            <a class="navbar-brand" href="home"><i class="fa-solid fa-house" style="color: #f5f5f5;"></i></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">




                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a href="contactUs" class="btn btn-light my-2 my-sm-0" type="submit">Contact Us <i class="fa-solid fa-address-book"></i>  </a>

                </form>
            </div>
        </nav>




        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-5 mt-md-4 pb-5">

                                    <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                    <p class="text-danger alert">
                                        ${mess}
                                    </p>
                                    <form action="login" method="post">
                                        <div class="form-outline form-white mb-4">
                                            <label class="form-label" for="typeEmailX">Email</label>

                                            <input type="email" id="typeEmailX" class="form-control form-control-lg" name="email"  />
                                        </div>

                                        <div class="form-outline  mb-4">       
                                            <label class="form-label" for="password-field">Password</label>
                                            <input type="password" id="password-field" class="form-control form-control-lg" name="password" /> 
                                            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>                        
                                        </div> 


                                        <button class="btn btn-outline-light btn-lg px-5" type="submit">Login <i class="fa-solid fa-right-to-bracket"></i></button>

                                    </form>
                                </div>

                                <div>
                                    <p class="mb-0">Don't have an account? <a href="register.jsp" class="text-white-50 fw-bold">Sign Up <i class="fa-solid fa-user-plus"></i></a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script>
            $(".toggle-password").click(function () {

                $(this).toggleClass("fa-eye fa-eye-slash");
                var input = $($(this).attr("toggle"));
                if (input.attr("type") == "password") {
                    input.attr("type", "text");
                } else {
                    input.attr("type", "password");
                }
            });
        </script>                          
    </body>
</html>
