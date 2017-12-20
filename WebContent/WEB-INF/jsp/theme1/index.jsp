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

<title>Soccer HTML5 Template</title>
<%@include  file="prereq.jsp" %>

</head>
<body ng-app="appMain" ng-controller='indexController'>



<div class="wrap push">

<!--  <div ng-include="'header1.html'"></div>   -->
<%@include  file="header.jsp" %> 

<div class="slider-holder" >

<ul id="main-slides" class="main-slides" >

<li>
<div id="animated-slider" class="carousel slide carousel-fade">

<div class="carousel-inner" role="listbox">

<div class="item active">
<img src="${resources}/images/banner-slider/40781.jpg" alt="">
<div class="position-center-x full-width">
<div class="container">
 <div class="banner-caption style-1 p-white h-white pull-right">
<h1 class="animated fadeInUp delay-1s" style="color:#cc0000; text-shadow: 1px 1px #FFFFFF;">Το δημοφιλέστερο άθλημα στην Ευρώπη, το ποδόσφαιρο, βρίσκει το "δικό" του γήπεδο</h1>
<p class="animated fadeInUp delay-2s red-btn" style="color:#cc0000; text-shadow: 1px 1px #FFFFFF;">Εγκαταστάσεις τελευταίας τεχνολογίας, μέσα από το Rossoneri Mini Football CLub! </p>
<a class="btn lg red-btn animated fadeInRight delay-3s" href="#"><i>+</i>Περισσοτερα</a>
</div>
</div>
</div>
</div>


<div class="item">
<img src="${resources}/images/banner-slider/black2.jpg" alt="">
<div class="position-center-x full-width">
<div class="container">
<div class="banner-caption style-2 p-white h-white pull-left">
<h1 class="animated fadeInUp delay-1s" style="color:#cc0000; text-shadow: 1px 1px #FFFFFF;">Βγείτε από το άγχος της καθημερινότητας</h1>
<p class="animated fadeInUp delay-2s" style="color:#cc0000; text-shadow: 1px 1px #FFFFFF;">Αθληθείτε με τον καλύτερο τρόπο στα τρία γήπεδα</p>
<a class="btn lg red-btn animated fadeInRight delay-3s" href="#"><i>+</i>Περισσοτερα</a>
</div>
</div>
</div>
</div>


<div class="item">
<img src="${resources}/images/banner-slider/yes2.jpg" alt="">
<div class="position-center-x full-width">
<div class="container">
<div class="banner-caption style-2 p-white h-white pull-left">
<h1 class="animated fadeInUp delay-1s" style="color:#cc0000; text-shadow: 1px 1px #FFFFFF;">Κάτι παραπάνω από παιχνίδι</h1>
<p class="animated fadeInUp delay-2s" style="color:#cc0000; text-shadow: 1px 1px #FFFFFF;"></p>
<a class="btn lg red-btn animated fadeInRight delay-3s" href="#"><i>+</i>Περισσοτερα</a>
</div>
</div>
</div>
</div>

</div>





<ul class="carousel-indicators">
<li data-target="#animated-slider" data-slide-to="0" class="active"></li>
<li data-target="#animated-slider" data-slide-to="1"></li>
<li data-target="#animated-slider" data-slide-to="2"></li>
</ul>

</div>
</li>


<li>
<img src="${resources}/images/banner-slider/jointheplayers.jpg" alt="">
<div class="video-banner-caption position-center-center p-white h-white">
<!-- <h1>Continuous effort not strength or<br> intelligence is the key to unlocking our potential</h1>
<p>Hart's short pass wasn't controlled by Fernando, and the Swedish striker's tackle<br> resulted in the ball rolling into the net. While the bulk</p> -->
<ul class="btn-list">
<!-- <li><a class="btn lg red-btn" href="http://www.youtube.com/watch?v=cH6kxtzovew" data-rel="prettyPhoto[video]">watch video<i class="fa fa-play-circle"></i></a></li>
 --><li><a class="btn lg red-btn" href="http://jointheplayers.com/videos/games/rossoneri">ΔΕΙΤΕ Videos<i class="fa fa-angle-right"></i></a></li>
</ul>
</div>
</li>


<li>
<img src="${resources}/images/banner-bgs/img-01.jpg" alt="">
</li>


<li>
<img src="${resources}/images/banner-bgs/img-02.jpg" alt="">
<div class="position-center-center">
<div class="container theme-padding">
<div class="pager-heading match-detail h-white">
<span class="pull-left win-tag"><img src="${resources}/images/result-team-logo/img-01.png" alt=""></span>
<div class="vs-match-heading position-center-center">
<strong class="vs-match-result">3<span>Vs</span>1</strong>
<span class="end-time"><i class="fa fa-clock-o"></i>13:57 min (IST)</span>
</div>
<span class="pull-right loss-tag"><img src="${resources}/images/result-team-logo/img-02.png" alt=""></span>
</div>
</div>
</div>
</li>

</ul>


<div class="main-slides-thumb">
<div class="container">
<ul id="slides-thmnail" class="slides-thmnail">
<li>
<span><i class="fa fa-sliders"></i>Slides</span>
</li>
<li>
<span><i class="fa fa-play-circle"></i>Video</span>
</li>
<li>
<span><i class="fa fa-soccer-ball-o"></i>scores</span>
</li>
<li>
<span><i class="fa fa-bar-chart"></i>Resutls</span>
</li>
</ul>
<ul class="thmnail-arrows">
<li class="prev-1"><span class="icon-arrow-01"></span></li>
<li class="next-1"><span class="icon-arrow-01"></span></li>
</ul>
</div>
</div>

</div>


<main class="main-content">

<section class="theme-padding-bottom bg-fixed">
<div class="container">

<div class="add-banners">
<ul id="add-banners-slider" class="add-banners-slider">
<li>
<a href="#"><img src="${resources}/images/add-banners/img-01.jpg" alt=""></a>
</li>
<li>
<a href="#"><img src="${resources}/images/add-banners/img-02.jpg" alt=""></a>
</li>
<li>
<a href="#"><img src="${resources}/images/add-banners/img-03.jpg" alt=""></a>
</li>
</ul>
</div>


<div class="match-detail-content">
<div class="row">
<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
<div class="row">

<div class="col-sm-4 col-xs-5 r-full-width">
<div class="next-matches">
<h4>Next Match</h4>
<div id="matches-detail-slider" class="matches-detail-slider">

<div class="item matches-detail" style="background: url(${resources}/images/country-flags-bg.jpg);">
<div class="time-left">
<ul id="countdown-1" class="countdown">
<li><span class="days">00</span>D:</li>
<li><span class="hours">00</span>H:</li>
<li><span class="minutes">00</span>M:</li>
<li><span class="seconds">00</span>S</li>
</ul>
</div>
<span class="left-date">12/02/2016 / 19:00</span>
<div class="team-btw-match">
<ul>
<li>
<img src="${resources}/images/team-logos/img-01.png" alt="">
<span>Footbal<span>Team</span></span>
</li>
<li>
<img src="${resources}/images/team-logos/img-02.png" alt="">
<span>Super Team<span>Club</span></span>
</li>
</ul>
</div>
</div>


<div class="item matches-detail" style="background: url(${resources}/images/country-flags-bg.jpg);">
<div class="time-left">
<ul id="countdown-2" class="countdown">
<li><span class="days">00</span>D:</li>
<li><span class="hours">00</span>H:</li>
<li><span class="minutes">00</span>M:</li>
<li><span class="seconds">00</span>S</li>
</ul>
</div>
<span class="left-date">12/02/2016 / 19:00</span>
<div class="team-btw-match">
<ul>
<li>
<img src="${resources}/images/team-logos/img-01.png" alt="">
<span>Footbal<span>Team</span></span>
</li>
<li>
<img src="${resources}/images/team-logos/img-02.png" alt="">
<span>Super Team<span>Club</span></span>
</li>
</ul>
</div>
</div>

</div>
</div>
</div>


<div class="col-sm-8 col-xs-7 r-full-width">
<h3><span><i class="red-color">UPCOMING </i>FIXTURE</span><a class="view-all pull-right" href="#">view all<i class="fa fa-angle-double-right"></i></a></h3>
<div class="upcoming-fixture">
<div class="table-responsive">
<table class="table table-bordered">
<tbody>
<tr>
<td>
<div class="logo-width-name"><img src="${resources}/images/team-logos-small/img-01.png" alt="">Portugal</div>
</td>
<td class="upcoming-fixture-date"><span>6 Feb 2016 15:00</span></td>
<td>
<div class="logo-width-name w-icon"><img src="${resources}/images/team-logos-small/img-02.png" alt="">Germany</div>
</td>
</tr>
<tr>
<td>
<div class="logo-width-name"><img src="${resources}/images/team-logos-small/img-03.png" alt="">Spain</div>
</td>
<td class="upcoming-fixture-date"><span>6 Feb 2016 15:00</span></td>
<td>
<div class="logo-width-name w-icon"><img src="${resources}/images/team-logos-small/img-04.png" alt="">Man Utd</div>
</td>
</tr>
<tr>
<td>
<div class="logo-width-name"><img src="${resources}/images/team-logos-small/img-05.png" alt="">Hondrus</div>
</td>
<td class="upcoming-fixture-date"><span>6 Feb 2016 15:00</span></td>
<td>
<div class="logo-width-name w-icon"><img src="${resources}/images/team-logos-small/img-06.png" alt="">Ivory Cost</div>
</td>
</tr>
<tr>
<td>
<div class="logo-width-name"><img src="${resources}/images/team-logos-small/img-07.png" alt="">West Brom</div>
</td>
<td class="upcoming-fixture-date"><span>6 Feb 2016 15:00</span></td>
<td>
<div class="logo-width-name w-icon"><img src="${resources}/images/team-logos-small/img-08.png" alt="">uruguay</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>


<div class="col-xs-12">
<div class="latest-news-holder">
<h3><span>Latest News</span></h3>

<div class="row no-gutters white-bg">

<div class="col-sm-9">
<ul id="latest-news-slider" class="latest-news-slider">
<%-- <li ng-repeat='row in news | orderBy:"-date"'>
<img src="${resources}{{row.imageurl}}" alt="">
<p>{{row.title}}<a href="#">Read more</a></p>
</li> --%>
 <li>
<img src="${resources}/images/latest-news/img-02.jpg" alt="">
<p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
</li>
<%--<li>
<img src="${resources}/images/latest-news/img-03.jpg" alt="">
<p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
</li>
<li>
<img src="${resources}/images/latest-news/img-04.jpg" alt="">
<p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
</li>
<li>
<img src="${resources}/images/latest-news/img-01.jpg" alt="">
<p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
</li>
<li>
<img src="${resources}/images/latest-news/img-02.jpg" alt="">
<p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
</li>
<li>
<img src="${resources}/images/latest-news/img-03.jpg" alt="">
<p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
</li> --%>
</ul>
</div>


<div class="col-sm-3">
<ul id="latest-news-thumb" class="latest-news-thumb">
<!-- <li ng-repeat='row in news | orderBy:"-date"'>
<p>{{row.title}}</p>
<span>{{row.date | date}}</span>
</li> -->
<li>
<p>Fancy footwork by Brito in build up to Atromitos</p>
<span>February 11, 2016</span>
</li>
<!-- <li>
<p>Fancy footwork by Brito in build up to Atromitos</p>
<span>February 11, 2016</span>
</li>
<li>
<p>Fancy footwork by Brito in build up to Atromitos</p>
<span>February 11, 2016</span>
</li>
<li>
<p>Fancy footwork by Brito in build up to Atromitos</p>
<span>February 11, 2016</span>
</li>
<li>
<p>Fancy footwork by Brito in build up to Atromitos</p>
<span>February 11, 2016</span>
</li>
<li>
<p>Fancy footwork by Brito in build up to Atromitos</p>
<span>February 11, 2016</span>
</li> -->
</ul>
<ul class="news-thumb-arrows">
<li class="prev"><span class="fa fa-angle-up"></span></li>
<li class="next"><span class="fa fa-angle-down"></span></li>
</ul>
</div>

</div>

</div>
</div>

</div>
</div>
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
<div class="row">

<div class="col-lg-12 col-md-12 col-sm-5 col-xs-6 r-full-width">
<div class="last-matches theme-margin-bottom win-tag">
<h4>Last Match</h4>
<div class="matches-detail style-2" style="background: url(images/keper-img.jpg);">
<p>49 Chapel Lane ARNE BH20 12/02/2016 / 19:00</p>
<div class="team-btw-match">
<ul>
<li>
<img src="${resources}/images/team-logos/img-03.png" alt="">
<span>Munchester<span>United</span></span>
</li>
<li>
<img src="${resources}/images/team-logos/img-04.png" alt="">
<span>Norwich<span>City</span></span>
</li>
</ul>
</div>
<div class="goals-detail">
<ul>
<li>
<span>M. Johansen</span>
<span>23 (FNA)</span>
</li>
<li>
<span>G. Smith</span>
<span>41 (FNA)</span>
</li>
<li>
<span>T. Mosler</span>
<span>59 (FNA)</span>
</li>
</ul>
</div>
</div>
</div>
</div>


<div class="col-lg-12 col-md-12 col-sm-7 col-xs-6 r-full-width">
<div class="last-matches styel-1">
<h3><span>POINTS TABLE</span></h3>
<table class="table table-bordered table-hover">
<thead>
<tr>
<th>#</th>
<th>Team</th>
<th>P</th>
<th>W</th>
<th>L</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>Liverpool</td>
<td>10</td>
<td>12</td>
<td>20</td>
</tr>
<tr>
<td>2</td>
<td>Chelsea</td>
<td>10</td>
<td>12</td>
<td>20</td>
</tr>
<tr>
<td>3</td>
<td>Norwich City</td>
<td>20</td>
<td>15</td>
<td>20</td>
</tr>
<tr>
<td>4</td>
<td>West Brom</td>
<td>60</td>
<td>10</td>
<td>60</td>
</tr>
<tr>
<td>5</td>
<td>sunderland</td>
 <td>30</td>
<td>06</td>
<td>30</td>
</tr>
<tr>
<td>6</td>
<td>Liverpool</td>
<td>12</td>
<td>03</td>
<td>40</td>
</tr>
<tr>
<td>7</td>
<td>Swansea city</td>
<td>12</td>
<td>15</td>
<td>12</td>
</tr>
<tr>
<td>8</td>
<td>Man UTD</td>
<td>12</td>
<td>15</td>
<td>12</td>
</tr>
<tr>
<td>9</td>
<td>Liverpool</td>
<td>22</td>
<td>14</td>
<td>22</td>
</tr>
</tbody>
</table>
</div>
</div>

</div>
</div>
</div>
</div>

</div>
</section>


<section class="red-section" style=" background: url(${resources}/images/red-bg.jpg) no-repeat;">

<div class="red-sec-heading">
<div class="container">
<h5>Player Features</h5>
</div>
</div>


<div class="container">
<div class="row">

<div class="col-sm-6">
<div class="theme-padding top-profiler">
<img class="player-img animate fadeInLeft" data-wow-delay="0.2s" src="${resources}/images/player-img.png" alt="">
<strong class="number-batch style-1">13</strong>
<strong class="number-batch style-2">06</strong>
</div>
</div>


<div class="col-sm-6">
<ul id="video-slider" class="video-slider">
<li class="red-sec-widget player-history h-white p-white">
<h3>Related Match</h3>
<p>The wait for a major title is weighing heavily on Argentina, and it showed as they lost again to Chile, Tim Vickery writes</p>
<div class="player-video-sec">
<div class="video video-post">
<img src="${resources}/images/video-bg.jpg" alt="">
<span class="play-lable fa fa-video-camera"></span>
<a class="position-center-center play-icon" href="http://www.youtube.com/watch?v=cH6kxtzovew" data-rel="prettyPhoto[video]"><i class="fa fa-video-camera"></i></a>
</div>
</div>
</li>
<li class="red-sec-widget player-history h-white p-white">
<h3>Related Match</h3>
<p>The wait for a major title is weighing heavily on Argentina, and it showed as they lost again to Chile, Tim Vickery writes</p>
<div class="player-video-sec">
<div class="video video-post">
<img src="${resources}/images/video-bg-2.jpg" alt="">
<span class="play-lable fa fa-video-camera"></span>
<a class="position-center-center play-icon" href="http://www.youtube.com/watch?v=cH6kxtzovew" data-rel="prettyPhoto[video]"><i class="fa fa-video-camera"></i></a>
</div>
</div>
</li>
<li class="red-sec-widget player-history h-white p-white">
<h3>Related Match</h3>
<p>The wait for a major title is weighing heavily on Argentina, and it showed as they lost again to Chile, Tim Vickery writes</p>
<div class="player-video-sec">
<div class="video video-post">
<img src="${resources}/images/video-bg-3.jpg" alt="">
<span class="play-lable fa fa-video-camera"></span>
<a class="position-center-center play-icon" href="http://www.youtube.com/watch?v=cH6kxtzovew" data-rel="prettyPhoto[video]"><i class="fa fa-video-camera"></i></a>
</div>
</div>
</li>
</ul>
</div>

</div>
</div>

</section>


<div class="facts-acounter">
<div class="container">
<div class="row">
<div class="col-sm-6 pull-right">
<ul class="facts-list-acounter" id="tc-counters">
<li>
<strong class="facts-number" data-from="0" data-to="550" data-speed="1000"></strong>
<span>Possession</span>
</li>
<li>
<strong class="facts-number" data-from="0" data-to="30" data-speed="2000"></strong>
<span>Team Members</span>
</li>
<li>
<strong class="facts-number" data-from="0" data-to="158" data-speed="3000"></strong>
<span>Match win</span>
</li>
<li>
<strong class="facts-number" data-from="0" data-to="199" data-speed="4000"></strong>
<span>football Shots</span>
</li>
<li>
<strong class="facts-number" data-from="0" data-to="1254" data-speed="5000"></strong>
<span>Stadium Security</span>
</li>
<li>
<strong class="facts-number" data-from="0" data-to="32" data-speed="6000"></strong>
<span>Match Fouls</span>
</li>
</ul>
</div>
</div>
</div>
</div>


<div class="theme-padding gallery-holder">

<div class="theme-padding-bottom">
<div class="container">

<h3><span>Match Gallery</span></h3>


<div class="gallery">
<div class="col-sm-6">
<div class="row">
<div class="col-sm-12 col-xs-12 r-full-width p-0">
<figure class="gallery-figure">
<img src="${resources}/images/gallery-v3/img-01.jpg" alt="">
<figcaption class="overlay">
<div class="position-center-center">
<ul class="btn-list">
<li><a href="${resources}/images/gallery-v3/img-1-1.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
<li><a class="fa fa-eye" href="#"></a></li>
</ul>
</div>
</figcaption>
</figure>
</div>
<div class="col-sm-6 col-xs-6 r-full-width p-0">
<figure class="gallery-figure">
<img src="${resources}/images/gallery-v3/img-02.jpg" alt="">
<figcaption class="overlay">
<div class="position-center-center">
<ul class="btn-list">
<li><a href="${resources}/images/gallery-v3/img-1-2.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
<li><a class="fa fa-eye" href="#"></a></li>
</ul>
</div>
</figcaption>
</figure>
</div>
<div class="col-sm-6 col-xs-6 r-full-width p-0">
<figure class="gallery-figure">
<img src="${resources}/images/gallery-v3/img-03.jpg" alt="">
<figcaption class="overlay">
<div class="position-center-center">
<ul class="btn-list">
<li><a href="${resources}/images/gallery-v3/img-1-3.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
<li><a class="fa fa-eye" href="#"></a></li>
</ul>
</div>
</figcaption>
</figure>
</div>
</div>
</div>
<div class="col-sm-6">
<div class="row">
<div class="col-sm-6 col-xs-6 r-full-width p-0">
<figure class="gallery-figure">
<img src="${resources}/images/gallery-v3/img-04.jpg" alt="">
<figcaption class="overlay">
<div class="position-center-center">
<ul class="btn-list">
<li><a href="${resources}/images/gallery-v3/img-1-4.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
<li><a class="fa fa-eye" href="#"></a></li>
</ul>
</div>
</figcaption>
</figure>
</div>
<div class="col-sm-6 col-xs-6 r-full-width p-0">
<figure class="gallery-figure">
<img src="${resources}/images/gallery-v3/img-05.jpg" alt="">
<figcaption class="overlay">
<div class="position-center-center">
<ul class="btn-list">
<li><a href="${resources}/images/gallery-v3/img-1-5.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
<li><a class="fa fa-eye" href="#"></a></li>
</ul>
</div>
</figcaption>
</figure>
</div>
<div class="col-sm-12 col-xs-12 r-full-width p-0">
<figure class="gallery-figure">
<img src="${resources}/images/gallery-v3/img-06.jpg" alt="">
<figcaption class="overlay">
<div class="position-center-center">
<ul class="btn-list">
<li><a href="${resources}/images/gallery-v3/img-1-6.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
<li><a class="fa fa-link" href="#"></a></li>
</ul>
</div>
</figcaption>
</figure>
</div>
</div>
</div>
</div>

</div>
</div>


<div class="container text-center">
<span class="sprater"><i class="fa fa-futbol-o"></i></span>
</div>


<div class="container">
<div class="team-holder theme-padding-top">

<div class="main-heading-holder">
<div class="main-heading">
<h2>our Team member</h2>
<p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness.</p>
</div>
</div>


<div id="team-slider" class="team-slider">

<div class="item">
<div class="team-column">
<img src="${resources}/images/team/img-01.jpg" alt="">
<span class="player-number">12</span>
<div class="team-detail">
<h5><a href="team-detail.html">Lionel Andres Messi</a></h5>
<span class="desination">Defender</span>
<div class="detail-inner">
<ul>
<li>Born</li>
<li>Position</li>
<li>Squad number</li>
<li>Previous Club</li>
<li>Fallow us on</li>
</ul>
<ul>
<li>August 31, 1988</li>
<li>Goalkeeper</li>
<li>13</li>
<li>Atletico Nacional</li>
<li>
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>
</div>


<div class="item">
<div class="team-column">
<img src="${resources}/images/team/img-02.jpg" alt="">
<span class="player-number">12</span>
<div class="team-detail">
<h5><a href="team-detail.html">Philipp Lahm</a></h5>
<span class="desination">Middle player</span>
<div class="detail-inner">
<ul>
<li>Born</li>
<li>Position</li>
<li>Squad number</li>
<li>Previous Club</li>
<li>Fallow us on</li>
</ul>
<ul>
<li>August 31, 1988</li>
<li>Goalkeeper</li>
<li>13</li>
<li>Atletico Nacional</li>
<li>
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>
</div>


<div class="item">
<div class="team-column">
<img src="${resources}/images/team/img-03.jpg" alt="">
<span class="player-number">12</span>
<div class="team-detail">
<h5><a href="team-detail.html">David Ospina</a></h5>
<span class="desination">Defender</span>
<div class="detail-inner">
<ul>
<li>Born</li>
<li>Position</li>
<li>Squad number</li>
<li>Previous Club</li>
<li>Fallow us on</li>
</ul>
<ul>
<li>August 31, 1988</li>
<li>Goalkeeper</li>
<li>13</li>
<li>Atletico Nacional</li>
<li>
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>
</div>


<div class="item">
<div class="team-column">
<img src="${resources}/images/team/img-04.jpg" alt="">
<span class="player-number">12</span>
<div class="team-detail">
<h5><a href="team-detail.html">Jerome Boateng</a></h5>
<span class="desination">Defender</span>
<div class="detail-inner">
<ul>
<li>Born</li>
<li>Position</li>
<li>Squad number</li>
<li>Previous Club</li>
<li>Fallow us on</li>
</ul>
<ul>
<li>August 31, 1988</li>
<li>Goalkeeper</li>
<li>13</li>
<li>Atletico Nacional</li>
<li>
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</li>
</ul>
</div>
</div>
</div>
</div>

</div>

</div>
</div>

</div>


<div class="products-holder gray-bg theme-padding">
<div id="product-slider" class="product-slider nav-style-1">

<div class="product-column">
<div class="product-column-inner">
<div class="product-img">
<img src="${resources}/images/products/img-01.jpg" alt="">
</div>
<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
<span class="product-use">Men’s Running Shirt</span>
</div>
<div class="btm">
<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
<span class="price">$39.00</span>
</div>
</div>


<div class="product-column">
<div class="product-column-inner">
<div class="product-img">
<img src="${resources}/images/products/img-02.jpg" alt="">
<span class="sale-batch">sale</span>
</div>
<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
<span class="product-use">Men’s Running Shirt</span>
</div>
<div class="btm">
<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
<span class="price">$39.00</span>
</div>
</div>


<div class="product-column">
<div class="product-column-inner">
<div class="product-img">
<img src="${resources}/images/products/img-03.jpg" alt="">
</div>
<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
<span class="product-use">Men’s Running Shirt</span>
</div>
<div class="btm">
<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
<span class="price">$39.00</span>
</div>
</div>


<div class="product-column">
<div class="product-column-inner">
<div class="product-img">
<img src="${resources}/images/products/img-04.jpg" alt="">
</div>
<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
<span class="product-use">Men’s Running Shirt</span>
</div>
<div class="btm">
<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
<span class="price">$39.00</span>
</div>
</div>


<div class="product-column">
<div class="product-column-inner">
<div class="product-img">
<img src="${resources}/images/products/img-05.jpg" alt="">
<span class="sale-batch">sale</span>
</div>
<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
<span class="product-use">Men’s Running Shirt</span>
</div>
<div class="btm">
<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
<span class="price">$39.00</span>
</div>
</div>


<div class="product-column">
<div class="product-column-inner">
<div class="product-img">
<img src="${resources}/images/products/img-06.jpg" alt="">
</div>
<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
<span class="product-use">Men’s Running Shirt</span>
</div>
<div class="btm">
<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
<span class="price">$39.00</span>
</div>
</div>


<div class="product-column">
<div class="product-column-inner">
<div class="product-img">
<img src="${resources}/images/products/img-01.jpg" alt="">
</div>
<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
<span class="product-use">Men’s Running Shirt</span>
</div>
<div class="btm">
<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
<span class="price">$39.00</span>
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



</body>

<!-- Mirrored from html.crunchpress.com/soccer/home-1.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 09 Dec 2017 09:39:35 GMT -->
</html>