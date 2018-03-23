 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:url value="/resources/theme1" var="resources" />
<spring:url value="/resources_static/theme1" var="resources_static" />

<spring:url value="/resources/" var="resources0" />
	<%-- <link rel="stylesheet" type="text/css" href="${resources0}admin.css">    --%>


<div class="page-heading-breadcrumbs">
<div class="container">
<h2>ΟΜΑΔΕΣ</h2>

<ul class="breadcrumbs">
<li><a href="">ΑΡΧΙΚΗ</a></li>
<li>ΟΜΑΔΕΣ</li>
</ul>
</div>
</div>

<main class="main-content" ng-init="teamid = '${teamid}'">
<div style="margin:auto; max-width:800px; width:100%; position:relative" class='theme-padding'>
<button style='' class="btn black-btn" ng-hide='showNewTeamForm' ng-click="showNewTeamForm=true">ΕΠΕΞΕΡΓΑΣΙΑ ΟΜΑΔΑΣ</button> 
	<div ng-show='showNewTeamForm'>
	<h2>ΕΠΕΞΕΡΓΑΣΙΑ ΟΜΑΔΑΣ</h2>
	Logo Ομάδας:
		<div style='margin-bottom:20px' class="">
		
		<img width=200 height=200 ng-show='team.logopath' ng-src='${resources_static}{{team.logopath}}'/>
		
		<input type = "file" file-model = "mylogo" accept="image/*"/><br/>
	    <button class="btn black-btn " ng-click = "uploadLogo()">Upload Logo</button>
	    </div>
	    <br/>
	    Cover Ομάδας:
	    <div style='margin-bottom:20px' class="">
		
		<img width=300 height=200 ng-show='team.coverpath' ng-src='${resources_static}{{team.coverpath}}'/>
		
		<input type = "file" file-model = "mylogo" accept="image/*"/><br/>
	    <button class="btn black-btn " ng-click = "uploadCover()">Upload Cover</button>
	    </div>
	    
	<div class="">
	
	<form id="contact-form" class="contact-form ">
		Τίτλος ομάδας:
	<div class="form-group">
	<input  ng-readonly="true"  style='color:black;border:1px solid #D0D0D0; ' type="text" class="form-control" ng-model='team.name' required="required" placeholder="Το όνομα της ομάδας εδω..">
	<i class="fa fa-user"></i>
	</div>
	Περιγραφή ομάδας:
	<div class="form-group">
	
	<textarea style='color:black; border:1px solid #D0D0D0' ng-model='team.description' maxlength="1000"  class="form-control style-d" rows="6" id="comment" placeholder="Η περιγραφη της ομαδας εδω.."></textarea>
	<i class="fa fa-pencil-square-o"></i>
	</div>
	<div >
	<button style='' class="btn black-btn" ng-click="editTeam()">ΑΠΟΘΗΚΕΥΣΗ</button> <!-- 
			<button style='' class="btn red-btn"  ng-click="deleteTeam()">Διαγραφή</button> -->
			</div>
	</form>
	</div>
</div>

</div>

<div ng-hide='team.locked'  style="margin:auto; max-width:800px; width:100%; position:relative">
		<button style='' class="btn black-btn" ng-hide='showNewForm' ng-click="showNewForm=true">ΕΙΣΑΓΩΓΗ ΝΕΟΥ ΠΑΙΧΤΗ</button> 
		<div ng-show='showNewForm'>
			<h2>ΕΙΣΑΓΩΓΗ ΝΕΟΥ ΠΑΙΧΤΗ</h2>
	
						
			<div class="">
			
			<form id="contact-form" class="contact-form ">
			'Ονομα παίχτη:
			<div class="form-group">
			<input style='color:black; border:1px solid #D0D0D0; ' type="text" class="form-control" ng-model='newplayer.name' required="required" placeholder='Το όνομα παίχτη εδω..'>
			<i class="fa fa-user"></i>
			</div>
			Αριθμός παίχτη:
			<div class="form-group">
			<input style='color:black; border:1px solid #D0D0D0; ' type="text" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ng-model='newplayer.number'  placeholder="Ο αριθμός παιχτη εδω.. (1-100)">
			<i class="fa fa-user"></i>
			</div>
			θέση παίχτη:
			<div class="form-group">
				<select  ng-model="newplayer.soccerposition">
		      <option value="">---Επιλέξτε θέση παίχτη---</option> <!-- not selected / blank option -->
		      <option value="Αμυντικος">Αμυντικός</option> <!-- interpolation -->
		      <option value="Μεσος">Μέσος</option>
		      <option value="Επιθετικος">Επιθετικός</option>
		      <option value="Τερματοφυλακας">Τερματοφύλακας</option>
		    </select>		
			</div>
			
			<button style='' class="btn black-btn" ng-click="addPlayer()">ΕΙΣΑΓΩΓΗ</button> 
			</form>
			</div>
		</div>
</div>




<div style="margin:auto; max-width:800px; width:100%; position:relative" class='theme-padding'>

	<h2>ΕΠΕΞΕΡΓΑΣΙΑ ΠΑΙΧΤΩΝ</h2>
	
	  <select style='margin-bottom:20px'ng-model="selectedPlayer" ng-change="" ng-options="row.name for row in players | orderBy:'name'">
		<option value="">---Επιλέξτε---</option>
		</select>
		
		<div class="" ng-show='selectedPlayer' style='margin-bottom:20px'>
		Εικόνα Παίχτη:<br/>
			<img width=150 height=150  ng-src='${resources_static}{{selectedPlayer.imagepath}}'/>
			
			<input type = "file" file-model = "selectedPlayer.playerimage" accept="image/*"/>
		    <button class="btn black-btn " ng-click = "uploadPlayerImage(selectedPlayer)">Upload</button>
	    </div>
			
	 
						
			<div class="" ng-show='selectedPlayer'>
			
			<form id="contact-form" class="contact-form ">
			'Ονομα παίχτη:
			<div class="form-group">
			<input ng-readonly="team.locked" style='color:black; border:1px solid #D0D0D0; ' type="text" class="form-control" ng-model='selectedPlayer.name' required="required" placeholder='Το νέο όνομα παίχτη εδω..'>
			<i class="fa fa-user"></i>
			</div>
			Αριθμός παίχτη:
			<div class="form-group">
			<input style='color:black; border:1px solid #D0D0D0; ' type="text" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ng-model='selectedPlayer.number'  placeholder="Ο αριθμός παιχτη εδω.. (1-100)">
			<i class="fa fa-user"></i>
			</div>
			θέση παίχτη:
			<div class="form-group">
				<select  ng-model="selectedPlayer.soccerposition">
		      <option value="">---Επιλέξτε θέση παίχτη---</option> <!-- not selected / blank option -->
		      <option value="Αμυντικος">Αμυντικός</option> <!-- interpolation -->
		      <option value="Μεσος">Μέσος</option>
		      <option value="Επιθετικος">Επιθετικός</option>
		      <option value="Τερματοφυλακας">Τερματοφύλακας</option>
		    </select>		
			</div>
			
			<button style='' class="btn black-btn" ng-click="editPlayer(selectedPlayer)">ΑΠΟΘΗΚΕΥΣΗ</button> 
					<button ng-hide='team.locked'  style='' class="btn red-btn"  ng-click="deletePlayer(selectedPlayer)">Διαγραφη</button>
			</form>
			</div>

</div>





</main>
