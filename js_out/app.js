(function() {
  var cocktails, controllers, services;

  cocktails = angular.module("cocktails", ['ngMaterial', 'rails', 'ui.router', 'controllers', 'services']);

  cocktails.config([
    '$httpProvider', '$stateProvider', '$urlRouterProvider', '$mdIconProvider', function($httpProvider, $stateProvider, $urlRouterProvider, $mdIconProvider) {
      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
      $urlRouterProvider.otherwise('/');
      $stateProvider.state('home', {
        url: '/',
        templateUrl: '/templates/index.html',
        controller: "CocktailsCtrl"
      });
      return $mdIconProvider.defaultFontSet("material-icons");
    }
  ]);

  controllers = angular.module('controllers', []);

  controllers.controller("CocktailsCtrl", [
    '$scope', 'CocktailRecipe', function($scope, CocktailRecipe) {
      return CocktailRecipe.query().then(function(results) {
        return $scope.cocktailRecipes = results;
      });
    }
  ]);

  controllers.controller("NavCtrl", ['$scope', function($scope) {}]);

  services = angular.module('services', []);

  services.factory("CocktailRecipe", [
    'railsResourceFactory', function(railsResourceFactory) {
      var resource;
      return resource = railsResourceFactory({
        url: '/cocktail_recipes',
        name: 'cocktail_recipe'
      });
    }
  ]);

}).call(this);
