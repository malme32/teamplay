 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />
<spring:url value="/resources_static/theme1" var="resources_static" />

<div class='font_size_small'>

<div class='div_edit_team'>

<h1>ΝΕΑ ΣΕΛΙΔΑ</h1>
	<ul class='ul_nobullet'>
		<li> <input type='text' ng-model='newcustompage.title' placeholder='Ο τίτλος της νεας σελίδας εδω..'/>	</li>
		<li> <textarea rows="4" cols="50" ng-model='newcustompage.content' maxlength="1000" class="width_100" placeholder='Το περιεχόμενο της νεας σελίδας εδω..'>	</textarea> </li>
		<li> <button class='button_flat background_green float_right' ng-click="addCustompage()">Προσθηκη</button> </li>
	</ul>

</div>
<div class='div_edit_team'>



<h1>ΕΠΕΞΕΡΓΑΣΙΑ ΣΕΛΙΔΩΝ</h1>
<select ng-model="selectedCustompage" ng-change="getCustompage(selectedCustompage)" ng-options="row.title for row in news | orderBy:'-date'">
<option value="">---Επιλέξτε---</option>
</select>
<div ng-show="custompage" class='margin_left_small'>

       <h2>ΕΠΕΞΕΡΓΑΣΙΑ</h2>
	<ul class='ul_nobullet'>
		<li> <input type='text' ng-model='custompage.title' placeholder='Ο τίτλος της σελίδας εδω'/>	</li>
		<li><textarea rows="4" cols="200" ng-model='custompage.content' maxlength="6000" class="width_100" placeholder='Το περιεχόμενο της είδησης εδω..'></textarea>  </li>
		
		<li> <button class='button_flat background_dark_yellow float_right' ng-click="editCustompage()">Αποθήκευση</button> 
		<button class='button_flat background_red float_right'  ng-click="deleteCustompage()">Διαγραφή</button></li>
		

		
		

<!-- 
		
		 			<input ng-model='team.name'/>
		
		
		<button ng-click="editTeam()">Αποθήκευση αλλαγών</button>
		<button ng-click="deleteTeam()">Διαγραφή Ομάδας</button>
		 -->
			</ul>
			<br/><br/>
			   <h2>ΕΠΕΞΕΡΓΑΣΙΑ ΕΙΚΟΝΩΝ</h2>
			{{waiting}}
<div class='admin_album table_stylish1'>

		<table>
				<tr>
				<th>EIKONΕΣ</th>
			<!-- 	<th>ΕΠΙΛΟΓΗ</th> -->
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			<tr>
				<!-- <td><input type = "file" ng-file-model = "newimages" multiple accept="image/*"/></td> -->
				<td>
				        <input type="file" id="file1" name="file" multiple
            				ng-files="getTheFiles($files)" multiple accept="image/*"/>

<!--        				 <input type="button" ng-click="uploadFiles(album)" value="Upload" />
 -->				</td>
				
	        <td> <button class='button_flat background_dark_yellow'  ng-click="uploadFiles(custompage)">Upload</button></td>
			</tr>

		</table>
		    <p ng-repeat="file in newimages">
      {{file.name}}
    </p>
    
    {{result}}
 <span ng-repeat='image in custompage.images'  > <img ng-click='deleteImage(image)' ng-src="${resources_static}{{image.thumburl}}"></span>

</div>
</div>
</div>
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


<!-- {{result}} -->




