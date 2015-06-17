services = angular.module('services', [])
services.factory "CocktailRecipe", [
  'railsResourceFactory',
  (railsResourceFactory) ->
    resource = railsResourceFactory
      url: '/cocktail_recipes'
      name: 'cocktail_recipe'
]
