<%-- 
    Document   : checkout
    Created on : Nov 3, 2020, 10:10:17 PM
    Author     : Admin
--%>

<%@page import="entity.UOrder"%>
<%@page import="model.uOrderDAO"%>
<%@page import="entity.Admin"%>
<%@page import="entity.Account"%>
<%@page import="model.cartDAO"%>
<%@page import="entity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>DuyTh4i</title>
        <link rel="shortcut icon" type="image/png" href="image/favicon.png"/>
        <!-- Meta tag Keywords -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />
        <meta name="keywords" content="Electro Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
              />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <!-- //Meta tag Keywords -->

        <!-- Custom-Files -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Bootstrap css -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Main css -->
        <link rel="stylesheet" href="css/fontawesome-all.css">
        <!-- Font-Awesome-Icons-CSS -->
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <!-- pop-up-box -->
        <link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />
        <!-- menu style -->
        <!-- //Custom-Files -->

        <!-- web fonts -->
        <link href="fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
        <link href="fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
              rel="stylesheet">
        <!-- //web fonts -->

    </head>

    <body>

        <!-- header-bottom-->
        <div class="header-bot">
            <div class="container">
                <div class="row header-bot_inner_wthreeinfo_header_mid">
                    <!-- logo -->
                    <div class="col-md-3 logo_agile">
                        <h1 class="text-center">
                            <a href="index" class="font-weight-bold font-italic">
                                <img src="image/logo2.png" style="height: 70px;"  class="img-fluid">DuyTh4i
                            </a>
                        </h1>
                    </div>
                    <!-- //logo -->
                    <!-- header-bot -->
                    <div class="col-md-9 header mt-4 mb-md-0 mb-4">
                        <div class="row">
                            <!-- search -->
                            <div class="col-10 agileits_search">
                                <form class="form-inline" action="search" method="post">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm" aria-label="Tìm kiếm" name="search" required>
                                    <button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
                                </form>
                            </div>
                            <!-- //search -->
                            <!-- cart details -->
                            <div class="col-2 top_nav_right text-center mt-sm-0 mt-2">
                                <%if (session.getAttribute("admin") == null) {
                                        if (session.getAttribute("user") != null) {%>
                                <form action="checkout" method="post">
                                    <input type="hidden" value="${sessionScope.user.id}" name="uNumber" />
                                    <button class="btn w3view-cart" type="submit">
                                        <i class="fas fa-cart-arrow-down">
                                            <%if (request.getAttribute("total") != null) {
                                            %>
                                            <span class="totalP"><%=request.getAttribute("total")%></span>
                                            <%}%>
                                        </i>
                                    </button>
                                </form>
                                <%} else {%>
                                <button class="btn w3view-cart" data-toggle="modal" data-target="#exampleModal">
                                    <i class="fas fa-cart-arrow-down">
                                    </i>
                                </button>
                                <%}
                                } else {%>
                                <form action="admin.jsp">
                                    <button class="btn w3view-cart" type="submit">
                                        <i class="fas fa-bell">
                                            <% Admin admin = (Admin) session.getAttribute("admin");
                                                uOrderDAO odb = new uOrderDAO();
                                                admin.setTotalOrder((odb.getNumberOfOrder() != null) ? Integer.parseInt(odb.getNumberOfOrder()) : 0);
                                                if (admin.getTotalOrder() > 0) {
                                            %>
                                            <span class="totalP"><%=admin.getTotalOrder()%></span>
                                            <%}%>
                                        </i>
                                    </button>
                                </form>
                                <%}%>
                            </div>
                            <!-- //cart details -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- shop locator (popup) -->
        <!-- //header-bottom -->
        <!-- navigation -->
        <div class="navbar-inner">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent" >
                        <ul class="navbar-nav">
                            <%if (session.getAttribute("admin") == null) {%>
                            <li class="nav-item  mr-lg-2 mb-lg-0 mb-2">
                                <a class="nav-link" href="index">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <%}%>
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
                                <a class="nav-link dropdown-toggle" href="#" role="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <div class="dropdown-menu">
                                    <ul class="multi-column-dropdown">
                                        <%if (session.getAttribute("admin") != null) {%>
                                        <li>
                                            <a class="dropdown-item" href="add">Thêm sản phẩm</a>
                                        </li>
                                        <%}%>
                                        <li>
                                            <a class="dropdown-item" href="product?status=1&begin=0&end=9">Hàng có sẵn</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="product?status=0&begin=0&end=9">Hàng oder</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <%if (session.getAttribute("admin") == null) {
                                    if (session.getAttribute("user") == null) {%>
                            <li class="nav-item mr-lg-2 mb-lg-0 mb-2">
                                <a href="#" data-toggle="modal" data-target="#exampleModal" class="nav-link text-black">
                                    <i class="fas fa-sign-in-alt mr-2"></i>Đăng nhập</a>
                            </li>
                            <%} else {%>
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2  active">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Xin chào,
                                    ${sessionScope.user.username}!
                                </a>
                                <div class="dropdown-menu">
                                    <ul class="multi-column-dropdown">
                                        <li>
                                            <a class="dropdown-item" href="account.jsp">Thông tin</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="logout">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <%}
                            } else {%>
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2  active">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">👑Admin👑
                                </a>
                                <div class="dropdown-menu">
                                    <ul class="multi-column-dropdown">
                                        <li>
                                            <a class="dropdown-item" href="admin.jsp">Thông tin</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="logout">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <%}%>       
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- //navigation -->

        <!-- banner-2 -->

        <!-- //banner-2 -->
        <!-- page -->
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">
                <div class="container">
                    <ul class="w3_short">
                        <li>
                            <a href="index">Trang chủ</a>
                            <i>|</i>
                        </li>
                        <li>Chi tiết đơn hàng</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //page -->
        <!-- checkout page -->
        <%ArrayList<UOrder> detail = (ArrayList<UOrder>) request.getAttribute("detail");
            int totalPrice = 0;
            String fullName = detail.get(0).getFullName();
            String phoneNumber = detail.get(0).getPhoneNumber();
            String address = detail.get(0).getAddress();
        %>
        <div class="privacy py-sm-5 py-4">
            <div class="container py-xl-4 py-lg-2">
                <!-- tittle heading -->
                <h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
                    Mã đơn hàng: <%=request.getAttribute("oId")%>
                </h3>
                <!-- //tittle heading -->
                <div class="checkout-right">
                    <h4 class="mb-sm-4 mb-3">Thời gian tạo đơn: <%=detail.get(0).getDate()%></h4>

                    <div class="table-responsive">
                        <table class="timetable_sub">
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (UOrder o : detail) {
                                        totalPrice += o.getPrice() * o.getQuantity();
                                %>

                                <tr class="rem">
                                    <td><%=o.getCode()%></td>
                                    <td class="invert-image">
                                        <a href="detail?code=<%=o.getCode()%>">
                                            <img src="<%=o.getImage()%>/1.jpg" alt=" " class="img-responsive">
                                        </a>
                                    </td>
                                    <td class="invert"><%=o.getName()%></td>
                                    <td class="invert">
                                        <%=o.getQuantity()%>
                                    </td>
                                    <td class="invert"><%=(new Cart()).formatPrice(o.getPrice() * o.getQuantity())%>₫</td>
                                </tr>

                                <%}%>

                            </tbody>
                        </table>
                        <h3 style="text-align: right; margin-top: 20px">Tổng: <%=(new Cart()).formatPrice(totalPrice)%>₫</h3>
                    </div>

                </div>

                <div class="checkout-left">

                    <div class="address_form_agile mt-sm-5 mt-4">
                        <h4 class="mb-sm-4 mb-3" style="color: #F45C5D">Thông tin giao hàng</h4>
                        <form >
                            <div class="information-wrapper">
                                <i>Tên khách hàng</i>
                                <div class="controls form-group">
                                    <input class="billing-address-name form-control" type="text" name="fullName" required value="<%=fullName%>" readonly>
                                </div>
                                <div class="w3_agileits_card_number_grids">
                                    <div class="w3_agileits_card_number_grid_left form-group">
                                        <i>Số điện thoại</i>
                                        <div class="controls">
                                            <input type="text" class="form-control"  name="phoneNumber" required value="<%=phoneNumber%>" readonly>
                                        </div>
                                    </div>
                                    <div class="w3_agileits_card_number_grid_right form-group">
                                        <i>Địa chỉ nhận hàng</i>
                                        <div class="controls">
                                            <input type="text" class="form-control"  name="address" required value="<%=address%>" readonly>
                                        </div>
                                    </div>
                                </div>                                        
                            </div>
                        </form>
                        <%if(session.getAttribute("user")==null)
                            if (detail.get(0).getStatus() == 0 ) {%>
                        <a href="confirm?oId=<%=request.getAttribute("oId")%>"><button class="submit check_out btn" >Xác nhận</button></a>
                        <a href="cancel?oId=<%=request.getAttribute("oId")%>"> <button class="submit check_out btn" >Hủy đơn</button></a>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <!-- //checkout page -->

        <!-- middle section -->

        <!-- middle section -->

        <!-- footer -->
        <footer style="position: sticky;top: 100%;">
            <!-- footer third section -->
            <div class="w3l-middlefooter-sec">
                <div class="container py-md-3 py-sm-3 py-1">
                    <div class="footer-copyright text-center text-white">
                        <!-- footer categories -->

                        <!-- //footer categories -->
                        <!-- quick links -->

                        Hotline: 01223456789 - Địa chỉ: somewhere on Earth

                        <!-- newsletter -->
                        <!-- //newsletter -->
                        <a class="icon fb" href="#" style="padding-left: 10px"	>
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <!-- social icons -->
                        <!-- //social icons -->

                    </div>
                    <!-- //quick links -->
                </div>
            </div>

        </div>
    </div>
    <!-- //footer fourth section (text) -->
</footer> 
<!-- //footer -->
<!-- copyright -->

<!-- //copyright -->

<script>
    function errorFunc() {
        window.alert("Giỏ hàng trống");
    }
</script>

<!-- js-files -->
<!-- jquery -->
<script src="js/jquery-2.2.3.min.js"></script>
<!-- //jquery -->

<!-- nav smooth scroll -->
<script>
    $(document).ready(function () {
        $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
        );
    });
</script>
<!-- //nav smooth scroll -->

<!-- popup modal (for location)-->
<script src="js/jquery.magnific-popup.js"></script>
<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
</script>
<!-- //popup modal (for location)-->

<!-- cart-js -->

<!-- //cart-js -->

<!-- password-script -->
<script>
    window.onload = function () {
        document.getElementById("password1").onchange = validatePassword;
        document.getElementById("password2").onchange = validatePassword;
    }

    function validatePassword() {
        var pass2 = document.getElementById("password2").value;
        var pass1 = document.getElementById("password1").value;
        if (pass1 != pass2)
            document.getElementById("password2").setCustomValidity("Passwords Don't Match");
        else
            document.getElementById("password2").setCustomValidity('');
        //empty string means no validation error
    }
</script>
<!-- //password-script -->

<!-- quantity -->
<script>
    $('.value-plus').on('click', function () {
        var divUpd = $(this).parent().find('.value'),
                newVal = parseInt(divUpd.text(), 10) + 1;
        divUpd.text(newVal);
    });

    $('.value-minus').on('click', function () {
        var divUpd = $(this).parent().find('.value'),
                newVal = parseInt(divUpd.text(), 10) - 1;
        if (newVal >= 1)
            divUpd.text(newVal);
    });
</script>
<!--quantity-->
<script>
    $(document).ready(function (c) {
        $('.close1').on('click', function (c) {
            $('.rem1').fadeOut('slow', function (c) {
                $('.rem1').remove();
            });
        });
    });
</script>
<script>
    $(document).ready(function (c) {
        $('.close2').on('click', function (c) {
            $('.rem2').fadeOut('slow', function (c) {
                $('.rem2').remove();
            });
        });
    });
</script>
<script>
    $(document).ready(function (c) {
        $('.close3').on('click', function (c) {
            $('.rem3').fadeOut('slow', function (c) {
                $('.rem3').remove();
            });
        });
    });
</script>
<!-- //quantity -->

<!-- smoothscroll -->
<script src="js/SmoothScroll.min.js"></script>
<!-- //smoothscroll -->

<!-- start-smooth-scrolling -->
<script src="js/move-top.js"></script>
<script src="js/easing.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();

            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->

<!-- smooth-scrolling-of-move-up -->
<script>
    $(document).ready(function () {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear' 
         };
         */
        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<!-- //smooth-scrolling-of-move-up -->

<!-- for bootstrap working -->
<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- //js-files -->

</body>

</html>
