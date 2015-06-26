angular.module('controllers').controller "CocktailAddCtrl", [
  '$scope',
  '$state',
  'Ingredient',
  'Cocktail',
  '$mdDialog',
  ($scope, $state, Ingredient, Cocktail, $mdDialog) ->
    $scope.isSubmitting = false
    self = this

    $scope.cancel = ->
      $mdDialog.cancel()

    $scope.cocktail = new Cocktail

    $scope.saveRecipe = (recipe) ->
      $scope.isSubmitting = true
      recipe.create().then(->
        $state.go('home')
      ).finally ->
        $scope.isSubmitting = false
        $mdDialog.hide()

    Ingredient.query().then (results) ->
      $scope.ingredients = results

]
