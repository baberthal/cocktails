angular.module('controllers')
.controller 'IngredientsCtrl', [
  '$scope',
  'Ingredient',
  ($scope, Ingredient) ->
    Ingredient.query().then (results) ->
      $scope.ingredients = results
]
