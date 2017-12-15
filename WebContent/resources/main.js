
var appMain = angular.module("appMain", ["ngRoute",'ngMaterial', 'ngMessages', 'material.svgAssetsCache']);

appMain.config(function($routeProvider) {
    $routeProvider

    .when("/eventlist", {
        templateUrl : "eventlist.html",
        controller: "eventsController"
 
    })
    .when("/phonebook", {
        templateUrl : "phonebook.html",
        controller: "contactsController"

    })
    .when("/event/:eventid", {
        templateUrl : "event.html",
        controller: "eventController"

    })
    .when("/newevent", {
        templateUrl : "newevent.html",
        controller: "newEventController"

    })
    .when("/contact/:contactid", {
        templateUrl : "contact.html",
        controller: "contactController"

    })
    .when("/championlist", {
        templateUrl : "championlist.html",
        controller: "championsController"

    })
    .when("/start", {
        templateUrl : "start.html"

    })
    .when("/admin", {
        templateUrl : "admin.html",
        controller: "adminController"

    })
   /*.when("/info/:name", {
        templateUrl : "info.htm",
        controller : "infoController"
    });*/
    
//>>theme1>>
/*    .when("/theme1/championlist", {
        templateUrl : "championlist.html",
        controller: "championsController"

    })*/
    .when("/home1", {
        templateUrl : "home1.html",
        controller: "championsController"

    })
    //<<theme1<<
    
});

//var appMain = angular.module("appMain",[]);
appMain.controller("eventsController",function($scope, $http, $location){
	


	//$scope.getContacts = function (){
		  
		 $http({
	        method : "GET",
	        url : "events"
	    }).then(function mySuccess(response) {

	        $scope.eventlist = response.data;
	      
	    }, function myError(response) {
	  
	        $scope.result = response.statusText;
	      
	    });
	    
		 $scope.visitEvent = function (eventid){
			 
			 $location.path('event/'+eventid); 
		 }
		 
	 $scope.setPath = function (){
		 //$location.path('event/1'); 
			 $location.path('newevent'); 
		 }

});

appMain.controller("eventController",function($scope, $http, $routeParams, $location){
	


	//$scope.getContacts = function (){
		  
		 $http({
	        method : "GET",
	        url : "events/"+$routeParams.eventid
	    }).then(function mySuccess(response) {

	        $scope.event = response.data;
	      
	    }, function myError(response) {
	  
	        $scope.result = response.statusText;
	      
	    });
		 
		 $http({
		        method : "GET",
		        url : "events/"+$routeParams.eventid+"/players"
		    }).then(function mySuccess(response) {

		        $scope.eventplayers = response.data;
		      
		    }, function myError(response) {
		  
		        $scope.result = response.statusText;
		      
		    });
		 
		 
		 $http({
		        method : "GET",
		        url : "events/"+$routeParams.eventid+"/messages"
		    }).then(function mySuccess(response) {

		        $scope.eventmessages = response.data;
		      
		    }, function myError(response) {
		  
		        $scope.result = response.statusText;
		      
		    });
		 

		 $scope.visitContact = function (contactid){
			 
			 $location.path('contact/'+contactid); 
		 }
		 
/*		 $scope.visitEvent = function (eventid){
			 
			 $window.location.href = 'main#!/event/'+eventid;
		 }
*/
});



appMain.controller("newEventController",function($scope, $http, $routeParams, $location){
	


	$scope.addEvent = function (){
		  
		 $http({
	        method : "POST",
	        url : "events",
	  	    params: {name:$scope.name, description:$scope.description, date:$scope.date}
	    }).then(function mySuccess(response) {

	    	$location.path('eventlist'); 
	    }, function myError(response) {
	    	$location.path('eventlist'); 
	        $scope.result = response.statusText;
	      
	    });
		 
	}
		 
	    
/*		 $scope.visitEvent = function (eventid){
			 
			 $window.location.href = 'main#!/event/'+eventid;
		 }
*/
});

appMain.controller("contactsController",function($scope, $http,$location){
	//$scope.contacts = "sdsss";
		$scope.getContacts = function (){
	  
		 $http({
	        method : "GET",
	        url : "contacts"
	    }).then(function mySuccess(response) {
	        $scope.contacts = response.data;
	      
	    }, function myError(response) {
	        $scope.contacts = response.statusText;
	      
	    });
			
		}
	//$scope.getWeather();
		$scope.$on('$viewContentLoaded', function() {
	    //call it here
		$scope.getContacts();
	});

		
		$scope.searchContacts = function (){
	        $scope.salaries = "";
	        
			var uri= "contacts/search/"+$scope.searchstr;  
			if($scope.searchstr=="")
				  uri = "contacts";  
			 $http({
		        method : "GET",
		        url : uri
		    }).then(function mySuccess(response) {
		        $scope.contacts = response.data;
		      
		    }, function myError(response) {
		        $scope.contacts = response.statusText;
		      
		    });
				
			}
		//$scope.getWeather();
			$scope.$on('$viewContentLoaded', function() {
		    //call it here
			$scope.getContacts();
		});
			 $scope.visitContact = function (contactid){
				 
				 $location.path('contact/'+contactid); 
			 }
		
				//$scope.getWeather();
					$scope.$on('$viewContentLoaded', function() {
				    //call it here
					$scope.getContacts();
				});
				
	});


appMain.controller("contactController",function($scope, $http, $routeParams,$location){
	
	//$scope.getContacts = function (){
		  
				 $http({
			        method : "GET",
			        url : "contacts/"+$routeParams.contactid
			    }).then(function mySuccess(response) {
		
			        $scope.contact = response.data;
			      
			    }, function myError(response) {
			  
			        $scope.result = response.statusText;
			      
			    });
		 

				 $http({
			        method : "GET",
			        url : "contacts/"+$routeParams.contactid+"/salaries"
			    }).then(function mySuccess(response) {
			        $scope.salaries = response.data;
			      
			    }, function myError(response) {
			        $scope.result = response.statusText;
			      
			    });

				 $http({
			        method : "GET",
			        url : "contacts/"+$routeParams.contactid+"/events"
			    }).then(function mySuccess(response) {
			        $scope.events = response.data;
			      
			    }, function myError(response) {
			        $scope.result = response.statusText;
			      
			    });
				 $scope.visitEvent = function (eventid){
					 
					 $location.path('event/'+eventid); 
				 }


});
//var appMain = angular.module("appMain",[]);
appMain.controller("championsController",function($scope, $http, $location, $window){
	
	 $scope.championlist ="";
	 $scope.champion;
	 
	//$scope.getContacts = function (){
		  
		 $http({
	        method : "GET",
	        url : "champions"
	    }).then(function mySuccess(response) {

	        $scope.championlist = response.data;
	        $scope.getChampion($scope.championlist[0]);
	    }, function myError(response) {
	  
	        $scope.result = response.statusText;
	      
	    });
		 
		 $scope.getChampion = function (row){
			 $scope.champion =row;
			 $scope.matchday="";
			 
			 $http({
			        method : "GET",
			        url : "champions/"+row.id+"/teamgroups"
			    }).then(function mySuccess(response) {

			        $scope.teamgrouplist = response.data;

			    }, function myError(response) {
			  
			        $scope.result = response;//;"/champions/"+row.id+"/teamgroups";
			      
			    });
		 }
		 
		 $scope.getMatchdays = function (row){
			 //$scope.teamgroup =row;
			// $scope.matchday = row.matchdays;
			 
			 $http({
			        method : "GET",
			        url : "teamgroups/"+row.id+"/matchdays"
			    }).then(function mySuccess(response) {

			    	$scope.matchday = response.data;
			    	row.standings.matchdays=response.data;
			    }, function myError(response) {
			  
			        $scope.result = response;//;"/champions/"+row.id+"/teamgroups";
			      
			    });
			 
		 }
		 $scope.adminAddChampion = function (){
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
			  
			        $scope.modalResult = "An Error occured. Try again.";
			      
			    });
			 
		 }
		 $scope.adminDeleteChampion = function (id){

		      $scope.modalResult = "";
			 $http({
			        method : "DELETE",
			        url : "champions/"+id
			    }).then(function mySuccess(response) {
			    	$window.location.reload();
			    }, function myError(response) {
			        $scope.modalResult = "An Error occured. Try again.";
			    });
		 }
		 
		
			    $scope.cssLiChampionClass = function (row) {
			    	if(row.id==$scope.champion.id)
			    		return "css_li_champion_active";
			    	else return "css_li_champion"
			    };
	

});

appMain.controller("teamdetailController",function($scope, $http, $location){
	var teamid = location.search.split('teamid=')[1]
	//var teamid = $location.search().teamid; 
	 //$scope.games = teamid;
	
	 $http({
	        method : "GET",
	        url : "teams/"+teamid
	    }).then(function mySuccess(response) {

	        $scope.team = response.data;
	      
	    }, function myError(response) {
	    	
	        //$scope.result = response.statusText;
	      
	    });
	
		 $http({
	        method : "GET",
	        url : "teams/"+teamid+"/games"
	    }).then(function mySuccess(response) {

	        $scope.games = response.data;
	      
	    }, function myError(response) {
	    	
	        //$scope.result = response.statusText;
	      
	    });
	 $http({
	        method : "GET",
	        url : "teams/"+teamid+"/standings"
	    }).then(function mySuccess(response) {

	        $scope.standings = response.data;
	      
	    }, function myError(response) {
	    	
	        //$scope.result = response.statusText;
	      
	    });
	    
	 $http({
	        method : "GET",
	        url : "teams/"+teamid+"/players",
	    }).then(function mySuccess(response) {

	        $scope.players = response.data;
	      
	    }, function myError(response) {
	    	
	        //$scope.result = response.statusText;
	      
	    });
	 
/*		 $scope.visitEvent = function (eventid){
			 
			 $location.path('event/'+eventid); 
		 }*/
		 
/*	 $scope.setPath = function (){
		 //$location.path('event/1'); 
			 $location.path('newevent'); 
		 }*/

});

appMain.controller("headerController",function($scope, $http, $location){

	    
	 $http({
	        method : "GET",
	        url : "champions",
	    }).then(function mySuccess(response) {

	        $scope.headerChampions = response.data;
	      
	    }, function myError(response) {
	    	
	        //$scope.result = response.statusText;
	      
	    });
	 
/*		 $scope.visitEvent = function (eventid){
			 
			 $location.path('event/'+eventid); 
		 }*/
		 
/*	 $scope.setPath = function (){
		 //$location.path('event/1'); 
			 $location.path('newevent'); 
		 }*/

});

appMain.controller("headerController",function($scope, $http, $location){

    
	 $http({
	        method : "GET",
	        url : "champions",
	    }).then(function mySuccess(response) {

	        $scope.headerChampions = response.data;
	      
	    }, function myError(response) {
	    		      
	    });
	 
});

appMain.controller("teamlistController",function($scope, $http, $location){

    
	 $http({
	        method : "GET",
	        url : "teams",
	    }).then(function mySuccess(response) {

	        $scope.teams = response.data;
	      
	    }, function myError(response) {
	    		      
	    });
	 
});

