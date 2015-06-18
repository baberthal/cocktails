angular.module('controllers')
.controller("CocktailsCtrl", [ '$scope', 'Cocktail',
  ($scope,Cocktail) ->
    Cocktail.query().then (results) ->
      $scope.cocktailRecipes = results
])
