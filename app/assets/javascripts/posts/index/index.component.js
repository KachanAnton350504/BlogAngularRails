angular.
    module('post.index').
    component('postsView', {
        templateUrl: 'posts/index/index.template.html',
        controller: [
            '$scope',
            'posts',
            function ($scope, posts) {

                $scope.posts_url = '/posts.json';   

                posts.getAll().then(function(posts) {
                  $scope.posts = posts.data;
                    });

                }
        ]
});