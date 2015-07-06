angular.module 'cocktails'
  .controller 'IngredientsController',
    ($scope, Ingredient) ->
      Ingredient.query().then (results) ->
        $scope.ingredients = results
