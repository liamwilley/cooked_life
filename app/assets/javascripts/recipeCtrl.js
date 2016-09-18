(function () {
  "use strict";

  angular.module("app").controller("recipeCtrl", function($scope, $http) {

    $scope.recipes = [];

    $scope.setup = function(currentUserId) {
      $http.get('/api/v1/recipes.json').then(function(response) {
        $scope.recipes = response.data;
        $scope.currentUserId = currentUserId;
      });
      $scope.recipes;
    }

   $scope.createMeal = function(mealName) {
    $http.post('/api/v1/meals.json', {mealName: mealName, currentUserId: $scope.currentUserId}).then(function(response) {
      $scope.meal = response.data;
    });
   }

   $scope.addRecipe = function(recipe) {
    console.log(recipe);
    $http.post('/api/v1/meal_recipes.json', {mealId: $scope.meal.id, recipeId: recipe.id}).then(function(response) {

    });
   }


  //delete recipe button incase you add wrong recipe

    window.$scope = $scope;
  });
})();