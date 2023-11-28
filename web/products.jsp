<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">  

        <title>Books List</title>
        <style>
            img {

                width: 120px;
                height: 150px;
                display:block;
            }
        </style>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">

        <%@include file="all_component/navbar.jsp" %>
        <div class="row">
            <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

            <div class="container-fluid ml-2 mr-2 p-3" style="background-color: white ">
                <h3 class="text-center">List of books in library</h3>
                <hr>

                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Title</th>
                            <th>Catalogy</th>
                            <th>Author</th>
                            <th>Publication Year</th>
                            <th>Describe</th>
                            <th>Images</th>
                            <th>Quantity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--   for (Todo todo: todos) {  -->
                        <c:forEach items="${requestScope.data}" var="c">
                            <tr>
                                <td>${c.bookId}</td>
                                <th>${c.title}</th>
                                <td>${c.category}</td>
                                <td>${c.author}</td>
                                <td>${c.publicY}</td>
                                <td>${c.describe}</td>
                                <td><img  src="img/${c.img}" alt="404"/></td>
                                <td>${c.number}</td>
                                <td>
                                    <a href="update?id=${c.bookId}">Update <i class="fa-solid fa-file-pen"></i> </a>

                                    <a href="#" style="color: red" onclick="onMess(${c.bookId})">Delete<i class="fa-solid fa-trash-can"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        <!-- } -->
                    </tbody>

                </table>
                <div class="container-fluid text-left" style="background: white">

                    <a  style="border-radius: 20px"  href="add" class="btn btn-success">Add New <i class="fa-solid fa-square-plus fa-xl"></i> </a>
                </div>

            </div>
        </div>







        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
    <script>
                                        function onMess(id) {
                                            if (confirm("Delete this product?")) {
                                                window.location.href = "delete?bookId=" + id;
                                            }
                                        }
    </script>

</html>
