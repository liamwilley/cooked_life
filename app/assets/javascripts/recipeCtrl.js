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

    $scope.addRecipe = function(newName, newDescription, newIngredients, newPrepTime, newInstructions) {
      var newRecipe = {
        name: newName,
        description: newDescription,
        ingredients: newIngredients,
        prepTime: newPrepTime,
        instructions: newInstructions
      };
      $http.post("/api/v1/recipes.json", recipe).then(function(response) {
        $scope.recipes.push(response.data)
      });
    }


  //delete recipe button incase you add wrong recipe

    window.$scope = $scope;
  });
})();