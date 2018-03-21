
 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:url value="/resources/theme1" var="resources" />
<spring:url value="/resources_static/theme1" var="resources_static" />

<div class="page-heading-breadcrumbs">
<div class="container">
<h2 class=''>ΠΡΩΤΑΘΛΗΜΑΤΑ</h2>
<!-- <ul class="breadcrumbs">
<li><a href="">ΑΡΧΙΚΗ</a></li>
<li>ΠΡΩΤΑΘΛΗΜΑΤΑ</li>
</ul> -->
</div>
</div>


<main class="main-content" style='font-size:90%; '>
<div class='champ'>
	<ul>
		<li  ng-repeat='row in custompages' ><a ng-click='getCustompage(row.id)' ng-class="cssLiChampionClass(row)">{{row.title}}</a></li>
	</ul> 
</div>

<div class="theme-padding white-bg">
<div class="container" style="padding:0">
<div class="row" >



<div class="col-lg-9 col-sm-8" >
<div class="">

<div class="blog-detail-holder">
<div class="author-header">
<h2>{{custompage.title}}</h2>
<div class="aurhor-img-name pull-left">
<%-- <img ng-src="${resources}{{notice.imageurl}}" alt=""> --%>
<!-- <strong>by <i class="red-color">Admin</i></strong> -->
<!-- <span>{{custompage.date | date}} </span> -->
</div>
<!-- <div class="share-option pull-right">
<span id="share-btn1"><i class="fa fa-share-alt"></i>Share</span>
<div id="show-social-icon1" class="on-hover-share">
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</div>
</div> -->
</div>
<article>
<p></p>
</article>
<div class="blog-detail">

<article>
<p>{{custompage.content}}</p>
 </article>
</div>
<div class="blog-detail">
<figure ng-repeat="image in custompage.images">
<img ng-src="${resources_static}{{image.url}}" alt="" style='max-width:800px'>
</figure>
<article>
 </article>
</div>
<!-- <div class="tags-holder">
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
 -->
</div>
</div>
	
</div>



<div class="col-lg-3 col-sm-4">

<%-- <div class="aside-widget">
<a href="#"><img src="${resources}/images/adds-02.jpg" alt=""></a>
</div>
 --%>
<div ng-show='upcominggames.length' style="margin-bottom:40px">
		<h3>ΕΠΟΜΕΝΑ ΠΑΙΧΝΙΔΙΑ</h3>


			<div class="matches-shedule-holder" style="margin:0;padding:0">


			<div class="matches-dates-shedule" style='padding:0;margin:0;'>
			<ul style='margin:0 0 10px 0;'>
			<li ng-repeat='row1 in upcominggames  | orderBy: "date" | limitTo:10' style='padding:2px; ' ng-show='row1.champion.enabled'>
			<span class="pull-left"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team1.logothumbpath}}" alt=""></span>
			<span class="pull-right"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team2.logothumbpath}}" alt=""></span>
			<div class="detail" style='padding:0; margin:0'>
			<a style='padding:0; margin:0' href="#!match.html/{{row1.id}}">Λεπτομέρειες<i class="fa fa-angle-double-right"></i></a>
			<strong style='padding:0; margin:0'><a style='display:inline; padding:0; margin:0' href='#!team-detail.html/{{row1.team1.id}}'>{{row1.team1.name}}</a><i class="red-color"  style=''> {{row1.score1}} - {{row1.score2}}</i> <a style='display:inline; padding:0; margin:0'  href='#!team-detail.html/{{row1.team2.id}}'>{{row1.team2.name}}</a></strong>
			 <span class="location-marker" style='padding:0; margin:0'><i class="fa "></i><b class="own-red-shadow">{{row1.date |  date : "EEE dd MMM HH:mm"}} </b> ({{row1.champion.name}})</span> 
			</div>
			</li>
			
			</ul>
			</div>
			
			</div>
		
		
			</div>



<div class="aside-widget" ng-show='news.length'>
<h3><span>ΤΕΛΕΥΤΑΙΑ ΝΕΑ</span></h3>
<div class="Popular-news">
<ul>
<li ng-repeat='row in news | orderBy:"-date"'>
 <img style='max-height:50px; max-width:65px' ng-src="${resources_static}{{row.thumburl}}" alt=""> 


<h5><a href="#!news-detail.html/{{row.id}}">{{row.title}}</a></h5>
<span class="red-color"><i class="fa fa-clock-o"></i>{{row.date | date}}</span>



</li>

</ul>
</div>
</div>

</div>



</div>
</div>
</div>

</main>

