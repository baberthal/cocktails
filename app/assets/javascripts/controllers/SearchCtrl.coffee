angular.module('controllers')
.controller "SearchCtrl", [
  '$scope',
  '$state',
  '$location',
  '$stateParams',
  'Cocktail',
  ($scope, $state, $location, $stateParams, Cocktail) ->
    $scope.search = (keywords) ->
      $location.path("/search").search('keywords', keywords)

    if $stateParams.keywords
      Cocktail.query(keywords: $stateParams.keywords).then (results) ->
        $scope.searchResults = results
]
