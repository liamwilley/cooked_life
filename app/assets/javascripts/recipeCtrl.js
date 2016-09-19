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

   $scope.toggleRecipe = function(recipe, toggle) {
    console.log(toggle);

    if (toggle == true) {
      $http.post('/api/v1/meal_recipes.json', {mealId: $scope.meal.id, recipeId: recipe.id}).then(function(response) {
        recipe.added = true;
      });
    }
    else {
      console.log($scope.meal.id, recipe.id);
      $http.delete('/api/v1/meal_recipes/' + $scope.meal.id + '/' + recipe.id + '.json').then(function(response) {
        recipe.added = false;
      });
    }

   }


  //delete recipe button incase you add wrong recipe

    window.$scope = $scope;
  });
})();