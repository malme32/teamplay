<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> --%>
<title>Phone Book</title>
<%-- 
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-route.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-animate.js"></script>
 	<spring:url value="/resources/main.js" var="crunchifyJS" />
 	<spring:url value="/resources/main.css" var="maincss" />
	<script src="${crunchifyJS}"></script>
	 	<link rel="stylesheet" type="text/css" href="${maincss}"> --%>
	 

</head>
<body ng-app='appMain' >



<%-- <c:url value="/logout" var="logoutUrl" />
<form id="logout" action="${logoutUrl}" method="post" >
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<c:if test="${pageContext.request.userPrincipal.name != null}">
	<a href="javascript:document.getElementById('logout').submit()">Logout</a>
</c:if>
 --%>

<%-- ${contactlist}
 --%><!-- 
 <form method="post" action="/phonebook/contacts">
  Name<br>
  <input type="text" name="name"><br>
  Age<br>
  <input type="text" name="age">
  <input type="submit">
</form> 
 -->
 <div class=bodycomponent> 
	 <div class=" searchmain">
		 <input ng-model='searchstr' ng-keyup='searchContacts()' type='text' >
		 <button ng-click='searchContacts()'>Search</button>
	 </div>
</div>

<div class="bodycomponent">
<!--  <div class="bodycomponent spacemargin"> </div>
 -->
	<table class="table-fill">
	<thead>
		<tr>
			<th class="text-left">Name</th>
			<th class="text-left">Phone Number</th>
			<th class="text-left">Mobile Number</th>
			<th class="text-left">Email</th>
			<th class="text-left">Address</th>
			<th class="text-left">Position</th>
		</tr>
	</thead>
	<tbody class="table-hover">
		<tr ng-repeat='row in contacts'  ng-click='visitContact(row.id)'>
			<td class="text-left">{{row.name}}</td>
			<td class="text-left">{{row.phonenumber}}</td>
			<td class="text-left">{{row.mobilenumber}}</td>
			<td class="text-left">{{row.email}}</td>
			<td class="text-left">{{row.address}}</td>
			<td class="text-left">{{row.position.position}}</td>
			
<!-- 			
 -->			
			
		</tr>
	</tbody>
	</table>
	
</div>

<span ng-init="getContacts()">
<h2>{{result}}</h2>




</body>
</html>