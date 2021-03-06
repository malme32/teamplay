
var appMain = angular.module("appMain", ["ngRoute",'ngMaterial', 'ngMessages', 'material.svgAssetsCache', 'ngSanitize']);

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

    .when("/point-table.html/:championid", {
        templateUrl : "point-table.html",
        controller: "championsController"

    })
    .when("/custompage/:custompageid", {
        templateUrl : "custompage",
        controller: "custompageController"

    })
    .when("/news-list.html", {
        templateUrl : "news-list.html",
        controller: "newsController"

    })
    .when("/team-list.html", {
        templateUrl : "team-list.html",
        controller: "teamlistController"

    })
    .when("/message-list.html", {
        templateUrl : "message-list.html",
        controller: "messageListController"

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
.when("/chat/:friendid", {
    templateUrl : "chat",
    controller: "chatController"

})
    /*.
     $routeProvider.otherwise({redirectTo: '/index'});*/
 /* $locationProvider.html5Mode(true); */
    //<<theme1<<
    
});
appMain.filter('reverse', function() {
	  return function(items) {
	    return items.slice().reverse();
	  };
	});


appMain.filter('parseUrl', function() {
    var urls = /(\b(https?|ftp):\/\/[A-Z0-9+&@#\/%?=~_|!:,.;-]*[-A-Z0-9+&@#\/%=~_|])/gim
    var emails = /(\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})/gim

    return function(text) {        
        if(text.match(urls)) {
            text = text.replace(urls, "<a href=\"$1\" target=\"_blank\">$1</a>")
        }
        if(text.match(emails)) {
            text = text.replace(emails, "<a href=\"mailto:$1\">$1</a>")
        }

        return text       
    }
})

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

appMain.run(function($rootScope, $window, $http, $timeout,$location) {
	
	
	$rootScope.onFocus = function(){
		if($rootScope.isAndroid)
		{
			return Android.isForeground()&document.hasFocus();
		}
		else
			return document.hasFocus();
	}

	
	try{
    	Android;$rootScope.indexClass="own-hidden";

		$rootScope.isAndroid=true;}
		catch(err){
			$rootScope.isAndroid=false;
			
		}
		$rootScope.mlastid=0;
		$rootScope.getNotifications = function (){
		 if(!$rootScope.onFocus())
		 {

		    	$timeout($rootScope.getNotifications, 500);   
		    	return;
		 }

		 //alert($rootScope.mlastid);
	 if( $rootScope.notification!=null)
			 if( $rootScope.notification.messages.length>0)
				 {
				 	for(i=0;i<$rootScope.notification.messages.length;i++)
				 		if($rootScope.notification.messages[i].id>$rootScope.mlastid)
				 			$rootScope.mlastid = $rootScope.notification.messages[i].id;
				 }
	// alert($rootScope.mlastid);
	   	 $http({
		        method : "GET",
		        	url : "notifications",
		        	params:{getunseenmessages:"getunseenmessages",lastid:$rootScope.mlastid,delay:15000}
		    }).then(function mySuccess(response) {
		    	//alert(response.data);
		    	if(response.data)
		    		$rootScope.notification = response.data;
		   	 $timeout($rootScope.getNotifications, 5000);
		    }, function myError(response) {
		    	//alert(error);

		   	 $timeout($rootScope.getNotifications, 20000);
		    });
		 }
  	 
		
	
	
	 
	
   	 $http({
	        method : "GET",
	        	url : "logins"
	    }).then(function mySuccess(response) {

			
	    	$rootScope.loggedin = response.data;
	    	if($rootScope.isAndroid)
	    	{
	    		if(response.data)
	    			{
	
			    	  	try{
					    	Android.setUsername(response.data.id)}
					    	catch(err){}
			    	
	    			}
	    		else
	    			{

		    	  	try{
				    	Android.setUsername("")}
				    	catch(err){}
		    	
	    			}
	    	}
	    	
	    	if(response.data&&response.data.username=="admin")
	    		$rootScope.isAdmin = true;
	    	else
	    		$rootScope.isAdmin = false;
	    	
	    	 if($rootScope.loggedin)
	    		 $timeout($rootScope.getNotifications, 10);
	    	 
	    }, function myError(response) {
	    	
	    });
	 
    $rootScope.$on("$locationChangeStart", function(event, next, current) { 
    	
	if(next.indexOf("#!")==-1)
		$location.path('home');

		 

			// alert(1);
/*		 $http({
		        method : "GET",
		        url : "events"
		    }).then(function mySuccess(response) {
		    	alert(response.data);
		    	$rootScope.eventlist = response.data;
		      
		    }, function myError(response) {

		    	alert("error");
		      
		    });*/
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
        	    	if(next.indexOf("#!/home") !== -1&&!$rootScope.isAndroid)//;=="http://localhost:60000/phonebook/soccer.html")
    	    	//	$rootScope.isIndex=true;
        	    		{
        	    		$rootScope.indexClass="own-visible";
        	    		
        	    		}
    	    	else
    	    		{
    	    		
    	    		$rootScope.indexClass="own-hidden";
    	    		}
    	    	//	$rootScope.isIndex=false;
    		//});
        	    

        	    	if(next.indexOf("#!/chat") !== -1)//;=="http://localhost:60000/phonebook/soccer.html")
						$rootScope.hideFooter=true;
        	    	else
						$rootScope.hideFooter=false;
        	    		
        	    	
        	 

        		 
        	    	
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





appMain.filter('timeago', function() {
    return function(input, p_allowFuture) {
	
        var substitute = function (stringOrFunction, number, strings) {
                var string = angular.isFunction(stringOrFunction) ? stringOrFunction(number, dateDifference) : stringOrFunction;
                var value = (strings.numbers && strings.numbers[number]) || number;
                return string.replace(/%d/i, value);
            },
            nowTime = (new Date()).getTime(),
            date = (new Date(input)).getTime(),
            //refreshMillis= 6e4, //A minute
            allowFuture = p_allowFuture || false,
            strings= {
                prefixAgo: '',
                prefixFromNow: '',
                suffixAgo: "ago",
                suffixFromNow: "from now",
                seconds: "less than a minute",
                minute: "about a minute",
                minutes: "%d minutes",
                hour: "about an hour",
                hours: "about %d hours",
                day: "a day",
                days: "%d days",
                month: "about a month",
                months: "%d months",
                year: "about a year",
                years: "%d years"
            },
            dateDifference = nowTime - date,
            words,
            seconds = Math.abs(dateDifference) / 1000,
            minutes = seconds / 60,
            hours = minutes / 60,
            days = hours / 24,
            years = days / 365,
            separator = strings.wordSeparator === undefined ?  " " : strings.wordSeparator,
        
           
            prefix = strings.prefixAgo,
            suffix = strings.suffixAgo;
            
        if (allowFuture) {
            if (dateDifference < 0) {
                prefix = strings.prefixFromNow;
                suffix = strings.suffixFromNow;
            }
        }

        words = seconds < 45 && substitute(strings.seconds, Math.round(seconds), strings) ||
        seconds < 90 && substitute(strings.minute, 1, strings) ||
        minutes < 45 && substitute(strings.minutes, Math.round(minutes), strings) ||
        minutes < 90 && substitute(strings.hour, 1, strings) ||
        hours < 24 && substitute(strings.hours, Math.round(hours), strings) ||
        hours < 42 && substitute(strings.day, 1, strings) ||
        days < 30 && substitute(strings.days, Math.round(days), strings) ||
        days < 45 && substitute(strings.month, 1, strings) ||
        days < 365 && substitute(strings.months, Math.round(days / 30), strings) ||
        years < 1.5 && substitute(strings.year, 1, strings) ||
        substitute(strings.years, Math.round(years), strings);
		console.log(prefix+words+suffix+separator);
		prefix.replace(/ /g, '')
		words.replace(/ /g, '')
		suffix.replace(/ /g, '')
		
		substitute.$stateful = true;
		return (prefix+' '+words+' '+suffix+' '+separator);
        
    };
});





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

appMain.filter('nextGames', function() {
    return function(items) {
    	  var result = [];   
    	  var d1 = new Date();
    	  for (var i=0; i<items.length; i++){
    		  if(!items[i].champion.enabled)
    			  continue;
              if (items[i].date>=d1&&!items[i].score1&&!items[i].score2)  {
                  result.push(items[i]);
              }
          }            
          return result;
    };
});

appMain.filter('lastResults', function() {
    return function(items) {
    	  var result = [];   
    	  var d1 = new Date();
    	  for (var i=0; i<items.length; i++){
    		  if(!items[i].champion.enabled)
    			  continue;
              if (items[i].score1&&items[i].score2)  {
                  result.push(items[i]);
              }
          }            
          return result;
    };
});

appMain.filter('otherGames', function() {
    return function(items) {
    	  var result = [];   
    	  var d1 = new Date();
    	  for (var i=0; i<items.length; i++){
    		  if(!items[i].champion.enabled)
    			  continue;
              if ((!items[i].date||items[i].date<d1)&&(!items[i].score1||!items[i].score2))  {
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
	        url : "news?option=important"
	    }).then(function mySuccess(response) {

	        $scope.importantnews = response.data;


	    }, function myError(response) {

	    	
	        //$scope.result = response.statusText;
	      
	    });
	 
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
appMain.controller("championsController",function($scope, $http, $location, $window,$routeParams){
	   

    
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
	        var found = false;
		    if($routeParams.championid == "start"&&$scope.championlist.length>0)
		    {
		    	for(i=$scope.championlist.length-1;i>=0;i--)
		    		{
		    			if($scope.championlist[i].enabled)
		    			{
		    				found = true;
				    		$scope.getChampion($scope.championlist[i].id);
				    		break;
		    			
		    			}
		    		}
		    	if(!found)
		    		{
		    			$scope.teamgrouplist = [];
		    			$scope.champion = {};
		    			$scope.champion.playoffgames = [];

		    		}
		    }
		    else if($scope.championlist.length>0){
		    	$scope.getChampion($routeParams.championid);
		    }
	        
	        //$scope.getChampion($scope.championlist[0]);
	    }, function myError(response) {
	  
	        $scope.result = response.statusText;
	      
	    });
		 
		 $scope.getChampion = function (id){
			// $scope.champion =row;
			 $scope.matchday="";
			
			 for(i=0;i<$scope.championlist.length;i++)
			 {
			 	if($scope.championlist[i].id==id) 
			 		{
					 	$scope.champion =$scope.championlist[i];
					 	break;
			 		}
			 }
			 $http({
			        method : "GET",
			        url : "champions/"+id+"/teamgroups"
			    }).then(function mySuccess(response) {

			        $scope.teamgrouplist = response.data;
			        
			    }, function myError(response) {
			  
			        $scope.result = response;//;"/champions/"+row.id+"/teamgroups";
			      
			    });
			 
			 $http({
			        method : "GET",
			        url : "champions/"+id+"/playoffs"
			    }).then(function mySuccess(response) {

			        $scope.champion.playoffgames = response.data;
			
			    }, function myError(response) {
			  
			        $scope.result = response;//;"/champions/"+row.id+"/teamgroups";
			      
			    });
			 
			 $http({
			        method : "GET",
			        url : "games?upcomingchampiongames="+id
			    }).then(function mySuccess(response) {

			        $scope.upcominggames = response.data;
			        
			
			    }, function myError(response) {

			    	
			        //$scope.result = response.statusText;
			      
			    });
			 
			 
			 
		 }
		 

		       
/*		       if($routeParams.championid != "start")
		    	   {

			       	$scope.getChampion($routeParams.championid);
		    	   }
		 */
		 
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
			        $scope.getFollowingTeams(true);
			    }, function myError(response) {
			    	alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");     
			    });
			 
		 }
		 
		 $scope.getFollowingTeams = function (buttonPushed){ 

			 $http({
			        method : "GET",
			        url : "followers"
			    }).then(function mySuccess(response) {
			    	if(response.data.length>0)
		    		{

			    		$scope.followingteam = response.data[0];
			    	/*	if(buttonPushed)
					        alert("Ακολουθείτε την ομάδα "+$scope.followingteam.name+"! Θα λαμβάνετε ειδοποιήσεις για αγώνες και αποτελέσματα!");
*/
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
	    
		 $scope.isFollowedText = function (row){
			 
			 if($scope.followingteam!=null&&row.id==$scope.followingteam.id)
				 return "ΑΚΟΛΟΥΘΕΙΣ!";
			 else
				 return "ΑΚΟΛΟΥΘΕΙΣΕ";

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
	
	//$location.path('home'); 
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

appMain.controller("headerController",function($scope, $http, $location, $rootScope, $route){

    
	 $http({
	        method : "GET",
	        url : "champions",
	    }).then(function mySuccess(response) {

	        $scope.headerChampions = response.data;
	      
	    }, function myError(response) {
	    		      
	    });
	 
	 $http({
	        method : "GET",
	        	url : "custompages"
	    }).then(function mySuccess(response) {
	    	$scope.custompages = response.data;
	    	
		    
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

	 $scope.openMessages = function (){ 
			
		 //alert($rootScope.isAdmin);
		 if($rootScope.isAdmin)
		 {
			 
		    	var currentp=window.location.href; 
		    	if(currentp.indexOf("message-list") !== -1)
		    		{
		    		$route.reload();
		    		}
		    	else 
			  		$location.path( "message-list.html");
			 
		 		$rootScope.notification=null;
		 }else
		 {
		 	//	$location.path( "chat/"+messages[0].contact.id );
		 		$location.path( "chat/54");
		 		$rootScope.notification=null;
		 }
		 
	 	//$rootScope.mlastid=0;
		 
	 }
	 $scope.getMyTeamLink = function (){ 

		 $http({
		        method : "GET",
		        url : "followers"
		    }).then(function mySuccess(response) {
		    	if(response.data[0])
		        //$scope.followingteam = response.data[0];
		    		$location.path( "team-detail.html/"+response.data[0].id );
		    	else
		    		{
		    			$location.path( "team-list.html" );
		    			alert("Ακολουθήστε πρώτα μια ομάδα!");
		    		}

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


appMain.controller("messageListController",function($scope, $http, $location){


	 $http({
	        method : "GET",
	        url : "teams?orderby=messagedate",
	    }).then(function mySuccess(response) {

	      
	   	 var tempteams = response.data;
	      	 $http({
	   	        method : "GET",
	   	        	url : "notifications",
	   	        	params:{getunseenmessages:"getunseenmessages",lastid:0}
	   	    }).then(function mySuccess(response) {

  	    		$scope.notif = response.data;
	   	    		$scope.teams = tempteams;
	   	   	
	   	    }, function myError(response) {
	   	    	//alert(error);

	   	    });
	   	 

	        
	    }, function myError(response) {
	    		      
	    });
	 
	 $scope.getMessageCount = function(team){
		 var counter = 0;
		 try{
			
				 for(i=0;i<$scope.notif.messages.length;i++)
				 {//alert($scope.notif.messages[i].contact.adminteam.id);
					 	if(team.id==$scope.notif.messages[i].contact.adminteam.id)
							counter=counter+1;
				 }
			}
		 catch(err){}
		 return counter;
	 }
	 
	 

	 
	 $scope.sendMessage = function (row){
		 
		 $http({
		        method : "GET",
		        url : "teams/"+row.id+"/admins",
		    }).then(function mySuccess(response) {
		    	if(!response.data)
		    		{

		    			alert("Δεν έχετε ορίσει χρήστη για αυτή την ομάδα.") ;
		    			return;
		    		}
				 $location.path('chat/'+ response.data.id); 
		        //$scope.teams = response.data;

		    }, function myError(response) {
		    		alert("Παρουσιαστηκε κάπιο σφάλμα. Προσπαθήστε ξανά.")      
		    });

	 }
	 
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
		        $scope.getFollowingTeams(true);
		    }, function myError(response) {
		    	alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");     
		    });
		 
	 }
	 $scope.isFollowedText = function (row){
		 
		 if($scope.followingteam!=null&&row.id==$scope.followingteam.id)
			 return "ΑΚΟΛΟΥΘΕΙΣ!";
		 else
			 return "ΑΚΟΛΟΥΘΕΙΣΕ";

	 }
	 $scope.getFollowingTeams = function (buttonPushed){ 

		 $http({
		        method : "GET",
		        url : "followers"
		    }).then(function mySuccess(response) {
		    	if(response.data.length>0)
		    		{
		    			
			    		$scope.followingteam = response.data[0];
			    		//if(buttonPushed)
					       // alert("Ακολουθείτε την ομάδα "+$scope.followingteam.name+"! Θα λαμβάνετε ειδοποιήσεις για αγώνες και αποτελέσματα!");

			    		
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
/*		 
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
		 */
/*		 $scope.deleteTeam = function (){ 

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
		 }*/
		 
		 $scope.editTeam = function (){ 
			 //$scope.team.players=$scope.players;
			 //$scope.result=$scope.team;
				$scope.loading=true;
			 $http({
		        method : "PUT",
		        	url : "teams",
			        data: $scope.team,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {

				$scope.loading=false;
		    	$scope.getTeam();
		    }, function myError(response) {

				$scope.loading=false;
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.uploadLogo = function(){
		     var fd = new FormData();
             fd.append('file', $scope.mylogo);

				$scope.loading=true;
			 $http({
			        method : "POST",
			        	url : "teams/"+$scope.team.id+"/logos",
				        data: fd,
				       // params:{file: $scope.myfile},
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}     
			    }).then(function mySuccess(response) {
					$scope.loading=false;
			    
			    	$scope.getTeam();
			    }, function myError(response) {

					$scope.loading=false;
			 
			        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
			    });
             
		 }
		 
		 $scope.uploadCover= function(){
		     var fd = new FormData();
             fd.append('file', $scope.mylogo);

				$scope.loading=true;
			 $http({
			        method : "POST",
			        	url : "teams/"+$scope.team.id+"/covers",
				        data: fd,
				       // params:{file: $scope.myfile},
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}     
			    }).then(function mySuccess(response) {

					$scope.loading=false;
			    	$scope.getTeam();
			    }, function myError(response) {

					$scope.loading=false;
			        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
			    });
             
		 }

		 
		 $scope.editPlayer = function (row){ 

				$scope.loading=true;
			 $http({
		        method : "PUT",
		        	url : "players",
			        data: row,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {


				$scope.loading=false;
		        alert("Οι αλλαγές αποθηκεύτηκαν με επιτυχία!");
		        
		    }, function myError(response) {

				$scope.loading=false;
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.addPlayer= function (){ 
			// $scope.result = $scope.newplayer;
				$scope.loading=true;
			 $http({
		        method : "POST",
		        	url : "teams/"+$scope.team.id+"/players",
			        data: $scope.newplayer,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {
					$scope.loading=false;
		    			$scope.newplayer={};
		    			$scope.getTeam();
		    			alert("Ο παίχτης έχει εισαχθεί με επιτυχία! Επέλεξε τον παίχτη απο το απο την λίστα για εισαγωγή εικόνας και επεξεργασία στοιχείων!")

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

				$scope.loading=false;
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.uploadPlayerImage = function(row){
		     var fd = new FormData();
             fd.append('file', row.playerimage);

				$scope.loading=true;
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
					$scope.loading=false;
			    	$scope.getTeam();
			    	//$window.location.reload();
			    }, function myError(response) {

					$scope.loading=false;
			        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
			    });
             
		 }
		 
		 
		 $scope.deletePlayer = function (row){ 
			 if(!confirm("Είστε σίγουρος;"))
				 return;
				$scope.loading=true;
			 $http({
		        method : "DELETE",
		        	url : "players/"+row.id
		    }).then(function mySuccess(response) {
				$scope.loading=false;
		    	$scope.getTeam();
		        
		    }, function myError(response) {
				$scope.loading=false;

		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
});

appMain.controller("chatController",function($scope, $http, $location, $window,$timeout,$routeParams, $rootScope){
	var path = window.location.href;

/*	var link = document.getElementById('myfooter');
	link.style.display = 'none'; //or
	link.style.visibility = 'hidden';*/
	$scope.disablesending=false;
	$scope.unseen = [];
		 $http({
	        method : "GET",
	        	url : "contacts/"+	$routeParams.friendid+"/messages"
	    }).then(function mySuccess(response) {
	    	$scope.messages = response.data;
	    	
			$scope.getLastMessages();  
			//window.scrollTo(150, 150);
		    $timeout($scope.scrolltobottom, 10);
		    $timeout($scope.setSeenStatus, 1000);
		    
	    }, function myError(response) {
	    	$scope.messages = [];
			$scope.getLastMessages();  
	    });
	 

		 $scope.scrolltobottom = function (){ window.scrollTo(0, 1000000);
}
		 
		 $scope.getSender = function (message){ 
			 if(message.receiver.id==$routeParams.friendid)
				 return "self";
				 else
					return "other";
		 
		 }
		 $scope.getPicture = function (message){ 
			 if(message.contact.adminteam==null)
				 return "/defaultimages/adminimage.png";
				 else return message.contact.adminteam.logothumbpath;
			 if(message.receiver.id==$routeParams.friendid)
				 return "self";
				 else
					return "other";
		 
		 }

		 $scope.getStatus = function (message, index){
			 if(message.id!=$scope.getLastId())
				 return "";
			 if(message.contact.id==$routeParams.friendid)
				 return "";
			 else
				 return message.status;
			
		 
		 }
		 

		 $scope.getLastId = function() {
		 var lastid=0;
		 if( $scope.messages!=null)
			 if( $scope.messages.length>0)
				 {
				 	for(i=0;i<$scope.messages.length;i++)
				 		if($scope.messages[i].id>lastid)
						 	lastid =  $scope.messages[i].id;
				 }
		 	return lastid;
		 }
		 $scope.keyPressed = function(keyEvent) {
			  if (keyEvent.which === 13)
			    	$scope.sendMessage($scope.text);
			}
		 $scope.sendMessage = function (text){ 
			 if($scope.disablesending)
				 return;
			 	if(text=="")
			 		return;
			 	

		    	$scope.disablesending=true;
			 $http({
			        method : "POST",
			        	url : "messages",
			        	params:{receiverid:$routeParams.friendid,message:text}
			    }).then(function mySuccess(response) {
			    	//$scope.messages = response.data;
/*			    	var message = {};
			    	message.message = text;
			    	message.receiver={};
			    	message.date=new Date();
			    	message.receiver.id=receiverid;
			    	message.del=true;*/
			    	$scope.disablesending=false;
			    	if(response.data)
			    		{

			    			$scope.messages.push( response.data);
			    			$scope.text = "";
			    		}
			    	else
				    	alert("Το μήνυμα δεν σταλθηκε. Σιγουρευτείτε οτι είστε συνδεδεμένος.");
				    $timeout($scope.scrolltobottom, 1);
			    }, function myError(response) {
			    	$scope.disablesending=false;
			    	alert("Το μήνυμα δεν σταλθηκε. Προσπαθήστε ξανα.");
/*		    		for(i=0;i<$scope.messages.length; i++)
				    	if($scope.messages[i].del)
				    		{
				    			$scope.messages.splice(i, $scope.messages.length-i);
				    			break;
				    		}*/
			    });
		 
		 }
		 

		 $scope.setSeenStatus = function (){
/*			 		 if (document.hasFocus()) {
			    $scope.text=$scope.text+ "focused";
			}
		 else
			    $scope.text=$scope.text+ "nofocused";*/
			 var found = false; //alert(0);
			 if($rootScope.onFocus()&&$scope.unseen.length>0){
				// alert(1);
/*				 for(i=0;i<unseen.length;i++)
				 { 
					 if(unseen[i].contact.id==$routeParams.friendid&&unseen[i].status!="Seen")
					 {
						
						 found=true;
						 break;
					}
				 }
				 if(found)
				 {*/ //alert(2);
					 $http({
					        method : "PUT",
					        	url : "contacts/actions",
					        	params:{senderid:$routeParams.friendid,action:"set_messages_seen"}
					    }).then(function mySuccess(response) {
					    	$scope.unseen = [];
							// alert(3);
		/*					 for(i=0;i<$scope.messages.length;i++)
								 if($scope.messages[i].contact.id==$routeParams.friendid&&$scope.messages[i].status!="Seen")
								 {
									 $scope.messages[i].status = "Seen";
								 }*/
					    }, function myError(response) {
							// alert(4);
					    });
				 //}
			// }
			 }
			 $timeout($scope.setSeenStatus, 300);
			 
			 
		 }
		 
		 $scope.getLastMessages = function (){
/*			 if (document.hasFocus()) {
				    $scope.text=$scope.text+ "focused";
				}
			 else
				    $scope.text=$scope.text+ "nofocused";*/
			 if(!$rootScope.onFocus()||!$rootScope.loggedin)
			 {

			    	$timeout($scope.getLastMessages, 500);   
			    	return;
			 }
			 var lastid=0;
			 var laststatus="";
			 if( $scope.messages!=null)
				 if( $scope.messages.length>0)
					 {
					 	for(i=0;i<$scope.messages.length;i++)
					 		if($scope.messages[i].id>lastid)
					 			{
							 		lastid =  $scope.messages[i].id;
							 		if($scope.messages[i].contact.id!=$routeParams.friendid)
							 			laststatus = $scope.messages[i].status;
							 		else
							 			laststatus = "Seen";
					 			}
					 }
		    	//alert("contacts/2/messages?lastid="+lastid);
		    	//alert("contacts/2/messages?lasti");
			// alert("contacts/"+$routeParams.friendid+"/messages?lastid="+lastid+"&laststatus="+laststatus);
			 $http({
			        method : "GET",
			        	url : "contacts/"+$routeParams.friendid+"/messages?lastid="+lastid+"&laststatus="+laststatus
			    }).then(function mySuccess(response) {
			    	//alert(response.data);
			    	if(!response.data)
			    		return;
	/*	    		for(i=0;i<$scope.messages.length; i++)
				    	if($scope.messages[i].del)
				    		{
				    			$scope.messages.splice(i, $scope.messages.length-i);
				    			break;
				    		}*/
			    	
			    	if(response.data)
			    	{
			    		for(i=0;i<response.data.length; i++)
			    		{	
			    			var found = false;
				    		for(y=$scope.messages.length -1;y>=0; y--)
				    			if($scope.messages[y].id==response.data[i].id)
				    			{
				    				//alert($scope.messages[y].status + " "+response.data[i].status);
				    				$scope.messages[y].status = response.data[i].status;
				    				$scope.messages[y].message = response.data[i].message;
				    				
				    				found=true;
				    				break;
				    			}
				    		if(!found)
				    			{
				    				$scope.messages.push( response.data[i]);
				    				$timeout($scope.scrolltobottom, 10);
				    				if(response.data[i].contact.id==$routeParams.friendid)
				    					{
				    						$scope.unseen.push(response.data[i]);
				    						var x = document.getElementById("myAudio"); 
				    						x.play();
				    					}
				    			}
				    				
			    		}
			    	}
			    	//alert(response.data);
				    //	$scope.getLastMessages(); 
				    if(window.location.href!=path)
				    	return;
			    	$timeout($scope.getLastMessages, 500);    
				    
			    }, function myError(response) {

				    if(window.location.href!=path)
				    	return;
			    	//alert("error");
				    $timeout($scope.getLastMessages, 5000);   

			    });
		 
		 }
			//$scope.$on('$viewContentLoaded', function() {
			    //call it here
				//$scope.getLastMessages();  
			  /*  $timeout(getLastMessages, 1000);*/    
			//});

	/*	 $window.onfocus = function(){
			   $scope.text=$scope.text+" focused";
			 }*/
});


appMain.controller("calendarController",function($scope, $http, $location, $window){
	
	$scope.events=[];
	
	$scope.showclock = true	;
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
                	$scope.events.push(event);
            	}
            	

            }
        	for(x=0;x<$scope.events.length;x++)
            {
        		
            	for(y=0;y<$scope.events.length;y++)
                {
            		//if(dates.inRange (events[x].start,events[y].start,events[y].end)
        			if(x!=y&&$scope.events[x].start.getTime()>=$scope.events[y].start.getTime()&&$scope.events[x].start.getTime()<$scope.events[y].end.getTime())
        			{
        				$scope.events[x].color='#ea9700';
        				$scope.events[y].color='#ea9700';
        			}
        			if(x!=y&&$scope.events[x].start.getTime()==$scope.events[y].start.getTime()&&$scope.events[x].end.getTime()==$scope.events[y].end.getTime())
        			{
        				$scope.events[x].color='#FF0000';
        				$scope.events[y].color='#FF0000';
        			}
        			
        			/*
        			if(x!=y&&events[x].end.getTime()>events[y].start.getTime()&&events[x].end.getTime()<=events[y].end.getTime())
        			{
                    	events[x].color='#ff4455';
                    	events[y].color='#ff4455';
        			}*/
                }
        		
            }
        	//events[0].color='#ffffff';
	    	$scope.showCalendar();
	    	$scope.showclock=false;
	/*   $scope.result=events;	*/
 
	    }, function myError(response) {
	    	$scope.showclock=false;
	    	$scope.showCalendar();
	    	
	        //$scope.result = response.statusText;
	      
	    });
	
	
/*$(document).ready(function() {*/

	 $scope.showCalendar = function (){ 

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next, today',
        center: 'title',
        right: 'agendaWeek,month'/*listWeek, listDay, agendaDay*/
      },height:  "auto",
	  minTime: "08:00:00",
	  firstDay:1,
      // customize the button names,
      // otherwise they'd all just say "list"
      views: {
        listDay: { buttonText: 'Ημέρα' },
        listWeek: { buttonText: 'Εβδομάδα' },
        month: { buttonText: 'Μήνας' },
        agendaWeek: { buttonText: 'Εβδομάδα' },
        agendaDay: { buttonText:  'Ημ.Μεγ' }
      },

      defaultView: 'agendaWeek',
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
      events: $scope.events
    });
    
	 
	/*	 $('#calendar').fullCalendar({
			  minTime: "07:00:00",
			  maxTime: "21:00:00"
			});*/
	 
	 }
 /* });*/

});


appMain.controller("custompageController",function($scope, $http, $location, $window,$routeParams){
	
	
	 $http({
	        method : "GET",
	        	url : "custompages"
	    }).then(function mySuccess(response) {
	    	$scope.custompages = response.data;
	    	

		    if($routeParams.custompageid == "start"&&$scope.custompages.length>0)
		    {
		    	$scope.getCustompage($scope.custompages[0].id);
		    }
	    }, function myError(response) {
	 
	    });
	 
	    $scope.cssLiChampionClass = function (row) {
	    	if(row.id==$scope.custompage.id)
	    		return "css_li_champion_active";
	    	else return "css_li_champion"
	    };
	    
	   
	    $scope.getCustompage = function (custompageid) {
	   	 $http({
		        method : "GET",
		        	url : "custompages/"+custompageid
		    }).then(function mySuccess(response) {
		    	$scope.custompage = response.data;
		    	
			    
		    }, function myError(response) {
		 
		    });
	    }
	    if($routeParams.custompageid != "start")
	    	$scope.getCustompage($routeParams.custompageid);
});
