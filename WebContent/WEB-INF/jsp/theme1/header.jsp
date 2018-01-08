 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:url value="/resources/theme1" var="resources" />


<header class="header style-3" ng-app="appMain" ng-controller='headerController' >

<div class="topbar-and-logobar" >
<div class="container">

<div class="responsive-btn pull-right">
<a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
</div>


<ul class="user-login-option pull-right">


<%if(pageContext.getAttribute("username", PageContext.REQUEST_SCOPE).equals("")){ %>
<li class="login-modal">
<a href="loginPage" class="login" ><i class="fa fa-user"></i> ΣΥΝΔΕΣΗ</a>

</li>
<%}else{%>
<li style='color:white'><%= pageContext.getAttribute("name", PageContext.REQUEST_SCOPE) %></li>
						<li>
					
					<c:url value="/logout" var="logoutUrl" /> <form id="logout" action="${logoutUrl}" method="post" >
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<a style='color:white' href="javascript:document.getElementById('logout').submit()">Logout</a>
					</c:if>
					</li>
<%}%>
<%--<li class="language-dropdown">
<a id="choses-lang" href="#"><i class="fa fa-globe"></i>ΕΛ<i class="fa fa-caret-down"></i></a>
 <ul id="language-dropdown">
<li><a href="#"><img src="${resources}/images/flags/img-02.jpg" alt="">ger</a></li>
<li><a href="#"><img src="${resources}/images/flags/img-03.jpg" alt="">fra</a></li>
<li><a href="#"><img src="${resources}/images/flags/img-04.jpg" alt="">bra</a></li>
</ul> 
</li>--%>
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

<a href="#!home">ΑΡΧΙΚΗ</a>
<%-- <ul>
<li><a >Home</a></li>
<li><a href="${resources}/home-2.html">Home 2</a></li>
<li><a href="#!championlist">Champions</a></li>

</ul> --%>
</li>

<%-- <li><a href="${resources}/about.html">ΕΓΚΑΤΑΣΤΑΣΕΙΣ</a></li>
 --%>
<li><a ng-href="#!point-table.html">ΠΡΩΤΑΘΛΗΜΑΤΑ</a>
<ul>
<li ng-repeat='row in headerChampions'><a href="#!point-table.html">{{row.name}}</a></li>

</ul>

</li>
<li><a href="#!team-list.html">ΟΜΑΔΕΣ</a>
<ul>
<li ><a ng-click='getMyTeamLink()' href=''>Η ΟΜΑΔΑ ΜΟΥ</a></li><!-- ng-href="{{getMyTeamLink()}} -->
<%if(!pageContext.getAttribute("username", PageContext.REQUEST_SCOPE).equals("")){ %>
<li ><a href="#!editteam">ΕΠΕΞΕΡΓΑΣΙΑ ΟΜΑΔΑΣ</a></li>
<%} %>
<li ><a href="#!team-list.html">ΟΛΕΣ ΟΙ ΟΜΑΔΕΣ</a></li>
</ul>
</li>
<li class="mega-dropdown">
<a href="#!news-list.html">ΝΕΑ</a>
<ul>
<li class="row">
<div class="col-lg-3 col-md-3 col-sm-3">
<div class="blog-categories">
<h2>ΝΕΑ</h2>
<ul class="blog-categories-list">
<li><a href="#!news-list.html"><b>ΟΛΑ ΤΑ ΝΕΑ</b></a></li>
<li ng-repeat='row in news | orderBy:"-date"'><a ng-href="#!news-detail.html/{{row.id}}">{{row.title}}</a></li>

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
  <div style='background:url(${resources}{{row.thumburl}}) no-repeat center; 
  width:180px; height:130px;background-size:cover; '>

</div>


	<div class="large-post-detail style-3 p-0" style='height:110px; overflow:hidden'>
	<span class="red-color">{{row.date | date}}</span>
	<a ng-href="#!news-detail.html/{{row.id}}"><h2>{{row.title}}</h2></a>
	</div>

</div>
</td>
</tr>
</table>


</div>
</div>
</li>
</ul>
</li>
<li>
<a href="">ΑΚΑΔΗΜΙΕΣ</a>
</li>
<li>
<a href="#!gallery">photo</a>

</li>
<li>
<a href="">ΕΠΙΚΟΙΝΩΝΙΑ</a>

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


<nav id="menu" class="responive-nav" ng-app="appMain" ng-controller='headerController'>
<a class="r-nav-logo" href="home-1.html"><img src="${resources}/images/logo-1.png" alt=""></a>
<ul class="respoinve-nav-list">




<%if(pageContext.getAttribute("username", PageContext.REQUEST_SCOPE).equals("")){ %>
<li class="">
<a href="loginPage" class= >ΣΥΝΔΕΣΗ</a>

</li>
<%}%>


<li><a href="#!home">ΑΡΧΙΚΗ</a></li>
<!-- <a data-toggle="collapse" href="#list-1"><i class="pull-right fa fa-angle-down"></i>ΑΡΧΙΚΗ</a>
<ul class="collapse" id="list-1">
<li><a href="#!home">ΑΡΧΙΚΗ</a></li>
<li><a href="index-2.html">Home 2</a></li>
<li><a href="index-3.html">Home 3</a></li>
</ul> 
</li>-->

<!-- <li>
<a data-toggle="collapse" href="#list-2"><i class="pull-right fa fa-angle-down"></i>Team</a>
<ul class="collapse" id="list-2">
<li><a href="#!team-list.html">ΟΜΑΔΕΣ</a></li>
<li><a href="team-detail.html">Team Detail</a></li>
<li><a href="team-widthsidebar.html">team widthsidebar</a></li>
</ul>
</li>
 -->


<li><a data-toggle="collapse" href="#list-2"><i class="pull-right fa fa-angle-down"></i>ΟΜΑΔΕΣ</a>
<ul  class="collapse" id="list-2">
<li  ng-click='getMyTeamLink()'><a href=''>Η ΟΜΑΔΑ ΜΟΥ</a></li>
<%if(!pageContext.getAttribute("username", PageContext.REQUEST_SCOPE).equals("")){ %>
<li ><a href="#!editteam">ΕΠΕΞΕΡΓΑΣΙΑ ΟΜΑΔΑΣ</a></li>
<%} %>
<li ><a href="#!team-list.html">ΟΛΕΣ ΟΙ ΟΜΑΔΕΣ</a></li>
</ul>
</li>


<li>
<li><a href="#!point-table.html">ΠΡΩΤΑΘΛΗΜΑΤΑ</a></li>

<li>
<a href="#!news-list.html">ΝΕΑ</a>
</li>
<li>
<a href="">ΑΚΑΔΗΜΙΕΣ</a>
</li>
<li><a href="#!gallery">GALLERY</a></li>
<li><a href="">ΕΠΙΚΟΙΝΩΝΙΑ</a></li>
<%if(!pageContext.getAttribute("username", PageContext.REQUEST_SCOPE).equals("")){ %>

<%-- <li style=''><a href='' ><%= pageContext.getAttribute("name", PageContext.REQUEST_SCOPE) %></a></li> --%>
						<li>
					
					<c:url value="/logout" var="logoutUrl" /> <form id="logout" action="${logoutUrl}" method="post" >
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<a style='' href="javascript:document.getElementById('logout').submit()"><%= pageContext.getAttribute("name", PageContext.REQUEST_SCOPE) %> Logout</a>
					</c:if>
					</li>
<%}%>
<!-- <li>
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
<li><a href="contact.html">Contact</a></li>-->
</ul> 
</nav>
