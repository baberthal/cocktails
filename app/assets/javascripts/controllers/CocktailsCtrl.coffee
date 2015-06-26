angular.module('controllers')
  .controller("CocktailsCtrl", [
    '$scope',
    '$state',
    '$location',
    'Cocktail',
    '$mdDialog',
    ($scope,$state,$location,Cocktail,$mdDialog) ->

      queryCocktails = ->
        Cocktail.query().then (results) ->
          $scope.cocktailRecipes = results

      Cocktail.query().then (results) ->
        $scope.cocktailRecipes = results

      $scope.canEdit = (cocktail)->
        if $scope.currentUser.id == cocktail.userId
          true
        else
          false

      $scope.viewCocktail = (cocktail) ->
        $location.path("/cocktails/#{cocktail.id}")

      $scope.addRecipe = (ev) ->
        $mdDialog.show(
          controller: 'CocktailAddCtrl as ctrl'
          templateUrl: '/templates/addRecipe.tmpl.html'
          parent: angular.element(document.body)
          targetEvent: ev
        ).then ->
          queryCocktails()

      $scope.editRecipe = (id) ->
        $mdDialog.show(
          controller: 'CocktailEditCtrl'
          templateUrl: '/templates/editRecipe.tmpl.html'
          parent: angular.element(document.body)
          locals:
            cocktailId: id
        ).then ->
          queryCocktails()

      $scope.delete = (cocktail_id) ->
        Cocktail.get(cocktail_id).then (cocktail) ->
          cocktail.remove().then ->
            queryCocktails()


  ])
