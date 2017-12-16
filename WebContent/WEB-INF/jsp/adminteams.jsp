 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

<div class='font_size_small'>


<div class='div_edit_team'>

	<ul class='ul_nobullet'>
		<li> <input type='text' ng-model='newteam.name' placeholder='Το ονομα της ομαδας εδω'/>	</li>
		<li> <textarea rows="4" cols="50" ng-model='newteam.description' maxlength="1000" class="width_100">	</textarea> </li>
		<li> <button class='button_flat background_green float_right' ng-click="addTeam()">Προσθηκη</button> </li>
	</ul>

</div>
<div class='div_edit_team'>



<h1>ΟΜΑΔΕΣ</h1>
<select ng-model="selectedTeam" ng-change="getTeam()" ng-options="row.name for row in teams | orderBy:'name'">
</select>
<div ng-show="team">
	<ul class='ul_nobullet'>
		<li> <input type='text' ng-model='team.name' placeholder='Το ονομα της ομαδας εδω'/>	</li>
		<li><textarea rows="4" cols="50" ng-model='team.description' maxlength="1000" class="width_100"></textarea>  </li>
		
		<li> <button class='button_flat background_dark_yellow float_right' ng-click="editTeam()">Αποθήκευση</button> 
		<button class='button_flat background_red float_right'  ng-click="deleteTeam()">Διαγραφή</button></li>
		

		
		

<!-- 
		
		 			<input ng-model='team.name'/>
		
		
		<button ng-click="editTeam()">Αποθήκευση αλλαγών</button>
		<button ng-click="deleteTeam()">Διαγραφή Ομάδας</button>
		 -->
			</ul>
	<div class='table_stylish1'>
		<table>
			<tr>
				<th>EIKONA</th>
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			<tr>
				<td><img width=60 height=60 ng-show='team.logopath' ng-src='${resources}{{team.logopath}}'/> </td>
				<td><input type = "file" file-model = "mylogo" class='button_flat background_dark_yellow'/>
	         <button class='button_flat background_dark_yellow' ng-click = "uploadLogo()">Αλλαγή Logo</button></td>
			</tr>
			<tr>
				<td><img width=60 height=60 ng-show='team.coverpath' ng-src='${resources}{{team.coverpath}}'/></td>
	
				<td>		 <input type = "file" file-model = "mycover" class='button_flat background_dark_yellow'/>
	         <button class='button_flat background_dark_yellow' ng-click = "uploadCover()">Αλλαγή Cover</button>
	         </td>
			</tr>
		</table>
	</div>

	<div class="div_team_edit_images">
	
			<img width=100 height=100 ng-show='team.logopath' ng-src='${resources}{{team.logopath}}'/> 
			<input type = "file" file-model = "mylogo"/>
	         <button ng-click = "uploadLogo()">Αλλαγή Logo</button>
			
			<img width=200 height=200 ng-show='team.coverpath' ng-src='${resources}{{team.coverpath}}'/>
			 <input type = "file" file-model = "mycover"/>
	         <button ng-click = "uploadCover()">Αλλαγή Cover</button>
	
	</div>
</div>

<!-- 
           <input type = "file" file-model = "mylogo"/>
         <button ng-click = "uploadLogo()">Αλλαγή Logo</button>
         <br>
        <input type = "file" file-model = "mycover"/>
         <button ng-click = "uploadCover()">Αλλαγή Cover</button> -->
</div>
        <br>
        <table>
        <tr ng-repeat = 'row in players'>
        <td><img width=50 height=50 ng-show='row.imagepath' ng-src='${resources}{{row.imagepath}}'/>
             <input type = "file" file-model = "row.playerimage"/>
         <button ng-click = "uploadPlayerImage(row)">Αλλαγή εικόνας παίχτη</button>
        </td>
        <td> <input ng-model='row.name'/>	</td>
        <td> <input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ng-model='row.number'/>	</td>
        
            <td><select  ng-model="row.soccerposition">
		      <option value="">---Επιλέξτε---</option> <!-- not selected / blank option -->
		      <option value="Defender">Αμυντικός</option> <!-- interpolation -->
		      <option value="Goalkeeper">Τερματοφύλακας</option>
		    </select>
   		 </td>
        
        <td> <button ng-click = "editPlayer(row)">Αποθήκευση αλλαγών παίχτη</button>
         <button ng-click = "deletePlayer(row)">Διαγραφή παίχτη</button>
        </td>
         
        </tr>
        
        <tr>
        <td></td>
        <td> <input ng-model='newplayer.name'/>	</td>
        <td> <input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ng-model='newplayer.number'/>	</td>
        
            <td><select  ng-model="newplayer.soccerposition">
		      <option value="">---Επιλέξτε---</option> <!-- not selected / blank option -->
		      <option value="Defender">Αμυντικός</option> <!-- interpolation -->
		      <option value="Goalkeeper">Τερματοφύλακας</option>
		    </select>
   		 </td>
        
        <td> <button ng-click = "addPlayer()">Αποθήκευση νέου παίχτη</button>
        
        </td>
         
        </tr>
        
        </table>
         </div>
<!--    <form method="POST" ng-submit="teams/{{team.id}}/images" enctype="multipart/form-data">
    <table>
        <tr>
            <td><label path="file">Select a file to upload</label></td>
            <td><input type="file" name="file" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Submit" /></td>
        </tr>
    </table>
</form> -->

<!-- {{result}} -->