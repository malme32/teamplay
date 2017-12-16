
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

<div class='font_size_small'>


<h1>ΠΡΩΤΑΘΛΗΜΑΤΑ</h1>
<!-- <div>
	<ul>
		<li ng-repeat='row in championlist'>
		 <input ng-model='row.name' ng-click='getTeamgroup(row); ' />
			<button ng-show='champion==row' data-toggle="modal"
				data-target="#deleteChampionModal">Delete</button>
			<button ng-show='champion==row' ng-click='adminEditChampion(row)'
				data-target="#editChampionModal">Save</button>
		</li>
		<li><input ng-model="adminChampionName"
			placeholder="Insert the champion name here" />
			<button ng-click='adminAddChampion()'>Add</button></li>
	</ul>
</div>

 -->
<div class='table_stylish1'>
	<table>
		<tr>
			<th>ΟΝΟΜΑ</th>
			<th>ΕΝΕΡΓΕΙΑ</th>
		</tr>
		<tr ng-repeat='row in championlist'>
			<td><input type='text' ng-model='row.name'
				ng-click='getTeamgroup(row); ' /></td>
			<td>
				<button class='button_flat  background_dark_yellow'
					ng-show='champion==row' ng-click='adminEditChampion(row)'>Αποθήκευση</button>
				<button class='button_flat background_red' ng-show='champion==row'
					ng-click='adminDeleteChampion(champion.id)'>Διαγραφή</button>
			</td>
		</tr>
		<tr>
			<td><input type='text' ng-model="adminChampionName"
				placeholder="Το νέο όνομα εδω.." /></td>
			<td>
				<button class='button_flat background_green'
					ng-click='adminAddChampion()'>Εισαγωγή</button>

			</td>
		</tr>

	</table>
</div>
<div ng-show='teamgrouplist'>


	<h1>
		ΟΜΙΛΟΙ <span class="color_gray font_size_small">(σε
			{{champion.name}})</span>
	</h1>
	<div class='table_stylish1'>
		<table>
			<tr>
				<th>ΟΝΟΜΑ</th>
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			<tr ng-repeat='row in teamgrouplist'>
				<td><input type='text' ng-model='row.name'
					ng-click='getMatchdays(row); getTeams(row)' /></td>
				<td>
					<button class='button_flat  background_red'
						ng-show='teamgroup==row' ng-click='adminDeleteTeamgroup(row)'>Διαγραφή</button>
					<button class='button_flat  background_dark_yellow'
						ng-show='teamgroup==row' ng-click='adminEditTeamgroup(row)'>Αποθήκευση</button>
					<button class='button_flat  background_black'
						ng-show='teamgroup==row' ng-click='generateMatchdays(row,1)'>Αγωνιστικές</button>
					<button class='button_flat  background_black'
						ng-show='teamgroup==row' ng-click='generateMatchdays(row,2)'>Αγωνιστικές
						(δύο γύροι) Matchdays(double round)</button>
				</td>
			</tr>
			<tr>
				<td><input type='text' ng-model="adminTeamgroupName"
					placeholder="Το νέο όνομα εδω.." /></td>
				<td>
					<button class='button_flat background_green'
						ng-click='adminAddTeamgroup(champion)'>Εισαγωγή</button>

				</td>
			</tr>

		</table>
	</div>



	<!-- <div>
	<ul>
		<li ng-repeat='row in teamgrouplist'>
	<input ng-model='row.name'
			ng-click='getMatchdays(row); getTeams(row)' />
			<button ng-show='teamgroup==row' ng-click='adminDeleteTeamgroup(row)'>Delete</button>

			<button ng-show='teamgroup==row' ng-click='adminEditTeamgroup(row)'>Save</button>
			<button ng-show='teamgroup==row' ng-click='generateMatchdays(row,1)'>Generate
				Matchdays</button>
			<button ng-show='teamgroup==row' ng-click='generateMatchdays(row,2)'>Generate
				Matchdays(double round)</button>

		</li>
		<li><input ng-model="adminTeamgroupName"
			placeholder="Insert the champion name here" />
			<button ng-click='adminAddTeamgroup(champion)'>Add</button></li>
	</ul>
</div> -->
</div>


<div ng-show='teamgroup'>
	<h1>
		ΟΜΑΔΕΣ <span class="color_gray font_size_small">(σε
			{{champion.name}}/{{teamgroup.name}})</span>
	</h1>
	<div class='table_stylish1'>
		<table>
			<tr>
				<th>ΟΝΟΜΑ</th>
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			<tr ng-repeat='row in standings'>
				<td><input type='text' ng-model='row.team.name'
					ng-click='standing_sel=row' /></td>
				<td>
					<button class='button_flat background_red'
						ng-click='adminDeleteStanding(row)'>Διαγραφή</button>
				</td>
			</tr>
			<tr>
				<td><select ng-model="selectedTeam"
					ng-options="row.name for row in totalTeamList | orderBy:'name'">
				</select>
				<td>
					<button class='button_flat background_green'
						ng-click='adminAddTeamToTeamgroup(teamgroup,selectedTeam)'>Εισαγωγή</button>

				</td>
			</tr>
			<tr>
				<td><input type='text' ng-model="adminNewTeamName"
					placeholder="Το νέο όνομα εδω.." /></td>
				<td>
					<button class='button_flat background_green'
						ng-click='adminAddNewTeamToTeamgroup(teamgroup,adminNewTeamName)'>Εισαγωγή</button>

				</td>
			</tr>
		</table>
	</div>
	<!-- 
	<div>
		<ul>
			<li ng-repeat='row in standings'>
			 <input ng-model='row.team.name' ng-click='standing_sel=row' />
				<button ng-show='standing_sel==row'
					ng-click='adminDeleteStanding(row)'>Remove</button> 
			</li>

			<li><select ng-model="selectedTeam"
				ng-options="row.name for row in totalTeamList">
			</select>

				<button ng-click='adminAddTeamToTeamgroup(teamgroup,selectedTeam)'>Add</button>
			</li>

			<li><input ng-model="adminNewTeamName"
				placeholder="Insert the new team name here" />
				<button
					ng-click='adminAddNewTeamToTeamgroup(teamgroup,adminNewTeamName)'>Add</button>
			</li>
		</ul>
	</div> -->
	<h1>
		ΑΓΩΝΙΣΤΗΚΕΣ <span class="color_gray font_size_small">(σε
			{{champion.name}}/{{teamgroup.name}})</span>
	</h1>
	
	
	<table class='table_stylish1 margin_bottom_medium' >
	<tr>
	<td>
	<input type='text' ng-model="adminNewMatchdayName"
		placeholder="Το νέο όνομα εδω" /></td>
	<td>
	<button class='button_flat  background_green' ng-click='adminAddMatchday(adminNewMatchdayName,teamgroup)'>Εισαγωγή</button>
	<button class='button_flat  background_red' ng-click='adminDeleteAllMatchdays(teamgroup)'>Διαγραφή όλων</button></td>
	</tr>
	</table>


	<div ng-repeat='row in matchday'>
		<div class='table_stylish1'>
			<table>
	<!-- 			<tr>
					<th>ΟΝΟΜΑ</th>
					<th>ΗΜΕΡ. ΑΡΧΗΣ</th>
					<th>ΗΜΕΡ. ΤΕΛΟΣ</th>
					<th>ΕΝΕΡΓΕΙΑ</th>
				</tr> -->
				<tr class='background_gray '>
					<td><input type='text' ng-model="row.name" /></td>
					<td><md-datepicker ng-model="row.startdate"
							md-placeholder="Η ημερομηνία αρχής εδω.."></md-datepicker></td>
					<td><md-datepicker ng-model="row.enddate"
							md-placeholder="Η ημερομηνία τέλους εδω.."></md-datepicker></td>
					<td>
						<button class='button_flat  background_dark_yellow'
							ng-click='adminUpdateMatchday(row,teamgroup)'>Αποθήκευση</button>
							<button class='button_flat  background_red' ng-click='adminDeleteMatchday(row)'>Διαγραφή</button>
					</td>
				</tr>

				<!-- 			<tr>
				<td><input type='text' ng-model="adminNewMatchdayName"
					placeholder="Το νέο όνομα εδω.." />
				<td></td>
				<td></td>
				<td>
					<button class='button_flat background_green'
						ng-click='adminAddMatchday(adminNewMatchdayName,teamgroup)'>Εισαγωγή</button>
				</td>
			</tr> -->
			</table>






		</div>




		<div class='table_stylish1'>
			<table>
				<tr>
					<th>ΑΓΩΝΑΣ</th>
					<th>ΗΜΕΡΟΜΗΝΙΑ</th>
					<th>ΩΡΑ</th>
					<th>ΕΝΕΡΓΕΙΑ</th>
					<th>ΑΛΛΑΓΗ</th>
					<th></th>
				</tr>
				<tr ng-repeat='row1 in row.games'>
					<td><span class="td_matchday_team1">{{row1.team1.name}}</span>
						<span class="td_score"><input type="number" min=0 max=100
							class="inputSmall" value={{row1.score1}} ng-model='row1.score1' />
							- <input type="number" min=0 max=100 value={{row1.score2}}
							class="inputSmall" ng-model='row1.score2' /></span> <span
						class="td_matchday_team2">{{row1.team2.name}}</span> <!-- 						<input type="text" class = "inputMedium" ng-model='row1.date|  date:"medium"'/> ng-model="row1.date"
 --></td>
					<td class="td_date_small"><md-datepicker
							ng-model="row1.tmpdate" md-placeholder="Enter date"></md-datepicker>
					</td>
					<td class="td_date_small"><input ng-model="row1.tmpdate"
						type="time" /></td>
					<td class=""><button
							class='button_flat  background_dark_yellow'
							ng-click='adminEditGame(row1,row)'>Αποθήκευση</button>
						<button class='button_flat  background_red'
							ng-click='adminDeleteGame(row1)'>Διαγραφή</button></td>
					<td><span><select ng-model="selectedmatchday"
							ng-options="row.name for row in matchday | orderBy:'name'">
						</select></span> 
					</td>
					<td><span><button class='button_flat  background_black'
								ng-click='addGameToMatchday(row1,selectedmatchday)'>Αλλαγή</button></span></td>

				</tr>

				<tr>

					<td>
					<select ng-model="selectedteam1"
							ng-options="row2.team.name for row2 in standings | orderBy:'name'" class='width_40'></select>

							-
							<select  ng-model="selectedteam2"
							ng-options="row2.team.name for row2 in standings | orderBy:'name'" class='width_40'></select>
					</span></td>
					<td></td>
					<td></td>
					<td><button class='button_flat background_green'
							ng-click='adminAddGame(selectedteam1.team,selectedteam2.team,row)'>Εισαγωγή</button></td>
					<td></td>
					<td></td>
				</tr>

			</table>






		</div>


	</div>


<!-- 
	<input ng-model="adminNewMatchdayName"
		placeholder="Insert the new matchday name here" />
	<button ng-click='adminAddMatchday(adminNewMatchdayName,teamgroup)'>Add
		New</button>
	<button ng-click='adminDeleteAllMatchdays(teamgroup)'>Delete
		All</button>

	<div class="div_matchday" ng-repeat='row in matchday'>

		<h4>
			<input ng-model="row.name"
				placeholder="Insert the matchday name here" />
			<md-datepicker ng-model="row.startdate"
				md-placeholder="Enter Start Date"></md-datepicker>
			<md-datepicker ng-model="row.enddate" md-placeholder="Enter End Date"></md-datepicker>
			<button ng-click='adminUpdateMatchday(row,teamgroup)'>Save</button>
		</h4>
		<button ng-click='adminDeleteMatchday(row)'>Delete</button>
		<table class="" ng-show=row.games.length>

			<tbody class="">
				<tr ng-repeat='row1 in row.games'>
					ng-click='visitContact(row.id)'
					<td class="td_matchday_team1">{{row1.team1.name}}</td>
					<td class="td_score"><input type="number" min=0 max=100
						class="inputSmall" value={{row1.score1}} ng-model='row1.score1' />
						- <input type="number" min=0 max=100 value={{row1.score2}}
						class="inputSmall" ng-model='row1.score2' /></td>
					<td class="td_matchday_team2">{{row1.team2.name}}</td>
											<input type="text" class = "inputMedium" ng-model='row1.date|  date:"medium"'/> ng-model="row1.date"

					<td class="td_date_small"><md-datepicker
							ng-model="row1.tmpdate" md-placeholder="Enter date"></md-datepicker>
						<input ng-model="row1.tmpdate" type="time" /></td>
					<td class=""><button ng-click='adminEditGame(row1,row)'>Save</button>
						<button ng-click='adminDeleteGame(row1)'>Delete</button></td>
					<td><select ng-model="selectedmatchday"
						ng-options="row.name for row in matchday">
					</select>
						<button ng-click='addGameToMatchday(row1,selectedmatchday)'>Move</button>
					</td>

				</tr>
			</tbody>
		</table>
		<table>
			<tr>
				<td><select ng-model="selectedteam1"
					ng-options="row2.team.name for row2 in standings"></td>
				<td><select ng-model="selectedteam2"
					ng-options="row2.team.name for row2 in standings"></td>
				<td><button
						ng-click='adminAddGame(selectedteam1.team,selectedteam2.team,row)'>Add
						Game</button></td>
			</tr>
		</table>
	</div>


</div>

</div> -->




<!-- Delete Modal -->
<!-- <div class="modal fade" id="deleteChampionModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Delete Champion</h4>
			</div>
			<p>
				Delete champion <b>{{champion.name}}</b>?
			</p>
			<button ng-click='adminDeleteChampion(champion.id)'>Delete</button>
			<p>{{modalResult}}</p>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> -->
<!-- {{result}}
 -->
<!-- {{result}} -->
<!-- 	<button ng-click="setPath()">Register a new event</button>
 -->