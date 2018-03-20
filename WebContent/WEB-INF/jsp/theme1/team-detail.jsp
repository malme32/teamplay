 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />
<spring:url value="/resources_static/theme1" var="resources_static" />


<div class="page-heading-breadcrumbs">
<div class="container" >
<h2>{{team.name}}</h2>

<ul class="breadcrumbs">
<li><a href="">ΑΡΧΙΚΗ</a></li>
<li>{{team.name}}</li>
</ul>
</div>
</div>


<%-- <div class="overlay-dark theme-padding parallax-window" data-appear-top-offset="600" data-parallax="scroll" data-image-src="${resources}/images/inner-banner/img-03.jpg">
</div> --%>


<main class="main-content">

<div class="team-detail-holder theme-padding white-bg">
<div class="container" style="padding:0">

<div class="row">

<div class="col-lg-3 col-md-3 col-sm-5" style='margin-bottom:30px'>
<div class="team-column ">
<img ng-src="${resources_static}{{team.logopath}}" alt="">
<!-- <span class="player-number">12</span>
 --><div class="team-detail">
<!-- <h5>Lionel AndrÃ©s Messi</h5> -->
<!-- <span class="desination">Defender</span>
 --><div ><!-- class="detail-inner" -->

{{team.name}}
</div>
</div>
</div>
</div>


<div class="col-lg-9 col-md-9 col-sm-7">

<div class="team-detail-content theme-padding-bottom" >
<h2>ΠΕΡΙΓΡΑΦΗ ΟΜΑΔΑΣ</h2>
<p>{{team.description}}</p>
<button style='' ng-class="isFollowed(team)"  ng-click="followTeam(team)">{{isFollowedText(team)}}</button> 
<div class="tags-holder">
<!--  <ul class="tags-list pull-left">
<li><i class="fa fa-tags"></i>Tags</li>
<li><a href="#!point-table.html">Champions</a></li>
<li><a href="team-list.html">Teams</a></li>
</ul> --> 
<ul class="social-icons pull-right">
<li>Κοινοποιήστε αυτή τη σελίδα</li>
<li><a class="facebook" href="https://www.facebook.com/sharer/sharer.php?u={{currentpage}}"><i class="fa fa-facebook"></i></a></li>
<li><a class="tweeter" href="https://twitter.com/home?status={{currentpage}}"><i class="fa fa-twitter"></i></a></li>

</ul>
</div>
</div>



<!-- <div class="" ng-repeat='row2 in row.standings.matchdays' style="margin-bottom:30px;"> -->
<!-- 		<h3><span><i class="red-color">{{row2.name}} </i></span></h3>
 -->		



 <div class="  palyer-career  theme-padding-bottom" ng-show='standings.length' style=''><!---->
<h2>Βαθμολογια</h2>
<div class="" style=''><!-- table-responsive -->
<table class="table table-bordered" style=''>
<thead>
			<tr >
				<th>ΠΡΩΤΑΘΛΗΜΑ
				</th>
				<th>ΒΑΘΜΟΙ
				</th>
				<th ng-show='desktop'>ΓΚΟΛ
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
			<tr ng-repeat='row1 in standings | orderBy: "-grade"' ng-show='row1.champion.enabled'>
				<td><a href='#!point-table.html'>{{row1.champion.name}}</a>
				</td>
				<td class="td_grade">{{row1.grade}}
				</td>
				<td ng-show='desktop'>{{row1.goal}}
				</td>
				<td ng-show='desktop'>{{row1.game}}
				</td>
				<td ng-show='desktop'>{{row1.win}}
				</td>
				<td ng-show='desktop'>{{row1.defeat}}
				</td>
				<td ng-show='desktop'>{{row1.draw}}
				</td>
			</tr>

</tbody>
</table>
</div>
</div>

  <!-- <div class="" ng-show='standings.length' style=''>
<h2>Βαθμολογια</h2>
<div class="" style=''>table-responsive
<table class="" style=''>

			<tr >
				<th>ΠΡΩΤΑΘΛΗΜΑ
				</th>
				<th>ΒΑΘΜΟΙ
				</th>
				<th>ΓΚΟΛ
				</th>
				<th>ΑΓΩΝΕΣ
				</th>
				<th>ΝΙΚΕΣ
				</th>
				<th>ΗΤΤΕΣ
				</th>
				<th>ΙΣΟΠΑΛΙΕΣ
				</th>
			</tr>

			<tr ng-repeat='row1 in standings | orderBy: "-grade"' >
				<td><a href='#!point-table.html'>{{row1.champion.name}}</a>
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

</table>
</div>
</div> -->
 
 
 		<div ng-show='games.length' class='theme-padding-bottom'>
 		<h2>ΕΠΟΜΕΝΑ ΠΑΙΧΝΙΔΙΑ</h2>

		<div class="matches-shedule-holder">


			<div class="matches-dates-shedule" style='padding:0'>
			<ul>
			<li ng-repeat='row1 in games | nextGames | orderBy: "date" ' style='padding:5px; ' ng-show='row1.champion.enabled'>
			<span class="pull-left"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team1.logothumbpath}}" alt=""></span>
			<span class="pull-right"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team2.logothumbpath}}" alt=""></span>
			<div class="detail">
			<a href="#!match.html/{{row1.id}}">Λεπτομέρειες<i class="fa fa-angle-double-right"></i></a>
			<strong><a style='display:inline; padding:0; margin:0' href='#!team-detail.html/{{row1.team1.id}}'>{{row1.team1.name}}</a><i class="red-color"  style=''> {{row1.score1}} - {{row1.score2}}</i> <a style='display:inline; padding:0; margin:0'  href='#!team-detail.html/{{row1.team2.id}}'>{{row1.team2.name}}</a></strong>
			<span class="location-marker" style=''><i class="fa "></i><b class="own-red-shadow">{{row1.date |  date : "EEE dd MMM HH:mm"}}</b> ({{row1.champion.name}})</span>
			</div>
			</li>
			
			</ul>
			</div>
			
			</div>
		


		</div>
		
		
		 		<div ng-show='games.length' class='theme-padding-bottom'>
 		<h2>ΤΕΛΕΥΤΑΙΑ ΑΠΟΤΕΛΕΣΜΑΤΑ</h2>

		<div class="matches-shedule-holder">


			<div class="matches-dates-shedule" style='padding:0'>
			<ul>
			<li ng-repeat='row1 in games | lastResults | orderBy: "-date" ' style='padding:5px; ' ng-show='row1.champion.enabled'>
			<span class="pull-left"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team1.logothumbpath}}" alt=""></span>
			<span class="pull-right"><img style='height:40px; width:40px' ng-src="${resources_static}{{row1.team2.logothumbpath}}" alt=""></span>
			<div class="detail">
			<a href="#!match.html/{{row1.id}}">Λεπτομέρειες<i class="fa fa-angle-double-right"></i></a>
			<strong><a style='display:inline; padding:0; margin:0' href='#!team-detail.html/{{row1.team1.id}}'>{{row1.team1.name}}</a><i class="red-color"  style=''> {{row1.score1}} - {{row1.score2}}</i> <a style='display:inline; padding:0; margin:0'  href='#!team-detail.html/{{row1.team2.id}}'>{{row1.team2.name}}</a></strong>
			<span class="location-marker" style=''><i class="fa "></i>{{row1.date |  date : "EEE dd MMM HH:mm"}} ({{row1.champion.name}})</span>
			</div>
			</li>
			
			</ul>
			</div>
			
			</div>
		


		</div>
		
	<!-- 	</div> -->


<div class="team-detail-content theme-padding-bottom" >
<h2>ΣΧΟΛΙΑ</h2>
<!-- <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11&appId=168415953609149';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script> -->
<!-- <div class="fb-comments" data-href="{{getLocation()}}" data-numposts="5"></div> 
 -->
 <div class="fb-comments" data-href="{{getLocation()}}" data-numposts="10" data-colorscheme="light" data-width="580" id="commentbox"></div>
 
<!--  <div ng-if="fbComments">
    <div class="fb-comments" fb-comment-box page-href="http://developers.facebook.com/docs/plugins/comments/" data-numposts="5" data-colorscheme="light" data-width="100%"></div>
  </div> -->
</div>




<div class="" ng-show='players.length'>
<div class=" "><!-- pull-left to	p-palyer -->
<h2>ΠΑΙΧΤΕΣ</h2>
<div class="row">

<div class="col-sm-4 col-xs-6 r-full-width" ng-repeat='row in players'>
<div class="team-column">
 <div style='background:url(${resources_static}{{row.imagepath}}) no-repeat center;  height:240px;background-size:cover; '>
<%--  <img ng-src="${resources}{{row.imagepath}}" alt="">  --%>
<span ng-show='row.number' class="player-number">{{row.number}}</span>
<div class="team-detail">
<h5><a href="#">{{row.name}}</a></h5>
<span class="desination">{{row.soccerposition}}</span>
<div class="detail-inner">
<ul>
<li >Θέση</li>
<li>Νούμερο</li>
<li>Ομάδα</li>
<li >&nbsp;</li>
<!-- <li>Ακολουθήστε μας</li> -->
</ul>
<ul>
<li>&nbsp;{{row.soccerposition}}</li>
<li>&nbsp;{{row.number}}</li>
<li>&nbsp;{{team.name}}</li>
<li >&nbsp;</li>
 <li>
<ul class="social-icons">
<li><a class="facebook" href="https://www.facebook.com/sharer/sharer.php?u={{currentpage}}"><i class="fa fa-facebook"></i></a></li>
<li><a class="tweeter" href="https://twitter.com/home?status={{currentpage}}"><i class="fa fa-twitter"></i></a></li>
<!-- <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li> -->
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
</div>
</div>
</div>

</div>


</main>

