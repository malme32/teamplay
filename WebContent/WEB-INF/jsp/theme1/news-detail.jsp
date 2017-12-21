 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:url value="/resources/theme1" var="resources" />

<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΕΙΔΗΣΗ</h2>
<ul class="breadcrumbs">
<li><a href="soccer.html">ΑΡΧΙΚΗ</a></li>
<li>ΕΙΔΗΣΗ</li>
</ul>
</div>
</div>



<main class="main-content">

<div class="theme-padding white-bg">
<div class="container">
<div class="row">

<div class="">

<div class="blog-detail-holder">
<div class="author-header">
<h2>{{notice.title}}</h2>
<div class="aurhor-img-name pull-left">
<%-- <img ng-src="${resources}{{notice.imageurl}}" alt=""> --%>
<strong>by <i class="red-color">Admin</i></strong>
<span>{{notice.date | date}} </span>
</div>
<div class="share-option pull-right">
<span id="share-btn1"><i class="fa fa-share-alt"></i>Share</span>
<div id="show-social-icon1" class="on-hover-share">
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</div>
</div>
</div>
<article>
<p></p>
</article>
<div class="blog-detail">
<figure>
<img ng-src="${resources}{{notice.imageurl}}" alt="" style='max-height:400px'>
</figure>
<article>
<p>{{notice.content}}</p>
 </article>
</div>
<div class="tags-holder">
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

</div>
</div>
</div>

</main>
