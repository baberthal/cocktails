angular.module('controllers')
.controller "SearchCtrl", [
  '$scope',
  '$state',
  '$location',
  '$stateParams',
  'CocktailRecipe',
  ($scope, $state, $location, $stateParams, CocktailRecipe) ->
    $scope.search = (keywords) ->
      $location.path("/search").search('keywords', keywords)

    console.log $stateParams

    if $stateParams.keywords
      CocktailRecipe.query(keywords: $stateParams.keywords).then (results) ->
        $scope.searchResults = results
]
