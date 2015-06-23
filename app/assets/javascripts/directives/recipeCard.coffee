angular.module 'cocktails'
  .directive 'recipeCard', ->
    return {
      restrict: 'E'
      templateUrl: '/templates/recipeCard.html'
    }
