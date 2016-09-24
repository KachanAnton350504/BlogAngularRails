angular.module('user.sign_up').
component('signUp', {
  templateUrl: 'users/sign_up/sign_up.template.html',
  controller: [
'$scope',
'$state',
'Auth',
'Flash',
function($scope, $state, Auth, Flash){


  $scope.register = function() {
    if($scope.user){
      $scope.user.role = "user"
    }
    Auth.register($scope.user).then(
      function(){
        var message = 'Sign up  successfully';
        $scope.id = Flash.create('success', message);
        $state.go('home');
      },
      function(error) {
        var message = error.data.errors;
        for(key in message)
          $scope.id = Flash.create('danger', key + ": " + message[key]);
      });
  };

  
}
]
});
