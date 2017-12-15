<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="en">

<!-- Mirrored from html.crunchpress.com/soccer/home-1.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:37:07 GMT -->
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="" />

<title>Soccer HTML5 Template</title>

<!-- COMMON >>>>>>>>>>>>> -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-route.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-animate.js"></script>
		<!-- ANGULAR MATERIAL >>>>> -->
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-aria.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-messages.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js"></script>
<script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.5/angular-material.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
<link rel='stylesheet' href='https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.5/angular-material.css'>
<!--<link rel='stylesheet' href='https://material.angularjs.org/1.1.5/docs.css'> -->
		<!-- <<<<< ANGULAR MATERIAL -->	
	
	<spring:url value="/resources/main.js" var="crunchifyJS" />
 	<spring:url value="/resources/main.css" var="maincss" />
 	<script src="${crunchifyJS}"></script>
	<link rel="stylesheet" type="text/css" href="${maincss}">  
<!-- <<<<<<<<<<<<< COMMON  -->


<spring:url value="/resources/theme1" var="resources" />

<link rel="stylesheet" href="${resources}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${resources}/css/main.css">
<link rel="stylesheet" href="${resources}/css/icomoon.css">
<link rel="stylesheet" href="${resources}/css/animate.css">
<link rel="stylesheet" href="${resources}/css/transition.css">
<link rel="stylesheet" href="${resources}/css/font-awesome.min.css">
<link rel="stylesheet" href="${resources}/css/style.css">
<link rel="stylesheet" href="${resources}/css/color.css">
<link rel="stylesheet" href="${resources}/css/responsive.css">

<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i,800|Open+Sans:400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

<script src="${resources}/js/vendor/modernizr.js"></script>
</head>
<body ng-app="appMain">



<div class="wrap push">

<header class="header style-3">

<div class="topbar-and-logobar">
<div class="container">

<div class="responsive-btn pull-right">
<a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
</div>


<ul class="user-login-option pull-right">
<li class="social-icon">
<ul class="social-icons style-5">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</li>
<li class="login-modal">
<a href="#" class="login" data-toggle="modal" data-target="#login-modal"><i class="fa fa-user"></i>member Login</a>
<div class="modal fade" id="login-modal">
<div class="login-form position-center-center">
<h2>Login<button class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button></h2>
<form>
<div class="form-group">
<input type="text" class="form-control" name="user" placeholder="domain@live.com">
<i class=" fa fa-envelope"></i>
</div>
<div class="form-group">
<input type="password" class="form-control" name="pass" placeholder="**********">
<i class=" fa fa-lock"></i>
</div>
<div class="form-group custom-checkbox">
<label>
<input type="checkbox"> Stay login
</label>
<a class="pull-right forgot-password" href="#"></a>
<a href="#" class="pull-right forgot-password" data-toggle="modal" data-target="#login-modal-2">Forgot password?</a>
</div>
<div class="form-group">
<button class="btn full-width red-btn">Login</button>
</div>
</form>
<span class="or-reprater"></span>
<ul class="others-login-way">
<li><a class="facebook-bg" href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
<li><a class="tweet-bg" href="#"><i class="fa fa-twitter"></i>Tweet</a></li>
<li><a class="linkedin-bg" href="#"><i class="fa fa-linkedin"></i>Linkedin</a></li>
<li><a class="google-plus-bg" href="#"><i class="fa fa-google-plus"></i>Google+</a></li>
</ul>
</div>
</div>
<div class="modal fade" id="login-modal-2">
<div class="login-form position-center-center">
<h2>Forgot password<button class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button></h2>
<form>
<div class="form-group">
<input type="text" class="form-control" name="user" placeholder="domain@live.com">
<i class=" fa fa-envelope"></i>
</div>
<div class="form-group">
<input type="password" class="form-control" name="pass" placeholder="**********">
<i class=" fa fa-lock"></i>
</div>
<div class="form-group">
<button class="btn full-width red-btn">Login</button>
</div>
</form>
</div>
</div>
</li>
<li class="language-dropdown">
<a id="choses-lang" href="#"><i class="fa fa-globe"></i>Eng<i class="fa fa-caret-down"></i></a>
<ul id="language-dropdown">
<li><a href="#"><img src="${resources}/images/flags/img-02.jpg" alt="">ger</a></li>
<li><a href="#"><img src="${resources}/images/flags/img-03.jpg" alt="">fra</a></li>
<li><a href="#"><img src="${resources}/images/flags/img-04.jpg" alt="">bra</a></li>
</ul>
</li>
</ul>

</div>
</div>


<div class="nav-holder">
<div class="container">
<div class="maga-drop-wrap">

<div class="logo">
<a href="home-1.html"><img src="${resources}/images/logo-4.png" alt=""></a>
</div>


<div class="search-bar-holder pull-right">
<div class="search-bar">
<input type="text" class="form-control" placeholder="search enter please...">
<i class="fa fa-search"></i>
</div>
</div>


<ul class="nav-list pull-right">
<li>
<a href="#">Home</a>
<ul>
<li><a href="#!home1">Home</a></li>
<li><a href="${resources}/home-2.html">Home 2</a></li>
<li><a href="#!championlist">Champions</a></li>

</ul>
</li>
<li><a href="${resources}/about.html">about</a></li>
<li>
<a href="${resources}/team.html">team</a>
<ul>
<li><a href="${resources}/team.html">team</a></li>
<li><a href="${resources}/team-detail.html">Team detail</a></li>
<li><a href="${resources}/team-width-sidebar.html">team-widthsidebar</a></li>
</ul>
</li>
<li class="mega-dropdown">
<a href="#">news</a>
<ul>
<li class="row">
<div class="col-lg-3 col-md-3 col-sm-3">
<div class="blog-categories">
<h2>Blog Categories</h2>
<ul class="blog-categories-list">
<li><a href="#">Blog 1 Column (Right Sidebar)</a></li>
<li><a href="#">Blog Medium With Right Sidebar</a></li>
<li><a href="#">Masonry (Right Sidebar)</a></li>
<li><a href="#">Blog 4 Columns</a></li>
<li><a href="#">Blog 1 Column (Right Sidebar)</a></li>
<li><a href="#">Masonry (Right Sidebar)</a></li>
<li><a href="#">Blog 1 Column (Right Sidebar)</a></li>
 </ul>
</div>
</div>
<div class="col-lg-9 col-md-9 col-sm-9">
<div id="mega-blog-slider" class="mega-blog-slider">

<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-1.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div>


<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-2.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div>


<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-3.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div>


<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-4.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div>


<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-1.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div>


<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-2.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div>

</div>
</div>
</li>
</ul>
</li>
<li>
<a href="#">Match</a>
<ul>
<li><a href="match.html">Match</a></li>
<li><a href="match-detail.html">Match Detail</a></li>
<li><a href="match-result.html">Match Result</a></li>
</ul>
</li>
<li>
<a href="#">shop</a>
<ul>
<li><a href="shop.html">shop</a></li>
<li><a href="shop-detail.html">shop detail</a></li>
<li><a href="cart.html">cart</a></li>
</ul>
</li>
<li>
<a href="#">pages</a>
<ul>
<li><a href="gallery.html">gallery</a></li>
<li><a href="blog.html">blog</a></li>
<li><a href="blog-detail.html">blog detail</a></li>
<li><a href="blog-grid-view.html">blog grid view</a></li>
<li><a href="blog-grid-view-2.html">blog grid view-2</a></li>
<li><a href="blog-larg-view.html">blog larg view</a></li>
<li><a href="blog-list-view.html">blog list view</a></li>
<li><a href="point-table.html">point table</a></li>
<li><a href="404.html">404</a></li>
<li><a href="underconstraction.html">underconstraction</a></li>
</ul>
</li>
<li><a href="contact.html">contact</a></li>
</ul>

</div>
</div>
</div>

</header>
<div ng-view></div>

<!-- PAGESTART -->


<!-- PAGEEND -->

<footer class="main-footer style-2">

<div class="container">

<div class="footer-column border-0">
<div class="row">

<div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
<div class="column-widget h-white">
<div class="logo-column p-white">
<img class="footer-logo" src="${resources}/images/footer-logo.png" alt="">
<ul class="address-list style-2">
<li><span>Address:</span>1782 Harrison Street Sun Prairie</li>
<li><span>Phone Number:</span>49 30 47373795</li>
<li><span>Email Address:</span><a href="http://html.crunchpress.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6a070503042a080603040e1e0f121e0d0f040f180b1e0518440e0f">[email&#160;protected]</a></li>
</ul>
<span class="follow-us">follow us </span>
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
<li><a class="tumblr" href="#"><i class="fa fa-tumblr"></i></a></li>
</ul>
</div>
</div>
</div>


<div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
<div class="column-widget h-white">
<h5>Advertisment</h5>
<a href="#"><img src="${resources}/images/footer-add.jpg" alt=""></a>
</div>
</div>


<div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
<div class="column-widget h-white">
<h5>Sponcer</h5>
<ul id="brand-icons-slider-2" class="brand-icons-slider-2">
<li>
<a href="#"><img src="${resources}/images/brand-icons/img-1-1.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-2.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-3.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-4.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-5.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-6.png" alt=""></a>
</li>
<li>
<a href="#"><img src="${resources}/images/brand-icons/img-1-1.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-2.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-3.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-4.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-5.png" alt=""></a>
<a href="#"><img src="${resources}/images/brand-icons/img-1-6.png" alt=""></a>
</li>
</ul>
</div>
</div>

</div>
</div>

</div>


<div class="copy-rights">
<div class="container">
<p>Â© Copyright by <i class="red-color">FineLayers</i> All rights reserved.</p>
<a class="back-to-top scrollup" href="#"><i class="fa fa-angle-up"></i></a>
</div>
</div>

</footer>

</div>


<nav id="menu" class="responive-nav">
<a class="r-nav-logo" href="home-1.html"><img src="${resources}/images/logo-1.png" alt=""></a>
<ul class="respoinve-nav-list">
<li>
<a data-toggle="collapse" href="#list-1"><i class="pull-right fa fa-angle-down"></i>Home</a>
<ul class="collapse" id="list-1">
<li><a href="home-1.html">Home 1</a></li>
<li><a href="index-2.html">Home 2</a></li>
<li><a href="index-3.html">Home 3</a></li>
</ul>
</li>
<li>
<a href="about.html">About</a>
</li>
<li>
<a data-toggle="collapse" href="#list-2"><i class="pull-right fa fa-angle-down"></i>Team</a>
<ul class="collapse" id="list-2">
<li><a href="team.html">Team</a></li>
<li><a href="team-detail.html">Team Detail</a></li>
<li><a href="team-widthsidebar.html">team widthsidebar</a></li>
</ul>
</li>
<li>
<a href="gallery.html">Gallery</a>
</li>
<li>
<a href="#">News</a>
</li>
<li>
<a data-toggle="collapse" href="#list-3"><i class="pull-right fa fa-angle-down"></i>Match</a>
<ul class="collapse" id="list-3">
<li><a href="match.html">match</a></li>
<li><a href="match-detail.html">match detail</a></li>
<li><a href="match-result.html">match result</a></li>
</ul>
</li>
<li>
<a data-toggle="collapse" href="#list-4"><i class="pull-right fa fa-angle-down"></i>Shop</a>
<ul class="collapse" id="list-4">
<li><a href="shop.html">shop</a></li>
<li><a href="cart.html">cart</a></li>
<li><a href="shop-detail.html">shop detail</a></li>
</ul>
</li>
<li>
<a data-toggle="collapse" href="#list-5"><i class="pull-right fa fa-angle-down"></i>Pages</a>
<ul class="collapse" id="list-5">
<li><a href="404.html">404</a></li>
<li><a href="underconstraction.html">underconstraction</a></li>
</ul>
</li>
<li>
<a data-toggle="collapse" href="#list-6"><i class="pull-right fa fa-angle-down"></i>Blog</a>
<ul class="collapse" id="list-6">
<li><a href="blog.html">blog</a></li>
<li><a href="blog-detail.html">blog detail</a></li>
</ul>
</li>
<li><a href="contact.html">Contact</a></li>
</ul>
</nav>


<script data-cfasync="false" src="${resources}/js/cloudflare-static/email-decode.min.js"></script><script src="${resources}/js/vendor/jquery.js"></script>
<script src="${resources}/js/vendor/bootstrap.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src="${resources}/js/gmap3.min.js"></script>
<script src="${resources}/js/bigslide.js"></script>
<script src="${resources}/js/slick.js"></script>
<script src="${resources}/js/waterwheelCarousel.js"></script>
<script src="${resources}/js/contact-form.js"></script>
<script src="${resources}/js/countTo.js"></script>
<script src="${resources}/js/datepicker.js"></script>
<script src="${resources}/js/rating-star.js"></script>
<script src="${resources}/js/range-slider.js"></script>
<script src="${resources}/js/spinner.js"></script>
<script src="${resources}/js/parallax.js"></script>
<script src="${resources}/js/countdown.js"></script>
<script src="${resources}/js/appear.js"></script>
<script src="${resources}/js/prettyPhoto.js"></script>
<script src="${resources}/js/wow-min.js"></script>
<script src="${resources}/js/main.js"></script>
</body>

<!-- Mirrored from html.crunchpress.com/soccer/home-1.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:39:35 GMT -->
</html>