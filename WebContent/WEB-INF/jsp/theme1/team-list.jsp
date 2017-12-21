 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:url value="/resources/theme1" var="resources" />





<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΟΜΑΔΕΣ</h2>

<ul class="breadcrumbs">
<li><a href="#">ΑΡΧΙΚΗ</a></li>
<li>ΟΜΑΔΕΣ</li>
</ul>
</div>
</div>

<main class="main-content">
<br><br><br>
<!-- pull-right
 --><!-- <div class="search-bar-holder "> -->
<!-- <div class="search-bar">
 -->
 <div class='search-field'>
 <input ng-model='mysearch' type="text" class="form-control" placeholder="Αναζητηστε ομάδα εδώ...">
<i class="fa fa-search"></i></div>
<!-- </div>
 --><!-- </div>
 -->
<div class=" theme-margin-bottom" ng-repeat="row in teams  | filter:mysearch" style="padding:10px; border-bottom: 1px solid lightgray;border-top: 1px solid lightgray; height:70px;">
<div style='display:inline-block'><img style='height:50px;' ng-src="${resources}{{row.logopath}}" alt=""></div>
<div style='display:inline-block'>
<h5><a ng-href='#!team-detail.html/{{row.id}}'>
<i class="red-color">{{row.name}}</i>
<!-- <p>Id quisque cursus est volutpat lorem phasellus ut neque vivamus dolor, ornare sociosqu purus taciti erat egestas integer enim sem porta ligula semper suspendisse mi metus auctor faucibus lobortis senectus, at metus nisl ornare consectetur.</p>
 --><!-- <span><a href="#"><i class="fa fa-twitter"></i>@marcobale #dominname</a></span> -->
</a></h5>

</div>

</div>


</main>

