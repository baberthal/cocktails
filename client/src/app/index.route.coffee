angular.module "cocktails"
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "home",
        url: "/"
        templateUrl: "app/main/main.html"
        controller: "CocktailIndexController"
        controllerAs: "ctrl"
      .state "search",
        url: '/search?keywords='
        templateUrl: 'app/views/search/search.html'
        controller: "SearchController"
      .state "whatCanImake",
        url: '/what_can_i_make'
        templateUrl: 'app/views/bar/whatCanImake.html'
        controller: 'MyBarController'
      .state "cocktails",
        url: '/cocktails'
        abstract: 'true'
        template: '<ui-view></ui-view>'
      .state "cocktails.browse",
        url: '/browse'
        templateUrl: 'app/views/cocktails/browse.html'
        controller: 'CocktailBrowseController'
      .state "cocktails.view",
        url: '/:id'
        templateUrl: 'app/views/cocktails/show.html'
        controller: 'CocktailShowController'
      .state 'ingredients',
        url: '/ingredients'
        templateUrl: 'app/views/ingredients/browse.html'
        controller: 'IngredientsController'

    $urlRouterProvider.otherwise '/'
