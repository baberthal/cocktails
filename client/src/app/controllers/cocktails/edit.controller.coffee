angular.module "cocktails"
  .controller "CocktailEditController",
    ($scope, Cocktail, $mdDialog, cocktailId) ->
      Cocktail.get(cocktailId).then (cocktail) ->
        $scope.cocktail = cocktail

      $scope.cancel = ->
        $mdDialog.cancel()

      $scope.saveRecipe = (cocktail) ->
        cocktail.update().then ->
          $mdDialog.hide()
