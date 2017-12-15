var appAdmin = angular.module("appAdmin", ["ngRoute",'ngMaterial', 'ngMessages', 'material.svgAssetsCache']);

appAdmin.config(function($routeProvider) {
    $routeProvider

    .when("/adminchampions", {
        templateUrl : "adminchampions.html",
        controller: "adminController"

    })
    .when("/adminteams", {
        templateUrl : "adminteams.html",
        controller: "teamController"

    });
    
});


appAdmin.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);

appAdmin.service('fileUpload', ['$http', function ($http) {
    this.uploadFileToUrl = function(file, uploadUrl){
        var fd = new FormData();
        fd.append('file', file);
        $http.post(uploadUrl, fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
        .success(function(){
        })
        .error(function(){
        });
    }
}]);

/*appAdmin.directive('fileModel', ['$parse', function ($parse) {
    return {
       restrict: 'A',
       link: function(scope, element, attrs) {
          var model = $parse(attrs.fileModel);
          var modelSetter = model.assign;
          
          element.bind('change', function(){
             scope.$apply(function(){
                modelSetter(scope, element[0].files[0]);
             });
          });
       }
    };
 }]);


myApp.service('fileUpload', ['$http', function ($http) {
   this.uploadFileToUrl = function(file, uploadUrl){
      var fd = new FormData();
      fd.append('file', file);
   
      $http.post(uploadUrl, fd, {
         transformRequest: angular.identity,
         headers: {'Content-Type': undefined}
      })
   
      .success(function(){
      })
   
      .error(function(){
    	  alert("error");
      });
   }
}]);
*/



appAdmin.controller("adminController",function($scope, $http, $location, $window){

	 $scope.championlist ="";
	 $scope.champion;
	 
	//$scope.getContacts = function (){
/*	 $scope.getChampion = function (row){  
*/		 $scope.result = "";
		 $scope.standings = "";
		 $http({
	        method : "GET",
	        url : "champions"
	    }).then(function mySuccess(response) {

	        $scope.championlist = response.data;
	        $scope.getTotalTeamList();
	    }, function myError(response) {
	  
	        $scope.result = response.statusText;
	      
	    });
	 /*}*/
	 
	 $scope.getTotalTeamList = function (){  
		 $http({
	        method : "GET",
	        url : "teams"
	    }).then(function mySuccess(response) {

	        $scope.totalTeamList = response.data;
	      
	    }, function myError(response) {
	  
	        $scope.result = response.statusText;
	      
	    });
	 }
	 
	 
		 $scope.getTeamgroup = function (row){
			 $scope.result = "";
			 $scope.champion =row;
			 $scope.matchday="";
			 $scope.standings = "";
			 $http({
			        method : "GET",
			        url : "champions/"+row.id+"/teamgroups"
			    }).then(function mySuccess(response) {

			        $scope.teamgrouplist = response.data;
			    }, function myError(response) {
			  
			        $scope.result = response;//;"/champions/"+row.id+"/teamgroups";
			      
			    });
		 }
		 $scope.getTeams = function (row){
			 	$scope.result = "";

		        $scope.standings =  row.standings;
		        $scope.teamgroup = row; 
		 }

		 $scope.getMatchdays = function (row){
			 $scope.result = "";
			 //$scope.teamgroup =row;
			// $scope.matchday = row.matchdays;
			 
			 $http({
			        method : "GET",
			        url : "teamgroups/"+row.id+"/matchdays"
			    }).then(function mySuccess(response) {

			    	$scope.matchday = response.data;
			    	for(i=0;i<$scope.matchday.length;i++)
		    		{
			    	 //$scope.result = $scope.result+"333";
		    			var games = $scope.matchday[i].games;
				    	 //$scope.result= $scope.result+ "444";
				    	for(k=0;k<games.length;k++)
			    		{
					    	// $scope.result= $scope.result+ "555";
					    	 if(games[k].date)
					    		 games[k].tmpdate=new Date(games[k].date);
			    		}
		    		}
			    	//$scope.result = matchday;
			    }, function myError(response) {
			  
			        $scope.result = "An Error Occurred";//;"/champions/"+row.id+"/teamgroups";
			      
			    });
			 
		 }
		 $scope.adminAddChampion = function (){
			 $scope.result = "";
			 	if( $scope.adminChampionName=="") 
			 		return;
		        $scope.modalResult = "";
			 $http({
			        method : "POST",
			        url : "champions",
			        	   params: {
			        	        name : $scope.adminChampionName
			        	    }
			    }).then(function mySuccess(response) {

			    	$window.location.reload();
			    }, function myError(response) {
			  
			        $scope.result = "An Error occured. Try again.";
			      
			    });
			 
		 }


		 
	/*	 $scope.editChampion = function (){
			 
			 
		 }*/		
		 $scope.adminEditChampion = function (row){
			 $scope.result = "";
			 	if( row.name=="") 
			 		return;
		        //$scope.modalResult = "";
			 $http({
			        method : "PUT",
			        url : "champions",
			        	   params: {
			        	        id : row.id,
			        	        name : row.name
			        	    }
			    }).then(function mySuccess(response) {

			    	$window.location.reload();
			    }, function myError(response) {
			  
			        $scope.result = "An Error occured. Try again.";
			      
			    });
			 
		 }
		 
		 $scope.adminDeleteChampion = function (id){

			 $scope.result = "";
		      //$scope.modalResult = "";
			 $http({
			        method : "DELETE",
			        url : "champions/"+id
			    }).then(function mySuccess(response) {
			    	$window.location.reload();
			    }, function myError(response) {
			        $scope.result = "An Error occured. Try again.";
			    });
		 }
		 
		 
		 $scope.adminAddTeamgroup = function (row){
			 $scope.result = "";
			 	if( $scope.adminChampionName=="") 
			 		return;
		        $scope.modalResult = "";
			 $http({
			        method : "POST",
			        url : "champions/"+row.id+"/teamgroups",
			        	   params: {
			        	        name : $scope.adminTeamgroupName
			        	    }
			    }).then(function mySuccess(response) {

			    	$window.location.reload();
			    }, function myError(response) {
			  
			        alert( "An Error occured. Try again");
			    });
			 
		 }
		 
		 $scope.adminEditTeamgroup = function (row){
			 $scope.result = "";
			 	if( row.name=="") 
			 		return;
		        //$scope.modalResult = "";
			 $http({
			        method : "PUT",
			        url : "champions/"+$scope.champion.id+"/teamgroups",
			        	   params: {
			        	        id : row.id,
			        	        name : row.name
			        	    }
			    }).then(function mySuccess(response) {

			    	alert("Done!");
			    }, function myError(response) {

			        alert( "An Error occured. Try again");
			      
			    });
			 
		 }
		 $scope.adminDeleteTeamgroup = function (row){

			 $scope.result = "";
			 if(!confirm("Are you sure?"))
				 return;
				 
			 $http({
			        method : "DELETE",
			        url : "teamgroups/"+row.id
			    }).then(function mySuccess(response) {
			    	$window.location.reload();
			    }, function myError(response) {
			        alert( "An Error occured. Try again");
			    });
		 }
		 
			    $scope.cssLiChampionClass = function (row) {
			    	if(row.id==$scope.champion.id)
			    		return "css_li_champion_active";
			    	else return "css_li_champion"
			    };
			    
			    
				 $scope.adminAddTeamToTeamgroup = function (teamgroup_,team_){
					 $scope.result = "";
					 	if( team_==null) 
					 		return;
				        $scope.modalResult = "";
					 $http({
					        method : "PUT",
					        url : "teamgroups/"+teamgroup_.id+"/teams/"+team_.id
					    }).then(function mySuccess(response) {

					    	$window.location.reload();
					    }, function myError(response) {

					        alert( "An Error occured. Team already exists?");
					    });
					 
				 }
				 
				 $scope.adminAddNewTeamToTeamgroup = function (teamgroup_obj,team_name){
					 $scope.result = "";

					 	if( team_name=="") 
					 		return;
			
				       // $scope.modalResult = "";
					 $http({
					        method : "POST",
					        url : "teamgroups/"+teamgroup_obj.id+"/teams",
					        params: { name : team_name}
					    }).then(function mySuccess(response) {

					    	$window.location.reload();
					    }, function myError(response) {

					        alert( "An Error occured. Team already exists?");
					    });
					 
				 }

/*				 $scope.adminRemoveTeamFromTeamgroup = function (teamgroup_,team_){
					 $scope.result = "";
					 $scope.result = "";
					 	if( team_==null) 
					 		return;
				
					 $http({
					        method : "DELETE",
					        url : "teamgroups/"+teamgroup_.id+"/teams/"+team_.id
					    }).then(function mySuccess(response) {

					    	//$window.location.reload();
					    }, function myError(response) {
					  
					        $scope.result = "An Error occured. Try again.";
					    });
					 
				 }*/
				 
				 
				 $scope.adminDeleteStanding = function (row){
				 $scope.result = "";
				 if(!confirm("Are you sure?"))
					 return;
			
				 $http({
				        method : "DELETE",
				        url : "standings/"+row.id
				    }).then(function mySuccess(response) {

				    	$window.location.reload();
				    }, function myError(response) {
				  
				        $scope.result = "An Error occured. Try again.";
				    });
				 
			 }
				 
				 $scope.adminDeleteMatchday = function (row){
					 $scope.result = "";
		
					 if(!confirm("Are you sure?"))
						 return;
						 
					 $http({
					        method : "DELETE",
					        url : "matchdays/"+row.id
					    }).then(function mySuccess(response) {

					    	$window.location.reload();
					    }, function myError(response) {
					  
					        $scope.result = "An Error occured. Try again.";
					    });
					 
				 }
				 
				 $scope.generateMatchdays = function (row,roundNumber){
					 if(!confirm("Are you sure?"))
						 return;
					 $scope.result = "";
					 $http({
					        method : "POST",
					        url : "teamgroups/"+row.id+"/actions/generatematchdays",
					        params:{roundNumber:roundNumber}
					    }).then(function mySuccess(response) {

					    	$window.location.reload();
					    }, function myError(response) {
					  
					        $scope.result = "An Error occured. Try again.";
					    });
					 
				 } 
				 

				 
				 $scope.adminDeleteAllMatchdays = function (row){
					 $scope.result = "";
		
					 if(!confirm("Are you sure?"))
						 return;
						 
					 $http({
					        method : "DELETE",
					        url : "teamgroups/"+row.id+"/matchdays"
					    }).then(function mySuccess(response) {

					    	$window.location.reload();
					    }, function myError(response) {
					  
					        $scope.result = "An Error occured. Try again.";
					    });
					 
				 }
				 
			 $scope.getFormattedDate = function(date,time) {
								  var year = date.getFullYear();

								  var month = (1 + date.getMonth()).toString();
								  month = month.length > 1 ? month : '0' + month;

								  var day = date.getDate().toString();
								  day = day.length > 1 ? day : '0' + day;
								  
								  if(time)
									{
									  var mydate = new Date(time);
									  
									  var hour = mydate.getHours().toString();
									  hour = hour.length > 1 ? hour : '0' + hour;
									  
									  var minute = mydate.getMinutes().toString();
									  minute = minute.length > 1 ? minute : '0' + minute;
									  
									  return month + '-' + day + '-' + year +" "+hour+":"+minute+":00";
									}  
								  
								  return month + '-' + day + '-' + year +" 00:00:00";
								}
				 
			 $scope.adminEditGame= function (row,tmpmatchday){
					if(row.tmpdate)
					{	row.date = row.tmpdate;
			/*			var mydate = new Date(row.date);
						row.date = $scope.getFormattedDate(mydate,row.gametime);*/
					}
	
				 $scope.result=row.tmpdate;
				 $http({
				        method : "PUT",
				        url : "matchdays/"+tmpmatchday.id+"/games",
				        data: row,
				        headers: {'Content-Type': 'application/json; charset=utf-8'} 
					      // params: {id:row.id,teamid1:row.team1.id,teamid2:row.team2.id,
					    	//   score1:row.score1,score2:row.score2, date:row.date, matchdayid:tmpmatchday.id}

				    }).then(function mySuccess(response) {

				    	alert("Done!");
				    }, function myError(response) {
				  
				    	alert("An Error occured. Try again.");
				      
				    });
				 

			 } 
				 $scope.adminDeleteGame = function (row){
						// $scope.result = "";
			
						 if(!confirm("Are you sure?"))
							 return;
							 
						 $http({
						        method : "DELETE",
						        url : "games/"+row.id
						    }).then(function mySuccess(response) {

						    	$window.location.reload();
						    }, function myError(response) {
						  
						        $scope.result = "An Error occured. Try again.";
						    });
						 
					 }
				 
				 
				  $scope.addGameToMatchday = function (gamerow,matchdayrow){
					// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
		
					 if(!confirm("Are you sure?"))
						 return;
						 
					 $http({
					        method : "PUT",
					        url : "matchdays/"+matchdayrow.id+"/games/"+gamerow.id
					    }).then(function mySuccess(response) {

					    	$window.location.reload();
					    }, function myError(response) {
					  
					        $scope.result = "An Error occured. Try again.";
					    });
					 
				 }
				  $scope.adminAddMatchday = function (matchdayname,teamgrouprow){
						// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
			
				/*		 if(!confirm("Are you sure?"))
							 return;*/
							 
						 $http({
						        method : "POST",
						        url : "teamgroups/"+teamgrouprow.id+"/matchdays",
						        params: {name:matchdayname}
						    }).then(function mySuccess(response) {

						    	$window.location.reload();
						    }, function myError(response) {
						  
						       alert("An Error occured. Try again.");
						    });
						 
					 }
				  $scope.adminUpdateMatchday = function (row,teamgrouprow){
						// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
			
				/*		 if(!confirm("Are you sure?"))
							 return;*/
					  
						if(row.startdate)
						{
							var mydate = new Date(row.startdate);
							row.startdate = $scope.getFormattedDate(mydate);
						}
						if(row.enddate){
							var mydate = new Date(row.enddate);
							row.enddate = $scope.getFormattedDate(mydate);
						}
					  
					  //$scope.result=row; 
						 $http({
						        method : "PUT",
						        url : "teamgroups/"+teamgrouprow.id+"/matchdays",
						        data: row,
						        headers: {'Content-Type': 'application/json; charset=utf-8'} 
						    }).then(function mySuccess(response) {

						    		alert("Done!");
						    }, function myError(response) {
						  
						       alert("An Error occured. Try again.");
						    });
						 
					 }
				  
				  $scope.adminAddGame = function (team1,team2,matchdayrow){
						// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
			
				/*		 if(!confirm("Are you sure?"))
							 return;*/
					  //$scope.result=matchdayrow; 
						 $http({
						        method : "POST",
						        url : "matchdays/"+matchdayrow.id+"/games",
						        params:{teamid1: team1.id, teamid2: team2.id}
						    }).then(function mySuccess(response) {

						    	$window.location.reload();
						    }, function myError(response) {
						  
						       alert("An Error occured. Try again.");
						    });
						 
					 }
				  
			/*	
					  this.myDate = new Date();
					  this.isOpen = false;*/
					

				  
});


appAdmin.controller("teamController",function($scope, $http, $location, $window){

		 
	/* $scope.getTeams = function (){ */ 
		 $http({
	        method : "GET",
	        url : "teams"
	    }).then(function mySuccess(response) {

	        $scope.teams = response.data;
	      
	    }, function myError(response) {

		      alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
	      
	    });
/*	 }*/
	 

		 
		 $scope.getTeam = function (){ 
		        $scope.team = "";
			 $http({
		        method : "GET",
		        url : "teams/"+$scope.selectedTeam.id
		    }).then(function mySuccess(response) {

		        $scope.team = response.data;
		        
				 $http({
				        method : "GET",
				        url : "teams/"+$scope.selectedTeam.id+"/players"
				    }).then(function mySuccess(response) {
				        $scope.players = response.data;
				    }, function myError(response) {
				  
				        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
				    });

		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.addTeam = function (){ 

			 $http({
		        method : "POST",
		        	url : "teams",
			        data: $scope.newteam,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {

		    	$window.location.reload();
		        
		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Μήπως η ομάδα υπάρχει ήδη?");
		    });
		 }
		 
		 $scope.deleteTeam = function (){ 

			 if(!confirm("Είστε σίγουρος;"))
				 return;
				 
			 $http({
		        method : "DELETE",
		        url : "teams/"+$scope.team.id
		    }).then(function mySuccess(response) {

		    	$window.location.reload();
		      
		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.editTeam = function (){ 
			 //$scope.team.players=$scope.players;
			 //$scope.result=$scope.team;
			 $http({
		        method : "PUT",
		        	url : "teams",
			        data: $scope.team,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {
		    	
		    	$scope.getTeam();
		    }, function myError(response) {

		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.uploadLogo = function(){
		     var fd = new FormData();
             fd.append('file', $scope.mylogo);
          

/*             $http.post("teams/"+$scope.team.id+"/images",fd,
                     {
                         transformRequest: angular.identity,
                         headers: {'Content-Type': undefined}                     
                      }).success(function(d)
                          {
                    	  	$window.location.reload();
                          })        
                 }*/
           
             
			 $http({
			        method : "POST",
			        	url : "teams/"+$scope.team.id+"/logos",
				        data: fd,
				       // params:{file: $scope.myfile},
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}     
			    }).then(function mySuccess(response) {

			    	$scope.getTeam();
			    }, function myError(response) {

			        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
			    });
             
		 }
 
		 $scope.uploadCover = function(){
		     var fd = new FormData();
             fd.append('file', $scope.mycover);
                     
			 $http({
			        method : "POST",
			        	url : "teams/"+$scope.team.id+"/covers",
				        data: fd,
				       // params:{file: $scope.myfile},
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}     
			    }).then(function mySuccess(response) {

			    	$scope.getTeam();
			    }, function myError(response) {

			        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
			    });
             
		 }
		 
		 $scope.editPlayer = function (row){ 

			 $http({
		        method : "PUT",
		        	url : "players",
			        data: row,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {


		        alert("Οι αλλαγές αποθηκεύτηκαν με επιτυχία!");
		        
		    }, function myError(response) {

		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.addPlayer= function (){ 
			// $scope.result = $scope.newplayer;
			 $http({
		        method : "POST",
		        	url : "teams/"+$scope.team.id+"/players",
			        data: $scope.newplayer,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {
		    			$scope.newplayer={};
		    			$scope.getTeam();
				    		//$scope.newplayer = response.data;
				    		//$scope.result=$scope.newplayer;
		/*					 $http({
						        method : "PUT",
						        	url : "teams/"+$scope.team.id+"players/"+$scope.newplayer.id
						    }).then(function mySuccess(response) {
		
						    	$window.location.reload();
						    	
						    }, function myError(response) {
						  
						        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
						    });*/
			
		    	
		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.uploadPlayerImage = function(row){
		     var fd = new FormData();
             fd.append('file', row.playerimage);
                     
			 $http({
			        method : "POST",
			        	url : "players/"+row.id+"/images",
				        data: fd,
				       // params:{file: $scope.myfile},
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}     
			    }).then(function mySuccess(response) {
			    	//w= response.data;
			    	//$scope.result= row;
			    	$scope.getTeam();
			    	//$window.location.reload();
			    }, function myError(response) {

			        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
			    });
             
		 }
		 
		 
		 $scope.deletePlayer = function (row){ 
			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $http({
		        method : "DELETE",
		        	url : "players/"+row.id
		    }).then(function mySuccess(response) {
		    	$scope.getTeam();
		        
		    }, function myError(response) {

		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
});



