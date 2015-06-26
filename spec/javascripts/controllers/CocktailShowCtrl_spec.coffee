#= require spec_helper

describe 'CocktailShowCtrl', ->
  beforeEach ->
    @setupController('CocktailShowCtrl')
    @loadFixtures()

  describe 'controller initialization', ->
    describe 'when the current cocktail has ingredients', ->
      beforeEach ->
        @stateParams.id = 4
        request = new RegExp("\/cocktails\/*")
        @http.whenGET(request).respond(200, @cocktail)
        @templateExpectations()

      it 'knows the cocktail', ->
        expect(@scope.cocktail).toEqualData(@cocktail)

      it 'knows about cocktails ingredients', ->
        expect(@scope.hasIngredients).toBeTruthy()

    describe 'when the current cocktail does not have ingredients', ->
      beforeEach ->
        @cocktail =
          id: 2
          name: 'Margarita'
          userId: 4
          ingredients:[ ]
        @stateParams.id = 4
        request = new RegExp("\/cocktails\/*")
        @http.whenGET(request).respond(200, @cocktail)
        @templateExpectations()

      it 'knows if a cocktail does not have ingredients', ->
        expect(@scope.hasIngredients).toBeFalsy()







