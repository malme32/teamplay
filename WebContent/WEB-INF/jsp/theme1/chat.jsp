 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />
<spring:url value="/resources" var="resources_start" />

<link href='${resources_start}/chat.css?v=28' rel='stylesheet' />

<spring:url value="/resources_static/theme1" var="resources_static" />
<div class="wrap push chattotal">



<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΜΗΝΥΜΑΤΑ</h2>
<ul class="breadcrumbs">
<li><a href="">ΑΡΧΙΚΗ</a></li>
<li>ΜΗΝΥΜΑΤΑ</li>
</ul>
</div>
</div>

<div class = "">




<!-- <div class="menuchat">
            <div class="back"><i class="fa fa-chevron-left"></i> <img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
            <div class="name">Alex</div>
            <div class="last">18:09</div>
        </div> -->
    <ol class="chat">
     <li ng-repeat="message in messages | orderBy: 'date'" ng-class="getSender(message)">
        <div class="avatar"><img ng-src="${resources_static}{{getPicture(message)}}" draggable="false"/></div>
      <div class="msg">
				<p>{{message.message}}</p>
        <time>{{message.date | timeago}} </time>
        <p style="font-size: 1.2rem;">{{getStatus(message)}} </p>
      </div>
    </li> 
  
  <!--    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
        <p>Hola!</p>
        <p>Te vienes a cenar al centro? <emoji class="pizza"/></p>
        <time>20:17</time>
      </div>
    </li>
     <li class="self">
        <div class="avatar"><img src="https://i.imgur.com/HYcn9xO.png" draggable="false"/></div>
      <div class="msg">
        <p>Puff...</p>
        <p>Aún estoy haciendo el contexto de Góngora... <emoji class="books"/></p>
        <p>Mejor otro día</p>
        <time>20:18</time>
      </div>
    </li>
-->
    </ol>
     <div class=" chatsend" >
     <table style="width:100%" >
     <tr>
     <td style='background-color:white'><textarea class="textarea" style='background-color:white; width:100%' type="text" placeholder="Γράψτε εδω!" ng-model='text' ng-keypress="keyPressed($event)"></textarea></td>
     <td style=' width:60px; padding:0 5px 0 5px'>
     <img ng-src='${resources_start}/generalimages/sendmessage.ico' class='sendbutton' ng-click='sendMessage(text,2);'  >
    
     </td>
     </tr>
     </table>
<%--   <div class="row">
    <div class="col-xs-11">
    <input class="textarea" type="text" placeholder="Γράψτε εδω!" ng-model='text'/><!-- <div class="emojis">  </div> -->
    </div>
    <div class="col-xs-1"><img ng-src='${resources_start}/generalimages/sendmessage.ico' class='sendbutton' ng-click='sendMessage(text,2);' >
    </div>
    </div> --%>
    </div>
    
   
  



</div>
</div>

<audio id="myAudio">
  <source src="${resources_start}/sounds/intuition.mp3" type="audio/mpeg">
</audio>
