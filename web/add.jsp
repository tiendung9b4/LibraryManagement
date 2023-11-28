<%-- 
    Document   : add
    Created on : Jun 2, 2023, 12:28:39 AM
    Author     : trant
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">

        <style>
            body {
                background-color: skyblue;
                background-image: url("img/emil-widlund-xrbbXIXAWY0-unsplash.jpg")
            }
            .inputForm {
                background-color: whitesmoke;
                color: black;
                margin-top: 5%;
                height:100%;
                width: 50%;
            }
            .inputForm div {
                float: left;
                width: 39%;
                padding-left: 5%;
                margin-top: 3%;
            }
            .inputForm input {

            }
            .inputForm button {
                border: 1.5px solid black;
                background-color: green;
                margin-left: 240px;
                width: 20%;
                text-align: center;
                margin-bottom: 2%;
                margin-top: 3%;
                color: black;
                font-size: large;
                font-weight: 500;
            }


        </style>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>

        <%@include file="all_component/navbar.jsp" %>

        <br>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-5 mt-md-4 pb-5">

                                    <h2 class="fw-bold mb-2 text-uppercase">ADD BOOK</h2>
                                    <p class="text-danger alert">
                                        ${mess}
                                    </p>
                                    <form action="add" method="post">
                                        <div class="form-outline form-white mb-4">
                                            <input type="text" class="form-control form-control-lg" name="title" placeholder="Book Title" />
                                            <br>
                                        </div>

                                        <div class="form-outline form-white mb-4">
                                            <input type="text" class="form-control form-control-lg" name="author" placeholder="Author Name" />
                                            <br>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <input type="text" class="form-control form-control-lg" name="publicYear" placeholder="Publication Year" />
                                            <br>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <input type="text" class="form-control form-control-lg" name="describe" placeholder="Describe about the book" />
                                            <br>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <label for="cid">Choose Catalogy:</label>
                                            <select id="cid" name="cid">
                                                <option value="1">Mystery/Thrille</option>
                                                <option value="2">Romance</option>
                                                <option value="3">Science Fiction/Fantasy</option>
                                                <option value="4">Young Adult</option>
                                                <option value="5">Historical Fiction</option>
                                                <option value="6">Non-fiction</option>
                                                <option value="7">Literary Fiction</option>
                                                <option value="8">Detective</option>
                                            </select>
                                            <br>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <input type="text" class="form-control form-control-lg" name="number" placeholder="Quantity" />
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <label for="img">Upload Image</label>
                                            <input type="file" class="form-control-file" name="img" id="img"/>
                                            <br>
                                        </div>
                                        <button class="btn btn-outline-light btn-lg px-5" type="submit">Add </button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <!--
                <div class="container d-flex justify-content-center">
                    <form class="inputForm" action="add" method="POST" >
        
        
        
                        <input  type="number" name="caId" placeholder="Catalogy ID"><br><br>
                        <input type="text" name="name" placeholder="Title"><br><br>
                        <input type="text" name="note" placeholder="Author"><br><br>
                        <input type="text" name="img" placeholder="Img Source"><br><br>
                        <button type="submit">Add</button>
        
                                    ID: 
                                    <input type="text" name="id"><br><br> 
        
                    </form>
        
        
                </div>-->




    </body>
</html>
