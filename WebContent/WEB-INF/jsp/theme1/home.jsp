 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />
<spring:url value="/resources_static/theme1" var="resources_static" />

<div class="wrap push">







<main class="main-content">


<div class="theme-padding white-bg">
<div class="container" style="padding:0">

<div class="col-lg-9 col-sm-8" style="padding:0">

<div class="Popular-news" ng-show='importantnews.length'>
<ul>
<li ng-repeat='row in importantnews | orderBy:"-date"'>
 <img style='max-height:50px; max-width:65px' ng-src="${resources_static}{{row.thumburl}}" alt=""> 


<h5 ><a class="red-color" href="#!news-detail.html/{{row.id}}">{{row.title}}</a></h5><!-- 
<span class="red-color"><i class="fa fa-clock-o"></i>{{row.date | date}}</span> -->
<span style=" " ng-bind-html="row.content | parseUrl"></span> 

</li>

</ul>
<br/>
<br/>
</div>

		<img ng-hide='upcominggames' width=40 height=40 src="${resources}/images/loading.gif" alt="">
 		<div ng-show='upcominggames.length' style="margin-bottom:40px">
		<h2>ΕΠΟΜΕΝΑ ΠΑΙΧΝΙΔΙΑ</h2>


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


		<img ng-hide='lastresults' width=40 height=40 src="${resources}/images/loading.gif" alt="">
 		<div ng-show='lastresults.length' style="margin-bottom:40px">
		<h2>ΤΕΛΕΥΤΑΙΑ ΑΠΟΤΕΛΕΣΜΑΤΑ</h2>


			<div class="matches-shedule-holder" style="margin:0;padding:0">


			<div class="matches-dates-shedule" style='padding:0;margin:0;'>
			<ul style='margin:0 0 10px 0;'>
			<li ng-repeat='row1 in lastresults  | orderBy: "date" | limitTo:10' style='padding:2px; ' ng-show='row1.champion.enabled'>
			<span class="pull-left"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team1.logothumbpath}}" alt=""></span>
			<span class="pull-right"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team2.logothumbpath}}" alt=""></span>
			<div class="detail" style='padding:0; margin:0'>
			<a style='padding:0; margin:0' href="#!match.html/{{row1.id}}">Λεπτομέρειες<i class="fa fa-angle-double-right"></i></a>
			<strong style='padding:0; margin:0'><a style='display:inline; padding:0; margin:0' href='#!team-detail.html/{{row1.team1.id}}'>{{row1.team1.name}}</a><i class="red-color"  style=''> {{row1.score1}} - {{row1.score2}}</i> <a style='display:inline; padding:0; margin:0'  href='#!team-detail.html/{{row1.team2.id}}'>{{row1.team2.name}}</a></strong>
			 <span class="location-marker" style='padding:0; margin:0'><i class="fa "></i>{{row1.date |  date : "EEE dd MMM HH:mm"}} ({{row1.champion.name}})</span> 
			</div>
			</li>
			
			</ul>
			</div>
			
			</div>
		
		
			</div>





</div>



<div class="col-lg-3 col-sm-4">

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


