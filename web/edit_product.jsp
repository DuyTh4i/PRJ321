<%-- 
    Document   : detail
    Created on : Oct 27, 2020, 11:09:55 AM
    Author     : Admin
--%>

<%@page import="model.uOrderDAO"%>
<%@page import="entity.Admin"%>
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

        <!-- header-bottom-->
        <div class="header-bot">
            <div class="container">
                <div class="row header-bot_inner_wthreeinfo_header_mid">
                    <!-- logo -->
                    <div class="col-md-3 logo_agile">
                        <h1 class="text-center">
                            <a href="#" class="font-weight-bold font-italic">
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
                                    <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm" name="search" aria-label="Tìm kiếm" required>
                                    <button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
                                </form>
                            </div>
                            <!-- //search -->
                            <!-- cart details -->
                            <div class="col-2 top_nav_right text-center mt-sm-0 mt-2">
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
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2 active">
                                <a class="nav-link dropdown-toggle" href="#" role="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Sản phẩm
                                </a>
                                <div class="dropdown-menu ">
                                    <ul class="multi-column-dropdown">
                                        <li>
                                            <a class="dropdown-item" href="add">Thêm sản phẩm</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item " href="product?status=1&begin=0&end=9">Hàng có sẵn</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item " href="product?status=0&begin=0&end=9">Hàng oder</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">👑Admin👑
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
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- //navigation -->

        <!-- log in -->

        <!-- register -->

        <!-- //modal -->



        <!-- page -->
        <% Product p = (Product) request.getAttribute("p");%>
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">
                <div class="container">
                    <ul class="w3_short">
                        <li>
                            <a href="#">Trang chủ</a>
                            <i>|</i>
                        </li>
                        <li><%=p.getName()%></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //page -->

        <!-- Single Page -->
        <div class="banner-bootom-w3-agileits py-5">
            <div class="container py-xl-4 py-lg-2">
                <!-- tittle heading -->
                <!-- //tittle heading -->
                <div class="row">
                    <div class="col-lg-5 col-md-8 single-right-left ">
                        <div class="grid images_3_of_2">
                            <div class="flexslider">
                                <ul class="slides">
                                    <li data-thumb="<%=p.getImage()%>/1.jpg">
                                        <div class="thumb-image">
                                            <img src="<%=p.getImage()%>/1.jpg" data-imagezoom="true" class="img-fluid" alt=""> </div>
                                    </li>
                                    <li data-thumb="<%=p.getImage()%>/2.jpg">
                                        <div class="thumb-image">
                                            <img src="<%=p.getImage()%>/2.jpg" data-imagezoom="true" class="img-fluid" alt=""> </div>
                                    </li>
                                    <li data-thumb="<%=p.getImage()%>/3.jpg">
                                        <div class="thumb-image">
                                            <img src="<%=p.getImage()%>/3.jpg" data-imagezoom="true" class="img-fluid" alt=""> </div>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 single-right-left simpleCart_shelfItem">
                        <form action="edit" method="post">
                            <h2 class="mb-3"><input type="text" name="name" value="<%=p.getName()%>" required></h2>
                            <p class="mb-3">
                                <span class="item_price_detail"><input type="number" name="price" value="<%=p.getPrice()%>" required>₫</span>
                            </p>

                            <div class="product-single-w3l">
                                <ul>
                                    <li class="mb-1">
                                        Nhân vật: <input type="text" name="character" value="<%=p.getDescribe()[0]%>" required>
                                    </li>
                                    <li class="mb-1">
                                        Series: <input type="text" name="describe" value="<%=p.getDescribe()[1]%>" required>
                                    </li>
                                    <li class="mb-1">
                                        Hãng sản xuất: <%=p.getDescribe()[2]%>
                                    </li>
                                    <li class="mb-1">
                                        Kích thước: <%=p.getDescribe()[3]%>
                                    </li>
                                    <li class="mb-1">
                                        <%String[] rd = p.getReleaseDate().split("/");%>
                                        Ngày phát hành: <input type="date" name="date" value="<%=rd[1]%>-<%=rd[0]%>-01" required>
                                    </li>
                                </ul>
                            </div>
                            <br>
                            <input type="hidden" name="code" value="<%=p.getCode()%>" />
                            <div class="occasion-cart">
                                <div class="snipcart-details">
                                    <input type="submit" value="Cập nhật" class="button btn"/>
                                </div>
                            </div>
                        </form>
                            <div style="margin-top: 10px">
                            <form action="stop" method="post">
                                <input type="hidden" name="code" value="<%=p.getCode()%>" />
                                <div class="occasion-cart">
                                    <div class="snipcart-details">
                                        <input type="submit" value="Dừng bán sản phẩm" class="button btn"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
<!-- //Single Page -->

<!-- middle section -->
<!-- middle section -->

<!-- footer -->
<footer>
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
    <!-- //footer third section -->

    <!-- footer fourth section -->

    <!-- //brands -->
    <!-- payment -->

    <!-- //payment -->
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

<!-- imagezoom -->
<script src="js/imagezoom.js"></script>
<!-- //imagezoom -->

<!-- flexslider -->
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

<script src="js/jquery.flexslider.js"></script>
<script>
    // Can also be used with $(document).ready()
    $(window).load(function () {
        $('.flexslider').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
        });
    });
</script>
<!-- //FlexSlider-->

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
