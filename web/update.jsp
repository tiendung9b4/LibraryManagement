<%-- 
    Document   : update
    Created on : Jun 4, 2023, 4:08:44 PM
    Author     : trant
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">  
        <title>Update</title>

        <style>
            body {
                background-color: skyblue;
                background-image: url("img/emil-widlund-xrbbXIXAWY0-unsplash.jpg")

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

                                    <form action="update" method="post" class="updateForm" enctype="multipart/form-data" >

                                        <div class="text-center p-3" style="font-size: 40px; border-bottom: solid 3px black">Update Book</div>
                                        <div class="form-outline form-white mb-4">
                                            Title: <input id="title" class="form-control form-control-lg" type="text" name="title" value="${product.getTitle()}" />
                                            <br>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            Author:
                                            <input class="form-control form-control-lg" type="text" name="author" value="${product.getAuthor()}" />
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            Publication year:
                                            <input class="form-control form-control-lg"  type="text" name="publicYear" value="${product.getPublicY()}" />
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            Describe:
                                            <input class="form-control form-control-lg" type="text" name="describe" value="${product.getDescribe()}" />
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
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            Quantity:
                                            <input class="form-control form-control-md" type="number" name="number" value="${product.getNumber()}" />
                                        </div>        
                                        <div class="form-group">
                                            <label for="img">Upload Image</label>                          
                                            <input id="img" class="form-control-file" type="file" name="img">
                                            <input type="hidden" name="oldImgPath" value="${product.getImg()}">
                                            <br>
                                        </div>

                                        <input class="button" style="width: 200px" type="submit" value="Update" />
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <!--        <div class="container d-flex justify-content-center">
                    <form action="update" method="post" class="updateForm">
                        <table border="0">
                            <div class="text-center p-3" style="font-size: 40px; border-bottom: solid 3px black">Update Book</div>
        
                            <tbody class="text-center">
                                <tr>
                                    <td class="td1">Title:</td>
                                    <td class="td2"><input type="text" name="title" value="${product.getTitle()}" /></td>
                                </tr>
                                <tr>
                                    <td class="td1">Author:</td>
                                    <td class = "td2"><input type="text" name="author" value="${product.getAuthor()}" /></td>
                                </tr>
                                <tr>
                                    <td class="td1">Publication year:</td>
                                    <td class="td2"><input type="text" name="publicYear" value="${product.getPublicY()}" /></td>
                                </tr>
                                <tr>
                                    <td class="td1">Describe:</td>
                                    <td class="td2"><input type="text" name="describe" value="${product.getDescribe()}" /></td>
                                <tr>
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
                            </tr>
                            <tr>
                                <td class="td1">Images:</td>
                                <td class="td2"><input type="file" name="img" value="${product.getImg()}" /></td>
                            </tr>
                            </tbody>
                        </table>
                        <br>
                        <input class="button" style="width: 200px" type="submit" value="Update" />
                    </form>
        
        
                </div>-->

    </body>
</html>
