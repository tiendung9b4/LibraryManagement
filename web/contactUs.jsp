<%-- 
    Document   : contactUs
    Created on : Jun 23, 2023, 1:38:30 AM
    Author     : tanki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>Contact Us</title>
        <link rel="stylesheet" href="all_component/styleContact.css">

    </head>
    <body>





        <div class="container">

            <div class="col-md-3 pb-3">
                <a style="text-decoration: none" href="home">
                    <h3 class="text-uppercase " style="color:#3e2093;font-family: 'Oswald', sans-serif;">
                        <i class="fa-solid fa-house fa-lg "  style="color: #322f2f;"></i>
                        Library FU</h3>
                </a>

            </div>


            <div class="content" style="border-top: 5px solid #322f2f  ">
                <div class="left-side">
                    <div class="address details">
                        <i class="fas fa-map-marker-alt"></i>
                        <div class="topic">Address</div>
                        <div class="text-one">No. 107, Delta building, FPT University, Hoa Lac High Tech Park</div>
                        <div class="text-two">Km29 Thang Long Avenue, Hanoi, Vietnam</div>
                    </div>
                    <div class="phone details">
                        <i class="fas fa-phone-alt"></i>
                        <div class="topic">Phone</div>
                        <div class="text-one">02466 805 912</div>
                    </div>
                    <div class="email details">
                        <i class="fas fa-envelope"></i>
                        <div class="topic">Email</div>
                        <div class="text-one">thuvien_fu_hoalac@fpt.edu.vn</div>
                    </div>
                </div>
                <div class="right-side">
                    <div class="topic-text">Send us a message</div>
                    <p class="text-danger" > ${mess1} </p>
                    <p>If you have any work from me or any types of quries related to my tutorial, you can send me message from here. It's my pleasure to help you.</p>
                    <form action="contactUs" method="post">
                        <div class="input-box">
                            <input type="text" placeholder="Enter your name" name="cName">
                        </div>
                        <div class="input-box">
                            <input type="text" placeholder="Enter your email" name="cEmail">
                        </div>
                        <div class="input-box message-box">
                            <textarea placeholder="Send us a message" name="mes"></textarea>
                        </div>
                        <div class="d-flex justify-content-center" >
                            <button class="btn btn-outline-light btn-lg px-4 mt-3 " style="border-radius: 20px; background-color: #3e2093;"  type="submit">Send Now</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
