angular.module('Blog')
.factory('rubrics', [
'$http',

function($http){
  var o = {
    rubrics: []
  };
  // o.getAll = function() {
  //   return $http.get('/rubrics.json').success(function(data) {
  //     angular.copy(data);
  //   });
  // };
  
  // o.addPost = function(post) {
  //   return $http.post('/posts.json', post);
  // };
  o.getName = function(id) {
    return $http.get('/rubrics/name/' + id).then(function(result){
      return result.data;
    });
  };
  // o.get = function(id) {
  //   return $http.get('/rubrics/' + id).then(function(result){
  //     return result.data;
  //   });
  // };
  
  return o; 
}]);