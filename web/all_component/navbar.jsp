<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .bg-custom {
        background-color: #282d32;
        border-top: tan dashed 2px;
    }
    .navbar .nav-item:hover .nav-link {
        background-color: grey;
        border-radius: 20px;
    }
    .container-fluid {
        background-color: #282d32;

    }
    body {
        font-family: 'Oswald', sans-serif;
    }
</style>
<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3">
            <a style="text-decoration: none" href="home">
                <h3 class="text-uppercase " style="color:tan;font-family: 'Oswald', sans-serif;">
                    <i class="fa-solid fa-book fa-bounce fa-lg" style="color: tan;"></i>
                    Library FU</h3>
            </a>

        </div>
        <div class="col-md-6" >
            <!--            <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-primary my-2 my-sm-0" type="submit">Search <i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>-->

            <c:if test="${sessionScope.acc==null}">
                <p class="text-uppercase " style="color: tan; text-align: center; font-size: larger; padding-top:">
                    You are not login yet ! Click <a href="login">here</a> to login !
                </p>
            </c:if>


            <c:if test="${sessionScope.acc.isAdmin != 1 && session.acc !=null}">
                <p class="text-uppercase " style="color: tan; text-align: center; font-size: larger; padding-top:">
                    Hello ${sessionScope.acc.name} !
                </p>
            </c:if>

            <c:if test="${sessionScope.acc.isAdmin==1}">
                <p class="text-uppercase " style="color: tan; text-align: center; font-size: larger; padding-top:">
                    welcome back    ${sessionScope.acc.name} (admin).
                </c:if>




        </div>
        <c:if test="${sessionScope.acc  != null}">
            <div class="col-md-3">
                <a href="logout" class="btn btn-success float-right ml-2">Logout <i class="fa-solid fa-right-from-bracket"></i> </a>
            </div>
        </c:if>
        <c:if test="${sessionScope.acc  == null}">
            <div class="col-md-3">
                <a href="login" class="btn btn-success float-right ml-2">Login <i class="fa-solid fa-right-to-bracket"></i> </a>
                <a href="register" class="btn btn-primary float-right">Register <i class="fa-solid fa-user-plus"></i></a>         
            </div>
        </c:if>

    </div>
</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="home"><i class="fa-solid fa-house fa-xl" style="color: tan;"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <c:if test="${sessionScope.acc.isAdmin  == 1}">


                <li class="nav-item active">
                    <a class="nav-link" href="list" style="color: tan">Manage Books<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="listCard" style="color: tan">Manage Library Card<span class="sr-only">(current)</span></a>
                </li>

            </c:if>
            <c:if test="${sessionScope.acc.isAdmin  == 0}">


                <li class="nav-item active">
                    <a class="nav-link" href="rLibCard" style="color: tan">LibraryCard Request<span class="sr-only">(current)</span></a>
                </li>


            </c:if>




        </ul>
        <form class="form-inline my-2 my-lg-0">
            <c:if test="${sessionScope.acc  != null}">
                <a href="cart" ><i class="fa-solid fa-cart-shopping"></i><span class="badge badge-danger">${sessionScope.cart.size()}</span></a>

                <a style="color:whitesmoke" class="nav-link active " href="info" > Hello <img class="avatar" style="border-radius: 50%;width: 20px;height: 20px" src="img/avt/${sessionScope.acc.avt}"/> 

                    !</a>
                </c:if>
            <a href="contactUs" class="btn btn-danger my-2 my-sm-0" type="submit">Contact<i class="fa-solid fa-address-book"></i>  </a>

        </form>
    </div>
</nav>