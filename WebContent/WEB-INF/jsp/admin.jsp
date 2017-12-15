 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:url value="/resources/theme1" var="resources" />
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="" />

<title>Admin</title>


<!-- COMMON >>>>>>>>>>>>> -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-route.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-animate.js"></script>
		<!-- ANGULAR MATERIAL >>>>> -->
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-aria.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-messages.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js"></script>
<script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.5/angular-material.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
<link rel='stylesheet' href='https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.5/angular-material.css'>
<!--<link rel='stylesheet' href='https://material.angularjs.org/1.1.5/docs.css'> -->
		<!-- <<<<< ANGULAR MATERIAL -->	
	
	<spring:url value="/resources/admin.js" var="crunchifyJS" />
 	<spring:url value="/resources/main.css" var="maincss" />
 	<script src="${crunchifyJS}"></script>
 	<link rel="stylesheet" type="text/css" href="${maincss}">   
<!-- <<<<<<<<<<<<< COMMON  -->


</head>
<body ng-app="appAdmin">
<div class='champ'>
	<ul>
		<li><a ng-href='#!adminchampions'>ΠΡΩΤΑΘΛΗΜΑΤΑ</a></li>
	</ul> 
	<ul>
		<li><a  ng-href='#!adminteams'>ΟΜΑΔΕΣ</a></li>
	</ul> 
</div>

<div ng-view></div>
</body>
</html>