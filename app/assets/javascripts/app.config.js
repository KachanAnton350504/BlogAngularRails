/**
 * Created by anton on 23/09/16.
 */
angular.
  module('Blog').
  config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {

        $stateProvider
            .state('home', {
                url: '/home',
                template: '<posts-view></posts-view>'
            })
            .state('post_show', {
                url: '/posts/{id}',
                template: '<post-show></post-show>'
            })

            .state('create_post', {
                url: '/home/create',
                template: '<post-create></post-create>'
            })

            .state('rubric_show', {
                url: '/rubrics/{id}',
                template: '<rubric-show></rubric-show>'
            })


            .state('sign_in', {
                url: '/login',
                template: '<sign-in></sign-in>'
            })

            .state('sign_up', {
                url: '/register',
                template: '<sign-up></sign-up>'
            });

        $urlRouterProvider.otherwise('home');
    }
]);
