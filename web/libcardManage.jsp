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

        <title>Libary Card List</title>
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
                <h3 class="text-center">Library Card Wait List</h3>
                <hr>

                <br>
                <div id="result">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Card ID</th>
                                <th>UserID</th>
                                <th>Status</th>
                                <th>Max Book</th>
                                <th>Book borrowing</th>
                                <th>Day Start</th>
                                <th>Day End</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   for (Todo todo: todos) {  -->
                            <c:forEach items="${requestScope.data}" var="c">
                                <tr>
                                    <td>${c.cardId}</td>
                                    <th>${c.userId}</th>
                                    <td> 
                                        <span id="status_${c.cardId}"
                                              class="${c.status == 0 ? 'text-danger' : 'text-success'}">
                                            ${c.status == 0 ? 'Not active' : 'Active'}
                                        </span>
                                    </td>
                                    <td>${c.maxBook}</td>
                                    <td>${c.numBookBorrowing}</td>
                                    <td id="startDate">${c.startDate}</td>
                                    <td id="endDate">${c.endDate}</td>
                                    <td style="width: 15%"> 
                                        <a href="#" style="color: green" onclick="confirmStatus(${c.cardId})">Confirm</a>
                                        &nbsp;&nbsp;
                                        <a href="#" style="color:black" onclick="rejectStatus(${c.cardId})">Reject </a>
                                        &nbsp;&nbsp;
                                        <a href="#" style="color: red" onclick="onMess(${c.cardId})">Delete<i class="fa-solid fa-trash-can"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
                <!--                <div class="container-fluid text-left" style="background: white">
                
                                    <a  style="border-radius: 20px"  href="add" class="btn btn-success">Add New <i class="fa-solid fa-square-plus fa-xl"></i> </a>
                                </div>-->

            </div>
        </div>








        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
    <script>
                                            function onMess(id) {
                                                if (confirm("Delete this card?")) {
                                                    window.location.href = "deleteCard?cardId=" + id;
                                                }
                                            }
                                            function confirmStatus(cardId) {
                                                $.ajax({
                                                    url: "/Assignment/statusLibcardUpdate", // Replace with the actual URL of your servlet or controller
                                                    type: "POST",
                                                    data: {cardId: cardId, status: 1}, // Pass the cardId and status value to the server
                                                    success: function (response) {
                                                        // Handle the success response here
                                                        console.log("Status updated successfully");
                                                        // Refresh the table or update the UI if needed
                                                        var statusElement = $("#status_" + cardId);
                                                        statusElement.text("Active");
                                                        statusElement.removeClass("text-danger").addClass("text-success");
                                                    },
                                                    error: function (xhr, status, error) {
                                                        // Handle the error response here
                                                        console.error("Error updating status:", error);
                                                    }
                                                });
                                            }

                                            // Function to handle the "Reject" link click
                                            function rejectStatus(cardId) {
                                                $.ajax({
                                                    url: "/Assignment/statusLibcardUpdate", // Replace with the actual URL of your servlet or controller
                                                    type: "POST",
                                                    data: {cardId: cardId, status: 0}, // Pass the cardId and status value to the server
                                                    success: function (response) {
                                                        // Handle the success response here
                                                        console.log("Status updated successfully");
                                                        var statusElement = $("#status_" + cardId);
                                                        statusElement.text("Not active");
                                                        statusElement.removeClass("text-success").addClass("text-danger");
//                                                        $("#result").html(response);
                                                        // Refresh the table or update the UI if needed
                                                    },
                                                    error: function (xhr, status, error) {
                                                        // Handle the error response here
                                                        console.error("Error updating status:", error);
                                                    }
                                                });
                                            }


    </script>

</html>
