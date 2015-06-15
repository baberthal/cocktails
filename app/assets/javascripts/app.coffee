cocktails = angular.module("cocktails", [
  'ngMaterial',
  'rails',
  'ui.router',
  'controllers',
  'services'
])

cocktails.config([
  '$httpProvider',
  '$stateProvider',
  '$urlRouterProvider',
  '$mdIconProvider',
  ($httpProvider, $stateProvider, $urlRouterProvider, $mdIconProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

    $urlRouterProvider.otherwise('/')

    $stateProvider
      .state('home',
        url: '/'
        templateUrl: '/templates/index.html'
        controller: "CocktailsCtrl"
      )

    $mdIconProvider.defaultFontSet("material-icons")
])

controllers = angular.module('controllers', [])
controllers.controller "CocktailsCtrl", [
  '$scope',
  'CocktailRecipe',
    ($scope,CocktailRecipe) ->
      CocktailRecipe.query().then (results) ->
        $scope.cocktailRecipes = results
]

controllers.controller "NavCtrl", [
  '$scope',
  ($scope) ->
]

services = angular.module('services', [])
services.factory "CocktailRecipe", [
  'railsResourceFactory',
  (railsResourceFactory) ->
    resource = railsResourceFactory
      url: '/cocktail_recipes'
      name: 'cocktail_recipe'
]

