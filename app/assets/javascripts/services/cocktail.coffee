angular.module('services')
.factory "Cocktail", [
  'railsResourceFactory',
  (railsResourceFactory) ->
    resource = railsResourceFactory
      url: '/cocktails'
      name: 'cocktail'
]
