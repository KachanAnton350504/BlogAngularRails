angular.
    module('post.show').
    component('postShow', {
        templateUrl: 'posts/show/show.template.html',
        controller: [
            '$scope',
            'posts',
            '$stateParams',
            'Flash',
            function ($scope, posts, $stateParams, Flash) {

                $scope.comments_url = '/comments/' +$stateParams.id; 
                      
                posts.get($stateParams.id).then(function(post) {
                    $scope.post = post;
                    $scope.comments_count = post.comments.length
                });

                $scope.addComment = function(){
                    posts.addComment($scope.post.id,{
                      body: $scope.body,
                      post_id: $scope.post.id
                    }).success(function(comment) {
                      if(!comment.error) {
                        var message = 'The Comment was successfully created.'
                        $scope.id = Flash.create('success', message);
                        $scope.post.comments.push(comment);
                        $scope.comments_count += 1;
                      }
                      else {
                        var errors = comment.error
                        for (var key in errors)
                          $scope.id = Flash.create('danger', key + ': ' + errors[key]);
                      }
                      });
                       

                    $scope.body = '';
                };
            }
        ]
});