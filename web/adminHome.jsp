<%-- 
    Document   : adminHome
    Created on : Jun 29, 2023, 3:30:17 PM
    Author     : tanki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <%@include file="all_component/allCss.jsp" %>

    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>





        <style>
            body {
                background-image:url("img/istockphoto-470721440-612x612.jpg");
            }


            .custom-dropdown .dropdown-menu {
                position: absolute !important;

            }
            .dropdown:hover .dropdown-menu {
                display: block;

            }
            .dropdown-item {
                text-align: center;
            }

        </style>
        <div class="container" >

            <div class="row p-5">
                <div class="col-md-3 ">

                    <div class="card">
                        <div class="card-body text-center" >

                            <div class="dropdown custom-dropdown">
                                <a class="dropdown" id="dropdownMenu" data-toggle="dropdown"  aria-haspopup="true" aria-expaned="false">
                                    <i class="fa-solid fa-book-open fa-3x text-danger"></i>
                                </a>
                                <div class="dropdown-menu"  aria-labelledby="dropdownMenu">
                                    <a class="dropdown-item" href="add">Add new book</a>
                                    <a class="dropdown-item" href="list">Show books</a>
                                </div>
                            </div>
                            <h5>Book Management</h5>


                            <!--                        <a href=" ">1. Add new book</a>
                                                    <br> comment 
                                                    <a href=" ">2. Show list of  book</a>-->

                        </div>
                    </div>
                    </a>


                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center text-primary">
                            <i class="fa-solid fa-book-open fa-3x"></i>
                            <h5>Librarian Management</h5>
                        </div>
                    </div>

                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center text-warning">
                            <i class="fa-solid fa-book-open fa-3x"></i>
                            <h5>Librarian Management</h5>
                        </div>
                    </div>

                </div>

                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center text-primary">
                            <a href="feedback">

                                <i class="fa-solid fa-book-open fa-3x"></i> 
                                <h5>Feedback</h5> </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>



    </body>






</html>
