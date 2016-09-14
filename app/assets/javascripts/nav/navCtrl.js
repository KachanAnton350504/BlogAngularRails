angular.module('Blog')
.controller('NavCtrl', [
  '$scope',
  'posts',
  'Auth',
  'Flash', 
  function($scope, posts, Auth, Flash) {
    $scope.signedIn = Auth.isAuthenticated;
    
    posts.getRubrics().then(function(rubrics) {
    $scope.rubrics = rubrics.data;
  });
    $scope.logout = function() { 
      Auth.logout().then(
      $scope.successAlert = function (err) {
        var message = 'Signed out successfully';
        $scope.id = Flash.create('danger', message);
      },
      function() {});
    };
      
      Auth.currentUser().then(function (user) {
        $scope.user = user;
       }, 
       function(error) {
        }
       );


   
     $scope.$on('devise:new-registration', function(e, user) {
       $scope.user = user;
     });
      $scope.$on('devise:login', function(e,user) {
       $scope.user = user;
      
     });
     $scope.$on('devise:logout', function(e, user) {
      $scope.user = {};
    });
}]);
