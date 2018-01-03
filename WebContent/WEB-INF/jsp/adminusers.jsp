 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

<div class='font_size_small'>
 <div class='search-field'>
 <input ng-model='mysearch' type="text" class="form-control" placeholder="Αναζητηστε χρήστη εδώ...">
<i class="fa fa-search"></i></div>
<div class='div_edit_team'>

	<div class='table_stylish1'>
		<table>
			<tr>
				<th>ΟΝΟΜΑ</th>
				<th>ΟΝΟΜΑ ΧΡΗΣΤΗ</th>
				<th>ΚΩΔΙΚΟΣ</th>
				<th>ΟΜΑΔΑ</th>
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			
			<tr >
				<td><input type="text" ng-model="newrow.name" placeholder="Το νεο ονομα χρήστη εδω.."></td>
				<td><input type="text" ng-model="newrow.username"  placeholder="Το νέο όνομα χρήστη εδ΄ώ.."></td>
				<td><input type="text" ng-model="newrow.password"  placeholder="Ο νέος κωδικός εδ΄ώ.."></td>
				
				<td><select ng-model="selectedTeam" ng-change="getTeam()" ng-options="row.name for row in teams | orderBy:'name'">
				<option value="">---Επιλέξτε---</option>
				</select></td>
				<td><button class='button_flat background_green float_right' ng-click="addUser(newrow,selectedTeam)">Προσθήκη</button> 
			</td>
			</tr>
			<tr ng-repeat="row in users | filter:mysearch" ng-show=row.adminteam>
				<td><input type="text" ng-model="row.name"></td>
				<td><input type="text" ng-model="row.username"></td>
				<td><input type="text" ng-model="row.password"></td>
				
				<td>{{row.adminteam.name}}</td>
				<td><button class='button_flat background_dark_yellow float_right' ng-click="editUser(row)">Αποθήκευση</button> 
			<button class='button_flat background_red float_right'  ng-click="deleteUser(row)">Διαγραφή</button></td>
			</tr>
			
			
			
		</table>
	</div>
</div>
</div>

