angular.module('Blog')
.controller('MainCtrl', [
'$scope',
'posts',
'$sce',
'$state',
'$timeout',
'Auth',
'limitToFilter',
'Flash',
function($scope, posts, $sce, $state, $timeout, Auth, Flash, limitToFilter){
  $scope.posts_url = '/posts.json';   
  $scope.trustAsHtml = $sce.trustAsHtml;
  $scope.signedIn = Auth.isAuthenticated;

  
  $scope.limit = 200;
  
  posts.getRubrics().then(function(rubrics) {
    $scope.rubrics = rubrics.data;
  });

  $scope.rubric_ids = [];
  $scope.addPost = function(){
   posts.addPost({post: {
      title: $scope.title,
      body: $scope.body,
      rubric_ids: $scope.rubric_ids
    }}).then(function (errors) {
          if(errors.id){
            $scope.alert = 'The Post was successfully created.';
          
            $timeout(function () {
              $state.go('home');
          }, 2000);
          } 
          else {             
            $scope.errors = errors
            $scope.show_error_messages = Object.keys( errors ).length;
          }
  
        });}   
}]);
