

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <%@include file="all_component/allCss.jsp" %>
        <style>
            body {
                background-color: tan;
                font-family: 'Oswald', sans-serif;

            }
        </style>
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

        </style>
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
            <a class="navbar-brand" href="home"><i class="fa-solid fa-house fa-xl" style="color: #f5f5f5;"></i></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <!--                                <li class="nav-item active">
                                                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                                                    </li>
                                
                                                    <li class="nav-item active">
                                                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                                                    </li>
                                                    <li class="nav-item active">
                                                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link disabled" href="#">Disabled</a>
                                                    </li>-->
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

                                    <h2 class="fw-bold mb-2 text-uppercase">Registration</h2>
                                    <form action="register" method="post"> 
                                        <p class="text-danger alert">${mess1}</p>
                                        <p class="text-danger alert">${mess2}</p>

                                        <div class="form-outline form-white mb-4">
                                            <label class="form-label" for="typeNameX">Name</label>

                                            <input type="text" id="nameX" class="form-control form-control-lg" name="fname" />
                                        </div>

                                        <div class="form-outline form-white mb-4">
                                            <label class="form-label" for="typeEmailX">Email</label>

                                            <input type="email" id="typeEmailX" class="form-control form-control-lg" name="email" />
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <label class="form-label" for="phoneNo">Phone Number</label>

                                            <input type="number" id="phoneNo" class="form-control form-control-lg" name="phno" />
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <label class="form-label" for="typePasswordX">Password</label>

                                            <input type="password" id="typePasswordX" class="form-control form-control-lg" name="password" />
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <label class="form-label" for="type2PasswordX">Repeat Password</label>

                                            <input type="password" id="type2PasswordX" class="form-control form-control-lg" name="repass" />
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <label for="role">You are:</label>
                                            <select id="role" name="role">
                                                <option value="0">Student/Reader</option>
                                                <option value="2">Librarian</option>
                                            </select>
                                            <br>
                                        </div>

                                        <button class="btn btn-outline-primary btn-lg px-5" type="submit">Sign Up</button>
                                    </form>

                                </div>

                                <div>
                                    <p class="mb-0">If you had account let's <a href="login.jsp" class="text-white-50 fw-bold">Sign In <i class="fa-solid fa-right-to-bracket"></i></a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



    </body>
</html>
