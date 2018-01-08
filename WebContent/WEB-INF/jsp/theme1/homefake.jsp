 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

<div class="slider-holder" ng-class='indexClass'><!-- ng-show='isIndex' -->

<ul id="main-slides" class="main-slides" >

<li>
<div id="animated-slider" class="carousel slide carousel-fade">

<div class="carousel-inner" role="listbox">

<div class="item active">
<img src="${resources}/images/banner-slider/40781.jpg" alt="">
<div class="position-center-x full-width">
<div class="container">
 <div class="banner-caption style-1 p-white h-white pull-right">
<h1 class="animated fadeInUp delay-1s " style="color:#cc0000; text-shadow: 1px 1px #FFFFFF;">Το δημοφιλέστερο άθλημα στην Ευρώπη, το ποδόσφαιρο, βρίσκει το "δικό" του γήπεδο</h1>
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
<span><i class="fa fa-sliders"></i>ΔΙΑΦΑΝΕΙΕΣ</span>
</li>
<li>
<span><i class="fa fa-play-circle"></i>VIDEO</span>
</li>
<li>
<span><i class="fa fa-soccer-ball-o"></i>ΑΓΩΝΕΣ</span>
</li>
<li>
<span><i class="fa fa-bar-chart"></i>ΓΙΑ ΕΜΑΣ</span>
</li>
</ul>
<ul class="thmnail-arrows">
<li class="prev-1"><span class="icon-arrow-01"></span></li>
<li class="next-1"><span class="icon-arrow-01"></span></li>
</ul>
</div>
</div>

</div>

