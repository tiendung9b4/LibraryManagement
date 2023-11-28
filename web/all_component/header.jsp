<%-- 
    Document   : header
    Created on : Jun 23, 2023, 1:10:39 AM
    Author     : tanki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header id="header" id="home">
            <div class="container">
                <div class="row align-items-center justify-content-between d-flex">
                    <div id="logo">
                        <a href="index.html"><img src="img/logo.png" alt="" title="" /></a>
                    </div>
                    <nav id="nav-menu-container">
                        <ul class="nav-menu">
                            <li class="menu-active"><a href="#home">Home</a></li>
                            <li><a href="#about">About</a></li>
                            <li><a href="#fact">Fact</a></li>
                            <li><a href="#price">Price</a></li>
                            <li><a href="#course">Course</a></li>
                            <li class="menu-has-children"><a href="">Pages</a>
                                <ul>
                                    <li><a href="generic.html">Generic</a></li>
                                    <li><a href="elements.html">Elements</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav><!-- #nav-menu-container -->		    		
                </div>
            </div>
        </header><!-- #header -->
    </body>
</html>
