 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="en" ng-app="appMain" ng-controller="teamdetailController">

<!-- Mirrored from html.crunchpress.com/soccer/team-detail.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:42:15 GMT -->
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="" />

<%@include  file="prereq.jsp" %>
<title>{{team.name}}</title>

</head>
<body >

<div class="wrap push">

<%@include  file="header.jsp" %>


<div class="page-heading-breadcrumbs">
<div class="container">
<h2>{{team.name}}</h2>

<ul class="breadcrumbs">
<li><a href="#">Home</a></li>
<li>{{team.name}}</li>
</ul>
</div>
</div>


<%-- <div class="overlay-dark theme-padding parallax-window" data-appear-top-offset="600" data-parallax="scroll" data-image-src="${resources}/images/inner-banner/img-03.jpg">
</div> --%>


<main class="main-content">

<div class="team-detail-holder theme-padding white-bg">
<div class="container">

<div class="row">

<div class="col-lg-3 col-md-3 col-sm-5">
<div class="team-column ">
<img ng-src="${resources}{{team.logopath}}" alt="">
<!-- <span class="player-number">12</span>
 --><div class="team-detail">
<!-- <h5>Lionel AndrÃ©s Messi</h5> -->
<!-- <span class="desination">Defender</span>
 --><div ><!-- class="detail-inner" -->
<!-- <ul> -->
<!-- <li>Born</li>
<li>Position</li>
<li>Squad number</li>
<li>Previous Club</li>
<li>Fallow us on</li>
</ul>
<ul>
<li>August 31, 1988</li>
<li>Goalkeeper</li>
<li>13</li>
<li>Atletico Nacional</li> -->
<!-- <li>
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</li>
</ul> -->
</div>
</div>
</div>
</div>


<div class="col-lg-9 col-md-9 col-sm-7">

<div class="team-detail-content theme-padding-bottom" ng-show='team.description'>
<h2>ΠΕΡΙΓΡΑΦΗ ΟΜΑΔΑΣ</h2>
<p>{{team.description}}</p>
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
</div>

<!-- <div class="" ng-repeat='row2 in row.standings.matchdays' style="margin-bottom:30px;"> -->
<!-- 		<h3><span><i class="red-color">{{row2.name}} </i></span></h3>
 -->		
 
 <div class="palyer-career theme-padding-bottom" ng-show='standings.length'>
<h2>Βαθμολογια</h2>
<div class="table-responsive">
<table class="table table-bordered">
<thead>
			<tr>
				<th>Team
				</th>
				<th>Grade
				</th>
				<th>Goal
				</th>
				<th>Mathes
				</th>
				<th>Wins
				</th>
				<th>Defeats
				</th>
				<th>Draws
				</th>
			</tr>
</thead>
<tbody>
			<tr ng-repeat='row1 in standings  | orderBy: "-grade"'>
				<td><a href='team-detail?teamid={{row1.team.id}}'><img src="${resources}/images/small-flags/img-01.png" alt="">{{row1.team.name}}</a>
				</td>
				<td class="td_grade">{{row1.grade}}
				</td>
				<td>{{row1.goal}}
				</td>
				<td>{{row1.game}}
				</td>
				<td>{{row1.win}}
				</td>
				<td>{{row1.defeat}}
				</td>
				<td>{{row1.draw}}
				</td>
			</tr>

</tbody>
</table>
</div>
</div>
 
 
 
 		<div ng-show='games.length' class='theme-padding-bottom'>
 		<h2>ΑΓΩΝΕΣ</h2>
 		<div class="upcoming-fixture" >
		<div class="table-responsive">
		<table class="table table-bordered">
		<tbody>
		<tr ng-repeat='row1 in games | orderBy: "date"''>
		<td>
		<div class="logo-width-name"><a href='team-detail?teamid={{row1.team1.id}}'><img src="${resources}/images/team-logos-small/img-01.png" alt="">{{row1.team1.name}}</a></div>
		</td>
		

		<td class="upcoming-fixture-date own-td-vs" style="text-align:center">
			<span class="own-score" ng-show="row1.score1">{{row1.score1}} - {{row1.score2}} </span><span class="own-date">{{row1.date |  date : "dd/MM HH:mm"}}</span>
			</td>
		<!--  w-icon -->
		
		<td>
		<div class="logo-width-name"><a href='team-detail?teamid={{row1.team2.id}}'><img src="${resources}/images/team-logos-small/img-02.png" alt="">{{row1.team2.name}}</a></div>
		</td>
		</tr>
		
		</tbody>
		</table>
		</div>
		</div>
		</div>
	<!-- 	</div> -->

</div>

</div>


<div class="row" ng-show='players.length'>
<div class="col-lg-9 col-sm-12 pull-right top-palyer">
<h2>ΠΑΙΧΤΕΣ</h2>
<div class="row">

<div class="col-sm-4 col-xs-6 r-full-width" ng-repeat='row in players'>
<div class="team-column">
<img ng-src="${resources}{{row.imagepath}}" alt="">
<span class="player-number">{{row.number}}</span>
<div class="team-detail">
<h5><a href="#">{{row.name}}</a></h5>
<span class="desination">Defender</span>
<div class="detail-inner">
<ul>
<li>Θέση</li>
<li>Νούμερο</li>
<li>Ομάδα</li>
<!-- <li>Ακολουθήστε μας</li> -->
</ul>
<ul>
<li>{{row.soccerposition}}</li>
<li>{{row.number}}</li>
<li>{{team.name}}</li>
<!-- <li>
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</li> -->
</ul>
</div>
</div>
</div>
</div>



</div>
</div>
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
<img class="footer-logo" src="${resources}/images/footer-logo.png" alt="">
<ul class="address-list style-2">
<li><span>Address:</span>1782 Harrison Street Sun Prairie</li>
<li><span>Phone Number:</span>49 30 47373795</li>
<li><span>Email Address:</span><a href="http://html.crunchpress.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="87eae8eee9c7e5ebeee9e3f3e2fff3e0e2e9e2f5e6f3e8f5a9e3e2">[email&#160;protected]</a></li>
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


</body>

<!-- Mirrored from html.crunchpress.com/soccer/team-detail.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:42:16 GMT -->
</html>