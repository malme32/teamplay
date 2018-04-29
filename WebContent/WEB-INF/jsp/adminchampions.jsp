
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />
	<img class='admin_loading' ng-show='loading' width=80 height=80 src="${resources}/images/loading.gif" alt="">
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
			<th>ΟΡΑΤΟ</th>
			<th>ΕΝΕΡΓΕΙΑ</th>
		</tr>
		<tr  ng-repeat='row in championlist | orderBy:"-id"'>
			<td ng-click='getTeamgroup(row); getPlayoffs(row)' >
			<input style='cursor:pointer;' ng-class='champion==row?"selected_input":"unselected_input"'  type='text' ng-model='row.name'
				/></td>
			<td><input class='cursor_pointer' type=checkbox ng-model='row.enabled' ng-click='getTeamgroup(row); getPlayoffs(row)' /></td>
			<td>
			<!-- ng-show='champion==row' -->
				<button ng-show='champion==row' title = "Αποθήκευση αλλαγών" class='button_flat  background_dark_yellow'
					 ng-click='adminEditChampion(row)'>&#10004;</button>
				<button ng-show='champion==row' title = "Διαγραφή πρωταθλήματος" class='button_flat background_red' 
					ng-click='adminDeleteChampion(champion.id)'>&#10006;</button>
			</td>
		</tr>
		<tr>
			<td><input type='text' ng-model="adminChampionName"
				placeholder="Το όνομα του νέου πρωταθλήματος εδω.." /></td>
			
			<td><input type=checkbox ng-model='adminChampionEnabled'/></td>
				<td><button title = "Προσθήκη πρωταθλήματος" class='button_flat background_green'
					ng-click='adminAddChampion()'>Προσθήκη</button>

			</td>
		</tr>

	</table>
</div>

<div ng-show='champion' class="margin_left_small">

	<h2>
		Play Offs <span class="color_red font_size_small">
			(σε {{champion.name}})</span>
	</h2>
	
	
	<table class='table_stylish1 margin_bottom_medium' >
	<tr>
	<td>
						 	<select ng-model="selectedPhase" >
							<option value="">---Επιλέξτε Φάση---</option>
							<option value="32">Φαση των 32</option>
							<option value="16">Φαση των 16</option>
							<option value="8">Προημιτελικα</option>
							<option value="4">Ημιτελικα</option>
							<option value="2">Τελικος</option>
							</select>
							<select ng-model="selectedRound" >
							<option value="">---Επιλέξτε γύρους---</option>
							<option value="1">1 γύρος</option>
							<option value="2">2 γύροι</option>
							</select>
	</td>
	<td>		<button class='button_flat  background_black'
						 ng-click='generatePlayoffs(champion,selectedPhase,selectedRound)'>Δημιουργία Playoff</button>	</td>
	</tr>
	<tr>
	<td>
	<input type='text' ng-model="adminNewPlayoffName"
		placeholder="Το νέο όνομα playoff εδω" /></td>
	<td>
	<button class='button_flat  background_green' ng-click='adminAddPlayoff(adminNewPlayoffName,champion)'>Προσθήκη</button>
<!-- 	<button class='button_flat  background_red' ng-click='adminDeleteAllPlayoffs(champion)'>Διαγραφή όλων</button>
 -->	
			
						 
	
	</td>
	</tr>
	</table>


	<div ng-repeat='row5 in playoffs  | orderBy: "phase"'>
		<div class='table_stylish1'>
			<table>
	<!-- 			<tr>
					<th>ΟΝΟΜΑ</th>
					<th>ΗΜΕΡ. ΑΡΧΗΣ</th>
					<th>ΗΜΕΡ. ΤΕΛΟΣ</th>
					<th>ΕΝΕΡΓΕΙΑ</th>
				</tr> -->
				<tr class='background_gray '>
					<td><input type='text' ng-model="row5.name" /></td>
	<!-- 				<td><md-datepicker ng-model="row.startdate"
							md-placeholder="Η ημερομηνία αρχής εδω.."></md-datepicker></td>
					<td><md-datepicker ng-model="row.enddate"
							md-placeholder="Η ημερομηνία τέλους εδω.."></md-datepicker></td> -->
							<td><input type="number" ng-model='row5.phase'></td>
					<td>
					
											<button class='button_flat  background_dark_yellow'
							title = "Μετονομασία αγωνιστικής"  ng-click='adminUpdatePlayoff(row5,champion)'>&#10004;</button>
							<button title = "Διαγραφή αγωνιστικής" class='button_flat  background_red' ng-click='adminDeletePlayoff(row5)'>&#10006;</button>
					
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
			<!-- 		<th>ΑΛΛΑΓΗ</th>
					<th></th> -->
				</tr>
				<tr ng-repeat='row1 in row5.games'>
					<td>
					
					<div ><span class="">
			 	<select style='display:inline; width:40%' ng-show='edhidden' ng-model="row1.team1"
							ng-options="row7.name for row7 in totalTeamList | orderBy:'name'">
						
						</select> <button  ng-show='edhidden' ng-click='edhidden=false'>close</button>	</span></div>
			
				 
					<span title='Κάντε κλικ για να αντικαταστήσετε την ομάδα'  class="td_matchday_team1" ng-click='edhidden=true'>{{row1.team1.name}}</span> 
					
					
					<!-- <span class="td_matchday_team1">{{row1.team1.name}}</span> -->
						<span class="td_score"><input type="number" min=0 max=100
							class="inputSmall" value={{row1.score1}} ng-model='row1.score1' />
							- <input type="number" min=0 max=100 value={{row1.score2}}
							class="inputSmall" ng-model='row1.score2' /></span>
							
						<span title='Κάντε κλικ για να αντικαταστήσετε την ομάδα'  class="td_matchday_team2" ng-click='edhidden2=true'>{{row1.team2.name}}</span> 
						
							<div ><span class="">
			 	<select style='display:inline; width:40%' ng-show='edhidden2' ng-model="row1.team2"
							ng-options="row7.name for row7 in totalTeamList | orderBy:'name'">
						
						</select> <button  ng-show='edhidden2' ng-click='edhidden2=false'>close</button>	</span></div>
				
							
							
					<!-- 		 <span
						class="td_matchday_team2">{{row1.team2.name}}</span> 
						 -->
						
						<!-- 						<input type="text" class = "inputMedium" ng-model='row1.date|  date:"medium"'/> ng-model="row1.date"
 --></td>
					<td class="td_date_small"><md-datepicker
							ng-model="row1.tmpdate" md-placeholder="Enter date"></md-datepicker>
					</td>
					<td class="td_date_small"><input ng-model="row1.tmpdate"
						type="time" /></td>
					<td class="">
					
					
					
										<button title = "Αποθήκευση αλλαγών αγώνα"
							class='button_flat  background_dark_yellow'
							ng-click='adminEditPlayoffGame(row1,row5); edhidden=false; edhidden2=false'>Αποθήκευση</button>
			
							
						<button title='Ορίστε τους σκορερς του αγώνα' class='button_flat  background_black'
							ng-click='openScorerModal(row1)'>Σκορερς</button>
										<button title = "Διαγραφή αγώνα" class='button_flat  background_red'
							ng-click='adminDeletePlayoffGame(row1)'>&#10006;</button>

							</td>
<!-- 					<td><span><select ng-model="selectedmatchday"
							ng-options="row.name for row in matchday | orderBy:'name'">
							<option value="">---Επιλέξτε---</option>
						</select></span> 
					</td>
					<td><span><button class='button_flat  background_black'
								ng-click='addGameToMatchday(row1,selectedmatchday)'>Αλλαγή</button></span></td> -->

				</tr>

				<tr>



					<td>
					<select ng-model="selectedteam1_"
							ng-options="row2.name for row2 in totalTeamList | orderBy:'name'" class='width_40'>
							<option value="">---Επιλέξτε---</option>
							</select>

							-
							<select  ng-model="selectedteam2_"
							ng-options="row2.name for row2 in totalTeamList | orderBy:'name'" class='width_40'>
							<option value="">---Επιλέξτε---</option>
							</select>
					</td>
					<td></td>
					<td></td>
					<td><button title = 'Προσθήκη αγώνα χειροκινητα σε αυτή την αγωνιστική' class='button_flat background_green'
							ng-click='adminAddPlayoffGame(selectedteam1_,selectedteam2_,row5)'>&#10010;</button></td>
				
				</tr>

			</table>






		</div>


	</div>
</div>


<div ng-show='teamgrouplist' class="margin_left_small">


	<h2>
		ΟΜΙΛΟΙ <span class="color_red font_size_small">
			(σε {{champion.name}})</span>
	</h2>
	<div class='table_stylish1'>
		<table>
			<tr>
				<th>ΟΝΟΜΑ</th>
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			<tr ng-repeat='row in teamgrouplist'>
				<td><input style='cursor:pointer' ng-class='teamgroup==row?"selected_input":"unselected_input"'  type='text' ng-model='row.name'
					ng-click='getMatchdays(row); getTeams(row);' /></td>
				<td>
					<button class='button_flat  background_dark_yellow'
						title = "Αποθήκευση αλλαγών" ng-show='teamgroup==row' ng-click='adminEditTeamgroup(row)'>&#10004;</button>
				
					<button title = "Διαγραφή Ομίλου" class='button_flat  background_red'
						ng-show='teamgroup==row' ng-click='adminDeleteTeamgroup(row)'>&#10006;</button>
				
				</td>
			</tr>
			<tr>
				<td><input type='text' ng-model="adminTeamgroupName"
					placeholder="Το όνομα του νέου ομίλου εδω.." /></td>
				<td>
					<button title = "Προσθήκη νέου ομίλου"  class='button_flat background_green'
						ng-click='adminAddTeamgroup(champion)'>Προσθήκη</button>

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


<div ng-show='teamgroup' class="margin_left_medium">
	<h3>
		ΟΜΑΔΕΣ 
			<span class="color_red font_size_small">(σε {{champion.name}} / {{teamgroup.name}})</span>
	</h3>
	<div class='table_stylish1'>
		<table>
			<tr>
				<th>ΟΝΟΜΑ</th>
				<th>ΕΝΕΡΓΕΙΑ</th>
			</tr>
			<tr ng-repeat='row in standings'>
				<td>{{row.team.name}}</td>
				<td>
					<button title = "Διαγραφή ομάδας από τον όμιλο" class='button_flat background_red'
						ng-click='adminDeleteStanding(row)'>&#10006;</button>
				</td>
			</tr>
			<tr>
				<td><select ng-model="selectedTeam"
					ng-options="row.name for row in totalTeamList |filter : adminNewTeamName| orderBy:'name'">
					<option value="">---Επιλέξτε από υπάρχουσες---</option>
				</select>
				<td>
					<button  title = "Προσθήκη υπάρχουσας ομάδας στον όμιλο"  class='button_flat background_green'
						ng-click='adminAddTeamToTeamgroup(teamgroup,selectedTeam)'>Προσθήκη</button>

				</td>
			</tr>
			<tr>
				<td><input type='text' ng-model="adminNewTeamName"
					placeholder="Εισάγετε όνομα νέας ομάδας εδώ.." /></td>
				<td>
					<button class='button_flat background_green'
						 title = "Δημιουργία νέας ομάδας και προσθήκη στον όμιλο" ng-click='adminAddNewTeamToTeamgroup(teamgroup,adminNewTeamName)'>Προσθήκη νέας</button>

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
	<h3>
		ΑΓΩΝΙΣΤΙΚΕΣ <span class="color_red font_size_small">(σε
			{{champion.name}}/{{teamgroup.name}})</span>
	</h3>
	
	
	<table class='table_stylish1 margin_bottom_medium' >
	<tr ><td>
							<button title='Αυτόματη δημιουργία αγωνιστικών ενός γύρου' class='button_flat  background_black'
						ng-click='generateMatchdays(teamgroup,1)'>Δημιουργία</button>
					<button title='Αυτόματη δημιουργία αγωνιστικών δύο γύρων' class='button_flat  background_black'
						 ng-click='generateMatchdays(teamgroup,2)'>Δημιουργία
						(δύο γύροι)</button>
	
	</td></tr>
	
	<tr title='Επιλέξτε αναπροσαρμογή αγωνιστικων στην περίπτωση που προσθέσατε νέα ομάδα στον όμιλο. Όλα τα αποτελέσματα θα διατηρηθούν.'><td>
			<button class='button_flat  background_black'
						 ng-click='reGenerateMatchdays(teamgroup,1)'>Αναπροσαρμογή</button>
					<button class='button_flat  background_black'
						ng-click='reGenerateMatchdays(teamgroup,2)'>Αναπροσαρμογή
						(δύο γύροι)</button>
	</td></tr>
	
	<tr>
	<td>
	<input type='text' ng-model="adminNewMatchdayName"
		placeholder="Το νέο όνομα αγωνιστικής εδω" /></td>
	<td>
	
	<button title='Προσθήκη νέας αγωνιστικής. Οι αγώνες σε αυτή την αγωνιστική θα πρέπει να προστεθούν χειροκίνητα.' class='button_flat  background_green' ng-click='adminAddMatchday(adminNewMatchdayName,teamgroup)'>Προσθήκη</button>

	<button title='Διαγραφή όλων των αγωνιστικών' class='button_flat  background_red' ng-click='adminDeleteAllMatchdays(teamgroup)'>Διαγραφή όλων</button></td>

	
	</tr>
	</table>


	<div ng-repeat='row in matchday | orderBy:"name"'>
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
				<!-- 	<td><md-datepicker ng-model="row.startdate"
							md-placeholder="Η ημερομηνία αρχής εδω.."></md-datepicker></td>
					<td><md-datepicker ng-model="row.enddate"
							md-placeholder="Η ημερομηνία τέλους εδω.."></md-datepicker></td> -->
					<td>
						<button class='button_flat  background_dark_yellow'
							title = "Μετονομασία αγωνιστικής"  ng-click='adminUpdateMatchday(row,teamgroup)'>&#10004;</button>
							<button title = "Διαγραφή αγωνιστικής" class='button_flat  background_red' ng-click='adminDeleteMatchday(row)'>&#10006;</button>
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
					<td>
			 	<div ><span class="">
			 	<select style='display:inline; width:40%' ng-show='edhidden' ng-model="row1.team1"
							ng-options="row7.name for row7 in curteams | orderBy:'name'">
						
						</select> <button  ng-show='edhidden' ng-click='edhidden=false'>close</button>	</span></div>
			
				 
					<span title='Κάντε κλικ για να αντικαταστήσετε την ομάδα'  class="td_matchday_team1" ng-click='edhidden=true'>{{row1.team1.name}}</span> 
						<span class="td_score"><input type="number" min=0 max=100
							class="inputSmall" value={{row1.score1}} ng-model='row1.score1' />
							- <input type="number" min=0 max=100 value={{row1.score2}}
							class="inputSmall" ng-model='row1.score2' /></span>
							<span title='Κάντε κλικ για να αντικαταστήσετε την ομάδα'  class="td_matchday_team2" ng-click='edhidden2=true'>{{row1.team2.name}}</span> 
						
							<div ><span class="">
			 	<select style='display:inline; width:40%' ng-show='edhidden2' ng-model="row1.team2"
							ng-options="row7.name for row7 in curteams | orderBy:'name'">
						
						</select> <button  ng-show='edhidden2' ng-click='edhidden2=false'>close</button>	</span></div>
			
				 
						<!-- 						<input type="text" class = "inputMedium" ng-model='row1.date|  date:"medium"'/> ng-model="row1.date"
 --></td>
					<td class="td_date_small"><md-datepicker
							ng-model="row1.tmpdate" md-placeholder="Enter date"></md-datepicker>
					</td>
					<td class="td_date_small"><input ng-model="row1.tmpdate"
						type="time" /></td>
					<td class="">
					
					<button title = "Αποθήκευση αλλαγών αγώνα"
							class='button_flat  background_dark_yellow'
							ng-click='adminEditGame(row1,row); edhidden=false; edhidden2=false'>Αποθήκευση</button>
			
							
						<button title='Ορίστε τους σκορερς του αγώνα' class='button_flat  background_black'
							ng-click='openScorerModal(row1)'>Σκορερς</button>
										<button title = "Διαγραφή αγώνα" class='button_flat  background_red'
							ng-click='adminDeleteGame(row1)'>&#10006;</button>
							</td>
					<td><span><select ng-model="selectedmatchday"
							ng-options="row.name for row in matchday | orderBy:'name'">
							<option value="">---Επιλέξτε---</option>
						</select></span> 
					</td>
					<td><span><button title='Μεταφέρετε αυτό τον αγώνα σε άλλη αγωνιστική' class='button_flat  background_black'
								ng-click='addGameToMatchday(row1,selectedmatchday)'>Αλλαγή</button></span></td>

				</tr>

				<tr>

					<td>
					<select ng-model="selectedteam1"
							ng-options="row2.team.name for row2 in standings | orderBy:'name'" class='width_40'>
							<option value="">---Επιλέξτε---</option>
							</select>

							-
							<select  ng-model="selectedteam2"
							ng-options="row2.team.name for row2 in standings | orderBy:'name'" class='width_40'>
							<option value="">---Επιλέξτε---</option>
							</select>
					</span></td>
					<td></td>
					<td></td>
					<td><button title = 'Προσθήκη αγώνα χειροκινητα σε αυτή την αγωνιστική' class='button_flat background_green'
							ng-click='adminAddGame(selectedteam1.team,selectedteam2.team,row)'>&#10010;</button></td>
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
 
 
 
 
 
 </div>
 
 </div>
 
 
 


<!-- Trigger/Open The Modal -->
<!-- <button ng-click='openScorerModal()' >Open Modal</button>
 -->
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span  ng-click='closeScorerModal()' class="close">&times;</span>
    
 <div class='table_stylish1'>

<h3 style="width:100%;text-align:center">{{selectedgame.team1.name}}</h3>
<table>

<tbody>

			<tr>
				
				<td>
					<select ng-model="newscorer1.contact"
							ng-options="row.name for row in team1players | orderBy:'name'">
							<option value="">---Επιλέξτε παίχτη---</option>
						</select>
				
				</td>
				<td ng-show='newscorer1.contact' >Γκολ: <input title='Εισάγετε τον αριθμό των γκολ που έβαλε ο παίχτης στον αγώνα' type='number' ng-model="newscorer1.number"/>
				</td>
				<td ng-show='newscorer1.contact'><button title='Προσθήκη σκόρερ'
							class='button_flat  background_green'
							ng-click='addScorer(newscorer1)'>&#10010;</button>
				</td>
			</tr>
						
			<tr>
				
				<td>
					<input type='text' ng-model="newplayer1.name" placeholder='ή αν δεν υπάρχει προσθέστε το όνομα παίχτη εδω..'/>
				</td>
			
				<td ng-show='newplayer1.name' >Γκολ: <input title='Εισάγετε τον αριθμό των γκολ που έβαλε ο παίχτης στον αγώνα' type='number' ng-model="newscorer1_.number"/>
				</td>
				<td ng-show='newplayer1.name' ><button title='Προσθήκη σκόρερ'
							class='button_flat  background_green'
							ng-click='addScorerAndPlayer(newscorer1_,newplayer1,selectedgame.team1)'>&#10010;</button>
				</td>
			</tr>
</tbody>
</table>
<BR/>
<h3 style="width:100%;text-align:center">{{selectedgame.team2.name}}</h3>
<table>

<tbody>
			<tr>
				
				<td>
					<select ng-model="newscorer2.contact"
							ng-options="row.name for row in team2players | orderBy:'name'">
							<option value="">---Επιλέξτε παίχτη---</option>
						</select>
				
				</td>
	
				<td ng-show='newscorer2.contact'>Γκολ: <input title='Εισάγετε τον αριθμό των γκολ που έβαλε ο παίχτης στον αγώνα' type='number' ng-model="newscorer2.number"/>
				</td>
				<td ng-show='newscorer2.contact'><button title='Προσθήκη σκόρερ'
							class='button_flat  background_green'
							ng-click='addScorer(newscorer2)'>&#10010;</button>
				</td>
			</tr>
			
			<tr>
				
				<td >
					<input type='text' ng-model="newplayer2.name" placeholder='ή αν δεν υπάρχει προσθέστε το όνομα παίχτη εδω..'/>
				</td>
			
				<td ng-show='newplayer2.name'>Γκολ: <input title='Εισάγετε τον αριθμό των γκολ που έβαλε ο παίχτης στον αγώνα' type='number' ng-model="newscorer2_.number"/>
				</td>
				<td ng-show='newplayer2.name'><button title='Προσθήκη σκόρερ'
							class='button_flat  background_green'
							ng-click='addScorerAndPlayer(newscorer2_,newplayer2,selectedgame.team2)'>&#10010;</button>
				</td>
			</tr>
</tbody>
</table>

<BR/>
<BR/>
<h3>Καταχωρημένοι Σκορερς</h3>
<table>





<thead>
			<tr>
				<th>ΟΝΟΜΑ
				</th>
				<th>ΟΜΑΔΑ
				</th>
				<th>ΓΚΟΛ
				</th>
				<th>ΕΝΕΡΓΕΙΑ
				</th>
			</tr>
</thead>
<tbody>
			<tr ng-repeat='row2 in scorers   | orderBy: "team.name"'>
				
				<td>{{row2.contact.name}}
				</td>
				<td>{{row2.team.name}}
				</td>
				<td><input type='number' ng-model="row2.number"/>
				</td>
				<td><button title = "Αποθήκευση αλλαγών του σκόρερ"
							class='button_flat  background_dark_yellow'
							ng-click='editScorer(row2)'>&#10004;</button>
				<button title = "Διαγραφή σκόρερ" class='button_flat background_red' 
					ng-click='deleteScorer(row2)'>&#10006;</button>
				</td>
			</tr>
			
<!-- 			
			<tr>
				
				<td>
					<select ng-model="newscorer1.contact"
							ng-options="row.name for row in team1players | orderBy:'name'">
							<option value="">---Επιλέξτε απο υπάρχοντες---</option>
						</select>
				
				</td>
				<td>{{selectedgame.team1.name}}
				</td>
				<td><input type='number' ng-model="newscorer1.number"/>
				</td>
				<td><button
							class='button_flat  background_green'
							ng-click='addScorer(newscorer1)'>Εισαγωγή</button>
				</td>
			</tr>
			
			<tr>
				
				<td>
					<input type='text' ng-model="newplayer1.name" placeholder='Εισάγετε το όνομα του νέου παίχτη εδω..'/>
				</td>
				<td>{{selectedgame.team1.name}}
				</td>
				<td><input type='number' ng-model="newscorer1_.number"/>
				</td>
				<td><button
							class='button_flat  background_green'
							ng-click='addScorerAndPlayer(newscorer1_,newplayer1,selectedgame.team1)'>Εισαγωγή νέου</button>
				</td>
			</tr>
			
			<tr>
				
				<td>
					<select ng-model="newscorer2.contact"
							ng-options="row.name for row in team2players | orderBy:'name'">
							<option value="">---Επιλέξτε από υπάρχοντες---</option>
						</select>
				
				</td>
				<td>{{selectedgame.team2.name}}
				</td>
				<td><input type='number' ng-model="newscorer2.number"/>
				</td>
				<td><button
							class='button_flat  background_green'
							ng-click='addScorer(newscorer2)'>Εισαγωγή</button>
				</td>
			</tr>
			
			<tr>
				
				<td>
					<input type='text' ng-model="newplayer2.name" placeholder='Εισάγετε το όνομα του νέου παίχτη εδω..'/>
				</td>
				<td>{{selectedgame.team2.name}}
				</td>
				<td><input type='number' ng-model="newscorer2_.number"/>
				</td>
				<td><button
							class='button_flat  background_green'
							ng-click='addScorerAndPlayer(newscorer2_,newplayer2,selectedgame.team2)'>Εισαγωγή νέου</button>
				</td>
			</tr>
			 -->

</tbody>
</table>
</div>
 

  </div>
<BR/>
<BR/>
<BR/>
<BR/>
<BR/>
<BR/>
</div>