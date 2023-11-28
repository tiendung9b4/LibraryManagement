
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FU Library</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <style type="text/css">
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
        .category_block .hehe:hover {
            background: border-box;
        }
        .category_block a:hover {
            color: coral;
        }
        .loadButton button:hover {
            background: gray;
            color: tomato;
        }
        .category_block .active {
            background: border-box;

        }
        .img-container {
            height: 400px;
            position: relative;
        }
        .image {
            height: 400px;
            transition: .5s ease;
            backface-visibility: hidden;
        }
        .overlay{
            transition: .5s ease;
            opacity: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);

        }
        .img-container:hover .image {
            opacity: 0.2;
        }
        .img-container:hover .overlay {
            opacity: 1;
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
    <link rel="stylesheet" href="all_component/footerStyle.css"/>

    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="back-img" >
            <h2 class="text-center text-uppercase backgrText" style="color: whitesmoke; font-family: 'Oswald', sans-serif; font-size: 70px"  >Library Management</h2>
        </div>
        <div class="container-fluid" style="background: url(img/istockphoto-470721440-612x612.jpg)" >
                    <p class="text-danger">${messe} </p>

            <p class="text-center pt-5" style="color: #330000;font-weight: 500;font-size: 40px; font-family: 'Oswald', sans-serif">${cat} Books</p>

            <div  class="row" style="border-top: dashed 6px tan">
                <div class="col-md-2 mt-5">
                    <section class="panel">
                        <div class="panel-body" style="display:inline-block" >
                            <input oninput="searchByName(this)" name="txt" type="text" placeholder="Keyword Search" class="searchTerm" />
                        </div>

                    </section>

                    <section class="panel mt-5">
                        <!--                        <header class="panel-heading mt-3" style="font-size: 20px">
                                                    Category
                                                </header>-->
                        <div class="panel-body" >
                            <ul class="list-group category_block" style="display:inline-block ">
                                <li class="list-group-item " style= "background: border-box ;border: solid tan 2px; font-weight: 600;color:#272E48 "><a href="home" style="color:#272E48;text-decoration: none">Category</a></li>
                                    <c:forEach items="${requestScope.listC}" var="c">
                                    <li style="border: solid tan 2px;"   id="oncl" onclick="displayBookByCid" value="${tag}" class="list-group-item hehe ${c.cid == tag ? "active":""}">
                                        <a  href="category?cid=${c.cid}" style="color:#330000;text-decoration: none;">${c.cname}</a>
                                    </li>
                                </c:forEach>
                            </ul>


                        </div>



                    </section>


                </div>



                <div class="col-md-10 mt-5">
                    <div class="row">
                        <!--Orderby....-->
                    </div>
                    <div class="row" id="content" >
                        <c:forEach items="${requestScope.data}" var="d">

                            <!--                            <div class="bookPro col-sm-3 mt-5" >
                                                            <div class="card crd-ho" >
                                                                <div class="card-body text-center">
                                                                    <a href="detail?bId=${d.bookId}"><img alt="" src="img/${d.img}" style="width:150px; height:200px " class="img-thumbnail"></a>
                                                                    <a href="detail?bId=${d.bookId}">  <p>${d.title}</p> </a>
                                                                    <p>${d.author}</p>
                                                                    <p> ${d.category}</p>
                                                                    <div class="row">
                                                                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart </a>
                                                                        <a href="detail?bId=${d.bookId}" class="btn btn-success btn-sm ml-1">View Details</a> 
                                                                        <a href="" class="btn btn-danger btn-sm ml-1">Price</a> 
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->



                            <div class="bookPro col-sm-3 mt-4">
                                <div class="card">
                                    <div class="img-container">
                                        <img alt="" src="img/${d.img}" class="image card-img-top">
                                        <div class="overlay">
                                            <!--<form action="addtocart?bookId=${d.bookId}" method="get">-->
                                            <a href="addtocart?bookId=${d.bookId}"  class="btn btn-outline-primary btn-sm"><i class="fas fa-cart-plus mr-2"></i>Want to read</a> 
                                        <!--</form>-->
                                            <button class="btn btn-outline-danger btn-sm"><i class="far fa-heart"></i></button>
                                            <p style="color: #330000;text-align: left;font-size: 12px" class="card-text pt-5">${d.describe}</p>

                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <a style="text-decoration: none;"  href="detail?bId=${d.bookId}">   <h5 class="card-title">${d.title}</h5> </a>
                                        <h6 class="card-subtitle mb-2 text-muted">Author: ${d.author}</h6>
                                        <h6 class="card-subtitle mb-2 text-muted">Genre: ${d.category}</h6>                       
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>






            </div>
            <div class="loadButton text-center mt-2 mb-1">
                <button onclick="loadMore()" class="btn  btn-secondary ">Load more</button>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script>
                    function loadMore() {
                        var n = document.getElementsByClassName("bookPro").length;
                        var c = document.getElementById("oncl").getAttribute('value');
                        $.ajax({
                            url: "/Assignment/load",
                            type: "get",
                            data: {
                                exist: n,
                                cid: c,
                            },

                            success: function (data) {
                                var row = document.getElementById("content");
                                row.innerHTML += data;
                            }


                        });
                    }
                    function searchByName(param) {
                        var txtSearch = param.value;
                        $.ajax({
                            url: "/Assignment/searchAjax",
                            type: "get",
                            data: {
                                txt: txtSearch,
                            },

                            success: function (data) {
                                var row = document.getElementById("content");
                                row.innerHTML = data;
                            }


                        });
                    }



                </script>
            </div>
        </div>


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
    </body>

</html>
