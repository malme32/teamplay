

    
 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="en">

<!-- Mirrored from html.crunchpress.com/soccer/home-1.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:37:07 GMT -->
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="" />

<title>ΠΡΩΤΑΘΛΗΜΑΤΑ</title>

<%@include  file="prereq.jsp" %>


</head>
<body ng-app="appMain" ng-controller="championsController">

<div class="wrap push">
<!--  <div ng-include="'header1.html'"></div>
 -->

 <%@include  file="header.jsp" %> 







<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΠΡΩΤΑΘΛΗΜΑΤΑ</h2>
<ul class="breadcrumbs">
<li><a href="#">ΑΡΧΙΚΗ</a></li>
<li>ΠΡΩΤΑΘΛΗΜΑΤΑ</li>
</ul>
</div>
</div>


<%-- <div style='background-color: #363636;' class="inner-banner style-2 overlay-dark theme-padding parallax-window" data-appear-top-offset="600" data-parallax="scroll" data-image-src="${resources}/images/inner-banner/img-05.jpg" >
<div class="container theme-padding">
<ul id="match-detail-slider" class="match-detail-slider">
<li>
<div class="pager-heading match-detail h-white">
<span class="pull-left win-tag"><img src="${resources}/images/result-team-logo/img-01.png" alt=""></span>
<div class="vs-match-heading position-center-center">
<strong class="vs-match-result">3<span>Vs</span>1</strong>
<span class="end-time"><i class="fa fa-clock-o"></i>13:57 min (IST)</span>
</div>
<span class="pull-right loss-tag"><img src="${resources}/images/result-team-logo/img-02.png" alt=""></span>
</div>
</li>
<li>
<div class="pager-heading match-detail h-white">
<span class="pull-left win-tag"><img src="${resources}/images/result-team-logo/img-01.png" alt=""></span>
<div class="vs-match-heading position-center-center">
<strong class="vs-match-result">3<span>Vs</span>1</strong>
<span class="end-time"><i class="fa fa-clock-o"></i>13:57 min (IST)</span>
</div>
<span class="pull-right loss-tag"><img src="${resources}/images/result-team-logo/img-02.png" alt=""></span>
</div>
</li>
<li>
<div class="pager-heading match-detail h-white">
<span class="pull-left win-tag"><img src="${resources}/images/result-team-logo/img-01.png" alt=""></span>
<div class="vs-match-heading position-center-center">
<strong class="vs-match-result">3<span>Vs</span>1</strong>
<span class="end-time"><i class="fa fa-clock-o"></i>13:57 min (IST)</span>
</div>
<span class="pull-right loss-tag"><img src="${resources}/images/result-team-logo/img-02.png" alt=""></span>
</div>
</li>
</ul>
</div>
</div>

 --%>
<main class="main-content">
<div class='champ'>
	<ul>
		<li  ng-repeat='row in championlist'><a ng-click='getChampion(row)' ng-class="cssLiChampionClass(row)">{{row.name}}</a></li>
	</ul> 
</div>

<div class="theme-padding white-bg">
<div class="container">
<div class="row">



<div class="col-lg-9 col-sm-8" >
<div ng-repeat='row in teamgrouplist' style="margin-bottom:60px;">
<div  class="macth-fixture" >
<h2>{{row.name}}</h2>
<div class="last-matches styel-3">
<div class="table-responsive">
<table class="table table-bordered table-hover">
<thead>
			<tr>
				<th>Team
				</th>
				<th>Grade
				</th>
				<th>Goal
				</th>
				<th>G+
				</th>
				<th>G-
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

			<tr ng-repeat='row1 in row.standings  | orderBy: "-grade"'>
				<td><a href='team-detail?teamid={{row1.team.id}}'><img src="${resources}/images/small-flags/img-01.png" alt="">{{row1.team.name}}</a>
				</td>
				<td class="td_grade">{{row1.grade}}
				</td>
				<td>{{row1.goal}}
				</td>
				<td>{{row1.goalplus}}
				</td>
				<td>{{row1.goalminus}}
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
<!-- 
 -->
 

		
	
			
			
<!-- 		<a ng-click="getMatchdays(row)" class="view-all pull-right" href="#">Show Program<i class="fa fa-angle-double-right"></i></a>
 -->
 
</div>



<!-- ng-hide="matchday.length"
 -->


</div>


 <div class="palyer-career theme-padding-bottom" ng-show='row.scorers.length'>
<h3>Σκορερς</h3>
<div class="table-responsive">
<table class="table table-bordered">
<thead>
			<tr>
				<th>
				</th>
				<th>ΟΝΟΜΑ
				</th>
				<th>ΟΜΑΔΑ
				</th>
				<th>ΓΚΟΛ
				</th>
			</tr>
</thead>
<tbody>
			<tr ng-repeat='row2 in row.scorers   | orderBy: "-number"'>
				<td>{{$index + 1}}</td>
				<td>{{row2.contact.name}}
				</td>
				<td>{{row2.team.name}}
				</td>
				<td>{{row2.number}}
				</td>
			</tr>

</tbody>
</table>
</div>
</div>
 


</div>	 
<button style="position:relative; "  ng-hide='row.standings.matchdays.length' class="btn red-btn pull-right" ng-click="getMatchdays(row)">Show Program</button>
		 <div class="" ng-repeat='row2 in row.standings.matchdays' style="margin-bottom:30px;">
		<h3><span><i class="red-color">{{row2.name}} </i></span></h3>
		<div class="upcoming-fixture">
		<div class="table-responsive">
		<table class="table table-bordered">
		<tbody>
		<tr ng-repeat='row1 in row2.games'>
		<td>
		<div class="logo-width-name"><a href='team-detail?teamid={{row1.team1.id}}'><img src="${resources}/images/team-logos-small/img-01.png" alt="">{{row1.team1.name}}</a></div>
		</td>
		

		<td class="upcoming-fixture-date own-td-vs" style="text-align:center">
			<span class="own-score" ng-show="row1.score1">{{row1.score1}} - {{row1.score2}} </span><span class="own-date">{{row1.date |  date : "dd/MM HH:mm"}}</span>
			</td>
		
<!-- 		 w-icon
 -->		<td>
		<div class="logo-width-name"><a href='team-detail?teamid={{row1.team2.id}}'><img src="${resources}/images/team-logos-small/img-02.png" alt="">{{row1.team2.name}}</a></div>
		</td>
		</tr>
		
		</tbody>
		</table>
		</div>
		</div>
		</div>
</div>

		
	
</div>



<div class="col-lg-3 col-sm-4">

<div class="aside-widget">
<a href="#"><img src="${resources}/images/adds-02.jpg" alt=""></a>
</div>


<div class="aside-widget">
<h3><span>Popular News</span></h3>
<div class="Popular-news">
<ul>
<li>
<img src="${resources}/images/popular-news/img-01.jpg" alt="">
<h5><a href="#">Two touch penalties, imaginary cards</a></h5>
<span class="red-color"><i class="fa fa-clock-o"></i>22 Feb, 2016</span>
</li>
<li>
<img src="${resources}/images/popular-news/img-02.jpg" alt="">
<h5><a href="#">Two touch penalties, imaginary cards</a></h5>
<span class="red-color"><i class="fa fa-clock-o"></i>22 Feb, 2016</span>
</li>
<li>
<img src="${resources}/images/popular-news/img-03.jpg" alt="">
<h5><a href="#">Two touch penalties, imaginary cards</a></h5>
<span class="red-color"><i class="fa fa-clock-o"></i>22 Feb, 2016</span>
</li>
<li>
<img src="${resources}/images/popular-news/img-04.jpg" alt="">
<h5><a href="#">Two touch penalties, imaginary cards</a></h5>
<span class="red-color"><i class="fa fa-clock-o"></i>22 Feb, 2016</span>
</li>
</ul>
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
<li><span>Email Address:</span><a href="http://html.crunchpress.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="b0dddfd9def0d2dcd9ded4c4d5c8c4d7d5ded5c2d1c4dfc29ed4d5">[email&#160;protected]</a></li>
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

<!-- Mirrored from html.crunchpress.com/soccer/point-table.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:43:51 GMT -->
</html>