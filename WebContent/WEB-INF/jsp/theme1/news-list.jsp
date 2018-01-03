 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<spring:url value="/resources/theme1" var="resources" />


<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΟΛΑ ΤΑ ΝΕΑ</h2>
<ul class="breadcrumbs">
<li><a href="">ΑΡΧΙΚΗ</a></li>
<li>ΝΕΑ</li>
</ul>
</div>
</div>


<main class="main-content">

<div class="theme-padding white-bg">
<div class="container">

<div class="blog-grid-view style-2">
<div class="row">

<div class="col-lg-4 col-xs-12" ng-repeat='row in news | orderBy:"-date"'>
<div class="blog-grid-figure"   >

<div class="large-post-img">

<div style='background:url(${resources}{{row.thumburl}}) no-repeat center; 
  width:100%; height:250px;background-size:cover; '>
</div>

<%-- <img src="${resources}{{row.imageurl}}" alt=""> --%>
</div>


<div class="large-post-detail style-3" style='height:100px; overflow:hidden'>
<span class="red-color">{{row.date | date}}</span>
<h2><a ng-href="#!news-detail.html/{{row.id}}">{{row.title}}</a></h2>
<!-- <p>Enim volutpat ac lectus in blandit vehicula faucibus non lectus vivamus cras etiam curabitur, vulputate ultricies curabitur accumsan varius vel volutpat aptent...
interdum gravida morbi non justo sociosqu aliquam justo ultrices duis laoreet mattis, consequat litora pellentesque</p>
 -->
 
 
 
 </div>


<div class="detail-btm">
<!-- <span>on Jun 27, 2014 </span>
 --><div class="share-option pull-right">
<span id="share-btn6"><i class="fa fa-share-alt"></i>Share</span>
<div id="show-social-icon6" class="on-hover-share">
<ul class="social-icons">
<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
</ul>
</div>
</div>
</div>

</div>
</div>

<!-- <div class="col-sm-4 col-xs-6 r-full-width-2 r-full-width">
<div class="column-widget h-white">
<h5>Sponcer</h5>
<ul id="brand-icons-slider-2" class="brand-icons-slider-2">
<li>
<a href="#"><img src="images/brand-icons/img-1-1.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-2.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-3.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-4.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-5.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-6.png" alt=""></a>
</li>
<li>
<a href="#"><img src="images/brand-icons/img-1-1.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-2.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-3.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-4.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-5.png" alt=""></a>
<a href="#"><img src="images/brand-icons/img-1-6.png" alt=""></a>
</li>
</ul>
</div>
</div>
 -->
 
 
<div class="col-xs-12">
<div class="pagination-holder">
<ul class="pagination">
<li><a href="#"><i class="fa fa-angle-double-left"></i>Previous</a></li>
<li><a href="#">1</a></li>
<li><a href="#">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">4</a></li>
<li><a href="#">5</a></li>
<li><a href="#">7</a></li>
<li><a href="#"><i class="fa fa-ellipsis-h"></i></a></li>
<li><a href="#">28</a></li>
<li><a href="#">Next<i class="fa fa-angle-double-right"></i></a></li>
</ul>
</div>
</div>
 
</div>
</div>

</div>
</div>
</main>


