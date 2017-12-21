 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />


<div class="page-heading-breadcrumbs">
<div class="container">
<h2>{{team.name}}</h2>

<ul class="breadcrumbs">
<li><a href="soccer.html">ΑΡΧΙΚΗ</a></li>
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
{{team.name}}
</div>
</div>
</div>
</div>


<div class="col-lg-9 col-md-9 col-sm-7">

<div class="team-detail-content theme-padding-bottom">
<h2>ΠΕΡΙΓΡΑΦΗ ΟΜΑΔΑΣ</h2>
<p>{{team.description}}</p>
<div class="tags-holder">
 <ul class="tags-list pull-left">
<li><i class="fa fa-tags"></i>Tags</li>
<li><a href="#!point-table.html">Champions</a></li>
<!-- <li><a href="#">transfers</a></li>
 --><li><a href="team-list.html">Teams</a></li>
<!-- <li><a href="#">cups</a></li>
 --></ul> 
<ul class="social-icons pull-right">
<li>Κοινοποιήστε αυτή τη σελίδα</li>
<li><a class="facebook" href="https://www.facebook.com/sharer/sharer.php?u={{currentpage}}"><i class="fa fa-facebook"></i></a></li>
<li><a class="tweeter" href="https://twitter.com/home?status={{currentpage}}"><i class="fa fa-twitter"></i></a></li>
<!-- <li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li> -->
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
</thead>
<tbody>
			<tr ng-repeat='row1 in standings | orderBy: "-grade"'>
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
		<tr ng-repeat='row1 in games | validDate | orderBy: "-date" '  >
		<td >
		<div class="logo-width-name"><a href='#!team-detail.html/{{row1.team1.id}}'><img src="${resources}/images/team-logos-small/img-01.png" alt="">{{row1.team1.name}}</a></div>
		</td>
		

		<td class="upcoming-fixture-date own-td-vs" style="text-align:center"><a ng-href='#!match.html/{{row1.id}}'>
			<span class="own-score own-red-shadow" ng-show="row1.score1">{{row1.score1}} - {{row1.score2}} </span><span class="own-date">{{row1.date |  date : "dd/MM HH:mm"}}</span>
			</a></td>
		<!--  w-icon -->
		
		<td>
		<div class="logo-width-name"><a href='#!team-detail.html/{{row1.team2.id}}'><img src="${resources}/images/team-logos-small/img-02.png" alt="">{{row1.team2.name}}</a></div>
		</td>
		</tr>
		
		</tbody>
		</table>
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

</div>

</div>



<div class="row" ng-show='players.length'>
<div class="col-lg-9 col-sm-12 pull-right top-palyer">
<h2>ΠΑΙΧΤΕΣ</h2>
<div class="row">

<div class="col-sm-4 col-xs-6 r-full-width" ng-repeat='row in players'>
<div class="team-column">
 <div style='background:url(${resources}{{row.imagepath}}) no-repeat center; width:250px; height:250px;background-size:cover; '>
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


</main>

