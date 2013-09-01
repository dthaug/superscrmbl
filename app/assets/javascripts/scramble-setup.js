'use strict'

var scrambleSetup = angular.module('scrambleSetup',['ngResource']);

scrambleSetup.controller('NewScramble', ['$scope', 'Milestone', 'Scramble', function($scope, Milestone, Scramble){
	$scope.milestones = [];
	$scope.scrambleTitle = '';
	$scope.scramblePrice = '';
	$scope.scrambleMinPrice = '';
	$scope.scrambleItemCount = '';
	$scope.scrambleDescription = '';

	$scope.createScramble = function(){
		if(!$scope.newScramble.title.length|!$scope.newScramble.price.length|!$scope.newScramble.availableItems.length|!$scope.newScramble.description.length|!$scope.newScramble.minimumPrice.length){
			return;
		}
		var saveScramble = new Scramble($scope.newScramble);
		console.log(saveScramble);
		saveScramble.$save(function(resource){
			console.log(saveScramble);
		},
		function(response){
			alert(response.data.errors);
		});
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
	return $resource('/milestones');
}]);

scrambleSetup.factory('Scramble', ['$resource', function($resource){
	var res = $resource('/scrambles/:scrambleId',{},{
		post:{
			method:"POST",
			isArray:false,
			responseType: 'json'
		},
	});
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