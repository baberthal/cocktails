angular.module('controllers')
.controller("CocktailsCtrl", [ '$scope', 'CocktailRecipe',
  ($scope,CocktailRecipe) ->
    CocktailRecipe.query().then (results) ->
      $scope.cocktailRecipes = results
])
