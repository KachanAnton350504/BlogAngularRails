angular.
    module('core.rubric').
    factory('rubrics',['$http',
        function ($http) {
            var o = {
                rubrics: []
            };

            o.get = function () {
                return $http.get('/rubrics.json').success(function (data) {
                    angular.copy(data);
                });
            };

            o.getName = function(id) {
                return $http.get('/rubrics/name/' + id).then(function(result){
                    return result.data;
                });
            };

            return o;
        }
]);