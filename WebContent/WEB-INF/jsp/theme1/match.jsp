 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />



<div class="wrap push">


<div class="page-heading-breadcrumbs">
<div class="container">
<h2>Match</h2>
<ul class="breadcrumbs">
<li><a href="">Home</a></li>
<li>Match</li>
</ul>
</div>
</div>

<div style ='background-color:black;'>


<div class="matches-shedule-holder" style ='width:100%;'>
<div style ='width:100%; font-size:160%; ' class="col-lg-9 col-sm-8 r-full-width">

<div class="matches-dates-shedule" style =''>
<ul style ='border-style:none; '>
<li style ='background-color:black; color:white; border-style:none; '>
<span  class="pull-left"><img style='width:100px; height:100px' ng-src="${resources}{{game.team1.logopath}}" alt=""></span>
<span class="pull-right"><img style='width:100px; height:100px' ng-src="${resources}{{game.team2.logopath}}" alt=""></span>
<div class="detail">
<a href="">Match Detail<i class="fa fa-angle-double-right"></i></a>
<strong style='font-size:140%;'>{{game.team1.name}}<i class="red-color"> {{game.score1}} - {{game.score2}}  </i> {{game.team2.name}}</strong>
<span class=""><i class=""></i>{{game.date | date:"EEE dd MMM HH:mm"}}</span><!-- fa fa-map-marker -->
</div>
</li>
</ul>
</div>
</div>
</div>
</div>


<main class="main-content">




<div class="theme-padding white-bg">
<div class="container">

<div class="col-lg-9 col-sm-8">

 <div class="palyer-career theme-padding-bottom" ng-show='scorers.length'>
<h3>Σκορερς</h3>
<div class="table-responsive">
<table class="table table-bordered">
<thead>
			<tr><!-- 
				<th ng-show='desktop'>
				</th> -->
				<th>
				</th>
				<th>ΟΝΟΜΑ
				</th>
				<th>ΟΜΑΔΑ
				</th>
			</tr>
</thead>
<tbody>
			<tr ng-repeat='row2 in scorers   | orderBy: "-number"'>
			<!-- 	<td ng-show='desktop'>{{$index + 1}}</td> -->
				<td>{{row2.number}}
				</td>
				<td>{{row2.contact.name}}
				</td>
				<td>{{row2.team.name}}
				</td>
			</tr>

</tbody>
</table>
</div>
</div>
 


<div class="team-detail-content theme-padding-bottom" >
<h2>ΣΧΟΛΙΑ</h2>
<!-- <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11&appId=168415953609149';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-comments" data-href="{{currentpage}}" data-numposts="5"></div>

</div> -->
 <div class="fb-comments" data-href="{{getLocation()}}" data-numposts="10" data-colorscheme="light" data-width="580" id="commentbox"></div>

</div>



</div>

<div class="col-lg-3 col-sm-4">

<div class="aside-widget" ng-show='news.length'>
<h3><span>ΤΕΛΕΥΤΑΙΑ ΝΕΑ</span></h3>
<div class="Popular-news">
<ul>
<li ng-repeat='row in news | orderBy:"-date"'>
 <img style='max-height:50px; max-width:65px' ng-src="${resources}{{row.thumburl}}" alt=""> 


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


