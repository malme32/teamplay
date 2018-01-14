 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />
<spring:url value="/resources" var="resources_start" />

<link href='${resources_start}/chat.css' rel='stylesheet' />

<div class="wrap push">



<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΜΗΝΥΜΑΤΑ</h2>
<ul class="breadcrumbs">
<li><a href="">ΑΡΧΙΚΗ</a></li>
<li>ΜΗΝΥΜΑΤΑ</li>
</ul>
</div>
</div>





<main class="main-content">

<div class="menu">
            <div class="back"><i class="fa fa-chevron-left"></i> <img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
            <div class="name">Alex</div>
            <div class="last">18:09</div>
        </div>
    <ol class="chat">
     <li ng-repeat="message in messages | orderBy: 'date'" ng-class="getSender(message)">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
				<p>{{message.message}}</p>
        <time>{{message.date | timeago}}</time>
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
    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
        <p>Qué contexto de Góngora? <emoji class="suffocated"/></p>
        <time>20:18</time>
      </div>
    </li>
    <li class="self">
        <div class="avatar"><img src="https://i.imgur.com/HYcn9xO.png" draggable="false"/></div>
      <div class="msg">
        <p>El que mandó Marialu</p>
        <p>Es para mañana...</p>
        <time>20:18</time>
      </div>
    </li>
    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
        <p><emoji class="scream"/></p>
        <p>Pásamelo! <emoji class="please"/></p>
        <time>20:18</time>
      </div>
    </li>
    <li class="self">
        <div class="avatar"><img src="https://i.imgur.com/HYcn9xO.png" draggable="false"/></div>
      <div class="msg">
        <img src="https://i.imgur.com/QAROObc.jpg" draggable="false"/>
        <time>20:19</time>
      </div>
    </li>
    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
        <p>Gracias! <emoji class="hearth_blue"/></p>
        <time>20:20</time>
      </div>
    </li>
        <div class="day">Hoy</div>
    <li class="self">
        <div class="avatar"><img src="https://i.imgur.com/HYcn9xO.png" draggable="false"/></div>
      <div class="msg">
        <p>Te apetece jugar a Minecraft?</p>
        <time>18:03</time>
      </div>
    </li>
    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
        <p>Venga va, hace ya mucho que no juego...</p>
        <time>18:07</time>
      </div>
    </li>
    <li class="self">
        <div class="avatar"><img src="https://i.imgur.com/HYcn9xO.png" draggable="false"/></div>
      <div class="msg">
        <p>Ehh, me crashea el Launcher... <emoji class="cryalot"/></p>
        <time>18:08</time>
      </div>
    </li>
    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
        <p><emoji class="lmao"/></p>
        <time>18:08</time>
      </div>
    </li>
    <li class="self">
        <div class="avatar"><img src="https://i.imgur.com/HYcn9xO.png" draggable="false"/></div>
      <div class="msg">
        <p>Es broma</p>
        <p>Ataque Moai!</p>
        <p><span><emoji class="moai"/></span><span><emoji class="moai"/></span><span><emoji class="moai"/></span><span><emoji class="moai"/></span><span><emoji class="moai"/></span><span><emoji class="moai"/></span></p>
        <time>18:09</time>
      </div>
    </li>
    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
          <p>Copón</p>
        <p><emoji class="funny"/></p>
        <time>18:08</time>
      </div>
    </li>
    <li class="self">
        <div class="avatar"><img src="https://i.imgur.com/HYcn9xO.png" draggable="false"/></div>
      <div class="msg">
        <p>Hey there's a new update about this chat UI with more responsive elements! Check it now:</p>
        <p><a href="https://codepen.io/Varo/pen/YPmwpQ" target="parent">Chat UI 2.0</a></p>
        <time>18:09</time>
      </div>
    </li> -->
    </ol>
    <input class="textarea" type="text" placeholder="Type here!" ng-model='text'/><div class="emojis"></div>
    <button ng-click='sendMessage(text,2)'>send</button>

</main>



</div>


