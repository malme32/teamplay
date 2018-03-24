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

    })
    .when("/adminnews", {
        templateUrl : "adminnews.html",
        controller: "newsController"

    })
    .when("/adminusers", {
        templateUrl : "adminusers",
        controller: "usersController"

    })
    .when("/adminimages", {
        templateUrl : "adminimages",
        controller: "imagesController"

    })
    .when("/admincustompages", {
        templateUrl : "admincustompages",
        controller: "custompagesController"

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

/*appAdmin.directive("ngFileModel", function() {
	  return {
	    require: "ngModel",
	    link: function postLink(scope,elem,attrs,ngModel) {
	      elem.on("change", function(e) {
	        var files = elem[0].files;
	        ngModel.$setViewValue(files);
	      })
	    }
	  }
	});*/
appAdmin.directive('ngFiles', ['$parse', function ($parse) {

    function fn_link(scope, element, attrs) {
        var onChange = $parse(attrs.ngFiles);
        element.on('change', function (event) {
            onChange(scope, { $files: event.target.files });
        });
    };

    return {
        link: fn_link
    }
}]);


/*appAdmin.directive('ngFileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {
            var model = $parse(attrs.ngFileModel);
            var isMultiple = attrs.multiple;
            var modelSetter = model.assign;
            element.bind('change', function () {
                var values = [];
                angular.forEach(element[0].files, function (item) {
                    var value = {
                       // File Name 
                        name: item.name,
                        //File Size 
                        size: item.size,
                        //File URL to view 
                        url: URL.createObjectURL(item),
                        // File Input Value 
                        _file: item
                    };
                    values.push(value);
                });
                scope.$apply(function () {
                    if (isMultiple) {
                        modelSetter(scope, values);
                    } else {
                        modelSetter(scope, values[0]);
                    }
                });
            });
        }
    };
}]);

*/

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
appAdmin.controller("adminStartController",function($scope, $http, $location, $window,$route){
//alert($location.path());//$location.path('home'); 



$scope.$on("$locationChangeStart", function(event, next, current) { 
	

	    	//if(next.indexOf("#!/home") !== -1&&!$rootScope.isAndroid)
//if(next!=current)
	if(next.indexOf("#!/admin")==-1)
		$location.path('adminchampions')
/*	 alert(current);
	 alert(next);*/

		 
	    	
});

});

appAdmin.controller("imagesController",function($scope, $http, $location, $window){
	
	 $http({
	       method : "GET",
	       url : "albums"
	   }).then(function mySuccess(response) {

	       $scope.albums = response.data;
	     
	   }, function myError(response) {
	 
	       $scope.result = response.statusText;
	     
	   });
	 
	 
	 
	 
	 
     var formdata = new FormData();
     $scope.getTheFiles = function ($files) {
         angular.forEach($files, function (value, key) {
             formdata.append("files", value);
         });
     };
	 
     
     $scope.deleteImage = function (image) {
		   

			 if(!confirm("Είστε σίγουρος οτι θέλετε να διαγράψετε αυτή την εικόνα;"))
				 return;
		   
			 $http({
		    method : "DELETE",
      	url : "images/"+image.id  
  }).then(function mySuccess(response) {
 
  	$window.location.reload();
  	//$scope.getTeam();
  }, function myError(response) {

  	
      alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
  });
		   
	   }
     
     $scope.deleteAlbum = function (album) {
		   
		
				 if(!confirm("Είστε σίγουρος οτι θέλετε να διαγράψετε αυτό το album;"))
					 return;
			   
				 $http({
			    method : "DELETE",
		  	url : "albums/"+album.id  
		}).then(function mySuccess(response) {
		
			$window.location.reload();
			//$scope.getTeam();
		}, function myError(response) {
		
			
  alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
});
	   
   }
     
     $scope.addAlbum = function (newalbum) {
		
					 $http({
				    method : "POST",
			  	url : "albums",
			  	params:{name:newalbum.name}
			}).then(function mySuccess(response) {
			
				$window.location.reload();
				//$scope.getTeam();
			}, function myError(response) {
			
				
			alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
			});
			
			}

     $scope.editAlbum = function (album) {
			 $http({
			        method : "PUT",
			        url : "albums",
			        data: album,
			        headers: {'Content-Type': 'application/json; charset=utf-8'} 
		
			    }).then(function mySuccess(response) {
		
			    	alert("Εγινε!");
			    }, function myError(response) {
			  
			    	alert("An Error occured. Try again.");
			      
			    });
     }
     // NOW UPLOAD THE FILES.
     $scope.uploadFiles = function (album) {

    	 $scope.waiting= "Οι εικόνες ανεβαίνουν. Παρακαλώ περιμένετε..";
    	 $http({
		        method : "POST",
		        	url : "albums/"+album.id+"/images",
			        data: formdata,
			        //params:{files: upl},
                 transformRequest: angular.identity,
                 headers: {'Content-Type': undefined}     
		    }).then(function mySuccess(response) {
		    	 $scope.waiting= "";
		    	$window.location.reload();
		    	//$scope.getTeam();
		    }, function myError(response) {

		    	
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
    	 

    	 
    	 
/*         var request = {
             method: 'POST',
             url: '/api/fileupload/',
             data: formdata,
             headers: {
                 'Content-Type': undefined
             }
         };

         // SEND THE FILES.
         $http(request)
             .success(function (d) {
                 alert(d);
             })
             .error(function () {
             });*/
     }
	 
	 
/*	 $scope.uploadImages = function(album, newimages){
		 var fd = new FormData();

	     $scope.result = newimages;
         for (var i = 0 ; i < newimages.length ; i++){
        	
        	 //alert(newimages[i].name);
        	 fd.append('files', newimages[i]);	
        	// upl.push(fd);
        	}
	     $scope.result = fd;

	    // alert("xixi");
		 $http({
		        method : "POST",
		        	url : "albums/"+album.id+"/images",
			        data: fd,
			        //params:{files: upl},
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}     
		    }).then(function mySuccess(response) {

			     alert("xexe");
		    	//$scope.getTeam();
		    }, function myError(response) {

			 
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
         
	 }*/
       
	 
	 
	
});

appAdmin.controller("adminController",function($scope, $http, $location, $window){

	 $scope.championlist ="";
	 $scope.champion;
	 
	//$scope.getContacts = function (){
/*	 $scope.getChampion = function (row){  
*/		 $scope.result = "";
		 $scope.standings = "";
		 $scope.curteams = "";
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
		 $scope.loading=true;
		 $http({
	        method : "GET",
	        url : "teams"
	    }).then(function mySuccess(response) {

			 $scope.loading=false;
	        $scope.totalTeamList = response.data;
	      
	    }, function myError(response) {

			 $scope.loading=false;
	        $scope.result = response.statusText;
	      
	    });
	 }
	 
	 $scope.getPlayoffs = function (row){
/*		 $scope.result = "";
		 $scope.champion =row;
		 $scope.matchday="";
		 $scope.standings = "";
		 $scope.teamgroup = "";*/
		 $scope.loading=true;
		 $scope.playoffs = "";
		 $http({
		        method : "GET",
		        url : "champions/"+row.id+"/playoffs"
		    }).then(function mySuccess(response) {
		    	
		    	$scope.playoffs = response.data;
		    	for(i=0;i<$scope.playoffs.length;i++)
	    		{
		    	 //$scope.result = $scope.result+"333";
	    			var games = $scope.playoffs[i].games;
			    	 //$scope.result= $scope.result+ "444";
			    	for(k=0;k<games.length;k++)
		    		{
				    	// $scope.result= $scope.result+ "555";
				    	 if(games[k].date)
				    		 games[k].tmpdate=new Date(games[k].date);
		    		}
	    		}

				 $scope.loading=false;
		    	
		    }, function myError(response) {

				 $scope.loading=false;
		        $scope.result = response;//;"/champions/"+row.id+"/teamgroups";
		      
		    });
	 }
	  
	 
		 $scope.getTeamgroup = function (row){
			 $scope.result = "";
			 $scope.champion =row;
			 $scope.matchday="";
			 $scope.standings = "";
			 $scope.curteams = "";
			 $scope.teamgroup = "";
			 $scope.playoffs = "";
			 $scope.loading=true;
			 $http({
			        method : "GET",
			        url : "champions/"+row.id+"/teamgroups"
			    }).then(function mySuccess(response) {

			        $scope.teamgrouplist = response.data;
					 $scope.loading=false;
			    }, function myError(response) {
			  
			        $scope.result = response;//;"/champions/"+row.id+"/teamgroups";
			      
			    });
		 }
		 $scope.getTeams = function (row){
			 	$scope.result = "";
		        //$scope.standings =  row.standings;
		        $scope.teamgroup = row; 
		        

				 $http({
				        method : "GET",
				        url : "teamgroups/"+row.id+"/standings"
				    }).then(function mySuccess(response) {
				    	 $scope.curteams=[];
				    	 $scope.standings=response.data;
				    	 $scope.standings=response.data;
				    	for(i=0;i<$scope.standings.length;i++)
				    	{
				    		 $scope.curteams.push($scope.standings[i].team);
				    	}
				    	//$scope.result = matchday;
				    }, function myError(response) {

				        $scope.result = "An Error Occurred";//;"/champions/"+row.id+"/teamgroups";
				      
				    });
		        
		        
		        
		 }

		 $scope.getMatchdays = function (row){
			 $scope.result = "";
			 //$scope.teamgroup =row;
			// $scope.matchday = row.matchdays;

			 $scope.loading=true;
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
					 $scope.loading=false;
			    	//$scope.result = matchday;
			    }, function myError(response) {
			  
			        $scope.result = "An Error Occurred";//;"/champions/"+row.id+"/teamgroups";

					 $scope.loading=false;
			    });
			 
		 }
		 $scope.adminAddChampion = function (){
			 $scope.result = "";
			 	if( $scope.adminChampionName=="") 
			 		return;
		        $scope.modalResult = "";
				 $scope.loading=true;
			 $http({
			        method : "POST",
			        url : "champions",
			        	   params: {
			        	        name : $scope.adminChampionName,
			        	        enabled:$scope.adminChampionEnabled
			        	    }
			    }).then(function mySuccess(response) {

			    	$window.location.reload();
			    }, function myError(response) {

					 $scope.loading=false;
			        alert("An Error occured. Try again.");
			      
			    });
			 
		 }


		 
	/*	 $scope.editChampion = function (){
			 
			 
		 }*/		
		 $scope.adminEditChampion = function (row){
			 $scope.result = "";
			 	if( row.name=="") 
			 		return;
				 $scope.loading=true;
		        //$scope.modalResult = "";
			 $http({
			        method : "PUT",
			        url : "champions",
			        	   params: {
			        	        id : row.id,
			        	        name : row.name,
			        	        enabled : row.enabled
			        	    }
			    }).then(function mySuccess(response) {

			    	$window.location.reload();
			    }, function myError(response) {

					 $scope.loading=false;
			        alert("An Error occured. Try again.");
			      
			    });
			 
		 }
		 
		 $scope.adminDeleteChampion = function (id){

			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $scope.result = "";
			 $scope.loading=true;
		      //$scope.modalResult = "";
			 $http({
			        method : "DELETE",
			        url : "champions/"+id
			    }).then(function mySuccess(response) {
			    	$window.location.reload();
			    }, function myError(response) {
					 $scope.loading=false;
			        alert("An Error occured. Try again.");
			    });
		 }
		 
		 
		 $scope.adminAddTeamgroup = function (row){
			 $scope.result = "";
			 	if( $scope.adminChampionName=="") 
			 		return;
		        $scope.modalResult = "";
				 $scope.loading=true;
			 $http({
			        method : "POST",
			        url : "champions/"+row.id+"/teamgroups",
			        	   params: {
			        	        name : $scope.adminTeamgroupName
			        	    }
			    }).then(function mySuccess(response) {
					 $scope.loading=false;
			    	$scope.getTeamgroup($scope.champion);
			    	//$window.location.reload();
			    	$scope.adminTeamgroupName="";
			    }, function myError(response) {

					 $scope.loading=false;
			        alert( "An Error occured. Try again");
			    });
			 
		 }
		 
		 
		 
		 $scope.adminEditTeamgroup = function (row){
			 $scope.result = "";
			 	if( row.name=="") 
			 		return;
		        //$scope.modalResult = "";
				 $scope.loading=true;
			 $http({
			        method : "PUT",
			        url : "champions/"+$scope.champion.id+"/teamgroups",
			        	   params: {
			        	        id : row.id,
			        	        name : row.name
			        	    }
			    }).then(function mySuccess(response) {

					 $scope.loading=false;
			    	alert("Εγινε!");
			    }, function myError(response) {

					 $scope.loading=false;
			        alert( "An Error occured. Try again");
			      
			    });
			 
		 }
		 $scope.adminDeleteTeamgroup = function (row){

			 $scope.result = "";
			 if(!confirm("Are you sure?"))
				 return;

			 $scope.loading=true;
			 $http({
			        method : "DELETE",
			        url : "teamgroups/"+row.id
			    }).then(function mySuccess(response) {
					 $scope.loading=false;
			    	$scope.getTeamgroup($scope.champion);
			    	//$window.location.reload();
			    }, function myError(response) {
					 $scope.loading=false;
			        alert( "An Error occured. Try again");
			    });
		 }
		 
			    $scope.cssLiChampionClass = function (row) {
			    	if(row.id==$scope.champion.id)
			    		return "css_li_champion_active";
			    	else return "css_li_champion"
			    };
			    
			    
				 $scope.adminAddTeamToTeamgroup = function (teamgroup_,team_){
					// $scope.result = "";
					 	if( team_==null) 
					 		return;
				       // $scope.modalResult = "";
						 $scope.loading=true;
					 $http({
					        method : "PUT",
					        url : "teamgroups/"+teamgroup_.id+"/teams/"+team_.id
					    }).then(function mySuccess(response) {
							 $scope.loading=false;
					    	$scope.getTeams($scope.teamgroup);
					    	$scope.getMatchdays($scope.teamgroup); 
					    	$scope.selectedTeam="";
					    	//$window.location.reload();
					    }, function myError(response) {

							 $scope.loading=false;
					        alert( "An Error occured. Team already exists?");
					    });
					 
				 }
				 
				 $scope.adminAddNewTeamToTeamgroup = function (teamgroup_obj,team_name){
					 $scope.result = "";

					 	if( team_name=="") 
					 		return;

						 $scope.loading=true;
				       // $scope.modalResult = "";
					 $http({
					        method : "POST",
					        url : "teamgroups/"+teamgroup_obj.id+"/teams",
					        params: { name : team_name}
					    }).then(function mySuccess(response) {
							 $scope.loading=false;
					    	$scope.getMatchdays($scope.teamgroup); $scope.getTeams($scope.teamgroup);
					    	//$window.location.reload();
					    	$scope.adminNewTeamName="";
					    }, function myError(response) {

							 $scope.loading=false;
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

				 $scope.loading=true;
				 $http({
				        method : "DELETE",
				        url : "standings/"+row.id
				    }).then(function mySuccess(response) {
				    	$scope.getMatchdays($scope.teamgroup); $scope.getTeams($scope.teamgroup);
				    	//$window.location.reload();
						 $scope.loading=false;
				    }, function myError(response) {
						 $scope.loading=false;
				  
				        alert("An Error occured. Try again.");
				    });
				 
			 }
				 
				 $scope.adminDeleteMatchday = function (row){
					 $scope.result = "";
		
					 if(!confirm("Are you sure?"))
						 return;

					 $scope.loading=true;
					 $http({
					        method : "DELETE",
					        url : "matchdays/"+row.id
					    }).then(function mySuccess(response) {
					    	
					    	$scope.getMatchdays($scope.teamgroup); 
							 $scope.loading=false;
					    	//$window.location.reload();
					    }, function myError(response) {

							 $scope.loading=false;
					        alert("An Error occured. Try again.");
					    });
					 
				 }
				 
				 $scope.adminDeletePlayoff = function (row){
					 $scope.result = "";
		
					 if(!confirm("Are you sure?"))
						 return;

					 $scope.loading=true;
					 $http({
					        method : "DELETE",
					        url : "playoffs/"+row.id
					    }).then(function mySuccess(response) {
					    	
					    	$scope.getPlayoffs($scope.champion); 
							 $scope.loading=false;
					    	//$window.location.reload();
					    }, function myError(response) {

							 $scope.loading=false;
					        $scope.result = "An Error occured. Try again.";
					    });
					 
				 }
				 
				 
				 $scope.generateMatchdays = function (row,roundNumber){
					 if(!confirm("Είστε σίγουρος?"))
						 return;
					 $scope.result = "";
					 $scope.loading=true;
					 $http({
					        method : "POST",
					        url : "teamgroups/"+row.id+"/actions/generatematchdays",
					        params:{roundNumber:roundNumber}
					    }).then(function mySuccess(response) {
					    	$scope.getMatchdays($scope.teamgroup); 
							 $scope.loading=false;
					    	//$window.location.reload();
					    }, function myError(response) {

							 $scope.loading=false;
					        alert("Παρουσιάστηκε κάποιο σφάλμα. Προσπαθήστε ξανά.");
					    });
					 
				 } 
				 
				 $scope.reGenerateMatchdays = function (row,roundNumber){
					 if(!confirm("Είστε σίγουρος?"))
						 return;
					 $scope.loading=true;
					 $scope.result = "";
					 $http({
					        method : "POST",
					        url : "teamgroups/"+row.id+"/actions/regeneratematchdays",
					        params:{roundNumber:roundNumber}
					    }).then(function mySuccess(response) {
							 $scope.loading=false;
					    	$scope.getMatchdays($scope.teamgroup); 
					    	//$window.location.reload();
					    }, function myError(response) {

							 $scope.loading=false;
					        alert("Παρουσιάστηκε κάποιο σφάλμα. Προσπαθήστε ξανά.");
					    });
					 
				 } 
				 
				 
				 $scope.adminDeleteAllMatchdays = function (row){
					 $scope.result = "";
		
					 if(!confirm("Are you sure?"))
						 return;

					 $scope.loading=true;
					 $http({
					        method : "DELETE",
					        url : "teamgroups/"+row.id+"/matchdays"
					    }).then(function mySuccess(response) {
							 $scope.loading=false;
					    	$scope.getMatchdays($scope.teamgroup); 
					    	$scope.getTeams($scope.teamgroup);

					    	//$scope.getMatchdays($scope.teamgroup);
					    }, function myError(response) {

							 $scope.loading=false;
					        alert("An Error occured. Try again.");
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
				 $scope.result=row;
				 $scope.loading=true;
				 $http({
				        method : "PUT",
				        url : "matchdays/"+tmpmatchday.id+"/games",
				        data: row,
				        headers: {'Content-Type': 'application/json; charset=utf-8'} 
					      // params: {id:row.id,teamid1:row.team1.id,teamid2:row.team2.id,
					    	//   score1:row.score1,score2:row.score2, date:row.date, matchdayid:tmpmatchday.id}

				    }).then(function mySuccess(response) {

						 $scope.loading=false;
				    	alert("Done!");
				    }, function myError(response) {

						 $scope.loading=false;
				    	alert("An Error occured. Try again.");
				      
				    });
				 

			 }
			 
			 
			 $scope.adminEditPlayoffGame= function (row,playoffrow){
					if(row.tmpdate)
					{	row.date = row.tmpdate;
			/*			var mydate = new Date(row.date);
						row.date = $scope.getFormattedDate(mydate,row.gametime);*/
					}
	
				 $scope.result=row.tmpdate;
				 $scope.loading=true;
				 $http({
				        method : "PUT",
				        url : "playoffs/"+playoffrow.id+"/games",
				        data: row,
				        headers: {'Content-Type': 'application/json; charset=utf-8'} 
					      // params: {id:row.id,teamid1:row.team1.id,teamid2:row.team2.id,
					    	//   score1:row.score1,score2:row.score2, date:row.date, matchdayid:tmpmatchday.id}

				    }).then(function mySuccess(response) {
						 $scope.loading=false;

				    	alert("Done!");
				    }, function myError(response) {
						 $scope.loading=false;
				  
				    	alert("An Error occured. Try again.");
				      
				    });
				 

			 } 
			 
			 
			 $scope.adminDeletePlayoffGame = function (row){
					// $scope.result = "";
		
					 if(!confirm("Are you sure?"))
						 return;

					 $scope.loading=true;
					 $http({
					        method : "DELETE",
					        url : "games/"+row.id
					    }).then(function mySuccess(response) {

							 $scope.loading=false;
					    	$scope.getPlayoffs($scope.champion); 
					    }, function myError(response) {

							 $scope.loading=false;
					       alert("An Error occured. Try again.");
					    });
					 
				 }
			 
				 $scope.adminDeleteGame = function (row){
						// $scope.result = "";
			
						 if(!confirm("Are you sure?"))
							 return;

						 $scope.loading=true;
						 $http({
						        method : "DELETE",
						        url : "games/"+row.id
						    }).then(function mySuccess(response) {

								 $scope.loading=false;
						    	$scope.getMatchdays($scope.teamgroup);
						    }, function myError(response) {

								 $scope.loading=false;
						        alert("An Error occured. Try again.");
						    });
						 
					 }
				 
				 
				  $scope.addGameToMatchday = function (gamerow,matchdayrow){
					// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
		
					 if(!confirm("Are you sure?"))
						 return;

					 $scope.loading=true;
					 $http({
					        method : "PUT",
					        url : "matchdays/"+matchdayrow.id+"/games/"+gamerow.id
					    }).then(function mySuccess(response) {

							 $scope.loading=false;

					    	$scope.getMatchdays($scope.teamgroup);
					    }, function myError(response) {

							 $scope.loading=false;
					        alert("An Error occured. Try again.");
					    });
					 
				 }
				  
				  $scope.adminAddPlayoff= function (playoffname,championrow){
						// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
			
				/*		 if(!confirm("Are you sure?"))
							 return;*/

						 $scope.loading=true;
						 $http({
						        method : "POST",
						        url : "champions/"+championrow.id+"/playoffs",
						        params: {name:playoffname}
						    }).then(function mySuccess(response) {
								 $scope.loading=false;
						    	$scope.getPlayoffs($scope.champion); 
						    }, function myError(response) {

								 $scope.loading=false;
						       alert("An Error occured. Try again.");
						    });
						 
					 }
				  
				  
				  $scope.adminAddMatchday = function (matchdayname,teamgrouprow){
						// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
			
				/*		 if(!confirm("Are you sure?"))
							 return;*/

						 $scope.loading=true;
						 $http({
						        method : "POST",
						        url : "teamgroups/"+teamgrouprow.id+"/matchdays",
						        params: {name:matchdayname}
						    }).then(function mySuccess(response) {
								 $scope.loading=false;
						    	$scope.getMatchdays($scope.teamgroup);
						    }, function myError(response) {

								 $scope.loading=false;
						       alert("An Error occured. Try again.");
						    });
						 
					 }
				  
				  
				  $scope.adminUpdatePlayoff = function (row,championrow){
						// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
			
				/*		 if(!confirm("Are you sure?"))
							 return;*/
					  
	
					  
					  //$scope.result=row; 
						 $scope.loading=true;
						 $http({
						        method : "PUT",
						        url : "champions/"+championrow.id+"/playoffs",
						        data: row,
						        headers: {'Content-Type': 'application/json; charset=utf-8'} 
						    }).then(function mySuccess(response) {

								 $scope.loading=false;
						    		alert("Done!");
						    }, function myError(response) {

								 $scope.loading=false;
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

						 $scope.loading=true;
						 $http({
						        method : "PUT",
						        url : "teamgroups/"+teamgrouprow.id+"/matchdays",
						        data: row,
						        headers: {'Content-Type': 'application/json; charset=utf-8'} 
						    }).then(function mySuccess(response) {

								 $scope.loading=false;
						    		alert("Done!");
						    }, function myError(response) {

								 $scope.loading=false;
						       alert("An Error occured. Try again.");
						    });
						 
					 }
				  
				  $scope.adminAddGame = function (team1,team2,matchdayrow){
						// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
			
				/*		 if(!confirm("Are you sure?"))
							 return;*/
					  //$scope.result=matchdayrow; 
						 $scope.loading=true;
						 $http({
						        method : "POST",
						        url : "matchdays/"+matchdayrow.id+"/games",
						        params:{teamid1: team1.id, teamid2: team2.id}
						    }).then(function mySuccess(response) {

								 $scope.loading=false;
						    	$scope.getMatchdays($scope.teamgroup);
						    }, function myError(response) {

								 $scope.loading=false;
						       alert("An Error occured. Try again.");
						    });
						 
					 }
				  $scope.generatePlayoffs = function (championrow,selectedPhase,selectedRound){
						// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
			
						 if(!confirm("Are you sure?"))
							 return;
						 $scope.loading=true;
					  //$scope.result=matchdayrow; 
						 $http({
						        method : "POST",
						        url : "champions/"+championrow.id+"/actions/generateplayoffs",
						        params:{phase:selectedPhase,round:selectedRound}
						    }).then(function mySuccess(response) {

								 $scope.loading=false;
						    	$scope.getPlayoffs($scope.champion);
						    }, function myError(response) {

								 $scope.loading=false;
						       alert("Προέυκυψε σφάλμα. Σιγουρευτήτε οτι αυτή η φάση δεν υπάρχει ήδη ή οτι έχετε συμπληρώσει ολα τα αποτελεσματα αγώνων της προηγούμενης φάσης.");
						    });
						 
					 }
				  
				  $scope.adminAddPlayoffGame = function (team1,team2,playoffrow){
						// $scope.result = gamerow.team1.name+" "+matchdayrow.name;
			
				/*		 if(!confirm("Are you sure?"))
							 return;*/
					  //$scope.result=matchdayrow; 
						 $scope.loading=true;
						 $http({
						        method : "POST",
						        url : "playoffs/"+playoffrow.id+"/games",
						        params:{teamid1: team1.id, teamid2: team2.id}
						    }).then(function mySuccess(response) {

								 $scope.loading=false;
						    	$scope.getPlayoffs($scope.champion);
						    }, function myError(response) {

								 $scope.loading=false;
						       alert("An Error occured. Try again.");
						    });
						 
					 }
				  
			/*	
					  this.myDate = new Date();
					  this.isOpen = false;*/
				  
				  $scope.openScorerModal = function (row){

				
					  var modal = document.getElementById('myModal');


					  
						 $http({
						        method : "GET",
						        url : "games/"+row.id+"/scorers"
						    }).then(function mySuccess(response) {
						 
						    	$scope.scorers=response.data;
						    	$scope.selectedgame=row;
						    	modal.style.display = "block";
						    	

								 $http({
								        method : "GET",
								        url : "teams/"+row.team1.id+"/players"
								    }).then(function mySuccess(response) {

								    	$scope.team1players=response.data;
		
								    	
								    }, function myError(response) {
								  
								       alert("Κάτι πήγε στραβά. Προσπαθήστε ξανά.");
								    });
								 
						    	
								 $http({
								        method : "GET",
								        url : "teams/"+row.team2.id+"/players"
								    }).then(function mySuccess(response) {

								    	$scope.team2players=response.data;
		
								    	
								    }, function myError(response) {
								  
								       alert("Κάτι πήγε στραβά. Προσπαθήστε ξανά.");
								    });
								 
						    	
						    	
						    }, function myError(response) {
						  
						       alert("Κάτι πήγε στραβά. Προσπαθήστε ξανά.");
						    });
						 
					  
					  
				  }  
				  $scope.closeScorerModal = function (){
					  
					  var modal = document.getElementById('myModal');
					  modal.style.display = "none";
					  
				  }  
				  
				  
				  $scope.editScorer = function (row){
		
					  var modal = document.getElementById('myModal');
					  

						 $scope.loading=true;
						 $http({
						        method : "PUT",
						        url : "games/"+$scope.selectedgame.id+"/scorers",
						        data: row,
						        headers: {'Content-Type': 'application/json; charset=utf-8'} 
						        
						    }).then(function mySuccess(response) {

								 $scope.loading=false;
							    alert("Εγινε!");
						    	//$scope.scorers=response.data;
						    	//modal.style.display = "block";
						    }, function myError(response) {

								 $scope.loading=false;
						       alert("Κάτι πήγε στραβά. Προσπαθήστε ξανά.");
						    });
						 
					  
					  
				  }  
				  
				  
				  $scope.addScorer = function (row){
					  if(!row)
						  return;
					  
					  if(!row.contact)
						  return;

					  if(!row.number)
						  return;
					  for(i=0;i<$scope.scorers.length;i++)
						  {
						  	if($scope.scorers[i].contact.name==row.contact.name)
						  		{
						  			alert("Αυτό το όναμα υπάρχει ήδη. Κανετε αλλαγή των τερμάτων και αποθήκευση.");
						  			return;
						  		}
						  }
						 $scope.loading=true;
						 $http({
						        method : "POST",
						        url : "games/"+$scope.selectedgame.id+"/scorers",
						        data: row,
						        headers: {'Content-Type': 'application/json; charset=utf-8'} 
						        
						    }).then(function mySuccess(response) {

								 $scope.loading=false;
						    	$scope.openScorerModal($scope.selectedgame);
							    //alert("Εγινε!");
						    	//$scope.scorers=response.data;
						    	//modal.style.display = "block";
						    	
						    	$scope.newplayer1.name="";
						    	$scope.newplayer2.name="";

			
						    	
						    	
						    }, function myError(response) {

								 $scope.loading=false;
						       alert("Κάτι πήγε στραβά. Προσπαθήστε ξανά.");
						    });
						 
					  
					  
				  } 
				  $scope.deleteScorer = function (row){
					  if(!row)
						  return;
						 if(!confirm("Είστε σίγουρος;"))
							 return;
						 $scope.loading=true;
						 $http({
						        method : "DELETE",
						        url : "scorers/"+row.id
						    }).then(function mySuccess(response) {

								 $scope.loading=false;
						    	$scope.openScorerModal($scope.selectedgame);
							    //alert("Εγινε!");
						    	//$scope.scorers=response.data;
						    	//modal.style.display = "block";
						    }, function myError(response) {

								 $scope.loading=false;
						       alert("Κάτι πήγε στραβά. Προσπαθήστε ξανά.");
						    });
						 
					  
					  
				  } 
				  
				  
				  
					 $scope.addScorerAndPlayer= function (scorer,player,team){
						 //addScorerAndPlayer(newscorer1,newplayer1,selectedgame.team1)
							// $scope.result = $scope.newplayer;
						 
						  if(!scorer)
							  return;
						  
						  if(!scorer.number)
							  return;
						  
						 if(!player)
							  return;
						  
						  if(!player.name)
							  return;
						  

							 $scope.loading=true;
							 $http({
						        method : "POST",
						        	url : "teams/"+team.id+"/players",
							        data: player,
							        headers: {'Content-Type': 'application/json; charset=utf-8'}
						    }).then(function mySuccess(response) {
						    	

								 $scope.loading=false;
						    			scorer.contact = response.data;
						    			$scope.addScorer(scorer);
						    			
						    			
						    			//$scope.newplayer={};
						    			//$scope.getTeam();
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

appAdmin.controller("newsController",function($scope, $http, $location, $window){

	 
	/* $scope.getTeams = function (){ */ 
		 $http({
	        method : "GET",
	        url : "news",
	        params:{headersonly:1}
	    }).then(function mySuccess(response) {

	        $scope.news = response.data;
	      
	    }, function myError(response) {

		      alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
	      
	    });
/*	 }*/
	 

		 
		 $scope.getNotice = function (){ 
		
		        $scope.notice = "";
			 $http({
		        method : "GET",
		        url : "news/"+$scope.selectedNotice.id
		    }).then(function mySuccess(response) {

			
		        $scope.notice = response.data;
		        
/*				 $http({
				        method : "GET",
				        url : "teams/"+$scope.selectedTeam.id+"/players"
				    }).then(function mySuccess(response) {
				        $scope.players = response.data;
				    }, function myError(response) {
				  
				        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
				    });*/

		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.addNotice = function (){ 
			 $scope.newnotice.date = new Date();
			 $http({
		        method : "POST",
		        	url : "news",
			        data: $scope.newnotice,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {

		    	$window.location.reload();
		        
		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Μήπως η ομάδα υπάρχει ήδη?");
		    });
		 }
		 
		 $scope.deleteNotice = function (){ 

			 if(!confirm("Είστε σίγουρος;"))
				 return;
				 
			 $http({
		        method : "DELETE",
		        url : "news/"+$scope.notice.id
		    }).then(function mySuccess(response) {

		    	$window.location.reload();
		      
		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.editNotice = function (){ 
			 $scope.notice.date = new Date();
			 //$scope.team.players=$scope.players;
			 //$scope.result=$scope.team;
			 $http({
		        method : "PUT",
		        	url : "news",
			        data: $scope.notice,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {
		    	
		    	$scope.getNotice();
		    }, function myError(response) {

		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.uploadImage = function(){
		     var fd = new FormData();
             fd.append('file', $scope.mylogo);
         
             
			 $http({
			        method : "POST",
			        	url : "news/"+$scope.notice.id+"/images",
				        data: fd,
				       // params:{file: $scope.myfile},
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}     
			    }).then(function mySuccess(response) {

			    	$scope.getNotice();
			    }, function myError(response) {

			        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
			    });
             
		 }
 
		
	
		 
	
		 
});


appAdmin.controller("custompagesController",function($scope, $http, $location, $window){

	 
	/* $scope.getTeams = function (){ */ 
		 $http({
	        method : "GET",
	        url : "custompages",
	        params:{headersonly:1}
	    }).then(function mySuccess(response) {

	        $scope.news = response.data;
	      
	    }, function myError(response) {

		      alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
	      
	    });
/*	 }*/
	 

		 
		 $scope.getCustompage = function (custompage){ 
		
		        $scope.custompage = "";
			 $http({
		        method : "GET",
		        url : "custompages/"+custompage.id
		    }).then(function mySuccess(response) {

			
		        $scope.custompage = response.data;
		        
/*				 $http({
				        method : "GET",
				        url : "teams/"+$scope.selectedTeam.id+"/players"
				    }).then(function mySuccess(response) {
				        $scope.players = response.data;
				    }, function myError(response) {
				  
				        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
				    });*/

		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.addCustompage = function (){ 
			 $scope.newcustompage.date = new Date();
			 $http({
		        method : "POST",
		        	url : "custompages",
			        data: $scope.newcustompage,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {

		    	$window.location.reload();
		        
		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Μήπως η ομάδα υπάρχει ήδη?");
		    });
		 }
		 
		 $scope.deleteCustompage = function (){ 

			 if(!confirm("Είστε σίγουρος;"))
				 return;
				 
			 $http({
		        method : "DELETE",
		        url : "custompages/"+$scope.custompage.id
		    }).then(function mySuccess(response) {

		    	$window.location.reload();
		      
		    }, function myError(response) {
		  
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.editCustompage = function (){ 
			 $scope.custompage.date = new Date();
			 //$scope.team.players=$scope.players;
			 //$scope.result=$scope.team;
			 $http({
		        method : "PUT",
		        	url : "custompages",
			        data: $scope.custompage,
			        headers: {'Content-Type': 'application/json; charset=utf-8'}
		    }).then(function mySuccess(response) {
		    	
		    	$scope.getCustompage($scope.selectedCustompage);
		    }, function myError(response) {

		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 $scope.uploadImage = function(){
		     var fd = new FormData();
             fd.append('file', $scope.mylogo);
         
             
			 $http({
			        method : "POST",
			        	url : "custompages/"+$scope.custompage.id+"/images",
				        data: fd,
				       // params:{file: $scope.myfile},
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}     
			    }).then(function mySuccess(response) {

			    	$scope.getCustompage($scope.selectedCustompage);
			    }, function myError(response) {

			        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
			    });
             
		 }
 
		
	/*images*/
		 
	 
	 
	 
    var formdata = new FormData();
    $scope.getTheFiles = function ($files) {
        angular.forEach($files, function (value, key) {
            formdata.append("files", value);
        });
    };
	 
    
    $scope.deleteImage = function (image) {
		   

			 if(!confirm("Είστε σίγουρος οτι θέλετε να διαγράψετε αυτή την εικόνα;"))
				 return;
		   
			 $http({
		    method : "DELETE",
     	url : "images/"+image.id  
 }).then(function mySuccess(response) {

 	$window.location.reload();
 	//$scope.getTeam();
 }, function myError(response) {

 	
     alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
 });
		   
	   }
    
    
    
    // NOW UPLOAD THE FILES.
    $scope.uploadFiles = function (custompage) {

   	 $scope.waiting= "Οι εικόνες ανεβαίνουν. Παρακαλώ περιμένετε..";
   	 $http({
		        method : "POST",
		        	url : "custompages/"+custompage.id+"/images",
			        data: formdata,
			        //params:{files: upl},
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined}     
		    }).then(function mySuccess(response) {
		    	 $scope.waiting= "";
		    	 $window.location.reload();
		    	//$scope.getCustompage($scope.selectedCustompage);
		    	//$scope.getTeam();
		    }, function myError(response) {

		    	
		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
    }
});

appAdmin.controller("usersController",function($scope, $http, $location, $window){
	
	 $http({
	        method : "GET",
	        url : "teams",
	    }).then(function mySuccess(response) {

	        $scope.teams = response.data;
	      
	    }, function myError(response) {
	    		      
	    });
	  $http({
	        method : "GET",
	        	url : "contacts"
	    }).then(function mySuccess(response) {

	    	$scope.users=response.data
	    }, function myError(response) {

	        //alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
	    });
	  
	  $scope.addUser = function(row,teamrow){
		  
		//  $scope.result= "teams/"+teamrow.id+"/adminusers";
		  $http({
		        method : "POST",
		        url : "teams/"+teamrow.id+"/adminusers",
		        params:{password:row.password, name: row.name, username:row.username}
		       // headers: {'Content-Type': 'application/json; charset=utf-8'} 
			      // params: {id:row.id,teamid1:row.team1.id,teamid2:row.team2.id,
			    	//   score1:row.score1,score2:row.score2, date:row.date, matchdayid:tmpmatchday.id}

		    }).then(function mySuccess(response) {

		      	$window.location.reload();
		    }, function myError(response) {
		  
		    	alert("An Error occured. Try again.");
		      
		    });
		 
	  }
		 $scope.deleteUser = function (row){ 
			 if(!confirm("Είστε σίγουρος;"))
				 return;
			 $http({
		        method : "DELETE",
		        	url : "players/"+row.id
		    }).then(function mySuccess(response) {
		    	$window.location.reload();
		        
		    }, function myError(response) {

		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 $scope.editUser = function (row){ 
			// $scope.result = row;
			 $http({
		        method : "PUT",
		        	url : "teamadmins",
		        	params:{name:row.name, username:row.username, id:row.id, password:row.password}
/*				        data: row,
				        headers: {'Content-Type': 'application/json; charset=utf-8'}*/
		    }).then(function mySuccess(response) {
		    	$window.location.reload();
		        
		    }, function myError(response) {

		        alert("Κατι δεν πηγε καλα. Δοκιμαστε ξανα.");
		    });
		 }
		 
		 
		 
		 
});
	


