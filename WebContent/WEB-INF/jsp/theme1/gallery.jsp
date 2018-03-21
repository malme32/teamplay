 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />


<spring:url value="/resources_static/theme1" var="resources_static" />


<div class="page-heading-breadcrumbs">
<div class="container">
<h2>Photo Gallery</h2>
<ul class="breadcrumbs">
<li><a href="">Home</a></li>
<li>Photo Gallery</li>
</ul>
</div>
</div>


<%-- <div class="overlay-dark theme-padding parallax-window" data-appear-top-offset="600" data-parallax="scroll" data-image-src="${resources}/images/inner-banner/img-01.jpg"></div>
 --%>

<main class="main-content">

<div class=" white-bg">
<div class="container">



<div class="theme-padding" ng-repeat="album in albums | orderBy:'-date'">
<div class="row m-0" ng-show='album.images.length'>

<div class="col-sm-12 p-0">
<h2>{{album.name}}</h2>
</div>


<div class="col-sm-3 col-xs-6 r-full-width p-0" ng-repeat="image in album.images">
<figure class="gallery-figure">
<img ng-src="${resources_static}{{image.thumburl}}" alt="">
<figcaption class="overlay">
<div class="position-center-center">
<ul class="btn-list">
<!-- <li><a class="fa fa-link" href="#"></a></li>
 --><%-- <li><a href="${resources}{{image.url}}" data-rel="prettyPhoto[gallery]"><i class="fa fa-search"></i></a></li>
 --%><li><a prettyp ng-href="${resources_static}{{image.url}}" rel="prettyPhoto[gallery]"><i class="fa fa-search"></i></a></li>
</ul>
</div>
</figcaption>
</figure>

</div>

<%-- <div prettyp class="image" ng-repeat="image in album.images" ng-href="${resources}{{image.url}}" rel="prettyPhoto[main]" target="_blank">
<img ng-src="${resources}{{image.url}}" width="70px"/>
</a>

</div>
 --%>
</div>




</div>
</div>

</main>