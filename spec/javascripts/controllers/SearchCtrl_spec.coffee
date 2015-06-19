#= require spec_helper

describe 'SearchCtrl', ->
  templateRequest = new RegExp("\/templates\/*")
  searchRequest = new RegExp("\/cocktails\/*")
  beforeEach ->
    @controller('SearchCtrl', { $scope: @scope })
    @CocktailRecipe = @model('Cocktail')
    @searchResults = [
      {
        id: 2
        name: 'Margarita (Cadillac)'
      },
      {
        id: 1
        name: 'Margarita'
      }
    ]
    @http.whenGET(searchRequest).respond(200, @searchResults)
    @http.flush()

  describe 'controller initialization', ->
    describe 'when no search has been entered', ->
      it 'defaults to no recipes', ->
        expect(@scope.searchResults).not.toBeDefined()

    describe 'when a search has been entered', ->
      it 'calls the backend', ->
        @scope.keywords = "Marg"
        @scope.search(@scope.keywords)
        @http.expectGET(templateRequest).respond(200)
        @http.flush()

      describe 'search()', ->
        it 'redirects to itself with a keyword param', ->
          keywords = 'foo'
          @scope.search(keywords)
          @http.expectGET(templateRequest).respond(200)
          @http.flush()
          expect(@location.path()).toBe('/search')
          expect(@location.search()).toEqualData({keywords: keywords})



