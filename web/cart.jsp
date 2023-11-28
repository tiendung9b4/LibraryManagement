<%-- 
    Document   : cart
    Created on : Jul 18, 2023, 8:03:45 PM
    Author     : tanki
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
        <style>
            .img-cart {
                display: block;
                max-width: 50px;
                height: auto;
                margin-left: auto;
                margin-right: auto;
            }
            table tr td{
                border:1px solid #FFFFFF;
            }

            table tr th {
                background:#eee;
            }

            .panel-shadow {
                box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
            }
        </style>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>



        <div class="container bootstrap  snippets bootdey">
            <div class="col-md-9 col-sm-10 content">
                <div class="row">
                    <div class="col-md-12">
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active">Cart</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <p class="text-danger alert">
                        ${mess}
                    </p>
                    <div class="col-md-12">
                        <div class="panel panel-info panel-shadow">
                            <div class="panel-heading">
                                <h3>
                                    <img width="100px" height="100px" class="img-circle img-thumbnail" src="img/avt/${sessionScope.acc.avt}">
                                    ${sessionScope.acc.name}
                                </h3>
                            </div>
                            <div class="panel-body"> 
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Book</th>
                                                <th>Description</th>
                                                <th>Quantity</th>
                                                <th>Cancel</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <form class="form-inline" action="cartDetail" method="post">

                                            <%--<c:if test="${requestScope.cart_list != null}">--%>
                                            <c:forEach items="${cart_list}" var="c">
                                                <tr>
                                                    <td><img src="img/${c.img}" class="img-cart"></td> 
                                                    <td><strong>${c.title}</strong><p>Author : ${c.author}</p></td>
                                                    <td>
                                                        <input name="id"  class="form-input" type="hidden" value="${c.bookId}">
                                                        <div class="form-group d-flex justify-content-between">
                                                            <a class="btn btn-sm btn-decre" href="quantityDesc?action=dec&id=${c.bookId}"><i class="fas fa-minus-square"></i></a>
                                                            <input type="text" name="quantity" class="form-control" value="${c.quantity}" readonly>
                                                            <a class="btn btn-sm btn-incre" href="quantityDesc?action=inc&id=${c.bookId}"><i class="fas fa-plus-square"></i></a>
                                                        </div>
                                                        <!--                                                        <button rel="tooltip" class="btn btn-default"><i class="fa fa-pencil"></i></button>
                                                                                                                <a href="#" class="btn btn-primary"><i class="fa fa-trash-o"></i></a>-->
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-sm btn-danger" href="removeFromCart?id=${c.bookId}">Remove</a></td>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <%--</c:if>--%>


                                            <!--                                            <tr>
                                                                                            <td><img src="https://www.bootdey.com/image/400x200/87CEFA/000000" class="img-cart"></td>
                                                                                            <td><strong>Product 2</strong><p>Size : M</p></td>
                                                                                            <td>
                                                                                                <form class="form-inline">
                                                                                                    <input class="form-control" type="text" value="2">
                                                                                                    <button class="btn btn-default" ><i class="fa fa-pencil"></i></button>
                                                                                                    <a href="#" class="btn btn-primary" rel="tooltip" ><i class="fa fa-trash-o"></i></a>
                                                                                                </form>
                                                                                            </td>
                                                                                            <td>$16.00</td>
                                                                                            <td>$32.00</td>
                                                                                        </tr>-->
                                            <!--                                            <tr>
                                                                                            <td colspan="6">&nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="4" class="text-right">Total Product</td>
                                                                                            <td>$86.00</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="4" class="text-right">Total Shipping</td>
                                                                                            <td>$2.00</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="4" class="text-right"><strong>Total</strong></td>
                                                                                            <td>$88.00</td>
                                                                                        </tr>-->
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <a href="home" class="btn btn-success"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;Continue Shopping</a>
                        <button type="submit" class="btn btn-primary pull-right">Borrow<span class="glyphicon glyphicon-chevron-right"></span></button>
                        </form>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
