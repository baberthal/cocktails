angular.module 'cocktails'
  .controller 'CocktailBrowseController',
    ($scope, $state, $location, Cocktail) ->

      $scope.showAdvanced = false

      Cocktail.query().then (results) ->
        $scope.cocktails = results

      $scope.toggleForm = ->
        if $scope.showAdvanced
          $scope.showAdvanced = false
          console.log $scope.showAdvanced
        else
          $scope.showAdvanced = true
          console.log $scope.showAdvanced

