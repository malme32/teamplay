 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

<div class='font_size_small'>

<div class='div_edit_team'>

<h1>ΝΕΑ ΟΜΑΔΑ</h1>
	<ul class='ul_nobullet'>
		<li> <input type='text' ng-model='newteam.name' placeholder='Το ονομα της ομαδας εδω'/>	</li>
		<li> <textarea rows="4" cols="50" ng-model='newteam.description' maxlength="1000" class="width_100" placeholder='Η περιγραφή της ομάδας εδω..'>	</textarea> </li>
		<li> <button class='button_flat background_green float_right' ng-click="addTeam()">Προσθηκη</button> </li>
	</ul>

</div>
<div class='div_edit_team'>



<h1>ΟΜΑΔΕΣ</h1>
<select ng-model="selectedTeam" ng-change="getTeam()" ng-options="row.name for row in teams | orderBy:'name'">
<option value="">---Επιλέξτε---</option>
</select>
<div ng-show="team" class='margin_left_small'>

       <h2>ΕΠΕΞΕΡΓΑΣΙΑ</h2>
	<ul class='ul_nobullet'>
		<li> <input type='text' ng-model='team.name' placeholder='Το ονομα της ομαδας εδω'/>	</li>
		<li><textarea rows="4" cols="50" ng-model='team.description' maxlength="1000" class="width_100" placeholder='Η περιγραφή της ομάδας εδω..'></textarea>  </li>
		
		<li> <button class='button_flat background_dark_yellow float_right' ng-click="editTeam()">Αποθήκευση</button> 
		<button class='button_flat background_red float_right'  ng-click="deleteTeam()">Διαγραφή</button></li>
		

		
		

<!-- 
		
		 			<input ng-model='team.name'/>
		
		
		<button ng-click="editTeam()">Αποθήκευση αλλαγών</button>
		<button ng-click="deleteTeam()">Διαγραφή Ομάδας</button>
		 -->
			</ul>
       <h3>ΕΙΚΟΝΕΣ (Logo/Cover)</h3>
	<div class='table_stylish1'>
		<table>
			<tr>
				<th>EIKONA</th>
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			<tr>
				<td><img width=60 height=60 ng-show='team.logopath' ng-src='${resources}{{team.logopath}}'/> </td>
				<td><input type = "file" file-model = "mylogo" class='button_flat background_dark_yellow' accept="image/*"/>
	         <button class='button_flat background_dark_yellow' ng-click = "uploadLogo()">Αλλαγή Logo</button></td>
			</tr>
<%-- 			<tr>
				<td><img width=60 height=60 ng-show='team.coverpath' ng-src='${resources}{{team.coverpath}}'/></td>
	
				<td>		 <input type = "file" file-model = "mycover" class='button_flat background_dark_yellow' accept="image/*"/>
	         <button class='button_flat background_dark_yellow' ng-click = "uploadCover()">Αλλαγή Cover</button>
	         </td>
			</tr> --%>
		</table>
	</div>

<%-- 	<div class="div_team_edit_images">
	
			<img width=100 height=100 ng-show='team.logopath' ng-src='${resources}{{team.logopath}}'/> 
			<input type = "file" file-model = "mylogo"/>
	         <button ng-click = "uploadLogo()">Αλλαγή Logo</button>
			
			<img width=200 height=200 ng-show='team.coverpath' ng-src='${resources}{{team.coverpath}}'/>
			 <input type = "file" file-model = "mycover"/>
	         <button ng-click = "uploadCover()">Αλλαγή Cover</button>
	
	</div> --%>


<!-- 
           <input type = "file" file-model = "mylogo"/>
         <button ng-click = "uploadLogo()">Αλλαγή Logo</button>
         <br>
        <input type = "file" file-model = "mycover"/>
         <button ng-click = "uploadCover()">Αλλαγή Cover</button> -->

       <h3>ΠΑΙΧΤΕΣ</h3>
       <div class='table_stylish1 width_100'>
        <table >
			<tr>
				<th>ΟΝΟΜΑ</th>
				<th>ΑΡΙΘΜΟΣ</th>
				<th>ΘΕΣΗ</th>
				<th>ΕΝΕΡΓΕΙΑ</th>
				<th>ΕΙΚΟΝΑ</th>
				<th>ΑΛΛΑΓΗ ΕΙΚΟΝΑΣ</th>
				<th></th>
			</tr>
        <tr ng-repeat = 'row in players'>
        <td> <input type='text' ng-model='row.name' placeholder='Το όνομα παίχτη εδω..'/>	</td>
        <td class='width_very_small'> <input  type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ng-model='row.number'/>	</td>
        

          <td><select  ng-model="row.soccerposition">
		      <option value="">---Επιλέξτε---</option> <!-- not selected / blank option -->
		      <option value="Defender">Αμυντικός</option> <!-- interpolation -->
		      <option value="Goalkeeper">Τερματοφύλακας</option>
		    </select>
   		 </td>
                <td> <button class='button_flat background_dark_yellow' ng-click = "editPlayer(row)">Αποθήκευση</button>
         <button class='button_flat background_red' ng-click = "deletePlayer(row)">Διαγραφή</button>
        </td>
         
        <td><img width=50 height=50 ng-show='row.imagepath' ng-src='${resources}{{row.imagepath}}'/> </td>
            <td> <input class='button_flat background_dark_yellow' type = "file" file-model = "row.playerimage" accept="image/*"/>
      
        </td>
              <td> 
         <button class='button_flat background_dark_yellow' ng-click = "uploadPlayerImage(row)">Αλλαγή εικόνας</button>
        </td>
        

        </tr>
        
        <tr>
        
        <td> <input type="text" ng-model='newplayer.name' placeholder='Το νέο όνομα παίχτη εδω..'/>	</td>
        <td class='width_very_small'> <input  type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ng-model='newplayer.number'/>	</td>
        
            <td><select  ng-model="newplayer.soccerposition">
		      <option value="">---Επιλέξτε---</option> <!-- not selected / blank option -->
		      <option value="Defender">Αμυντικός</option> <!-- interpolation -->
		      <option value="Goalkeeper">Τερματοφύλακας</option>
		    </select>
   		 </td>
        
        <td> <button class='button_flat background_green' ng-click = "addPlayer()">Εισαγωγή</button>
        
        </td>
         <td></td>
         <td></td>
   
        </tr>
        
        </table>
        </div>
         </div>
         </div>
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