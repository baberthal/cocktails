angular.module "cocktails"
  .controller "CocktailIndexController",
    ($scope, $state, $location, Cocktail, $mdDialog) ->
      queryCocktails = ->
        Cocktail.query().then (results) ->
          $scope.cocktailRecipes = results

      Cocktail.query().then (results) ->
        $scope.cocktailRecipes = results

      $scope.canEdit = (cocktail) ->
        if $scope.currentUser and $scope.currentUser.id == cocktail.userId
          true
        else
          false

      $scope.viewCocktail = (cocktail) ->
        $location.path("/cocktails/#{cocktail.id}")

      $scope.addRecipe = (ev) ->
        $mdDialog.show(
          controller: "CocktailAddController as ctrl"
          templateUrl: 'app/components/dialogs/addRecipe.tmpl.html'
          parent: angular.element(document.body)
          targetEvent: ev
        ).then ->
          queryCocktails()

      $scope.editRecipe = (id) ->
        $mdDialog.show(
          controller: "CocktailEditController"
          templateUrl: 'app/components/dialogs/editRecipe.tmpl.html'
          parent: angular.element(document.body)
          locals:
            cocktailId: id
        ).then ->
          queryCocktails()

      $scope.delete = (cocktailId) ->
        Cocktail.get(cocktailId).then (cocktail) ->
          cocktail.remove().then ->
            queryCocktails()
