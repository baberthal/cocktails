#= require spec_helper

describe 'CocktailShowCtrl', ->
  beforeEach ->
    @controller('CocktailShowCtrl', { $scope: @scope })

  describe 'controller initialization', ->
    describe 'when the current cocktail has ingredients', ->
      beforeEach ->
        @cocktail =
          id: 2
          name: 'Margarita'
          userId: 4
          ingredients:[
            {
              name: 'Tequila'
              id: 1
              ingredientType: 'Spirit'
            },
            {
              name: 'Cointreau'
              id: 2
              ingredientType: 'Liqueur'
            },
            {
              name: 'Lime Juice'
              id: 3
              ingredientType: 'Fruit Juice'
            }
          ]
        @templateRequest = new RegExp("\/templates\/*")
        @stateParams = @injector.get('$stateParams')
        @stateParams.id = 4
        request = new RegExp("\/cocktails\/*")
        @http.expectGET(request).respond(200, @cocktail)
        @http.expectGET(@templateRequest).respond(200)
        @http.flush()

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
        @templateRequest = new RegExp("\/templates\/*")
        @stateParams = @injector.get('$stateParams')
        @stateParams.id = 4
        request = new RegExp("\/cocktails\/*")
        @http.whenGET(request).respond(200, @cocktail)
        @http.expectGET(@templateRequest).respond(200)
        @http.flush()

      it 'knows if a cocktail does not have ingredients', ->
        expect(@scope.hasIngredients).toBeFalsy()







