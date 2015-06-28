angular.module("cocktails")
.config(['$urlRouterProvider', '$stateProvider',
  ($urlRouterProvider, $stateProvider) ->
    $urlRouterProvider.otherwise('/')
    $stateProvider
      .state('home',
        url: '/'
        templateUrl: '/templates/index.html'
        controller: "CocktailsCtrl"
      ).state('search',
        url: '/search?keywords='
        templateUrl: '/templates/search.html'
        controller: "SearchCtrl"
      ).state('whatCanImake',
        url: '/what_can_i_make'
        templateUrl: '/templates/what_can_i_make.html'
        controller: 'MyBarCtrl'
      ).state('cocktails',
        url: '/cocktails'
        abstract: 'true'
        template: '<ui-view></ui-view>'
      ).state('cocktails.browse',
        url: '/browse'
        templateUrl: '/templates/cocktails.html'
        controller: 'CocktailsCtrl'
      ).state('cocktails.view',
        url: '/:id'
        templateUrl: '/templates/cocktailShow.html'
        controller: 'CocktailShowCtrl'
      ).state('ingredients',
        url: '/ingredients'
        templateUrl: '/templates/ingredients.html'
        controller: 'IngredientsCtrl'
      )
])
#  vim: set ts=8 sw=2 tw=0 ft=coffee et :
