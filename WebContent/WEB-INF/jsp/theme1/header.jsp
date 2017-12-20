 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:url value="/resources/theme1" var="resources" />


<header class="header style-3" ng-app="appMain" ng-controller='headerController'>

<div class="topbar-and-logobar">
<div class="container">

<div class="responsive-btn pull-right">
<a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
</div>


<ul class="user-login-option pull-right">
<li class="social-icon">
<ul class="social-icons style-5">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</li>
<li class="login-modal">
<a href="#" class="login" data-toggle="modal" data-target="#login-modal"><i class="fa fa-user"></i>ΣΥΝΔΕΣΗ</a>
<div class="modal fade" id="login-modal">
<div class="login-form position-center-center">
<h2>Login<button class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button></h2>
<form>
<div class="form-group">
<input type="text" class="form-control" name="user" placeholder="domain@live.com">
<i class=" fa fa-envelope"></i>
</div>
<div class="form-group">
<input type="password" class="form-control" name="pass" placeholder="**********">
<i class=" fa fa-lock"></i>
</div>
<div class="form-group custom-checkbox">
<label>
<input type="checkbox"> Stay login
</label>
<a class="pull-right forgot-password" href="#"></a>
<a href="#" class="pull-right forgot-password" data-toggle="modal" data-target="#login-modal-2">Forgot password?</a>
</div>
<div class="form-group">
<button class="btn full-width red-btn">Login</button>
</div>
</form>
<span class="or-reprater"></span>
<ul class="others-login-way">
<li><a class="facebook-bg" href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
<li><a class="tweet-bg" href="#"><i class="fa fa-twitter"></i>Tweet</a></li>
<li><a class="linkedin-bg" href="#"><i class="fa fa-linkedin"></i>Linkedin</a></li>
<li><a class="google-plus-bg" href="#"><i class="fa fa-google-plus"></i>Google+</a></li>
</ul>
</div>
</div>
<div class="modal fade" id="login-modal-2">
<div class="login-form position-center-center">
<h2>Forgot password<button class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button></h2>
<form>
<div class="form-group">
<input type="text" class="form-control" name="user" placeholder="domain@live.com">
<i class=" fa fa-envelope"></i>
</div>
<div class="form-group">
<input type="password" class="form-control" name="pass" placeholder="**********">
<i class=" fa fa-lock"></i>
</div>
<div class="form-group">
<button class="btn full-width red-btn">Login</button>
</div>
</form>
</div>
</div>
</li>
<li class="language-dropdown">
<a id="choses-lang" href="#"><i class="fa fa-globe"></i>ΕΛ<i class="fa fa-caret-down"></i></a>
<%-- <ul id="language-dropdown">
<li><a href="#"><img src="${resources}/images/flags/img-02.jpg" alt="">ger</a></li>
<li><a href="#"><img src="${resources}/images/flags/img-03.jpg" alt="">fra</a></li>
<li><a href="#"><img src="${resources}/images/flags/img-04.jpg" alt="">bra</a></li>
</ul> --%>
</li>
</ul>

</div>
</div>


<div class="nav-holder">
<div class="container">
<div class="maga-drop-wrap">

<div class="logo">
<a href="home-1.html"><img src="${resources}/images/davourlislogo1.png" alt=""></a>
</div>


<div class="search-bar-holder pull-right">
<div class="search-bar">
<input type="text" class="form-control" placeholder="search enter please...">
<i class="fa fa-search"></i>
</div>
</div>


<ul class="nav-list pull-right">
<li>
<a href="soccer.html">ΑΡΧΙΚΗ</a>
<%-- <ul>
<li><a >Home</a></li>
<li><a href="${resources}/home-2.html">Home 2</a></li>
<li><a href="#!championlist">Champions</a></li>

</ul> --%>
</li>
<%-- <li><a href="${resources}/about.html">ΕΓΚΑΤΑΣΤΑΣΕΙΣ</a></li>
 --%><li>
<a href="${resources}/team.html">ΑΚΑΔΗΜΙΕΣ</a>
<ul>
<li><a href="${resources}/team.html">team</a></li>
<li><a href="${resources}/team-detail.html">Team detail</a></li>
<li><a href="${resources}/team-width-sidebar.html">team-widthsidebar</a></li>
</ul>
<li><a href="point-table.html">ΠΡΩΤΑΘΛΗΜΑΤΑ</a>
<ul>
<li ng-repeat='row in headerChampions'><a href="point-table.html">{{row.name}}</a></li>

</ul>

</li>
<li><a href="team-list.html">ΟΜΑΔΕΣ</a>
</li>
<li class="mega-dropdown">
<a href="news-list.html">ΝΕΑ</a>
<ul>
<li class="row">
<div class="col-lg-3 col-md-3 col-sm-3">
<div class="blog-categories">
<h2>ΝΕΑ</h2>
<ul class="blog-categories-list">
<li><a href="news-list.html"><b>ΟΛΑ ΤΑ ΝΕΑ</b></a></li>
<li ng-repeat='row in news | orderBy:"-date"'><a ng-href="news-detail?id={{row.id}}">{{row.title}}</a></li>

 </ul>
</div>
</div>
<div class="col-lg-9 col-md-9 col-sm-9">
<div id="mega-blog-slider" class="mega-blog-slider">


<table>
<tr>
<td  ng-repeat='row in news | orderBy:"-date"'>
 <div class="item" style='margin:10px; width:180px; top:0;'>

<div class="large-post-img">
<%-- <img ng-src="${resources}{{row.imageurl}}" alt="">
 --%>
  <div style='background:url(${resources}{{row.imageurl}}) no-repeat center; 
  width:180px; height:130px;background-size:cover; '>

</div>


	<div class="large-post-detail style-3 p-0" style='height:110px; overflow:hidden'>
	<span class="red-color">{{row.date | date}}</span>
	<a ng-href="news-detail?id={{row.id}}"><h2>{{row.title}}</h2></a>
	</div>

</div>
</td>
</tr>
</table>
<%--  <div class="item"  ng-repeat='row in news | orderBy:"-date"'>

<div class="large-post-img">
<img ng-src="${resources}{{row.imageurl}}" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">{{row.date | date}}</span>
<h2>{{row.title}}</h2>
</div>

</div> --%>

<%--  <div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-2.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div> 



<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-3.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div> --%>

<%-- 
<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-4.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div>


<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-1.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div>


<div class="item">

<div class="large-post-img">
<img src="${resources}/images/blog-grid-view/img-2-2.jpg" alt="">
</div>


<div class="large-post-detail style-3 p-0">
<span class="red-color">Englis FA Cup</span>
<h2>Man United reunion for Ibrahimovic,</h2>
</div>

</div> --%>

</div>
</div>
</li>
</ul>
</li>
<li>
<a href="#">photo</a>
<ul>
<li><a href="match.html">Match</a></li>
<li><a href="match-detail.html">Match Detail</a></li>
<li><a href="match-result.html">Match Result</a></li>
</ul>
</li>
<li>
<a href="#">ΕΠΙΚΟΙΝΩΝΙΑ</a>
<ul>
<li><a href="shop.html">shop</a></li>
<li><a href="shop-detail.html">shop detail</a></li>
<li><a href="cart.html">cart</a></li>
</ul>
</li>
<!-- <li>
<a href="#">pages</a>
<ul>
<li><a href="gallery.html">gallery</a></li>
<li><a href="blog.html">blog</a></li>
<li><a href="blog-detail.html">blog detail</a></li>
<li><a href="blog-grid-view.html">blog grid view</a></li>
<li><a href="blog-grid-view-2.html">blog grid view-2</a></li>
<li><a href="blog-larg-view.html">blog larg view</a></li>
<li><a href="blog-list-view.html">blog list view</a></li>
<li><a href="point-table.html">point table</a></li>
<li><a href="404.html">404</a></li>
<li><a href="underconstraction.html">underconstraction</a></li>
</ul>
</li> 
<li><a href="contact.html">contact</a></li>-->
</ul>

</div>
</div>
</div>

</header>
