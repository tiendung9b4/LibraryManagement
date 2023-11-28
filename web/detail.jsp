<%-- 
    Document   : detail
    Created on : Jul 5, 2023, 7:53:08 PM
    Author     : tanki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
        <%@include file="all_component/allCss.jsp" %>

    </head>
    <style>
        .back-img {
            background: url("img/emil-widlund-xrbbXIXAWY0-unsplash.jpg");
            width: 100%;
            height: 40vh;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;

        }
        .backgrText  {
            padding-top: 7%;
            font-weight: 700;
            font-size: 40px;
        }
        .footer-dark {
            padding:50px 0;
            color:#f0f9ff;
            background-color:#282d32;
        }

        .footer-dark h3 {
            margin-top:0;
            margin-bottom:12px;
            font-weight:bold;
            font-size:16px;
        }

        .footer-dark ul {
            padding:0;
            list-style:none;
            line-height:1.6;
            font-size:14px;
            margin-bottom:0;
        }

        .footer-dark ul a {
            color:inherit;
            text-decoration:none;
            opacity:0.6;
        }

        .footer-dark ul a:hover {
            opacity:0.8;
        }

        @media (max-width:767px) {
            .footer-dark .item:not(.social) {
                text-align:center;
                padding-bottom:20px;
            }
        }

        .footer-dark .item.text {
            margin-bottom:36px;
        }

        @media (max-width:767px) {
            .footer-dark .item.text {
                margin-bottom:0;
            }
        }

        .footer-dark .item.text p {
            opacity:0.6;
            margin-bottom:0;
        }

        .footer-dark .item.social {
            text-align:center;
        }

        @media (max-width:991px) {
            .footer-dark .item.social {
                text-align:center;
                margin-top:20px;
            }
        }

        .footer-dark .item.social > a {
            font-size:20px;
            width:36px;
            height:36px;
            line-height:36px;
            display:inline-block;
            text-align:center;
            border-radius:50%;
            box-shadow:0 0 0 1px rgba(255,255,255,0.4);
            margin:0 8px;
            color:#fff;
            opacity:0.75;
        }

        .footer-dark .item.social > a:hover {
            opacity:0.9;
        }

        .footer-dark .copyright {
            text-align:center;
            padding-top:24px;
            opacity:0.3;
            font-size:13px;
            margin-bottom:0;
        }

        /*        .container-rate {
                    width: 400px;
                    background: white;
                    padding: 20px 30px;
                    border: 1px solid #444;
                    border-radius: 5px;
                    align-items: center;
                    justify-content: center;
                    flex-direction: column;
        
                }
                .container-rate .star-widget input {
                    display: none;
                }
                .star-widget {
                    font-size: 30px;
                    color: #444;
                    padding: 10px;
                    float:right;
                    transition: all
                }
                .star-widget input:not(:checked) label ~ label:hover {
                    color: #fd4;
                }*/
        .star-widget {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .rating {
            border:none;
            float:left;
        }
        .rating label {
            font-size: 30px;
            cursor: pointer;
        }
        .rating > input {
            display:  none;
        }
        .star-rating {
            display: inline-block;
            font-size: 20px;
            color: #ffb600;
        }

        .star-rating .star {
            display: inline-block;
            width: 16px;
            height: 16px;
            margin-right: 2px;
            background-position: 0 -16px;
            background-repeat: no-repeat;
            background-image: url(img/star-icon.png);

        }

        .star-rating .star.filled {
            background-position: 0 0;
        }




    </style>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="back-img" >
            <h2 class="text-center text-uppercase backgrText" style="color:whitesmoke; font-family: 'Oswald', sans-serif; font-size: 70px"  >Library Management</h2>
        </div>

        <div class="container-fluid" style="background: whitesmoke">
            <div class="book1">
                <h2 class="text-center pt-5 pb-5" style="border-bottom: 1px black solid">Book Detail</h2>
                <p class="text-danger alert text-center">${mess1}</p>
                <p class="text-danger alert text-center">${mess2}</p>
            </div>
            <section class="container books  mb-0 py-5" >
                <div class="row mt-5 pt-3 pb"  style="border: 2px solid black">
                    <div class="col-lg-5 col-md-12 col-12 ">
                        <img style="height: 500px" class="img-fluid w-100 pb-1" src="img/${detail.img}" alt="alt"/>
                        <div class="star-widget">
                            <form action="rating" method="post"> 


                                <fieldset class="rating">
                                    <h2>Rate this book!</h2>
                                    <br>
                                    <input type ="hidden" value="${sessionScope.acc.id}" name="uId">
                                    <input type="hidden" value="${detail.bookId}" name="bId">
                                    <input type="radio" id="star1" name="rating" value="1"><label id="s1" for="star1" class="fa fa-star"></label>
                                    <input type="radio" id="star2" name="rating" value="2"><label id="s2" for="star2" class="fa fa-star"></label>
                                    <input type="radio" id="star3" name="rating" value="3"><label id="s3" for="star3" class="fa fa-star"></label>
                                    <input type="radio" id="star4" name="rating" value="4"><label id="s4" for="star4" class="fa fa-star"></label>
                                    <input type="radio" id="star5" name="rating" value="5"><label id="s5" for="star5" class="fa fa-star"></label>
                                    <br><button style="border-radius:25%" class="btn btn-warning ml-5" type="submit">Rate</button>

                                </fieldset>

                        </div>

                        </form>
                    </div>
                    <div class="col-lg-7 col-md-12 col-12">
                        <h3 class="py-4">${detail.title}</h3>
                        <h5 class="text-muted">${detail.author}</h5>
                        <h5 class="my-3">Genre: ${detail.category}</h5>
                        <h5 class="my-3">Publication Year: ${detail.publicY}</h5>
                        <h6> 
                            <span> ${detail.describe}</span>
                        </h6>

                        <c:set var="rating" value="${rate}" /> 
                        <c:if test="${rating == 0}">
                            <p class="text-danger">There are no rated yet!</p>                            
                        </c:if>
                        <c:if test="${rating != 0}">
                            <div class="star-rating">
                                <c:forEach var="i" begin="1" end="5">
                                    <span class="star ${i <= rating ? 'filled fa fa-star' : ''}"></span>
                                </c:forEach>
                            </div>                    
                        </c:if>



                        <div class="overlay py-4">
                            <button class="btn btn-outline-primary btn-md"><i class="fas fa-cart-plus mr-2"></i>Want to read</button>
                            <button class="btn btn-outline-danger btn-md"><i class="far fa-heart"></i></button>
                        </div>
                    </div>





                </div>
        </div>
    </section>


</div>










<div class="footer-dark pt-3 pb-3">
    <footer>
        <div class="container rate">
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
<script>
    $(document).ready(function () {
        $("#s1").click(function () {
            $(".fa-star").css("color", "black");
            $("#s1").css("color", "#FFC107");
        });
        $("#s2").click(function () {
            $(".fa-star").css("color", "black");

            $("#s1,#s2").css("color", "#FFC107");
        });
        $("#star3").click(function () {
            $(".fa-star").css("color", "black");

            $("#s1,#s2,#s3").css("color", "#FFC107");
        });
        $("#star4").click(function () {
            $(".fa-star").css("color", "black");

            $("#s1,#s2,#s3,#s4").css("color", "#FFC107");
        });
        $("#star5").click(function () {
            $(".fa-star").css("color", "black");

            $("label").css("color", "#FFC107");
        });
    });
</script>
</body>

</body>
</html>
