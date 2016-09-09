angular.module('Blog')
.controller('AuthCtrl', [
'$scope',
'$state',
'Auth',
'Flash',
function($scope, $state, Auth, Flash){

  $scope.login = function() {
     Auth.login($scope.user).then(
      $scope.successAlert = function () {
      var message = 'Signed in successfully';
      $scope.id = Flash.create('success', message);
      $state.go('home');
    },
       function(error) {
            var message = error.data.error;
            $scope.id = Flash.create('danger', message);
          });
    };


  $scope.register = function() {
    Auth.register($scope.user).then(
      $scope.successAlert = function(){
        var message = 'Sign up  successfully';
        $scope.id = Flash.create('success', message);
        $state.go('home');
      },
      function(RESPONSE_ERROR) {
        $scope.errors = RESPONSE_ERROR.data.errors;
        $scope.show_error_messages = Object.keys( $scope.errors ).length;
      });
  };

  
}]);
