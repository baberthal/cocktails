angular.module "cocktails"
  .controller "CocktailAddController",
    ($scope, $state, Ingredient, Cocktail, $mdDialog) ->
      $scope.isSubmitting = false

      Ingredient.query().then (results) ->
        $scope.ingredients = results

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
