<%-- 
    Document   : product
    Created on : Oct 28, 2020, 11:21:41 AM
    Author     : Admin
--%>

<%@page import="model.uOrderDAO"%>
<%@page import="entity.UOrder"%>
<%@page import="javax.faces.bean.SessionScoped"%>
<%@page import="entity.Cart"%>
<%@page import="entity.Account"%>
<%@page import="model.cartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <body style="overflow-y: scroll">
        <!-- top-header -->
        <!-- Button trigger modal(select-location) -->
        <!-- //shop locator (popup) -->
        <!-- //top-header -->
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
                                <form action="checkout" method="post">
                                    <input type="hidden" value="${sessionScope.user.id}" name="uNumber" />
                                    <button class="btn w3view-cart" type="submit">
                                        <i class="fas fa-cart-arrow-down">
                                            <%cartDAO cdb = new cartDAO();
                                                Account user = (Account) session.getAttribute("user");
                                                String total = cdb.getTotalQ(user.getId());
                                                if (total != null) {
                                            %>
                                            <span class="totalP"><%=total%></span>
                                            <%}%>
                                        </i>
                                    </button>
                                </form>
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
                            <li class="nav-item  mr-lg-2 mb-lg-0 mb-2">
                                <a class="nav-link" href="index">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
                                <a class="nav-link dropdown-toggle" href="#" role="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <div class="dropdown-menu ">
                                    <ul class="multi-column-dropdown">
                                        <li>
                                            <a class="dropdown-item " href="product?status=1&begin=0&end=9">Hàng có sẵn</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item " href="product?status=0&begin=0&end=9">Hàng oder</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2 active">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Xin chào,
                                    ${sessionScope.user.username}!
                                </a>
                                <div class="dropdown-menu">
                                    <ul class="multi-column-dropdown">
                                        <li>
                                            <a class="dropdown-item" href="product?status=1&begin=0&end=9">Thông tin</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="logout">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </div>      
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <!-- page -->

        <!-- //page -->

        <!-- top Products -->
        <div class="container py-xl-4 py-lg-2">
            <div class="row py-5" >
                <div class="col-sm-12 col-xl-2 text-center ">
                    <div  style="display:inline-block;position: relative;">
                        <div ><img src="image/user.jpg" style="width: 60px; border-radius:  60px"></div>
                        <div style="padding-top: 10px"><span>Xin chào <b>${sessionScope.user.username}</b></span></div>
                        <div style="padding-top: 20px">
                            <div class="nav flex-column nav-pills"  role="tablist" aria-orientation="vertical">
                                <a class="nav-link active"  data-toggle="pill" href="#info" role="tab"  aria-selected="true" >Thông tin tài khoản</a>
                                <a class="nav-link"  data-toggle="pill" href="#address" role="tab"  aria-selected="false">Thông tin địa chỉ</a>
                                <a class="nav-link"  data-toggle="pill" href="#buyed" role="tab"  aria-selected="false">Sản phẩm đã mua</a>
                                <a class="nav-link" href="logout" >Đăng xuất</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-xl-10 ">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="info" role="tabpanel">
                            <div class="address_form_agile mt-sm-3 mt-1">
                                <h4 class="mb-sm-4 mb-3" style="color: #F45C5D">Thông tin tài khoản</h4>
                                <form action="payment.html" method="post" >
                                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                                        <div class="information-wrapper">
                                            <div class="first-row">
                                                <div class="controls form-group">
                                                    <input class="billing-address-name form-control" type="text" name="username" required value="${sessionScope.user.username}">
                                                </div>
                                                <div class="w3_agileits_card_number_grid_left form-group">
                                                    <div class="controls">
                                                        <input type="password" class="form-control" placeholder="Mật khẩu hiện tại" name="currentPassword" id="password0" required="">
                                                    </div>
                                                </div>
                                                <div class="w3_agileits_card_number_grid_left form-group">
                                                    <div class="controls">
                                                        <input type="password" class="form-control" placeholder="Mật khẩu mới" name="nPassword" id="password1" required >
                                                    </div>
                                                </div>
                                                <div class="w3_agileits_card_number_grid_left form-group">
                                                    <div class="controls">
                                                        <input type="password" class="form-control" placeholder="Xác nhận mật khẩu" name="cNPassword" id="password2" required >
                                                    </div>
                                                </div>
                                            </div>
                                            <button class="submit check_out btn" type="submit">Lưu thay đổi</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="address" role="tabpanel" >
                            <div class="address_form_agile mt-sm-3 mt-1">
                                <h4 class="mb-sm-4 mb-3" style="color: #F45C5D">Thông tin giao hàng</h4>
                                <form action="info" method="post" >
                                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                                        <div class="information-wrapper">
                                            <div class="first-row">
                                                <i>Tên khách hàng</i>
                                                <div class="controls form-group">
                                                    <input class="billing-address-name form-control" type="text" name="fullname" required value="${sessionScope.user.fullname}">
                                                </div>
                                                <div class="w3_agileits_card_number_grids">
                                                    <div class="w3_agileits_card_number_grid_left form-group">
                                                        <i>Số điện thoại</i>
                                                        <div class="controls">
                                                            <input type="text" class="form-control"  name="phoneNumber" required value="${sessionScope.user.phoneNumber}" pattern="[0-9]{10}">
                                                        </div>
                                                    </div>
                                                    <div class="w3_agileits_card_number_grid_right form-group">
                                                        <i>Địa chỉ nhận hàng</i>
                                                        <div class="controls">
                                                            <input type="text" class="form-control"  name="address" required value="${sessionScope.user.address}">
                                                        </div>
                                                    </div>
                                                </div>                                        
                                            </div>
                                            <button class="submit check_out btn" >Lưu thông tin</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="buyed" role="tabpanel" >
                            
                                <div class="table-responsive">
                                    <table class="timetable_sub">
                                        <thead>
                                            <tr>
                                                <th>Đơn hàng</th>
                                                <th>Sản phẩm</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Số lượng</th>
                                                <th>Giá</th>
                                                <th>Thời gian</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% uOrderDAO odb = new uOrderDAO();
                                                user.setOrderList(odb.getUOrder(user.getId()));
                                                ArrayList<UOrder> orderList = user.getOrderList();
                                                for (UOrder o : orderList) {%>
                                            <tr class="rem">
                                                <td class="invert">
                                                    <form action="oDetail" method="post">
                                                        <input type="hidden" value="<%=o.getoId()%>" name="oId">
                                                        <input type="submit" class="myLink1" value="<%=o.getoId()%>">
                                                    </form>
                                                </td>
                                                <td class="invert-image">
                                                    <a href="detail?code=<%=o.getCode()%>">
                                                        <img src="<%=o.getImage()%>/1.jpg" class="img-responsive">
                                                    </a>
                                                </td>
                                                <td class="invert"><%=o.getName()%></td>
                                                <td class="invert">
                                                    <%=o.getQuantity()%>
                                                </td>
                                                <td class="invert"><%=o.formatPrice()%>₫</td>
                                                <td class="invert">
                                                    <%=o.getDate()%>
                                                </td>
                                                <%String status="";
                                                    switch(o.getStatus()){
                                                        case 0:
                                                            status = "Chờ xác nhận";
                                                            break;
                                                        case 1:
                                                            status = "Hoàn thành";
                                                            break;
                                                        case 2:
                                                            status = "Đã Hủy";
                                                            break;
                                                    }
                                                %>
                                                <td class="invert"><%=status%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //top products -->

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
        document.getElementById("password0").onchange = checkPass;
        document.getElementById("password1").onchange = validatePassword;
        document.getElementById("password2").onchange = validatePassword;
    }

    function validatePassword() {
        var pass2 = document.getElementById("password2").value;
        var pass1 = document.getElementById("password1").value;
        if (pass1 != pass2)
            document.getElementById("password2").setCustomValidity("Mật khẩu không khớp");
        else
            document.getElementById("password2").setCustomValidity('');
        //empty string means no validation error
    }
    function checkPass() {
        var pass0 = document.getElementById("password0").value;
        if (pass0 != ${sessionScope.user.password})
            document.getElementById("password0").setCustomValidity("Sai mật khẩu");
        else
            document.getElementById("password0").setCustomValidity('');
    }
</script>
<!-- //password-script -->

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
