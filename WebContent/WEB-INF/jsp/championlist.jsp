<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Champion List</title>
</head>
<body>



<!--  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#addChampionModal">Open Small Modal</button>
 -->



<!-- 
	 <div class="banner-bottom-grids">
		 <div class="container" ng-repeat='row in championlist'>
			 <div class="col-md-6 banner-text-info clr1">
				 <i class="icon1"></i>
				 <div class="bnr-text" ng-click='getChampion(row)'>				 
					 <h3>{{row.name}}</h3>
					 <p>Vestibulum malesuada nisi sit amet justo ullamcorper, non convallis justo consequat Integer et urna bibendum elit accumsan interdum.</p>
				 </div>
			 </div>
			 
			 <div class="clearfix"></div>
		 </div>
	 </div> -->
<div class='champ'>
	<ul>
		<li  ng-repeat='row in championlist'><a ng-click='getChampion(row)' ng-class="cssLiChampionClass(row)">{{row.name}}</a></li>
	</ul> 
</div>


<div  class="div_standings" ng-repeat='row in teamgrouplist'><h3> {{row.name}}</h3>
	<div  ng-show="row.standings.length">
		<table>
			<tr>
				<th>
				</th>
				<th>Grade
				</th>
				<th>Goal
				</th>
				<th>Goal +
				</th>
				<th>Goal -
				</th>
				<th>Mathes
				</th>
				<th>Wins
				</th>
				<th>Defeats
				</th>
				<th>Draws
				</th>
			</tr>
			<tr ng-repeat='row1 in row.standings  | orderBy: "-grade"'>
				<td class='td_team'>{{row1.team.name}}
				</td>
				<td class="td_grade">{{row1.grade}}
				</td>
				<td>{{row1.goal}}
				</td>
				<td>{{row1.goalplus}}
				</td>
				<td>{{row1.goalminus}}
				</td>
				<td>{{row1.game}}
				</td>
				<td>{{row1.win}}
				</td>
				<td>{{row1.defeat}}
				</td>
				<td>{{row1.draw}}
				</td>
			</tr>
		</table>
		
			<div class="div_matchday" ng-repeat='row in matchday' >
			<h4 ng-show=row.games.length>{{row.name}}</h4>
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
						<td class="td_score">{{row1.score1}} - {{row1.score2}}</td>
						<td class="td_matchday_team2"> {{row1.team2.name}}</td>
						<td class="td_date_small">{{row1.date |  date:'medium'}}</td>
	
					</tr>
				</tbody>
				</table>
			</div>
			
		<button ng-click="getMatchdays(row)">Show Program</button>
		
</div>
<!-- <div class="teamgroup">
	<ul >
		<li ng-repeat='row in teamgrouplist' ><a ng-click='getMatchdays(row)'>{{row.name}}</a></li>
	</ul> 
	</div>-->
</div>




	<!-- <h1>{{champion.name}}</h1> -->
<!-- 	<div ng-repeat='row in teamgrouplist'>{{row.name}}
 -->	
<!--  <div ng-repeat='row in matchday'>{{row.name}}

 	<table class="table-fill" ng-show=row.games.length>
	<thead>
		<tr>
			<th class="text-left">Teams</th>
			<th class="text-left">Date</th>
			<th class="text-left">Score</th>
		</tr>
	</thead>
	<tbody class="table-hover">
		<tr ng-repeat='row1 in row.games' >ng-click='visitContact(row.id)'
			<td class="text-left">{{row1.team1.name}} - {{row1.team2.name}}</td>
			<td class="text-left">{{row1.date |  date:'medium'}}</td>
			<td class="text-left">-</td>
		</tr>
	</tbody>
	</table>
  
 </div> -->
	
  <!-- Add Champion Modal -->
  <div class="modal fade" id="addChampionModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Champion</h4>
        </div>
          <input ng-model="adminChampionName" type='text' placeholder="Insert the champion here"/>
          <button ng-click='adminAddChampion()'>Add</button>
          <span>{{modalResult}}</span>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
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
 
	<!-- {{result}} -->
<!-- 	<button ng-click="setPath()">Register a new event</button>
 --></body>
</html>