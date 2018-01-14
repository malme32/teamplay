 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<spring:url value="/resources/theme1" var="resources" />

<spring:url value="/resources" var="resources_start" />

<link href='${resources_start}/calendar/fullcalendar.min.css' rel='stylesheet' />
<link href='${resources_start}/calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${resources_start}/calendar/lib/moment.min.js'></script>
<%-- <script src='${resources}/calendar/lib/jquery.min.js'></script> --%>
<script src='${resources_start}/calendar/fullcalendar.min.js'></script>


<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΔΙΑΘΕΣΙΜΟΤΗΤΑ</h2>
<ul class="breadcrumbs">
<li><a href="">ΑΡΧΙΚΗ</a></li>
<li>ΔΙΑΘΕΣΙΜΟΤΗΤΑ</li>
</ul>
</div>
</div>


<script>



</script>
<style>

/*   body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  } */

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>

{{result}} 
		<img ng-show='showclock' width=40 height=40 src="${resources}/customimages/loading.gif" alt="">
<main class="main-content">

   <div id='calendar'></div> 
</main>


