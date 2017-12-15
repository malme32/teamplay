<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event</title>
</head>
<body>
<h1>{{event.name}}</h1>
<h2>{{event.description}}</h2>
<h3>{{event.date | date:'medium'}}</h3>
	<table class="table-fill" ng-show=eventplayers>
	<thead>
		<tr>
			<th class="text-left">Player Name</th>
		</tr>
	</thead>
	<tbody class="table-hover">
		<tr ng-repeat='row in eventplayers' ng-click='visitContact(row.id)'>
			<td class="text-left">{{row.name}}</td>
		</tr>
	</tbody>
	</table>
	
	
		<table class="table-fill" ng-show=eventmessages>
	<thead>
		<tr>
			<th class="text-left">Message</th>
			<th class="text-left">Sender</th>
		</tr>
	</thead>
	<tbody class="table-hover">
		<tr ng-repeat='row in eventmessages'>
			<td class="text-left">{{row.message}}</td>
			<td class="text-left">{{row.contact.name}}</td>
		</tr>
	</tbody>
	</table>
	
</body>
</html>