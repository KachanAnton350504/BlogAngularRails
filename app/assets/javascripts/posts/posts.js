angular.module('Blog')
.factory('posts', [
'$http',

function($http){
  var o = {
    posts: []
  };
  o.getAll = function() {
    return $http.get('/posts.json').success(function(data) {
      angular.copy(data);
    });
  };
  
  o.getRubrics = function() {
    return $http.get('/rubrics.json').success(function(data) {
      angular.copy(data);
    });
  };
  
  o.addPost = function(post) {
    console.log(post)
    return $http.post('/posts', post).then(function(result){
      
      return result.data;
    });
  };
  
  o.get = function(id) {
    return $http.get('/posts/' + id).then(function(result){
      return result.data;
    });
  };
  o.addComment = function(id, comment) {
    return $http.post('/posts/' + id + '/comments', comment);
  };
  
  return o; 
}]);