angular.module 'cocktails'
  .factory 'Cocktail', (RailsResource) ->
    class Cocktail extends RailsResource
      @configure url: '/api/cocktails', name: 'cocktail'
