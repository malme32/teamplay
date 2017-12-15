<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event List</title>
</head>
<body>
	<table class="table-fill">
	<thead>
		<tr>
			<th class="text-left">Name</th>
			<th class="text-left">Date</th>
		</tr>
	</thead>
	<tbody class="table-hover">
		<tr ng-repeat='row in eventlist'  ng-click='visitEvent(row.id)'>
			<td class="text-left">{{row.name}} </td>
			<td class="text-left">{{row.date| date:'medium'}}</td>
		</tr>
	</tbody>
	</table>
	
	
	<button ng-click="setPath()">Register a new event</button>
</body>
</html>