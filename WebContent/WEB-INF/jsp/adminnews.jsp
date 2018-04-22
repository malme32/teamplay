 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />
<spring:url value="/resources_static/theme1" var="resources_static" />

<img class='admin_loading' ng-show='loading' width=80 height=80 src="${resources}/images/loading.gif" alt="">

<div class='font_size_small'>

<div class='div_edit_team'>

<h1>ΝΕΑ ΕΙΔΗΣΗ</h1>
	<ul class='ul_nobullet'>
		<li> <input type='text' ng-model='newnotice.title' placeholder='Ο τίτλος της νεας είδησης εδω..'/>	</li>
		<li> <textarea rows="4" cols="50" ng-model='newnotice.content' maxlength="1000" class="width_100" placeholder='Το περιεχόμενο της νεας είδησης εδω..'>	</textarea> </li>
		<li> <button class='button_flat background_green float_right' ng-click="addNotice()">Προσθηκη</button> </li>
	</ul>

</div>
<div class='div_edit_team'>



<h1>ΕΙΔΗΣΕΙΣ</h1>
<select ng-model="selectedNotice" ng-change="getNotice()" ng-options="row.title for row in news | orderBy:'-date'">
<option value="">---Επιλέξτε---</option>
</select>
<div ng-show="notice" class='margin_left_small'>

       <h2>ΕΠΕΞΕΡΓΑΣΙΑ</h2>
	<ul class='ul_nobullet'>
		<li> <input type='text' ng-model='notice.title' placeholder='Ο τίτλος της είδησης εδω'/>	</li>
		<li><textarea rows="4" cols="50" ng-model='notice.content' maxlength="1000" class="width_100" placeholder='Το περιεχόμενο της είδησης εδω..'></textarea>  </li>
		<li title='Εαν είναι επιλεγμένο τότε αυτή η είδηση θα φένεται στην αρχική σελίδα'>		 
		 <input  type="checkbox" ng-model='notice.important'/> Σημαντική είδηση	</li>
		
		<li> <button class='button_flat background_dark_yellow float_right' ng-click="editNotice()">Αποθήκευση</button> 
		<button class='button_flat background_red float_right'  ng-click="deleteNotice()">Διαγραφή</button></li>
		

		
		

<!-- 
		
		 			<input ng-model='team.name'/>
		
		
		<button ng-click="editTeam()">Αποθήκευση αλλαγών</button>
		<button ng-click="deleteTeam()">Διαγραφή Ομάδας</button>
		 -->
			</ul>
       <h3>ΕΙΚΟΝΕΣ</h3>
	<div class='table_stylish1'>
		<table>
			<tr>
				<th>EIKONA</th>
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			<tr>
				<td><img width=60 height=60 ng-show='notice.imageurl' ng-src='${resources_static}{{notice.thumburl}}'/> </td>
				<td><input type = "file" file-model = "mylogo" class='button_flat background_dark_yellow' accept="image/*"/>
	         <button class='button_flat background_dark_yellow' ng-click = "uploadImage()">Αλλαγή ΕΙΚΟΝΑΣ</button></td>
			</tr>

		</table>
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