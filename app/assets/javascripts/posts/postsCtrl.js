angular.module('Blog')
.controller('PostsCtrl', [
'$scope',
'posts',
'$stateParams',
'$sce',
'Auth',
function($scope, posts, $stateParams, $sce, Auth){
  $scope.comments_url = '/comments/' +$stateParams.id; 
    $scope.signedIn = Auth.isAuthenticated;
  


  posts.get($stateParams.id).then(function(post) {
    $scope.post = post;
    $scope.comments_count = post.comments.length
  });
  posts.getRubrics().then(function(rubrics) {
    $scope.rubrics = rubrics.data;
  });
  $scope.trustAsHtml = $sce.trustAsHtml;
  
  $scope.addComment = function(){
    if($scope.body === '') return;
    posts.addComment($scope.post.id, {
      body: $scope.body
    }).success(function(comment) {
      $scope.alert = 'The Comment was successfully created.';
      $scope.post.comments.push(comment);
    });
      $scope.comments_count += 1;
      $("#notice").css('visibility','visible');
      

    $scope.body = '';
  };
  
}]);