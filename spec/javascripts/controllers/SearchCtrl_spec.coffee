#= require spec_helper

describe 'SearchCtrl', ->
  searchRequest = new RegExp("\/cocktails\/*")
  beforeEach ->
    @setupController('SearchCtrl')
    @CocktailRecipe = @model('Cocktail')
    @http.whenGET(searchRequest).respond(200, @searchResults)
    @templateExpectations()

  describe 'controller initialization', ->
    describe 'when no search has been entered', ->
      it 'defaults to no recipes', ->
        expect(@scope.searchResults).not.toBeDefined()

    describe 'when a search has been entered', ->
      it 'calls the backend', ->
        @scope.keywords = "Marg"
        @scope.search(@scope.keywords)
        @templateExpectations()

      describe 'search()', ->
        it 'redirects to itself with a keyword param', ->
          keywords = 'foo'
          @scope.search(keywords)
          @templateExpectations()
          expect(@location.path()).toBe('/search')
          expect(@location.search()).toEqualData({keywords: keywords})



