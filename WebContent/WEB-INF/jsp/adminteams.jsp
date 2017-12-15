 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />


<input ng-model='newteam.name' placeholder='Το ονομα της ομαδας εδω'/>	


<textarea rows="4" cols="50" ng-model='newteam.description' maxlength="1000">
</textarea> 
<button ng-click="addTeam()">Προσθηκη Ομάδας</button>

<h1>ΟΜΑΔΕΣ</h1>
<select ng-model="selectedTeam" ng-change="getTeam()" ng-options="row.name for row in teams | orderBy:'name'">
</select>



<div ng-show="team">
<img width=100 height=100 ng-show='team.logopath' ng-src='${resources}{{team.logopath}}'/>
 			<input ng-model='team.name'/>
<img width=200 height=200 ng-show='team.coverpath' ng-src='${resources}{{team.coverpath}}'/>
 
<textarea rows="4" cols="50" ng-model='team.description' maxlength="1000">
</textarea> 
<button ng-click="editTeam()">Αποθήκευση αλλαγών</button>
<button ng-click="deleteTeam()">Διαγραφή Ομάδας</button>

</div>


           <input type = "file" file-model = "mylogo"/>
         <button ng-click = "uploadLogo()">Αλλαγή Logo</button>
         <br>
        <input type = "file" file-model = "mycover"/>
         <button ng-click = "uploadCover()">Αλλαγή Cover</button>
         
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

{{result}}