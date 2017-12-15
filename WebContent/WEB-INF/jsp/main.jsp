<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Soccer a Sports Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
	
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
<link rel='stylesheet' href='https://material.angularjs.org/1.1.5/docs.css'>
		<!-- <<<<< ANGULAR MATERIAL -->	
	
	<spring:url value="/resources/main.js" var="crunchifyJS" />
 	<spring:url value="/resources/main.css" var="maincss" />
 	<script src="${crunchifyJS}"></script>
	<link rel="stylesheet" type="text/css" href="${maincss}">  
<!-- <<<<<<<<<<<<< COMMON  -->
 	
 	<spring:url value="/resources/js/jquery.min.js" var="themejs1" />
 	<spring:url value="/resources/js/responsiveslides.min.js" var="themejs2" />
 	<spring:url value="/resources/css/style.css" var="themecss1" />
 	<spring:url value="/resources/css/bootstrap.css" var="themecss2" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!--fonts-->
<!-- 			<link href='https://css.uefa.com/CompiledAssets/UefaCom/css/competitions/uefachampionsleague/sections/standings.min.css?_t=409baf2260ad1afd7382f3ffa1f6b76b' rel='stylesheet' type='text/css'>
 -->	
	
		<link href='http://fonts.googleapis.com/css?family=Francois+One' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>	
	   <link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'>		
	<!--//fonts-->		
		<link href="${themecss2}" rel="stylesheet" type="text/css" media="all" />
		<link href="${themecss1}" rel="stylesheet" type="text/css" media="all" />
	<!-- for-mobile-apps -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->

		<meta name="keywords" content="soccer Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	
	

	<!-- //for-mobile-apps -->
	<!-- js -->
		<%-- <script src="${themejs1}" ></script> --%>
	<!-- js -->
</head>
<body ng-app="appMain">
<div class="header">
	 <div class="container">
		 <div class="logo">
			   <h1><a href="index.html">SOCCER</a></h1>
		 </div>	
		 <div class="top-menu">
			 <span class="menu"></span>
					<ul class='active'>
					<!-- 	<li><a href="#/!">Main</a></li> -->
						<li><a href="#!start">Home</a></li>
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
		 </div>			
		 <!-- script-for-menu -->
		 <script>
				$("span.menu").click(function(){
					$(".top-menu ul").slideToggle("slow" , function(){
					});
				});
		 </script>
		 <!-- script-for-menu -->	  	

		 <div class="clearfix"></div>
	 </div>
</div>
<!-- //header -->
<!-- banner -->
<div class="strip">
	 <div class="container">
	 <div class="search">
		    <form>
		    	<input type="text" value="" placeholder="Search...">
				<input type="submit" value="">
			</form>
     </div>     
	 <div class="social">			 
			 <a href="#"><i class="facebook"></i></a>
			 <a href="#"><i class="twitter"></i></a>
			 <a href="#"><i class="dribble"></i></a>	
			 <a href="#"><i class="google"></i></a>	
			 <a href="#"><i class="youtube"></i></a>	
	 </div>
		<div class="clearfix"></div>
		</div>
</div>
<!-- banner -->
<div class="banner">
		<script src="${themejs2}" ></script>
  <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 300,
        manualControls: '#slider3-pager',
      });
    });
  </script>

<!-- header -->
<div ng-view></div>
<!-- //content-bottom -->
<!--footer-->
<div class="footer">
	 <div class="container">
		 <div class="copywrite">
			 <p>© 2015 All Rights Reseverd Design by <a href="http://w3layouts.com/">W3layouts</a> </p>
		 </div>
		 <div class="footer-menu">
			 <ul>
				 <li><a href="index.html">HOME</a></li>
				 <li><a href="index.html">ABOUT US</a></li>
				 <li><a href="index.html">GALLERY</a></li>
				 <li><a href="index.html">TRAINING</a></li>
				 <li><a href="index.html">NEWS & EVENTS</a></li>
				 <li><a href="index.html">CONTACT</a></li>
			 </ul>
		 </div>
		 <div class="clearfix"></div>
	 </div>
</div>
<!-- //footer -->
</body>
</html>