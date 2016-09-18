(function () {
  "use strict";

  angular.module("app").controller("recipeCtrl", function($scope, $http) {

    $scope.recipes = [];

    $scope.setup = function() {
      $http.get('/api/v1/recipes.json').then(function(response) {
        $scope.recipes = response.data;
      });
      $scope.recipes;
    }

   $scope.createMeal = function(mealName) {
    $http.post('/api/v1/meals.json', {mealName: mealName}).then(function(response) {
      $scope
    });
   }


  //delete recipe button incase you add wrong recipe

    window.$scope = $scope;
  });
})();