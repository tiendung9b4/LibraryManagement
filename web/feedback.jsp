
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        
        <style>
            th, td {
                text-align: center;
            }
            
        </style>
        
        <%@include file="all_component/navbar.jsp" %>
        <div class="row">
            <div class="container p-3" style="background-color: white ">
                <h3 class="text-center">List of feed back to administrator</h3>
                <hr>

                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Feedback</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--   for (Todo todo: todos) {  -->
                        <c:forEach items="${requestScope.data}" var="c">
                            <tr>
                                <td>${c.formId}</td>
                                <td>${c.cName}</td>
                                <td>${c.cEmail}</td>
                                <td>${c.mes}</td>
                                <td>${c.date}</td>
                            </tr>
                        </c:forEach>
                        <!-- } -->
                    </tbody>

                </table>



            </div>






        </div>
    </body>
</html>
