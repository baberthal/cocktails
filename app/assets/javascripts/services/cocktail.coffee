services = angular.module('services', [])
services.factory "Cocktail", [
  'railsResourceFactory',
  (railsResourceFactory) ->
    resource = railsResourceFactory
      url: '/cocktails'
      name: 'cocktail'
]
