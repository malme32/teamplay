 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />

	 


<h1>Champions <h2>{{champion.name}}</h2></h1>
<div>
	<ul>
		<li ng-repeat='row in championlist'>
<!-- 		<a ng-click='getTeamgroup(row)' >{{row.name}}</a>
 -->			<input ng-model='row.name' ng-click='getTeamgroup(row); '/>
			<button ng-show='champion==row' data-toggle="modal" data-target="#deleteChampionModal">Delete</button>
			<button ng-show='champion==row' ng-click='adminEditChampion(row)' data-target="#editChampionModal">Save</button>
	</li>
		<li>
          <input ng-model="adminChampionName" placeholder="Insert the champion name here"/>
 		<button ng-click='adminAddChampion()'>Add</button>
	</li>
	</ul> 
</div>


<h1>Groups</h1>
<div>
	<ul>
		<li ng-repeat='row in teamgrouplist'>
<!-- 		<a ng-click='getTeamgroup(row)' >{{row.name}}</a>
 -->			<input ng-model='row.name' ng-click='getMatchdays(row); getTeams(row)'/>
 			<button ng-show='teamgroup==row' ng-click='adminDeleteTeamgroup(row)'>Delete</button>
<!-- 			<button ng-show='teamgroup==row' data-toggle="modal" data-target="#deleteChampionModal">Delete</button>
 -->			<button ng-show='teamgroup==row' ng-click='adminEditTeamgroup(row)' >Save</button>
 				<button ng-show='teamgroup==row' ng-click='generateMatchdays(row,1)' >Generate Matchdays</button>
 				<button ng-show='teamgroup==row' ng-click='generateMatchdays(row,2)' >Generate Matchdays(double round)</button>
 				
	</li>
		<li>
          <input ng-model="adminTeamgroupName" placeholder="Insert the champion name here"/>
 		<button ng-click='adminAddTeamgroup(champion)'>Add</button>
	</li>
	</ul> 
</div>

<h1>Teams</h1>
<div>
	<ul>
		<li ng-repeat='row in standings'>
<!-- 		<a ng-click='getTeamgroup(row)' >{{row.name}}</a>
 -->			<input  ng-model='row.team.name' ng-click='standing_sel=row'/>
 			<button ng-show='standing_sel==row' ng-click='adminDeleteStanding(row)'>Remove</button>
<!-- 			<button ng-show='teamgroup==row' data-toggle="modal" data-target="#deleteChampionModal">Delete</button> -->
			</li>
			
				<li>
				<select ng-model="selectedTeam" ng-options="row.name for row in totalTeamList">
				</select>
								
					<button ng-click='adminAddTeamToTeamgroup(teamgroup,selectedTeam)'>Add</button>
 			 </li>
		
		<li>
          <input  ng-model="adminNewTeamName" placeholder="Insert the new team name here"/>
 		<button ng-click='adminAddNewTeamToTeamgroup(teamgroup,adminNewTeamName)'>Add</button>
	</li>
	</ul> 
</div>
<h1>Matchdays</h1>
    <input  ng-model="adminNewMatchdayName" placeholder="Insert the new matchday name here"/>
	<button ng-click='adminAddMatchday(adminNewMatchdayName,teamgroup)'>Add New</button>
	<button ng-click='adminDeleteAllMatchdays(teamgroup)'>Delete All</button>
	
			<div class="div_matchday" ng-repeat='row in matchday' > <!-- | orderBy: "name" -->
			<h4 ><input ng-model="row.name" placeholder="Insert the matchday name here"/>
    		<md-datepicker  ng-model="row.startdate" md-placeholder="Enter Start Date"></md-datepicker>
   			 <md-datepicker  ng-model="row.enddate" md-placeholder="Enter End Date"></md-datepicker>
			<button ng-click='adminUpdateMatchday(row,teamgroup)'>Save</button></h4>
 			<button ng-click='adminDeleteMatchday(row)'>Delete</button>
			 	<table class="" ng-show=row.games.length>
<!-- 				<thead>
					<tr>
						<th class="text-left">Teams</th>
						<th class="text-left">Date</th>
						<th class="text-left">Score</th>
					</tr>
				</thead> -->
				<tbody class="">
					<tr ng-repeat='row1 in row.games' ><!-- ng-click='visitContact(row.id)' -->
						<td class="td_matchday_team1">{{row1.team1.name}}</td>
						<td class="td_score"><input type="number" min=0 max=100 class = "inputSmall" value={{row1.score1}} ng-model='row1.score1'/> - <input type="number" min=0 max=100 value={{row1.score2}} class = "inputSmall"  ng-model='row1.score2'/></td>
						<td class="td_matchday_team2"> {{row1.team2.name}}</td>
<!-- 						<input type="text" class = "inputMedium" ng-model='row1.date|  date:"medium"'/> ng-model="row1.date"
 -->						<td class="td_date_small"><md-datepicker  ng-model="row1.tmpdate" md-placeholder="Enter date"></md-datepicker>
							<input ng-model="row1.tmpdate" type="time"/>
 								
 								</td>
 						<td class=""><button ng-click='adminEditGame(row1,row)'>Save</button><button ng-click='adminDeleteGame(row1)'>Delete</button>
 					
 						</td>
							<td>
								<select ng-model="selectedmatchday" ng-options="row.name for row in matchday">
								</select><button ng-click='addGameToMatchday(row1,selectedmatchday)'>Move</button>
							</td>
						
					</tr>
				</tbody>
				</table>
				<table>
					<tr>
						<td> <select ng-model="selectedteam1" ng-options="row2.team.name for row2 in standings">
						</td>
						<td> <select ng-model="selectedteam2" ng-options="row2.team.name for row2 in standings">
						</td>
						<td><button ng-click='adminAddGame(selectedteam1.team,selectedteam2.team,row)'>Add Game</button>
						</td>
					</tr>
				</table>
			</div>


</div>



  
  
  
  <!-- Delete Modal -->
   <div class="modal fade" id="deleteChampionModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delete Champion</h4>
        </div>
          <p>Delete champion <b>{{champion.name}}</b>?</p>
          <button ng-click='adminDeleteChampion(champion.id)'>Delete</button>
          <p>{{modalResult}}</p>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  {{result}}
	<!-- {{result}} -->
<!-- 	<button ng-click="setPath()">Register a new event</button>
 -->