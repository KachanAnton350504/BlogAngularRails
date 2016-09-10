angular.module('Blog')
.controller('PostsCtrl', [
'$scope',
'posts',
'$stateParams',
'$sce',
'Auth',
function($scope, posts, $stateParams, $sce, Auth){
  $scope.comments_url = '/comments/' +$stateParams.id; 
    $scope.signedIn = Auth.isAuthenticated;
  


  posts.get($stateParams.id).then(function(post) {
    $scope.post = post;
    $scope.comments_count = post.comments.length
  });

  
  posts.getRubrics().then(function(rubrics) {
    $scope.rubrics = rubrics.data;
  });
  $scope.trustAsHtml = $sce.trustAsHtml;
  
  $scope.addComment = function(){
    posts.addComment($scope.post.id,{
      body: $scope.body,
      post_id: $scope.post.id
    }).success(function(comment) {
      if(!comment.error) {
        console.log(comment)
        $scope.alert = 'The Comment was successfully created.';
        $scope.post.comments.push(comment);
        $scope.comments_count += 1;
        $("#notice").css('visibility','visible');
      }
      else {
        console.log(comment)

         $scope.errors = comment.error
         $scope.show_error_messages = Object.keys( comment.error ).length;        
      }
      });
       

    $scope.body = '';
  };
  
}]);



// $scope.addPost = function(){
//    posts.addPost({
//       title: $scope.title,
//       rubric_ids: $scope.rubric_ids,
//       body: $scope.body,
//     }).then(function (errors) {
//           console.log(errors)
//           if(errors.id){
//             $scope.alert = 'The Post was successfully created.';
          
//             $timeout(function () {
//               $state.go('home');
//           }, 2000);
//           } 
//           else {    
//             $scope.errors = errors
//             $scope.show_error_messages = Object.keys( errors ).length;
//           }
  
//         });}