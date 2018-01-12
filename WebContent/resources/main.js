
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

    })
    .when("/editteam", {
        templateUrl : "editteam",
        controller: "teamController"

    })
/*    .when("/", {
            templateUrl : "home1",
            controller: "homeController"

    })*/
    .when("/home", {
        templateUrl : "home1",
        controller: "homeController"

})

    .when("/gallery", {
            templateUrl : "gallery",
            controller: "galleryController"

    })
    .when("/contactus", {
        templateUrl : "contactus"

})
.when("/calendar", {
    templateUrl : "calendar",
    controller: "calendarController"

})
    /*.
     $routeProvider.otherwise({redirectTo: '/index'});*/
 /* $locationProvider.html5Mode(true); */
    //<<theme1<<
    
});


appMain.directive('fileModel', ['$parse', function ($parse) {
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

appMain.run(function($rootScope, $window) {
    $rootScope.$on("$locationChangeStart", function(event, next, current) { 
        // handle route changes    
    	window.scrollTo(0, 0);
/*    	if($rootScope.lastpage!=window.location.href)
    		window.scrollTo(0, 0);
    	else
    		window.scrollTo(300, 0);*/
    	$rootScope.lastpage = $rootScope.currentpage;
    	$rootScope.currentpage=window.location.href; 
    	//$rootScope.length = window.innerWidth;
    	  if(window.innerWidth<650)
    		  $rootScope.desktop=false;
    	    else
    	    	$rootScope.desktop=true;
    		
    		$(window).resize(function() {
    	
    			$rootScope.$apply(function(){
    		    	//$rootScope.length = window.innerWidth;
    			    if(window.innerWidth<650)
    			    	$rootScope.desktop=false;
    		    else
    		    	$rootScope.desktop=true;
    		        //do something to update current scope based on the new innerWidth and let angular update the view.
    		    });
    		});
    	    
    	  //  $rootScope.$on('$viewContentLoaded', function() {
    	    	//if(next.indexOf("#!/home") !== -1)//;=="http://localhost:60000/phonebook/soccer.html")
        	    	if(next.indexOf("#!/home") !== -1)//;=="http://localhost:60000/phonebook/soccer.html")
    	    	//	$rootScope.isIndex=true;
    	    		$rootScope.indexClass="own-visible";
    	    	else
    	    		$rootScope.indexClass="own-hidden";
    	    	//	$rootScope.isIndex=false;
    		//});
    		

    });
    
    

});


appMain.directive('prettyp', function(){
	return function(scope, element, attrs){
		$("[rel^='prettyPhoto']").prettyPhoto({deeplinking: false});
		}
		})

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
              if (items[i].date||(items[i].score1&&items[i].score2))  {
                  result.push(items[i]);
              }
          }            
          return result;
    };
});


appMain.filter('playoffPhase', function() {
    return function(items, phase) {
    	  var result = [];   
    	  for (var i=0; i<items.length; i++){
              if (items[i].phase==phase)  {
                  result.push(items[i]);
              }
          }            
          return result;
    };
});


//var appMain = angular.module("appMain",[]);
appMain.controller("galleryController",function($scope, $http, $location){ 
	
	  
	 $http({
       method : "GET",
       url : "albums"
   }).then(function mySuccess(response) {

       $scope.albums = response.data;
     
   }, function myError(response) {
 
       $scope.result = response.statusText;
     
   });

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
appMain.controller("homeController",function($scope, $http, $routeParams, $location){


	

	 
	 $http({
	        method : "GET",
	        url : "news",
	        params:{headersonly:1,count:5}
	    }).then(function mySuccess(response) {

	        $scope.news = response.data;


	    }, function myError(response) {

	    	
	        //$scope.result = response.statusText;
	      
	    });
	 
	
	 
	 
	 $http({
	        method : "GET",
	        url : "games?upcoming"
	    }).then(function mySuccess(response) {

	        $scope.upcominggames = response.data;


	    }, function myError(response) {

	    	
	        //$scope.result = response.statusText;
	      
	    });
	 
	 $http({
	        method : "GET",
	        url : "games?lastresults"
	    }).then(function mySuccess(response) {

	        $scope.lastresults = response.data;


	    }, function myError(response) {

	    	
	        //$scope.result = response.statusText;
	      
	    });
	 
});

appMain.controller("matchController",function($scope, $http, $routeParams, $location){


	
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
	 $scope.phases=[];
	 $scope.phases.push(32);
	 $scope.phases.push(16);
	 $scope.phases.push(8);
	 $scope.phases.push(4);
	 $scope.phases.push(2);
	// window.scrollTo(0, 0);
/*	  if(window.innerWidth<500)
	    	$scope.desktop=false;
	    else
	    	$scope.desktop=true;
		
		$(window).resize(function() {
	
		    $scope.$apply(function(){
			    if(window.innerWidth<500)
		    		$scope.desktop=false;
		    else
		    		$scope.desktop=true;
		        //do something to update current scope based on the new innerWidth and let angular update the view.
		    });
		});*/
	 
	 

	 
	 
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
			 
			 $http({
			        method : "GET",
			        url : "champions/"+row.id+"/playoffs"
			    }).then(function mySuccess(response) {

			        $scope.champion.playoffgames = response.data;
			
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
		 

		 $scope.getPlayoffTitle = function (phase){
				switch(phase) {
				case 32:
					return "ΦΑΣΗ ΤΩΝ 32"
				case 16:
					return "ΦΑΣΗ ΤΩΝ 16"
				case 8:
					return "ΠΡΟΗΜΙΤΕΛΙΚΑ"
				case 4:
					return "ΗΜΙΤΕΛΙΚΑ"
				case 2:
					return "ΤΕΛΙΚΟΣ"
					break;
				default:
				
				return;
				}
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

appMain.controller("teamdetailController",function($scope, $http, $location, $routeParams, $window){
	//var teamid = location.search.split('teamid=')[1];
	//var teamid = $location.search().teamid; 
	 //$scope.games = teamid;
		/*$scope.currentpage=window.location.href; 
		window.scrollTo(0, 0);
		
	  if(window.innerWidth<500)
	    	$scope.desktop=false;
	    else
	    	$scope.desktop=true;
		
		$(window).resize(function() {
	
		    $scope.$apply(function(){
			    if(window.innerWidth<500)
		    		$scope.desktop=false;
		    else
		    		$scope.desktop=true;
		        //do something to update current scope based on the new innerWidth and let angular update the view.
		    });
		});
		*/
/*		$(window).resize(function() {
		 
		    if(window.innerWidth<500)
		    	{
		    		alert(false);
		    		$scope.desktop=false;
		    	}
		    else
		    	{
	    			alert(true);
		    		$scope.desktop=true;
		    	}
		    	
		});
		*/
	    $scope.getLocation = function(){
	        return document.location.href; 
	   } 
		
	    
	    
	    $scope.followTeam = function (row){ 

			 $http({
			        method : "POST",
			        url : "teams/"+row.id+"/followers"
			    }).then(function mySuccess(response) {

			        ///$scope.teams = response.data;
			        //alert("'Εγινε!");
			        $scope.getFollowingTeams();
			    }, function myError(response) {
			    	alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");     
			    });
			 
		 }
		 
		 $scope.getFollowingTeams = function (){ 

			 $http({
			        method : "GET",
			        url : "followers"
			    }).then(function mySuccess(response) {
			    	if(response.data.length>0)
		    		{

			    		$scope.followingteam = response.data[0];
			    		
			    	  	try{
					    	Android.getFollowers(response.data[0].id); }
					    	catch(err){}
				    	
		    		}
		    	else {
		    		

			    		$scope.followingteam =null;
			    		
			    	  	try{
					    	Android.getFollowers(""); }
					    	catch(err){}
				    	
		    	}
			        //alert(response.data[0].id);
			    }, function myError(response) {
			    	//alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");     
			    });
			 
		 }
		 $scope.getFollowingTeams();
		 $scope.isFollowed = function (row){
			 
			 if($scope.followingteam!=null&&row.id==$scope.followingteam.id)
				 return "btn red-btn";
			 else
				 return "btn black-btn";

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

	//window.scrollTo(0, 0);
	/*$scope.isIndex=true;*/
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
	//window.scrollTo(0, 0);

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


	//window.scrollTo(0, 0);
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
	 
	 $scope.getMyTeamLink = function (){ 

		 $http({
		        method : "GET",
		        url : "followers"
		    }).then(function mySuccess(response) {

		        //$scope.followingteam = response.data[0];
		    	$location.path( "team-detail.html/"+response.data[0].id );
		    	

		        //return "#!team-detail.html/"+response.data[0].id;
		    }, function myError(response) {
		    	alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");     
		    });
		 
	 }
	 
	 
	 //$scope.getFollowingTeams = function (){ 

		 $http({
		        method : "GET",
		        url : "followers"
		    }).then(function mySuccess(response) {
		    	if(response.data.length>0)
		    		{
		    		//alert("xa");
			    		//$scope.followingteam = response.data[0];
			    		
			    	  	try{
					    	Android.getFollowers(response.data[0].id); }
					    	catch(err){}
				    	
		    		}
		    	else {
		    		

			    		//$scope.followingteam =null;
			    		
			    	  	try{
					    	Android.getFollowers(""); }
					    	catch(err){}
				    	
		    	}
		    	
		  
		        //alert(response.data[0].id);
		    }, function myError(response) {
		    	//alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");     
		    });
		 
	 //}
	 
});

appMain.controller("teamlistController",function($scope, $http, $location){

	
	 $http({
	        method : "GET",
	        url : "teams",
	    }).then(function mySuccess(response) {

	        $scope.teams = response.data;
	      
	    }, function myError(response) {
	    		      
	    });
	 
	 $scope.followTeam = function (row){ 

		 $http({
		        method : "POST",
		        url : "teams/"+row.id+"/followers"
		    }).then(function mySuccess(response) {

		        ///$scope.teams = response.data;
		        //alert("'Εγινε!");
		        $scope.getFollowingTeams();
		    }, function myError(response) {
		    	alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");     
		    });
		 
	 }
	 
	 $scope.getFollowingTeams = function (){ 

		 $http({
		        method : "GET",
		        url : "followers"
		    }).then(function mySuccess(response) {
		    	if(response.data.length>0)
		    		{

			    		$scope.followingteam = response.data[0];
			    		
			    	  	try{
					    	Android.getFollowers(response.data[0].id); }
					    	catch(err){}
				    	
		    		}
		    	else {
		    		

			    		$scope.followingteam =null;
			    		
			    	  	try{
					    	Android.getFollowers(""); }
					    	catch(err){}
				    	
		    	}
		    	
		  
		        //alert(response.data[0].id);
		    }, function myError(response) {
		    	//alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");     
		    });
		 
	 }
	 $scope.getFollowingTeams();
	 $scope.isFollowed = function (row){
		 
		 if($scope.followingteam!=null&&row.id==$scope.followingteam.id)
			 return "btn red-btn";
		 else
			 return "btn black-btn";

	 }
});

appMain.controller("teamController",function($scope, $http, $location, $window){

	 
	/* $scope.getTeams = function (){ */ 
/*		 $http({
	        method : "GET",
	        url : "teams"
	    }).then(function mySuccess(response) {

	        $scope.teams = response.data;
	      
	    }, function myError(response) {

		      alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
	      
	    });*/
/*	 }*/
	 

			$scope.$on('$viewContentLoaded', function() {
			    //call it here
				$scope.getTeam();
			});
		 $scope.getTeam = function (){ 
    	 $scope.result = "teams/"+$scope.teamid+"/players";
		        $scope.team = "";
			 $http({
		        method : "GET",
		        url : "teams/"+$scope.teamid
		    }).then(function mySuccess(response) {
		        $scope.team = response.data;
				 $http({
				        method : "GET",
				        url : "teams/"+$scope.teamid+"/players"
				    }).then(function mySuccess(response) {
				        $scope.players = response.data;
				    }, function myError(response) {
				  
				        //alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
				    });

		    }, function myError(response) {
		  
		        //alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
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


appMain.controller("calendarController",function($scope, $http, $location, $window){
	
	events=[];
	

	 $http({
	        method : "GET",
	        url : "games?calendargames"
	    }).then(function mySuccess(response) {

	        $scope.upcominggames = response.data;
	    
            for(i=0;i<$scope.upcominggames.length;i++)
            {
            	var event={};
            	if($scope.upcominggames[i].champion.enabled)
            	{
                	var date = new Date($scope.upcominggames[i].date);
                	event.id = $scope.upcominggames[i].id;
                	event.title = $scope.upcominggames[i].team1.name+" - "+$scope.upcominggames[i].team2.name +" ("+$scope.upcominggames[i].champion.name+")";
                	event.start = date;
                	var enddate = new Date(date);
                	enddate.setHours(enddate.getHours() + 1);
                	event.end = enddate;
                    events.push(event);
            	}

            }
	    	$scope.showCalendar();
	    /*	$scope.result=events;*/
 
	    }, function myError(response) {
	    	$scope.showCalendar();
	    	
	        //$scope.result = response.statusText;
	      
	    });
	
	
/*$(document).ready(function() {*/

	 $scope.showCalendar = function (){ 
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next, today',
        center: 'title',
        right: 'listWeek,listDay,month,agendaWeek,agendaDay'
      },

      // customize the button names,
      // otherwise they'd all just say "list"
      views: {
        listDay: { buttonText: 'Ημέρα' },
        listWeek: { buttonText: 'Βδομάδα' },
        month: { buttonText: 'Μήνας' },
        agendaWeek: { buttonText: 'Αντζέντα βδομάδας' },
        agendaDay: { buttonText:  'Αντζέντα ημέρας' }
      },

      defaultView: 'listWeek',
      defaultDate: new Date(),
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectHelper: true,
      select: function(start, end) {
    	  alert("Καλέστε στο ... για να κάνετε κράτηση!");
/*        var title = prompt('Event Title:');
        var eventData;
        if (title) {
          eventData = {
            title: title,
            start: start,
            end: end
          };
          $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
        }
        $('#calendar').fullCalendar('unselect');*/
      },
      editable: false,
      eventLimit: true, // allow "more" link when too many events
      events: events
    });
	 }
 /* });*/

});