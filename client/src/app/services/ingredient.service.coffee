angular.module 'cocktails'
  .factory 'Ingredient', (RailsResource) ->
    class Ingredient extends RailsResource
      @configure url: '/api/ingredients', name: 'ingredient'
