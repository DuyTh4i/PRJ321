<%-- 
    Document   : product
    Created on : Oct 28, 2020, 11:21:41 AM
    Author     : Admin
--%>

<%@page import="entity.Admin"%>
<%@page import="model.uOrderDAO"%>
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

    <body>
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
                                                admin.setTotalOrder((odb.getNumberOfOrder()!=null)?Integer.parseInt(odb.getNumberOfOrder()):0);
                                                if(admin.getTotalOrder()>0){
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
                            <%if (session.getAttribute ("admin") == null) {%>
                            <li class="nav-item  mr-lg-2 mb-lg-0 mb-2">
                                <a class="nav-link" href="index">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <%}%>
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2 active">
                                <a class="nav-link dropdown-toggle" href="#" role="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <div class="dropdown-menu">
                                    <ul class="multi-column-dropdown">
                                        <%if(session.getAttribute("admin")!=null){%>
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
                            <%if (session.getAttribute ("admin") == null) {
                                    if (session.getAttribute("user") == null) {%>
                            <li class="nav-item mr-lg-2 mb-lg-0 mb-2">
                                <a href="#" data-toggle="modal" data-target="#exampleModal" class="nav-link text-black">
                                    <i class="fas fa-sign-in-alt mr-2"></i>Đăng nhập</a>
                            </li>
                            <%} else {%>
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
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
                            <%}}else {%>
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
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
        <!-- //modal -->
        <!-- log in -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center">Đăng nhập</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                            <%
                                Cookie[] listCookie = request.getCookies();
                                String username = "";
                                String password = "";
                                String remember = "";
                                for (int i = 0;
                                i< listCookie.length;i++) {
                                    if (listCookie[i].getName().equals("username")) {
                                        username = listCookie[i].getValue();
                                    }
                                    if (listCookie[i].getName().equals("password")) {
                                        password = listCookie[i].getValue();
                                    }
                                    if (listCookie[i].getName().equals("remember")) {
                                        remember = listCookie[i].getValue();
                                    }
                                }
                            %>
                        <form action="login" method="post">
                            <div class="form-group">
                                <label class="col-form-label">Tên đăng nhập</label>
                                <input type="text" class="form-control" placeholder=" " name="username" required autocomplete value="<%=username%>">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Mật Khẩu</label>
                                <input type="password" class="form-control" placeholder=" " name="password" required autocomplete value="<%=password%>">
                            </div>
                            <div class="sub-w3l">
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="customControlAutosizing" name="remember" value="on" <%=("on".equals(remember)) ? "checked" : ""%>>
                                    <label class="custom-control-label" for="customControlAutosizing" >Lưu mật khẩu?</label>
                                </div>
                            </div>
                            <div class="right-w3l">
                                <input type="submit" class="form-control" value="Đăng nhập" id="account">
                            </div>
                        </form>
                        <div style="text-align: center">
                            <p class="text-center dont-do mt-3">Hoặc</p>
                            <a  data-dismiss="modal" aria-label="Close" href="#" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal2"  id="account" style="display: block;padding: 9px 0;margin-top: 10px;color: white">
                                Đăng ký ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- register -->
        <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Đăng ký</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="register" method="post">
                            <div class="form-group">
                                <label class="col-form-label">Tên đăng nhập</label>
                                <input type="text" class="form-control" placeholder=" " name="username" required >
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Mật khẩu</label>
                                <input type="password" class="form-control" placeholder=" " name="password" id="password1" required >
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Xác nhận mật khẩu</label>
                                <input type="password" class="form-control" placeholder=" " name="cPassword" id="password2" required >
                            </div>
                            <div class="sub-w3l">
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="customControlAutosizing2" required>
                                    <label class="custom-control-label" for="customControlAutosizing2">Tôi đồng ý với các điều khoản sử dụng</label>
                                </div>
                            </div>
                            <div class="right-w3l">
                                <input type="submit" class="form-control" value="Đăng ký" id="account">
                            </div>
                        </form>
                    </div>
                    <div style="text-align: center">
                        <p class="text-center dont-do mt-3">Hoặc</p>
                        <a data-dismiss="modal" aria-label="Close" href="#"  data-toggle="modal" data-target="#exampleModal"  id="account" style="display: block;padding: 9px 0;margin-top: 10px;color: white">
                            Đăng nhập ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //modal -->

    <!-- page -->
    <div class="services-breadcrumb">
        <div class="agile_inner_breadcrumb">
            <div class="container">
                <ul class="w3_short">
                    <li>
                        <a href="index">Trang chủ</a>
                        <i>|</i>
                    </li>
                    <li><%=(String) request.getAttribute("mess")%></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //page -->

    <!-- top Products -->

    <div class="container py-xl-4 py-lg-2">
        <!-- tittle heading -->
        <h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
            <%=(String) request.getAttribute("mess")%></h3>
        <!-- //tittle heading -->
        <div class="row">
            <!-- product left -->
            <div class="agileinfo-ads-display col-lg-12">
                <div class="wrapper">
                    <!-- first section -->
                    <div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4">
                        <div class="row">

                            <% ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");

                                if (list.size () 
                                
                                == 0) {%>
                            <div style="position: relative;left:430px"><h4>Không có kết quả phù hợp</h4></div>
                            <%} else
                                for (Product p : list

                                
                                    ) {%>
                            <!--important-->
                            <div class="col-md-4 product-men mt-5">
                                <div class="men-pro-item simpleCart_shelfItem">
                                    <div class="men-thumb-item text-center">
                                        <div style="width: 280px;  height: 450px; position: relative;margin: auto; ">
                                            <img src="<%=p.getImage()%>/1.jpg" alt="" style="object-fit: cover;width: 100%;  height: 100%;">
                                        </div>
                                        <div class="men-cart-pro">
                                            <div class="inner-men-cart-pro">
                                                <a href="detail?code=<%=p.getCode()%>" class="link-product-add-cart">Xem chi tiết</a>
                                            </div>
                                        </div>
                                        <%if (p.getStatus() == 0) {%>
                                        <span class="product-new-top">Đặt hàng</span>
                                        <%}%>
                                        <span class="pCode"><b><%=p.getCode()%></b></span>
                                    </div>
                                    <div class="item-info-product text-center border-top mt-4">
                                        <h4 class="pt-1">
                                            <a href="detail?code=<%=p.getCode()%>"><%=p.getName()%></a>
                                        </h4>
                                        <div class="info-product-price my-2">
                                            <span class="item_price"><%=p.formatPrice()%>₫</span>
                                        </div>
                                        <div class="snipcart-details">
                                            <%if (session.getAttribute("admin") == null){%>
                                            <%if (session.getAttribute("user") != null) {%>
                                            <form action="cart" method="post">
                                                <input type="hidden" name="code" value="<%=p.getCode()%>" />
                                                <input type="hidden" name="page" value="product?status=<%=p.getStatus()%>&begin=<%= request.getParameter("begin")%>&end=<%= request.getParameter("end")%>"/>
                                                <input type="submit" name="submit" value="Thêm vào giỏ" class="button btn" />
                                            </form>
                                            <%} else {%>
                                            <input type="submit" name="submit" value="Thêm vào giỏ" class="button btn" data-toggle="modal" data-target="#exampleModal"/>
                                            <%}}else{%>
                                            <form action="edit" method="get">
                                                <input type="hidden" name="code" value="<%=p.getCode()%>" />
                                                <input type="submit" name="submit" value="Cập nhật thông tin" class="button btn" />
                                            </form>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>

                    </div>
                    <%if (request.getAttribute ("size") != null) {%>
                    <div style="text-align: center">
                        <ul>
                            <%
                                int begin, end;
                                int size = (Integer) request.getAttribute("size");
                                int numpage = size / 9;
                                if (numpage * 9 < size) {
                                    numpage = numpage + 1;
                                }
                                for (int i = 1; i <= numpage; i++) {
                                    begin = (i - 1) * 9;
                                    end = (i * 9);
                                    if (end > size) {
                                        end = size;
                                    }
                            %>

                            <li class="pagination">
                                <a style="<%=(Math.ceil(Integer.parseInt(request.getParameter("end")) / (double) 9) == i) ? "color: white;padding: 8px 16px;text-decoration: none;background-color: black;" : ""%>" href="product?status=<%=request.getParameter("status")%>&begin=<%=begin%>&end=<%=end%>"><%=i%></a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                    <%}%>
                    <!-- //first section -->
                    <!-- second section -->

                    <!-- //second section -->
                    <!-- 3rd section -->

                    <!-- //3rd section -->
                    <!-- fourth section -->

                    <!-- //fourth section -->
                </div>
            </div>
            <!-- //product left -->
            <!-- product right -->
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
<script src="js/minicart.js"></script>
<script>
            paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

            paypals.minicarts.cart.on('checkout', function (evt) {
                var items = this.items(),
                        len = items.length,
                        total = 0,
                        i;

                // Count the number of each item in the cart
                for (i = 0; i < len; i++) {
                    total += items[i].get('quantity');
                }

                if (total < 3) {
                    alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
                    evt.preventDefault();
                }
            });
</script>
<!-- //cart-js -->

<!-- password-script -->
<script>
    window.onload = function () {
        document.getElementById("password1").onchange = validatePassword;
        document.getElementById("password2").onchange = validatePassword;
        <%if (request.getAttribute("error") != null){
            if ( request.getAttribute("error").equals("1")){ %>
                alert("Tài khoản không tồn tại");
    <%}else{%>
        alert("Tài khoản đã tồn tại");
    <%}}%>
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
