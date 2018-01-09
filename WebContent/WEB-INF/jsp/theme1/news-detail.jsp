 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html >
<html class="no-js" lang="en" ng-app="appMain" ng-controller='newsDetailController'>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="" />

<title>{{notice.title}}</title>
<%@include  file="prereq.jsp" %>


</head>
<body >

<div class="wrap push">
 <%@include  file="header.jsp" %> 
 <!-- <div ng-include="'header1.html'"></div>   -->

 
<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΕΙΔΗΣΗ</h2>
<ul class="breadcrumbs">
<li><a href="soccer.html">ΑΡΧΙΚΗ</a></li>
<li>ΕΙΔΗΣΗ</li>
</ul>
</div>
</div>



<main class="main-content">

<div class="theme-padding white-bg">
<div class="container">
<div class="row">

<div class="">

<div class="blog-detail-holder">
<div class="author-header">
<h2>{{notice.title}}</h2>
<div class="aurhor-img-name pull-left">
<%-- <img ng-src="${resources}{{notice.imageurl}}" alt=""> --%>
<strong>by <i class="red-color">Admin</i></strong>
<span>{{notice.date | date}} </span>
</div>
<div class="share-option pull-right">
<span id="share-btn1"><i class="fa fa-share-alt"></i>Share</span>
<div id="show-social-icon1" class="on-hover-share">
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</div>
</div>
</div>
<article>
<p></p>
</article>
<div class="blog-detail">
<figure>
<img ng-src="${resources}{{notice.imageurl}}" alt="" style='max-height:400px'>
</figure>
<article>
<p>{{notice.content}}</p>
 </article>
</div>
<div class="tags-holder">
<ul class="tags-list pull-left">
<li><i class="fa fa-tags"></i>Tags</li>
<li><a href="#">Scores</a></li>
<li><a href="#">transfers</a></li>
<li><a href="#">teams</a></li>
<li><a href="#">cups</a></li>
</ul>
<ul class="social-icons pull-right">
<li>Share this post</li>
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</div>
<!-- <div class="next-prev-option">
<a href="#" class="prev-blog pull-left">
<img src="images/blog-detail/prev-img.jpg" alt="">
<span><i class="fa fa-angle-left"></i>Previous Post</span>
<h5>Tottenham Hotspur are growing</h5>
<span class="m-0">23 December 2015</span>
</a>
<a href="#" class="next-blog pull-right">
<img src="images/blog-detail/next-img.jpg" alt="">
<span>Next Post<i class="fa fa-angle-right"></i></span>
<h5>Tottenham Hotspur are growing</h5>
<span class="m-0">23 December 2015</span>
</a>
</div>
<div class="about-aurthor-holder theme-margin-bottom">
<div class="about-aurthor">
<img src="images/blog-detail/aurthor.jpg" alt="">
<h5>Taste Dictatorr <i class="red-color">Marco Bale</i></h5>
<p>Id quisque cursus est volutpat lorem phasellus ut neque vivamus dolor, ornare sociosqu purus taciti erat egestas integer enim sem porta ligula semper suspendisse mi metus auctor faucibus lobortis senectus, at metus nisl ornare consectetur.</p>
<span><a href="#"><i class="fa fa-twitter"></i>@marcobale #dominname</a></span>
</div>
</div> -->
</div>


<!-- <div class="blog-grid-view theme-padding-bottom">
<h2>Related Match</h2>
<div class="row">

<div class="col-lg-4 col-xs-12">

<div class="large-post-img">
<img src="images/blog-grid-view/img-01.jpg" alt="">
</div>


<div class="large-post-detail style-3">
<span class="red-color">Englis FA Cup </span>
<h2><a href="#">Man United reunion for Ibrahimovic, Mourinho Klopp plots</a></h2>
</div>


<div class="detail-btm">
<span>on Jun 27, 2014 </span>
<div class="share-option pull-right"> 
<span id="share-btn2"><i class="fa fa-share-alt"></i>Share</span>
<div id="show-social-icon2" class="on-hover-share">
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


<div class="col-lg-4 col-xs-12">

<div class="large-post-img video-post">
<img src="images/blog-grid-view/img-02.jpg" alt="">
<span class="play-lable fa fa-video-camera"></span>
<a class="position-center-center play-icon" href="http://www.youtube.com/watch?v=cH6kxtzovew" data-rel="prettyPhoto[video]"><i class="fa fa-video-camera"></i></a>
</div>


<div class="large-post-detail style-3">
<span class="red-color">Englis FA Cup </span>
<h2><a href="#">Man United reunion for Ibrahimovic, Mourinho Klopp plots</a></h2>
</div>


<div class="detail-btm">
<span>on Jun 27, 2014 </span>
<div class="share-option pull-right">
<span id="share-btn3"><i class="fa fa-share-alt"></i>Share</span>
<div id="show-social-icon3" class="on-hover-share">
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


<div class="col-lg-4 col-xs-12">

<div class="large-post-img">
<img src="images/blog-grid-view/img-03.jpg" alt="">
</div>


<div class="large-post-detail style-3">
<span class="red-color">Englis FA Cup </span>
<h2><a href="#">Man United reunion for Ibrahimovic, Mourinho Klopp plots</a></h2>
</div>


<div class="detail-btm">
<span>on Jun 27, 2014 </span>
<div class="share-option pull-right">
<span id="share-btn5"><i class="fa fa-share-alt"></i>Share</span>
<div id="show-social-icon5" class="on-hover-share">
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
</div>


<div class="comment-holder theme-padding-bottom">
<h2>Latest comments</h2>
<ul>
<li>
<img class="position-center-x" src="images/commenter/img-01.jpg" alt="">
<div class="comment-detail">
<h5><a href="#">Rachel Evans</a></h5>
<span>December 23, 2015, 10:59 am</span>
<p>Vestibulum eros rutrum suspendisse dictum commodo magna habitasse taciti tincidunt non cursus conubia accumsan, vitae dapibus cursus id tristique porta felis porttitor ante primis libero nisi arcu elementum aliquam tincidunt eros at sapien in ac himenaeos primis duis tellus.</p>
<a class="reply-btn" href="#"><i class="fa fa-reply"></i>Reply</a>
</div>
</li>
<li class="sub-comment">
<ul>
<li>
<img class="position-center-x" src="images/commenter/img-1-1.jpg" alt="">
<div class="comment-detail">
<h5><a href="#">Kiana Sanders</a></h5>
<span>December 23, 2015, 10:59 am</span>
<p>Vestibulum eros rutrum suspendisse dictum commodo magna habitasse taciti tincidunt non cursus conubia accumsan, vitae dapibus cursus.</p>
<a class="reply-btn" href="#"><i class="fa fa-reply"></i>Reply</a>
</div>
</li>
<li class="sub-comment">
<ul>
<li>
<img class="position-center-x" src="images/commenter/img-2-1.jpg" alt="">
<div class="comment-detail">
<h5><a href="#">Mahesh Kantariya</a></h5>
<span>December 23, 2015, 10:59 am</span>
<p>Vestibulum eros rutrum suspendisse dictum commodo magna habitasse taciti tincid</p>
<a class="reply-btn" href="#"><i class="fa fa-reply"></i>Reply</a>
</div>
</li>
</ul>
</li>
</ul>
</li>
<li>
<img class="position-center-x" src="images/commenter/img-02.jpg" alt="">
<div class="comment-detail">
<h5><a href="#">Rachel Evans</a></h5>
<span>December 23, 2015, 10:59 am</span>
<p>Vestibulum eros rutrum suspendisse dictum commodo magna habitasse taciti tincidunt non cursus conubia accumsan, vitae dapibus cursus id tristique porta felis porttitor ante primis libero nisi arcu elementum aliquam tincidunt eros at sapien in ac himenaeos primis duis tellus.</p>
<a class="reply-btn" href="#"><i class="fa fa-reply"></i>Reply</a>
</div>
</li>
</ul>
</div>


<div class="leave-a-reply">
<h2>Leave a Reply</h2>
<form class="row">
<div class="col-sm-4">
<div class="form-group">
<input type="text" class="form-control" placeholder="Name">
<i class="fa fa-user"></i>
</div>
<div class="form-group">
<input type="text" class="form-control" placeholder="Email *">
<i class="fa fa-envelope"></i>
</div>
<div class="form-group">
<input type="text" class="form-control" placeholder="Phone">
<i class="fa fa-phone"></i>
</div>
<button class="btn red-btn full-width">Send Comments</button>
</div>
<div class="col-sm-8">
<div class="form-group">
<textarea class="form-control style-d" rows="11" id="comment" placeholder="Write Comments here..."></textarea>
<i class="fa fa-pencil-square-o"></i>
</div>
</div>
</form>
</div> -->

</div>


<!-- <div class="col-lg-3 col-md-3 col-sm-5 col-xs-12">

<div class="aside-search-bar">
<input class="form-control" type="text" placeholder="Search...">
<button><i class="fa fa-search"></i></button>
</div>


<div class="aside-widget">
<h3><span>Top Categories</span></h3>
<div class="top-categories">
<ul>
<li><a href="#">Cricket</a></li>
<li><a href="#">Football</a></li>
<li><a href="#">Hockey</a></li>
<li><a href="#">Tennis</a></li>
<li><a href="#">Basketball</a></li>
<li><a href="#">Baseball</a></li>
<li><a href="#">Golf</a></li>
<li><a href="#">Cycling</a></li>
<li><a href="#">Motorsports</a></li>
</ul>
</div>
</div>


<div class="aside-widget">
<h3><span>Popular News</span></h3>
<div class="Popular-news">
<ul>
<li>
<img src="images/popular-news/img-01.jpg" alt="">
 <h5><a href="#">Two touch penalties, imaginary cards</a></h5>
<span class="red-color"><i class="fa fa-clock-o"></i>22 Feb, 2016</span>
</li>
<li>
<img src="images/popular-news/img-02.jpg" alt="">
<h5><a href="#">Two touch penalties, imaginary cards</a></h5>
<span class="red-color"><i class="fa fa-clock-o"></i>22 Feb, 2016</span>
</li>
<li>
<img src="images/popular-news/img-03.jpg" alt="">
<h5><a href="#">Two touch penalties, imaginary cards</a></h5>
<span class="red-color"><i class="fa fa-clock-o"></i>22 Feb, 2016</span>
</li>
<li>
<img src="images/popular-news/img-04.jpg" alt="">
<h5><a href="#">Two touch penalties, imaginary cards</a></h5>
<span class="red-color"><i class="fa fa-clock-o"></i>22 Feb, 2016</span>
</li>
</ul>
</div>
</div>


<div class="aside-widget">
<div class="aside-post">

<div class="large-post-img video-post">
<img src="images/aside-post.jpg" alt="">
<span class="play-lable fa fa-video-camera"></span>
<a class="position-center-center play-icon" href="http://www.youtube.com/watch?v=cH6kxtzovew" data-rel="prettyPhoto[video]"><i class="fa fa-video-camera"></i></a>
</div>


<div class="large-post-detail">
<h2><a href="#">Somehow there wa enough distaste presumption of it) to</a></h2>
<span class="red-color">22 Feb, 2016</span>
</div>

</div>
</div>


<div class="aside-widget">
<h3><span>Archive</span></h3>
<div id="calendar" class="calendar"></div>
</div>


<div class="aside-widget">
<h3><span>Tag clouds</span></h3>
<div class="tag-clouds">
<ul>
<li><a href="#">Scores</a></li>
<li><a href="#">transfers</a></li>
<li><a href="#">teams</a></li>
<li><a href="#">cups</a></li>
<li><a href="#">All News</a></li>
<li><a href="#">Photos</a></li>
<li><a href="#">Videos</a></li>
<li><a href="#">match</a></li>
</ul>
</div>
</div>


<div class="aside-widget">
<h3><span>instgram</span></h3>
<div class="instgram-writer">
<img src="images/instgram-imgs/instgram-writer.jpg" alt="">
<p>@domainnamein spiration from all over the world</p>
</div>
<div class="instgram-imgs">
<ul>
 <li><a href="#"><img src="images/instgram-imgs/img-01.jpg" alt=""></a></li>
<li><a href="#"><img src="images/instgram-imgs/img-02.jpg" alt=""></a></li>
<li><a href="#"><img src="images/instgram-imgs/img-03.jpg" alt=""></a></li>
<li><a href="#"><img src="images/instgram-imgs/img-04.jpg" alt=""></a></li>
<li><a href="#"><img src="images/instgram-imgs/img-05.jpg" alt=""></a></li>
<li><a href="#"><img src="images/instgram-imgs/img-06.jpg" alt=""></a></li>
<li><a href="#"><img src="images/instgram-imgs/img-07.jpg" alt=""></a></li>
<li><a href="#"><img src="images/instgram-imgs/img-08.jpg" alt=""></a></li>
</ul>
</div>
</div>


<div class="aside-widget">
<h3><span>Tweet</span></h3>
<div class="twitter-list">
<ul>
<li>
<h5><a href="#"><i class="fa fa-twitter"></i>Dhiren Adesara</a></h5>
<p>Just posted an unbeliveably amazing sketch to make you feel sad about your skills <i>@dribble-drbl.in/efzh</i></p>
</li>
<li>
<h5><a href="#"><i class="fa fa-twitter"></i>Dhiren Adesara</a></h5>
<p>Just posted an unbeliveably amazing sketch to make you feel sad about your skills <i>@dribble-drbl.in/efzh</i></p>
</li>
<li>
<h5><a href="#"><i class="fa fa-twitter"></i>Dhiren Adesara</a></h5>
<p>Just posted an unbeliveably amazing sketch to make you feel sad about your skills <i>@dribble-drbl.in/efzh</i></p>
</li>
</ul>
</div>
</div>


<div class="aside-widget">
<a href="#"><img src="images/adds.jpg" alt=""></a>
</div>

</div>
 -->
</div>
</div>
</div>

</main>


<footer class="main-footer style-2">

<div class="container">

<div class="footer-column border-0">
<div class="row">

<div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
<div class="column-widget h-white">
<div class="logo-column p-white">
<img class="footer-logo" src="images/footer-logo.png" alt="">
<ul class="address-list style-2">
<li><span>Address:</span>1782 Harrison Street Sun Prairie</li>
<li><span>Phone Number:</span>49 30 47373795</li>
<li><span>Email Address:</span><a href="http://html.crunchpress.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="cda0a2a4a38dafa1a4a3a9b9a8b5b9aaa8a3a8bfacb9a2bfe3a9a8">[email&#160;protected]</a></li>
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
<a href="#"><img src="images/footer-add.jpg" alt=""></a>
</div>
</div>


<div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
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

</html>