angular.module('controllers').controller "CocktailShowCtrl", [
  '$scope',
  '$state',
  '$stateParams',
  'Cocktail',
  ($scope, $state, $stateParams, Cocktail) ->
    Cocktail.get($stateParams.id).then (result) ->
      $scope.cocktail = result
      if result.ingredients.length >= 1
        $scope.hasIngredients = true
      else
        $scope.hasIngredients = false

]
