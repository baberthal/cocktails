angular.module('services')
.factory "Ingredient", [
  'railsResourceFactory',
  (railsResourceFactory) ->
    resource = railsResourceFactory
      url: '/ingredients'
      name: 'ingredient'
]
