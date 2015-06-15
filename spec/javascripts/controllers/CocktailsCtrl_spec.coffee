describe 'CocktailsCtrl', ->
  scope       = null
  ctrl        = null
  location    = null
  httpBackend = null
  CocktailRecipe = null

  setupController = (results) ->
    inject(($location, $rootScope, _CocktailRecipe_, $httpBackend, $controller) ->
      scope          = $rootScope.$new()
      location       = $location
      CocktailRecipe = _CocktailRecipe_
      httpBackend    = $httpBackend

      request = new RegExp("\/cocktail_recipes")
      httpBackend.expectGET(request).respond(results)

      ctrl        = $controller("CocktailsCtrl",
                                $scope: scope
                                $location: location)
    )

  beforeEach(module("cocktails"))

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()

  describe 'controller initialization', ->
    describe 'cocktail recipe index', ->
      cocktailRecipes = [
        {
          id: 2
          name: 'Margarita (Cadillac)'
        },
        {
          id: 1
          name: 'Margarita'
        }
      ]
      beforeEach ->
        setupController(cocktailRecipes)
        httpBackend.flush()

      it 'calls the backend', ->
        expect(scope.cocktailRecipes).toEqualData(cocktailRecipes)


# vim: set ts=8 sw=2 tw=0 ft=coffee et :
