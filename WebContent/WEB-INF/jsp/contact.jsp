<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event</title>
</head>
<body>
<h1>{{contact.name}}</h1>
<p ng-show='contact.address.length')>Address:</p>
<h2>{{contact.address}}</h2>
<!-- <h3>{{event.date | date:'medium'}}</h3> -->

 <div class=bodycomponent ng-show='salaries.length'>
	<table class="table-fill" >
				<thead>
					<tr>
						<th class="text-left">Salary</th>
						<th class="text-left">Date</th>

					</tr>
				</thead>
				<tbody class="table-hover">
					<tr ng-repeat='row in salaries'>
						<td class="text-left">{{row.salary}}</td>
						<td class="text-left">{{row.date | date:'medium'}}</td>
	
					</tr>
				</tbody>
				</table>
</div>


 <div class=bodycomponent ng-show='events.length'>
	<table class="table-fill" >
				<thead>
					<tr>
						<th class="text-left">Event Name</th>
						<th class="text-left">Date</th>

					</tr>
				</thead>
				<tbody class="table-hover">
					<tr ng-repeat='row in events' ng-click='visitEvent(row.id)'>
						<td class="text-left">{{row.name}}</td>
						<td class="text-left">{{row.date | date:'medium'}}</td>
	
					</tr>
				</tbody>
				</table>
</div>
	

	
</body>
</html>