<%-- 
    Document   : accInfo
    Created on : Jul 7, 2023, 3:17:28 AM
    Author     : tanki
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${info.name}</title>



        <%@include file="all_component/allCss.jsp" %>
        <link rel="stylesheet" href="all_component/footerStyle.css"/>

    </head>
    <body>

        <%@include file="all_component/navbar.jsp" %>

        <style>
            .gradient-custom {
                /* fallback for old browsers */
                background: #f6d365;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
            }
        </style>
        <section class="vh-100" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <img src="img/avt/${info.avt}"
                                         alt="Avatar" class="img-fluid my-5" style="border-radius: 50%;width: 100px;" />
                                    <h5>${info.name}</h5>
                                    <c:if test="${sessionScope.acc.isAdmin  == 1}">
                                        <p>Administrator</p>
                                    </c:if>
                                    <c:if test="${sessionScope.acc.isAdmin  == 0}">
                                        <p>Reader</p>
                                    </c:if>


                                </div>
                                <div class="col-md-8 ">
                                    <div class="card-body p-4 profile-info" id="profile-info" >
                                        <h6>Information</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-7 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted">${info.email}</p>
                                            </div>
                                            <div class="col-5 mb-3">
                                                <h6>Phone</h6>
                                                <p class="text-muted">${info.phno}</p>
                                            </div>
                                        </div>
                                        <div class="row pt-1">
                                            <div class="col-12 mb-3">
                                                <h6>Name</h6>
                                                <p class="text-muted">${info.name}</p>
                                            </div>                                   
                                        </div>
                                        <div class="row pt-1">
                                            <div class="col-12 mb-3">
                                                <h6>Address</h6>
                                                <p class="text-muted">${info.address}</p>
                                            </div>                                   
                                        </div>
                                        <c:if test="${card != null}"> 
                                            <div class="row pt-1">
                                                <div class="col-7 mb-3">
                                                    <h6>Card ID</h6>
                                                    <p class="text-muted">${card.cardId}</p>
                                                </div>
                                                <div class="col-5 mb-3">
                                                    <h6>Status</h6>
                                                    <c:if test="${card.status ==  1}">
                                                        <p class="text-success">
                                                            Active</p>

                                                    </c:if>
                                                    <c:if test="${card.status ==  0}">
                                                        <p class="text-danger">
                                                            Unactived</p> 
                                                        </c:if> 
                                                </div>
                                            </div>
                                            <div class="row pt-1">
                                                <div class="col-7 mb-3">
                                                    <h6>End date</h6>
                                                    <p class="text-muted">${card.endDate}</p>
                                                </div>
                                                <div class="col-5 mb-3">
                                                    <h6>Borrowing</h6>
                                                    <p class="text-muted">${card.numBookBorrowing} books</p>
                                                </div>
                                            </div>
                                        </c:if>
                                        <!--                                        <h6>Projects</h6>
                                                                                <hr class="mt-0 mb-4">
                                                                                <div class="row pt-1">
                                                                                    <div class="col-6 mb-3">
                                                                                        <h6>Recent</h6>
                                                                                        <p class="text-muted">Lorem ipsum</p>
                                                                                    </div>
                                                                                    <div class="col-5 mb-3">
                                                                                        <h6>Most Viewed</h6>
                                                                                        <p class="text-muted">Dolor sit amet</p>
                                                                                    </div>
                                                                                </div>-->


                                    </div>
                                    <div class="form-outline card-body p-4 profile-edit " id="profile-edit" style="display: none" >
                                        <form action="editProfile" method="post" enctype="multipart/form-data">
                                            <h6>Information</h6>
                                            <hr class="mt-0 mb-4">
                                            <div class="row pt-1">
                                                <div class="col-7 mb-3">
                                                    <h6>Email</h6>
                                                    <input type="text" name="email" value="${info.email}" class="form-control">
<!--                                                    <p class="text-muted">${info.email}</p>-->
                                                </div>
                                                <div class="col-5 mb-3">
                                                    <h6>Phone</h6>
                                                    <input type="text" name="phone" value="${info.phno}" class="form-control" >
                                                </div>
                                            </div>
                                            <div class="row pt-1">
                                                <div class="col-12 mb-3">
                                                    <h6>Name</h6>
                                                    <input type="text" name="name" value="${info.name}" class="form-control">
                                                </div>

                                            </div>
                                            <div class="row pt-1">
                                                <div class="col-12 mb-3">
                                                    <h6>Address</h6>
                                                    <input type="text" name="address" value="${info.address}" class="form-control">
                                                </div>

                                            </div>
                                            <div class="row pt-1">  
                                                <div class="col-6 mb-3">
                                                    <h6>Old Password</h6>
                                                    <input type="password" name="oldPass" class="form-control">
<!--                                                    <p class="text-muted">${info.email}</p>-->
                                                </div>
                                                <div class="col-6 mb-3">
                                                    <h6>New Password</h6>
                                                    <input type="password" name="newPass" class="form-control" >
                                                </div>
                                            </div>

                                            <!--                                            <h6>Projects</h6>
                                                                                        <hr class="mt-0 mb-4">
                                                                                        <div class="row pt-1">
                                                                                            <div class="col-6 mb-3">
                                                                                                <h6>Recent</h6>
                                                                                                <p class="text-muted">Lorem ipsum</p>
                                                                                            </div>
                                                                                            <div class="col-5 mb-3">
                                                                                                <h6>Most Viewed</h6>
                                                                                                <p class="text-muted">Dolor sit amet</p>
                                                                                            </div>
                                                                                        </div>-->
                                            <div class="row pt-1">
                                                <div class="col-12 mb-3">
                                                    <h6>Update Avatar</h6>
                                                    <input type="file" name="imageFile" class="form-control">
                                                    <input type="hidden" name="oldImagePath" value="${sessionScope.acc.avt}">
                                                </div>                                           
                                            </div>

                                            <div class="row pb-3">
                                                <div class="mx-auto">
                                                    <button type="submit" class="btn btn-outline-primary">
                                                        Save 
                                                        <!--<i class="far fa-edit fa-lg" style="color: black"></i>-->
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div> 


                                    <div class="row pb-3">
                                        <div class="mx-auto">
                                            <button id="edit-button" class="btn btn-outline-danger">
                                                Edit 
                                                <!--<i class="far fa-edit fa-lg" style="color: black"></i>-->
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            $(document).ready(function () {

                let status = false;
                $('#edit-button').click(function () {
                    if (status == false) {
                        $('#profile-info').hide()

                        $('#profile-edit').show();
                        status = true;
                        $(this).text("Back");
                    } else {
                        $('#profile-info').show()

                        $('#profile-edit').hide();
                        status = false;
                        $(this).text("Edit");

                    }
                }
                )
            });
        </script>                                   


        <div class="footer-dark pt-5 pb-3">
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-md-3 item">
                            <h3>Services</h3>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Register</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6 col-md-3 item">
                            <h3>About</h3>
                            <ul>
                                <li><a href="#">Contact Us</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6 item text">
                            <h3>FPT Library</h3>
                            <p> <i class="fa-solid fa-location-dot"></i> &nbsp;&nbsp;&nbsp;    No. 107, Delta building, FPT University, Hoa Lac High Tech Park, Km29 Thang Long Avenue, Hanoi, Vietnam.</p>
                            <p> <i class="fa-solid fa-envelope"></i> &nbsp;&nbsp;&nbsp;    thuvien_fu_hoalac@fpt.edu.vn</p>
                            <p> <i class="fa-solid fa-phone"></i> &nbsp;&nbsp;&nbsp;   02466 805 912 </p>

                        </div>
                        <div class="col item social"><a href="#"><i class="fa-brands fa-facebook-f"></i></a><a href="#"><i class="fa-brands fa-instagram"></i></a><a href="#"><i class="fa-brands fa-discord"></i></a><a href="#"><i class="fa-brands fa-tiktok"></i></a></div>
                    </div>
                    <p class="copyright">FPT University Library</p>
                </div>
            </footer>
        </div>
    </div>


</body>
</html>
