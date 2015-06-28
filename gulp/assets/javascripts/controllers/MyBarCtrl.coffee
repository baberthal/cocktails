angular.module('controllers')
.controller 'MyBarCtrl', [
  '$scope',
  'Ingredient',
  'Bar',
  ($scope, Ingredient, Bar) ->

    Bar.query().then (results) ->
      $scope.userBar = results

    Bar.$get('/bars/available_cocktails.json').then (results) ->
      $scope.availableCocktails = results

    Ingredient.query().then (results) ->
      $scope.ingredients = results

    $scope.addIngredient = (ingredient) ->
      newBarItem = new Bar
      newBarItem.userId = $scope.currentUser.id
      newBarItem.ingredientId = ingredient.id
      newBarItem.create().then ->
        Bar.query().then (results) ->
          $scope.userBar = results

]
