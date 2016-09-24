angular.
    module('post.create').
    component('postCreate', {
        templateUrl: 'posts/create/create.template.html',
        controller: [
            '$scope',
            'posts',
            'rubrics',
            '$state',
            '$timeout',
            'Flash',
            function ($scope, posts, rubrics, $state, $timeout, Flash) {

            rubrics.get().then(function(rubrics) {
              $scope.rubrics = rubrics.data;
                });

            $scope.rubric_ids = [];
            $scope.addPost = function(){
                posts.addPost({post: {
                    title: $scope.title,
                    body: $scope.body,
                    rubric_ids: $scope.rubric_ids
                }}).then(function (errors) {
                    if(errors.id){
                        var message = 'The Post was successfully created.'
                        $scope.id = Flash.create('success', message);
                        $state.go('home');
                    }
                    else {
                        for (var key in errors)
                          $scope.id = Flash.create('danger', key + ': ' + errors[key]);
                    }

                });}
            }
        ]
});