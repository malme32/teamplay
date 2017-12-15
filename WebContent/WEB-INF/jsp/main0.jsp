<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event List</title>

	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-route.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-animate.js"></script>
<!-- 	 	<script src="/phonebook/scripts/myscript.js"></script>
 -->	<spring:url value="/resources/main.js" var="crunchifyJS" />
 	<spring:url value="/resources/main.css" var="maincss" />
	<script src="${crunchifyJS}"></script>
	 	<link rel="stylesheet" type="text/css" href="${maincss}">
	 
<!-- 	<script src="http://www.evebbo.com/externalresources/scripts/myscript.js"></script>
	<link rel="stylesheet" type="text/css" href="http://www.evebbo.com/externalresources/css/mystyle.css">
 -->
</head>
<body ng-app="appMain">



<ul class='mainmenu'>
<!-- 	<li><a href="#/!">Main</a></li> -->
	<li><a href="#!eventlist">Event List</a></li>
	<li><a href="#!phonebook">Phone Book</a></li>
	<li><a href="#!championlist">Champions</a></li>
	<li>

<c:url value="/logout" var="logoutUrl" /> <form id="logout" action="${logoutUrl}" method="post" >
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<c:if test="${pageContext.request.userPrincipal.name != null}">
	<a href="javascript:document.getElementById('logout').submit()">Logout</a>
</c:if>
</li>
	<!-- <li><a href="#!weather">Weather</a></li> -->
</ul>
<!-- <p>Click on the links.</p>

<p>Note that each "view" has its own controller which each gives the "msg" variable a value.</p>

<h1>Hide the DIV: <input type="checkbox" ng-model="myCheck"></h1>

<div ng-hide="myCheck">dddd</div> -->
{{loading}}
<div ng-view></div>
<h2>{{result}}</h2>

</div>

</body>
</html>
