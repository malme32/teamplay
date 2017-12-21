
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

    .when("/point-table.html", {
        templateUrl : "point-table.html",
        controller: "championsController"

    })
    .when("/news-list.html", {
        templateUrl : "news-list.html",
        controller: "newsController"

    })
    .when("/team-list.html", {
        templateUrl : "team-list.html",
        controller: "teamlistController"

    })
    .when("/news-detail.html/:id", {
        templateUrl : "news-detail.html",
        controller: "newsDetailController"

    })
    .when("/team-detail.html/:id", {
        templateUrl : "team-detail.html",
        controller: "teamdetailController"

    })
    .when("/match.html/:id", {
        templateUrl : "match.html",
        controller: "matchController"

    });/*.
     $routeProvider.otherwise({redirectTo: '/index'});*/
 /* $locationProvider.html5Mode(true); */
    //<<theme1<<
    
});
//appMain.directive('fbComments', function() {
appMain.
directive('fbComments', function() {
    return {
        restrict: 'C',
        link: function(scope, element, attributes) { 
            element[0].dataset.href = document.location.href;
            return typeof FB !== "undefined" && FB !== null ? FB.XFBML.parse(element.parent()[0]) : void 0;
        }
    };
});

/*appMain.directive('fbCommentBox', function() {
	  function createHTML(href, numposts, colorscheme, width) {
			
	    return '<div class="fb-comments" ' +
	      'data-href="' + href + '" ' +
	      'data-numposts="' + numposts + '" ' +
	      'data-colorsheme="' + colorscheme + '" ' +
	      'data-width="' + width + '">' +
	      '</div>';
	  }

	  return {
	    restrict: 'A',
	    scope: {},
	    link: function postLink(scope, elem, attrs) {
	      attrs.$observe('pageHref', function(newValue) {
	        var href = newValue;
	        var numposts = attrs.numposts || 5;
	        var colorscheme = attrs.colorscheme || 'light';
	        var width = attrs.width || '100%';
	        elem.html(createHTML(href, numposts, colorscheme, width));
	        FB.XFBML.parse(elem[0]);
	      });
	    }
	  };
	});*/

appMain.filter('validDate', function() {
    return function(items) {
    	  var result = [];   
    	  for (var i=0; i<items.length; i++){
              if (items[i].date)  {
                  result.push(items[i]);
              }
          }            
          return result;
    };
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


appMain.controller("matchController",function($scope, $http, $routeParams, $location){

	$scope.currentpage=window.location.href; 
	 $http({
	        method : "GET",
	        url : "games/"+$routeParams.id
	    }).then(function mySuccess(response) {

	        $scope.game = response.data;
	      
	    }, function myError(response) {
	  
	        //$scope.result = response.statusText;
	      
	    });
	 
	 
	 $http({
	        method : "GET",
	        url : "news",
	        params:{headersonly:1,count:6}
	    }).then(function mySuccess(response) {

	        $scope.news = response.data;


	    }, function myError(response) {

	    	
	        //$scope.result = response.statusText;
	      
	    });
	 
	
	 
	 
	 $http({
	        method : "GET",
	        url : "games/"+$routeParams.id+"/scorers"
	    }).then(function mySuccess(response) {
	    	$scope.scorers = response.data;
	    	
	    }, function myError(response) {
	  
	        $scope.result = response;//;"/champions/"+row.id+"/teamgroups";
	        
	        
	      
	    });
	 
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
	 
	 
	 $http({
	        method : "GET",
	        url : "news",
	        params:{headersonly:1,count:6}
	    }).then(function mySuccess(response) {

	        $scope.news = response.data;


	    }, function myError(response) {

	    	
	        //$scope.result = response.statusText;
	      
	    });
	 
	 
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
			 
			 
			 $http({
			        method : "GET",
			        url : "teamgroups/"+row.id+"/scorers"
			    }).then(function mySuccess(response) {

			    	var scorer_tmp = response.data;
			    	row.scorers=[] ;
			  
			    	for(i=0;i<scorer_tmp.length&&i<10;i++)
		    		{
			    		var found=false;
			    		if(row.scorers)
			    			for(k=0;k<row.scorers.length;k++)
			    			{
			    					if((row.scorers[k].contact.id==scorer_tmp[i].contact.id))
			    						{
					    						row.scorers[k].number= row.scorers[k].number+ scorer_tmp[i].number;
					    						found=true;
					    						break;
			    						}
			    			}
			    		
		    	
		    			if(!found)
		    				row.scorers.push(scorer_tmp[i]);
		  
		    		}
			    	
			    }, function myError(response) {
			  
			        //$scope.result = response;//;"/champions/"+row.id+"/teamgroups";
			        
			        
			      
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

appMain.controller("teamdetailController",function($scope, $http, $location, $routeParams){
	//var teamid = location.search.split('teamid=')[1];
	//var teamid = $location.search().teamid; 
	 //$scope.games = teamid;
		$scope.currentpage=window.location.href; 

		
	    $scope.getLocation = function(){
	        return document.location.href; 
	   } 
		
	 $http({
	        method : "GET",
	        url : "teams/"+$routeParams.id
	    }).then(function mySuccess(response) {

	        $scope.team = response.data;
	      
	    }, function myError(response) {
	    	
	        //$scope.result = response.statusText;
	      
	    });
	
		 $http({
	        method : "GET",
	        url : "teams/"+$routeParams.id+"/games"
	    }).then(function mySuccess(response) {

	        $scope.games = response.data;
	      
	    }, function myError(response) {
	    	
	        //$scope.result = response.statusText;
	      
	    });
	 $http({
	        method : "GET",
	        url : "teams/"+$routeParams.id+"/standings"
	    }).then(function mySuccess(response) {

	        $scope.standings = response.data;
	      
	    }, function myError(response) {
	    	
	        //$scope.result = response.statusText;
	      
	    });
	    
	 $http({
	        method : "GET",
	        url : "teams/"+$routeParams.id+"/players",
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

/*appMain.controller("headerController",function($scope, $http, $location){

	    
	 $http({
	        method : "GET",
	        url : "champions",
	    }).then(function mySuccess(response) {

	        $scope.headerChampions = response.data;
	      
	    }, function myError(response) {
	    	
	        //$scope.result = response.statusText;
	      
	    });*/

/*		 $scope.visitEvent = function (eventid){
			 
			 $location.path('event/'+eventid); 
		 }*/
		 
/*	 $scope.setPath = function (){
		 //$location.path('event/1'); 
			 $location.path('newevent'); 
		 }*/

/*});*/

appMain.controller("indexController",function($scope, $http, $location){



/*	 $http({
	        method : "GET",
	        url : "news",
	        params:{headersonly:1,count:4}
	    }).then(function mySuccess(response) {

	        $scope.news = response.data;


	    }, function myError(response) {

	    	
	        //$scope.result = response.statusText;
	      
	    });*/

	 
});

appMain.controller("newsDetailController",function($scope, $http, $location,$routeParams){


	//var id = location.search.split('id=')[1];
	 $http({
	        method : "GET",
	        url : "news/"+$routeParams.id
	    }).then(function mySuccess(response) {

	        $scope.notice = response.data;


	    }, function myError(response) {

	      
	    });
	 
	 
});

appMain.controller("newsController",function($scope, $http, $location){



	 $http({
	        method : "GET",
	        url : "news",
	        params:{headersonly:1}
	    }).then(function mySuccess(response) {

	        $scope.news = response.data;


	    }, function myError(response) {

	      
	    });
	 
	 
});

appMain.controller("headerController",function($scope, $http, $location){

    
	 $http({
	        method : "GET",
	        url : "champions",
	    }).then(function mySuccess(response) {

	        $scope.headerChampions = response.data;
	      
	    }, function myError(response) {
	    		      
	    });
	 

	 $http({
	        method : "GET",
	        url : "news",
	        params:{headersonly:1,count:4}
	    }).then(function mySuccess(response) {

	        $scope.news = response.data;


	    }, function myError(response) {

	    	
	        //$scope.result = response.statusText;
	      
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

