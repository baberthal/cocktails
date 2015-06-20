angular.module('services')
.factory "Cocktail", [
  'RailsResource',
  (RailsResource) ->
    class Cocktail extends RailsResource
      @configure url: '/cocktails', name: 'cocktail'
]
