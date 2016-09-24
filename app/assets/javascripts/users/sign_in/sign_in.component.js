angular.module('user.sign_in').
component('signIn', {
  templateUrl: 'users/sign_in/sign_in.template.html',
  controller: [
'$scope',
'$state',
'Auth',
'Flash',
function($scope, $state, Auth, Flash){


  $scope.login = function() {
     Auth.login($scope.user).then(
      function () {
      var message = 'Signed in successfully';
      $scope.id = Flash.create('success', message);
      $state.go('home');
    },
       function(error) {
            var message = error.data.error;
            $scope.id = Flash.create('danger', message);  
          });
    };

  
}
]
});
