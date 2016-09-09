angular.module('Blog')
.controller('MainCtrl', [
'$scope',
'posts',
'$sce',
'$state',
'Auth',
'limitToFilter',
'Flash',
function($scope, posts, $sce, $state, Auth, Flash, limitToFilter){
  $scope.posts_url = '/posts.json';   
  $scope.trustAsHtml = $sce.trustAsHtml;
  $scope.signedIn = Auth.isAuthenticated;

 console.log(posts);
  
  $scope.limit = 200;
  
  posts.getAll().then(function(posts){
    $scope.posts = posts.data; 
  });

  posts.getRubrics().then(function(rubrics) {
    $scope.rubrics = rubrics.data;
  });
$scope.successAlert = function(error) {
            console.log("error")
            console.log(error)
      var message = 'Signed in successfully';
      $scope.id = Flash.create('success', message);
  }
  $scope.rubric_ids = [];
  $scope.addPost = function(){
   $scope.successAlert = posts.addPost({
      title: $scope.title,
      rubric_ids: $scope.rubric_ids,
      body: $scope.body,
    }).then(function (error) {
          console.log(error.data)
          $scope.successAlert
          $scope.successAlert = function(){$scope.id = Flash.create('success', error.data);}
          $state.go('home');
        });}   
}]);


// Auth.login($scope.user).then(
//       $scope.successAlert = function () {
//       var message = 'Signed in successfully';
//       $scope.id = Flash.create('success', message);
//       $state.go('home');
//     },
//        function(error) {
//             var message = error.data.error;
//             $scope.id = Flash.create('danger', message);
//           });
//     };