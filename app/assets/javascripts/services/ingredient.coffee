angular.module('services')
.factory "Ingredient", [
  'RailsResource',
  (RailsResource) ->
    class Ingedient extends RailsResource
      @configure url: '/ingredients', name: 'ingredient'
]
