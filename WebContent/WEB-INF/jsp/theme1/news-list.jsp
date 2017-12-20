 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="en">

<!-- Mirrored from html.crunchpress.com/soccer/blog-grid-view.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:43:46 GMT -->
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="" />

<title>ΝΕΑ</title>
<%@include  file="prereq.jsp" %>


</head>
<body ng-app="appMain" ng-controller='newsController'>

<div class="wrap push">

<%@include  file="header.jsp" %> 
<!--  <div ng-include="'header1.html'"></div>  
 -->


<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΟΛΑ ΤΑ ΝΕΑ</h2>
<ul class="breadcrumbs">
<li><a href="soccer.html">ΑΡΧΙΚΗ</a></li>
<li>ΝΕΑ</li>
</ul>
</div>
</div>


<main class="main-content">

<div class="theme-padding white-bg">
<div class="container">

<div class="blog-grid-view style-2">
<div class="row">

<div class="col-lg-4 col-xs-12" ng-repeat='row in news | orderBy:"-date"'>
<div class="blog-grid-figure"   >

<div class="large-post-img">

<div style='background:url(${resources}{{row.imageurl}}) no-repeat center; 
  width:100%; height:250px;background-size:cover; '>
</div>

<%-- <img src="${resources}{{row.imageurl}}" alt=""> --%>
</div>


<div class="large-post-detail style-3" style='height:100px; overflow:hidden'>
<span class="red-color">{{row.date | date}}</span>
<h2><a ng-href="news-detail?id={{row.id}}">{{row.title}}</a></h2>
<!-- <p>Enim volutpat ac lectus in blandit vehicula faucibus non lectus vivamus cras etiam curabitur, vulputate ultricies curabitur accumsan varius vel volutpat aptent...
interdum gravida morbi non justo sociosqu aliquam justo ultrices duis laoreet mattis, consequat litora pellentesque</p>
 -->
 
 
 
 </div>


<div class="detail-btm">
<!-- <span>on Jun 27, 2014 </span>
 --><div class="share-option pull-right">
<span id="share-btn6"><i class="fa fa-share-alt"></i>Share</span>
<div id="show-social-icon6" class="on-hover-share">
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</div>
</div>
</div>

</div>
</div>

<!-- <div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
<div class="column-widget h-white">
<h5>Sponcer</h5>
<ul id="brand-icons-slider-2" class="brand-icons-slider-2">
<li>
<a href="#"><img src="images/brand-icons/img-1-1.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-2.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-3.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-4.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-5.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-6.png" alt=""></a>
</li>
<li>
<a href="#"><img src="images/brand-icons/img-1-1.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-2.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-3.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-4.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-5.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-6.png" alt=""></a>
</li>
</ul>
</div>
</div>
 -->
 
 
<div class="col-xs-12">
<div class="pagination-holder">
<ul class="pagination">
<li><a href="#"><i class="fa fa-angle-double-left"></i>Previous</a></li>
<li><a href="#">1</a></li>
<li><a href="#">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">4</a></li>
<li><a href="#">5</a></li>
<li><a href="#">7</a></li>
<li><a href="#"><i class="fa fa-ellipsis-h"></i></a></li>
<li><a href="#">28</a></li>
<li><a href="#">Next<i class="fa fa-angle-double-right"></i></a></li>
</ul>
</div>
</div>
 
</div>
</div>

</div>
</div>
</main>

<div class="copy-rights">
<div class="container">
<p>Â© Copyright by <i class="red-color">FineLayers</i> All rights reserved.</p>
<a class="back-to-top scrollup" href="#"><i class="fa fa-angle-up"></i></a>
</div>
</div>

</footer>

</div>


<nav id="menu" class="responive-nav">
<a class="r-nav-logo" href="home-1.html"><img src="images/logo-1.png" alt=""></a>
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


<script data-cfasync="false" src="../cdn-cgi/scripts/af2821b0/cloudflare-static/email-decode.min.js"></script><script src="js/vendor/jquery.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src="js/gmap3.min.js"></script>
<script src="js/bigslide.js"></script>
<script src="js/slick.js"></script>
<script src="js/waterwheelCarousel.js"></script>
<script src="js/contact-form.js"></script>
<script src="js/countTo.js"></script>
<script src="js/datepicker.js"></script>
<script src="js/rating-star.js"></script>
<script src="js/range-slider.js"></script>
<script src="js/spinner.js"></script>
<script src="js/parallax.js"></script>
<script src="js/countdown.js"></script>
<script src="js/appear.js"></script>
<script src="js/prettyPhoto.js"></script>
<script src="js/wow-min.js"></script>
<script src="js/main.js"></script>
</body>

<!-- Mirrored from html.crunchpress.com/soccer/blog-grid-view.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:43:50 GMT -->
</html>