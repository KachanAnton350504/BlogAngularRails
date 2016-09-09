angular.module('Blog')
.controller('NavCtrl', [
  '$scope',
  'Auth',
  'Flash', 
  function($scope, Auth, Flash) {
    $scope.signedIn = Auth.isAuthenticated;
    $scope.logout = function() { 
      Auth.logout().then(
      $scope.successAlert = function (err) {
        var message = 'Signed out successfully';
        $scope.id = Flash.create('success', message);
        console.log(err);
      },
      function() {
        // var message = "Signed in successfully."
        // var id = Flash.create('success', message);
        });
    };
    // }
       Auth.currentUser().then(function (user) {
         $scope.user = user;
       }, 
       function(error) {
            console.log(error)
        }
       );


    // $scope.$on('devise:unauthorized', function(event, xhr, deferred) {
    //         console.log('Authentication Failed!');
    //          var config = { interceptAuth: true};
    //        });
     
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
