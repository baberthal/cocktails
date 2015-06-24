angular.module('controllers')
  .controller("CocktailsCtrl", [
    '$scope',
    'Cocktail',
    '$mdDialog',
    ($scope,Cocktail,$mdDialog) ->
      Cocktail.query().then (results) ->
        $scope.cocktailRecipes = results

      $scope.addRecipe = (ev) ->
        $mdDialog.show(
          controller: 'CocktailAddCtrl as ctrl'
          templateUrl: '/templates/addRecipe.tmpl.html'
          parent: angular.element(document.body)
          targetEvent: ev
        ).then ->
          Cocktail.query().then (results) ->
            $scope.cocktailRecipes = results

      $scope.editRecipe = (ev) ->
        $mdDialog.show(
          controller: 'CocktailEditCtrl'
          templateUrl: '/templates/editRecipe.tmpl.html'
          parent: angular.element(document.body)
          targetEvent: ev
        ).then ->
          Cocktail.query().then (results) ->
            $scope.cocktailRecipes = results


  ])
