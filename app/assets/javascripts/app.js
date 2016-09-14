angular.module('Blog', ['ui.router',
'templates',
'Devise',
'ngFlash',
'bgf.paginateAnything',
'checklist-model'])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {

  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/_home.html',
      
      controller: 'MainCtrl'
    })
    .state('posts', {
      url: '/posts/{id}',
      templateUrl: 'posts/_posts.html',
      controller: 'PostsCtrl'
    })
    
    .state('create_post', {
      url: '/home/create',
      templateUrl: 'home/_create_post.html',
      controller: 'MainCtrl'
    })
     
    .state('layouts', {
      templateUrl: 'layout/_rubrics_list.html',
      templateUrl: 'layout/_posts.html',
    })

    .state('rubrics', {
      url: '/rubrics/{id}',
      templateUrl: 'rubrics/_rubrics.html',
      controller: 'RubricsCtrl'
    })

     
    .state('login', {
      url: '/login',
      templateUrl: 'auth/_login.html',
      controller: 'AuthCtrl',
      onEnter: ['$state', 'Auth', 'Flash', function($state, Auth, Flash) {
      }]
    })
  
    .state('register', {
      url: '/register',
      templateUrl: 'auth/_register.html',
      controller: 'AuthCtrl',
      onEnter: ['$state', 'Auth','Flash', function($state, Auth, Flash) {
        // Auth.currentUser().then(function (){
        //   $state.go('home');
        // });
      }]
    });

    $urlRouterProvider.otherwise('home');
}])
// // .config((FlashProvider) => {
// //     FlashProvider.setTimeout(5000);
// //     FlashProvider.setShowClose(true);
// // })
// .config(function(AuthInterceptProvider) {
//         // Intercept 401 Unauthorized everywhere
//         AuthInterceptProvider.interceptAuth(true);
// });
