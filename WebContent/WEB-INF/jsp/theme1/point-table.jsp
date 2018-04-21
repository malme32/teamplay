
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
		<li  ng-repeat='row in championlist  | orderBy:"-id"' ng-show='row.enabled'><a ng-click='getChampion(row.id)' ng-class="cssLiChampionClass(row)">{{row.name}}</a></li>
	</ul> 
</div>

<div class="theme-padding white-bg">
<div class="container" style="padding:0">
<div class="row" >



<div class="col-lg-9 col-sm-8" >

<!-- 		 <div class="" ng-repeat='row2 in row.standings.matchdays' style="margin:0;padding:0">
		<h3 style="margin:0 0 5px 0; padding:0"><span><i class="red-color">{{row2.name}} </i></span></h3> -->
		
		<img ng-hide='champion.playoffgames' width=40 height=40 src="${resources}/images/loading.gif" alt="">
		<div ng-show='champion.playoffgames.length'>
		<!-- <h2>Play Offs</h2> -->

			<div ng-repeat='row3 in champion.playoffgames | orderBy: "phase"'>
			<div ng-show="row3.games.length">
			
			<h3 style="margin:15px 0 5px 0; padding:0">{{row3.name}}</h3><!-- {{getPlayoffTitle(row3)}} -->
			<div class="matches-shedule-holder" style="margin:0;padding:0">


			<div class="matches-dates-shedule" style='padding:0;margin:0;'>
			<ul style='margin:0 0 10px 0;'>
			<li ng-repeat='row1 in row3.games  | orderBy: "-date" ' style='padding:2px; '>
			<span class="pull-left"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team1.logothumbpath}}" alt=""></span>
			<span class="pull-right"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team2.logothumbpath}}" alt=""></span>
			<div class="detail" style='padding:0; margin:0'>
			<a style='padding:0; margin:0' href="#!match.html/{{row1.id}}">Λεπτομέρειες<i class="fa fa-angle-double-right"></i></a>
			<strong style='padding:0; margin:0'><a style='display:inline; padding:0; margin:0' href='#!team-detail.html/{{row1.team1.id}}'>{{row1.team1.name}}</a><i class="red-color"  style=''> {{row1.score1}} - {{row1.score2}}</i> <a style='display:inline; padding:0; margin:0'  href='#!team-detail.html/{{row1.team2.id}}'>{{row1.team2.name}}</a></strong>
			 <span class="location-marker" style='padding:0; margin:0'><i class="fa "></i><b class="own-red-shadow">{{row1.date |  date : "EEE dd MMM HH:mm"}}</b></span> 
			</div>
			</li>
			
			</ul>
			</div>
			
			</div>
			</div>
			</div>
			</div>


<img ng-hide='teamgrouplist' width=40 height=40 src="${resources}/images/loading.gif" alt="">

<div ng-repeat='row in teamgrouplist' style="margin-bottom:60px;">
<div  class="macth-fixture" >
<h2>{{row.name}} </h2>
<div class="last-matches styel-3">
<div class="table-responsive">
<table class="table table-bordered table-hover">
<thead>
			<tr>
				<th>ΟΜΑΔΑ
				</th>
				<th>ΒΑΘΜΟΙ
				</th>
				<th ng-show='desktop'>ΓΚΟΛ
				</th>
				<th ng-show='desktop'>ΓΚΟΛ+
				</th>
				<th ng-show='desktop'>ΓΚΟΛ-
				</th>
				<th ng-show='desktop'>ΑΓΩΝΕΣ
				</th>
				<th ng-show='desktop'>ΝΙΚΕΣ
				</th>
				<th ng-show='desktop'>ΗΤΤΕΣ
				</th>
				<th ng-show='desktop'>ΙΣΟΠΑΛΙΕΣ
				</th>
			</tr>
</thead>
<tbody>

			<tr  ng-repeat='row1 in row.standings  | orderBy: "-grade"'>
				<td style='text-align:left; padding:2px' >
				
				  <a ng-href='#!team-detail.html/{{row1.team.id}}'><img style='height:30px; width:30px' ng-src="${resources_static}{{row1.team.logothumbpath}}" alt="">
				{{row1.team.name}} </a>
<%-- 				 <div style='display:inline-block'>
				  <div style='background:url(${resources}{{row1.team.logopath}}) no-repeat center; 
 						 width:30px; height:30px;background-size:cover; '></div></div>
 						  <div style='display:inline-block'>
 						 <a ng-href='team-detail?teamid={{row1.team.id}}'>{{row1.team.name}}</a></div>
				
				
				</td> --%>
				<td style='padding:2px; text-align:center'  >{{row1.grade}}
				</td>
				<td style='padding:2px'  ng-show='desktop'>{{row1.goal}}
				</td>
				<td style='padding:2px' ng-show='desktop'>{{row1.goalplus}}
				</td>
				<td style='padding:2px' ng-show='desktop'>{{row1.goalminus}}
				</td>
				<td style='padding:2px'  ng-show='desktop'>{{row1.game}}
				</td>
				<td style='padding:2px' ng-show='desktop'>{{row1.win}}
				</td>
				<td style='padding:2px' ng-show='desktop'>{{row1.defeat}}
				</td>
				<td style='padding:2px' ng-show='desktop'>{{row1.draw}}
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


 <div class="palyer-career " ng-show='row.scorers.length' style="margin:0 0 15px 0;">
<h3 style="margin:0 0 5px 0; padding:0"><span><i class="red-color">Σκορερς </i></span></h3>
<div class="table-responsive">
<table class="table table-bordered">

			<tr>
	<!--  		<th ng-show='desktop'>
				</th>  -->
				<th style='text-align:center'>ΓΚΟΛ
				</th>
				<th  style='text-align:center'>ΟΝΟΜΑ
				</th>
				<th  style='text-align:center'>ΟΜΑΔΑ
				</th>
			</tr>

<tbody>
			<tr ng-repeat='row2 in row.scorers   | orderBy: "-number"'>
			<!-- 	<td>{{$index + 1}}</td> -->
				<td>{{row2.number}}
				</td>
				<td> <table>  <tr><td><div style='  background:url(${resources_static}{{row2.contact.thumbpath}}) no-repeat center; height:40px;width:40px; background-size:cover; '></div></td>
				<td><div style=''><span>{{row2.contact.name}}</span></div></td>
				</tr></table>
				
				</td>
				<td><a ng-href='#!team-detail.html/{{row2.team.id}}'>{{row2.team.name}}</a>
				</td>
			</tr>

</tbody>
</table>
</div>
</div>
 


</div>	 
<button style="position:relative; "  ng-hide='row.standings.matchdays.length' class="btn red-btn pull-right" ng-click="getMatchdays(row)">ΠΡΟΓΡΑΜΜΑ</button>
		 <div class="" ng-repeat='row2 in row.standings.matchdays|  orderBy:"name"' style="margin:0;padding:0">
		<h3 style="margin:0 0 5px 0; padding:0"><span><i class="red-color">{{row2.name}} </i></span></h3>
		
		
	<div class="matches-shedule-holder" style="margin:0;padding:0">


			<div class="matches-dates-shedule" style='padding:0;margin:0;'>
			<ul style='margin:0 0 10px 0;'>
			<li ng-repeat='row1 in row2.games  | orderBy: "-date" ' style='padding:2px; '>
			<span class="pull-left"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team1.logothumbpath}}" alt=""></span>
			<span class="pull-right"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team2.logothumbpath}}" alt=""></span>
			<div class="detail" style='padding:0; margin:0'>
			<a style='padding:0; margin:0' href="#!match.html/{{row1.id}}">Λεπτομέρειες<i class="fa fa-angle-double-right"></i></a>
			<strong style='padding:0; margin:0'><a style='display:inline; padding:0; margin:0' href='#!team-detail.html/{{row1.team1.id}}'>{{row1.team1.name}}</a><i class="red-color"  style=''> {{row1.score1}} - {{row1.score2}}</i> <a style='display:inline; padding:0; margin:0'  href='#!team-detail.html/{{row1.team2.id}}'>{{row1.team2.name}}</a></strong>
			 <span class="location-marker" style='padding:0; margin:0'><i class="fa "></i><b class="own-red-shadow">{{row1.date |  date : "EEE dd MMM HH:mm"}}</b></span> 
			</div>
			</li>
			
			</ul>
			</div>
			
			</div>
		

		
		
<%-- 		
		<div class="upcoming-fixture">
		<div class="table-responsive">
		<table class="table table-bordered">
		<tbody>
		<tr ng-repeat='row1 in row2.games'>
		<td>
		<div class="logo-width-name">
		
		
		

  		  <a ng-href='#!team-detail.html/{{row1.team1.id}}'><img style='height:30px; width:30px' ng-src="${resources}{{row1.team1.logopath}}" alt="">
				{{row1.team1.name}} </a>

		</div>
		</td>
		

		<td class="upcoming-fixture-date own-td-vs" style="text-align:center"><a ng-href='#!match.html/{{row1.id}}'>
			<span class="own-score own-red-shadow" ng-show="row1.score1">{{row1.score1}} - {{row1.score2}} </span><span class="own-date">{{row1.date |  date : "dd/MM HH:mm"}}</span>
			</a></td>
		

		<td>
		<div class="logo-width-name">
		

 
 		  <a ng-href='#!team-detail.html/{{row1.team2.id}}'><img style='height:30px; width:30px' ng-src="${resources}{{row1.team2.logopath}}" alt="">
				{{row1.team2.name}} </a>
 	
 						 
		</div>
		</td>
		</tr>
		
		</tbody>
		</table>
		</div>
		</div>   --%>
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
			<li ng-repeat='row1 in upcominggames  | orderBy: "date" | limitTo:10' style='padding:2px; ' ng-show='champion.enabled'>
			<span class="pull-left"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team1.logothumbpath}}" alt=""></span>
			<span class="pull-right"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team2.logothumbpath}}" alt=""></span>
			<div class="detail" style='padding:0; margin:0'>
			<a style='padding:0; margin:0' href="#!match.html/{{row1.id}}">Λεπτομέρειες<i class="fa fa-angle-double-right"></i></a>
			<strong style='padding:0; margin:0'><a style='display:inline; padding:0; margin:0' href='#!team-detail.html/{{row1.team1.id}}'>{{row1.team1.name}}</a><i class="red-color"  style=''> {{row1.score1}} - {{row1.score2}}</i> <a style='display:inline; padding:0; margin:0'  href='#!team-detail.html/{{row1.team2.id}}'>{{row1.team2.name}}</a></strong>
			 <span class="location-marker" style='padding:0; margin:0'><i class="fa "></i><b class="own-red-shadow">{{row1.date |  date : "EEE dd MMM HH:mm"}} </b> </span> 
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

