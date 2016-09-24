angular.module('rubric.show').
	component('rubricShow',{
		templateUrl: 'rubrics/show/show.template.html',
		controller: [
			'$scope',
			'rubrics',
			'$stateParams',
			function($scope, rubrics, $stateParams){
			  $scope.posts_url = '/rubrics/'+$stateParams.id;

			  rubrics.getName($stateParams.id).then(function(rubric) {
			     $scope.rubric_name = rubric.name
			     $scope.posts = rubric.posts
			  });

			}
		]
	});