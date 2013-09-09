'use strict'

var scrambleSetup = angular.module('scrambleSetup',['ngResource']);

scrambleSetup.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
}]);

scrambleSetup.controller('NewScramble', ['$scope', '$location' , '$window', 'Milestone', 'Scramble', function($scope, $location, $window, Milestone, Scramble){
	$scope.milestones = [];
	$scope.scrambleTitle = '';
	$scope.scramblePrice = '';
	$scope.scrambleMinPrice = '';
	$scope.scrambleAvailableItems = '';
	$scope.scrambleDescription = '';

	$scope.createScramble = function(){
		if(!$scope.scrambleTitle.length|!$scope.scramblePrice.length|!$scope.scrambleAvailableItems.length|!$scope.scrambleDescription.length|!$scope.scrambleMinPrice.length){
			return;
		}
		var saveScramble = new Scramble();
		saveScramble.title = $scope.scrambleTitle;
		saveScramble.description = $scope.scrambleDescription;
		saveScramble.available_items = parseInt($scope.scrambleAvailableItems);
		saveScramble.price = parseFloat($scope.scramblePrice);
		saveScramble.minimum_price = parseFloat($scope.scrambleMinPrice);
		
		saveScramble.$save(function(resource){
			$scope.saveMilestones(saveScramble.id);
			console.log(saveScramble);
			$window.location.href = 'http://localhost:3000/scrambles/' + saveScramble.id;
		},
		function(response){
			alert(response.data.errors);
			return;
		});
		
		
	}

	$scope.saveMilestones = function(scrambleID){
		for (var i = $scope.milestones.length - 1; i >= 0; i--) {
				var newMilestone = new Milestone({discount:0, limit:parseInt($scope.milestones[i]), scramble_id:scrambleID});
				newMilestone.$save(function(resource){
					console.log(newMilestone);
				},
				function(response){
					alert(response.data.errors);

				});
			};
	}

	$scope.addMilestone = function() {
		var newMilestone = $scope.newMilestone.trim();

		if(!newMilestone.length){
			return;
		}
		for (var i = $scope.milestones.length - 1; i >= 0; i--) {
					if($scope.milestones[i] == newMilestone){
						$scope.newMilestone='';
						return;
					}
				};

		$scope.milestones.push(newMilestone);
		$scope.newMilestone='';
	}
}]);

scrambleSetup.factory('Milestone', ['$resource', function($resource){
	var ret = $resource('/scrambles/:scrambleId/milestones/:id', {scrambleId: '@scramble_id', id: '@id'});
/*		{ 'get':    {method:'JSONP', isArray:true},
                'save':   {method:'POST'},
                'query':  {method:'JSONP', isArray:true},
                'remove': {method:'DELETE'},
                'delete': {method:'DELETE'} });*/
	return ret;
	//return $resource('/milestones/:id', { id: '@id'});
}]);

scrambleSetup.factory('Scramble', ['$resource', function($resource){
	var res = $resource('/scrambles/:id', {id: '@id'});
/*		{ 'get':    {method:'JSONP'},
                'save':   {method:'POST'},
                'query':  {method:'JSONP'},
                'remove': {method:'DELETE'},
                'delete': {method:'DELETE'} });*/
	return res;
}]);


/*scrambleSetup.controller('ScrambleDetails', function($scope, $location, Scramble){
	$scope.scramble = new 
})*/

/*
function ScrambleSetup($scope){
	$scope.milestones = [];

	$scope.addMilestone = function() {
		var newMilestone = $scope.newMilestone.trim();

		if(!newMilestone.length){
			return;
		}

		$scope.milestones.push(newMilestone);

		$scope.newMilestone='';
	}
}

*/