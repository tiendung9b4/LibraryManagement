<%-- 
    Document   : footer
    Created on : Jul 5, 2023, 9:07:34 PM
    Author     : tanki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
        <%@include file="allCss.jsp" %>

        <!--<link rel="stylesheet" href="footerStyle.css"/>-->
    </head>

    <style>
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

    </style>
    <body>
        <div class="footer-dark">
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
