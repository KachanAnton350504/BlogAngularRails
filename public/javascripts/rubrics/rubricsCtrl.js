angular.module('Blog')
.controller('RubricsCtrl', [
'$scope',
'posts',
'rubrics',
'$stateParams',
'$sce',
'Auth',
function($scope, posts, rubrics, $stateParams, $sce, Auth){
  $scope.posts_url = '/rubrics/'+$stateParams.id; 
  //$scope.signedIn = Auth.isAuthenticated;
  
  rubrics.getName($stateParams.id).then(function(rubric) {
     $scope.rubric_name = rubric.name
  });

  // rubrics.getAll().then(function(rubrics) {
  //  $scope.rubrics = rubrics.data;
  //  });

  posts.getAll().then(function(posts) {
   $scope.posts = posts.data;
   });

  // $scope.trustAsHtml = $sce.trustAsHtml;
  // $scope.id = [];
  // $scope.id.push($stateParams.id);
  // $scope.addPost = function(){
  //   if(!$scope.title || $scope.title === '') return;
  //   rubrics.addPost({
  //     title: $scope.title,
  //     rubric_ids: $scope.id,
  //     body: $scope.body,
  //   }).success(function(post) {
  //     if(post.id){
  //       $scope.posts.unshift(post);
  //       $scope.alert = 'The Post was successfully created.';
  //       $("#notice").removeClass('alert-danger alert');
  //       $("#notice").toggleClass('alert-success alert');
  //     } else {
  //       $scope.alert = 'The Post was not created.';
  //       $("#notice").removeClass('alert-success alert');
  //       $("#notice").toggleClass('alert-danger alert');      
  //     }
              
  //     $("#notice").css('visibility','visible');
  //     window.scrollTo(0, 0);
  //   });
  //   $scope.title = '';
  //   $scope.body = '';
  // }  
}]);