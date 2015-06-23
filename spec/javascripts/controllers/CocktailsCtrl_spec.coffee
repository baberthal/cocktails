#= require spec_helper

describe 'CocktailsCtrl', ->
  beforeEach ->
    @controller('CocktailsCtrl', { $scope: @scope })
    @cocktailRecipes = [
      {
        id: 2
        name: 'Margarita (Cadillac)'
      },
      {
        id: 1
        name: 'Margarita'
      }
    ]
    templateRequest = new RegExp("\/templates\/*")
    @http.expectGET(templateRequest).respond(200)
    @http.whenGET('/cocktails').respond(200, @cocktailRecipes)
    @http.flush()

  describe 'controller initialization', ->
    describe 'cocktail recipe index', ->
      it 'sets up the list of recent cocktail recipes', ->
        expect(@scope.cocktailRecipes.length).toEqual(2)

      it 'calls the backend', ->
        expect(@scope.cocktailRecipes).toEqualData(@cocktailRecipes)


# vim: set ts=8 sw=2 tw=0 ft=coffee et :
