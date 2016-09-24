/**
 * Created by anton on 23/09/16.
 */
angular.
    module('nav').
    component('nav', {
        templateUrl: 'nav/nav.template.html',
        controller: [
            '$scope',
            'posts',
            'rubrics',
            'Auth',
            'Flash',
            function($scope, posts, rubrics, Auth, Flash) {
                $scope.signedIn = Auth.isAuthenticated;

                rubrics.get().then(function(rubrics) {
                    $scope.rubrics = rubrics.data;
                });
                $scope.logout = function() {
                    Auth.logout().then(
                        $scope.successAlert = function() {
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
                $scope.$on('devise:logout', function() {
                    $scope.user = {};
                });
            }
        ]
});