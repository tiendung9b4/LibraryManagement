<%-- 
    Document   : rLibCard
    Created on : Jul 10, 2023, 4:07:54 PM
    Author     : tanki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Library Card Form</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <style>
            body {
                background: url(img/istockphoto-470721440-612x612.jpg);
            }
        </style>
        <%@include file="all_component/navbar.jsp"%>
        <!--<div class="container-fluid">-->
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-5 mt-md-4 pb-5">

                                    <h2 class="fw-bold mb-2 text-uppercase">Registration Libary Card</h2>
                                    <form action="rLibCard" method="post"> 
                                        <p class="text-danger alert">${mess1}</p>
                                        <p class="text-danger alert">${mess2}</p>
                                        <p class="text-danger alert">${mess3}</p>
                                        <input type="hidden" value="${sessionScope.acc.id}" name="userId" />
                                        <%--<c:if test="${mess2 != null}">--%>
                                        <div class="form-outline form-white mb-4">
                                            <label for="month">Choose card duration:</label>
                                            <select id="month" name="month">
                                                <option value="1">1 month</option>
                                                <option value="3">3 months</option>
                                                <option value="6">6 months</option>
                                                <option value="12">A year</option>
                                            </select>
                                            <br>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <label for="numb">Choose max book can borrow:</label>
                                            <select id="numb" name="numB">
                                                <option value="5">5 books</option>
                                                <option value="10">up to 10 books</option>
                                                <option value="15">up to 15 books</option>
                                            </select>
                                            <br>
                                        </div>
                                        
                                        <button class="btn btn-outline-warning btn-lg px-5" type="submit">Confirm</button>
                                    </form>
                                    <%--</c:if>--%>   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--</div>-->
    </body>
</html>
