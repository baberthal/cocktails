#= require spec_helper

describe 'CocktailsCtrl', ->
  beforeEach ->
    @controller('CocktailsCtrl', { $scope: @scope })
    @cocktailRecipes = [
      {
        id: 2
        name: 'Margarita (Cadillac)'
        userId: 4
      },
      {
        id: 1
        name: 'Margarita'
        userId: 2
      }
    ]
    @ingredients = [
      {
        id: 1
        name: 'Angoustora Bitters'
        ingredientType: 'Bitters'
      },
      {
        id: 2
        name: 'Tequila'
        ingredientType: 'Spirit'
      }
    ]
    @templateRequest = new RegExp("\/templates\/*")
    @http.expectGET(@templateRequest).respond(200)
    @http.whenGET('/cocktails').respond(200, @cocktailRecipes)
    @http.flush()

  describe 'controller initialization', ->
    describe 'utility functions', ->
      it 'knows if the currentUser can edit the cocktail', ->
        currentUser =
          username: 'foobar1'
          id: 4
        @scope.currentUser = currentUser
        expect(@scope.canEdit(@cocktailRecipes[0])).toBeTruthy()
        expect(@scope.canEdit(@cocktailRecipes[1])).toBeFalsy()

      it 'knows how view a cocktail', ->
        location = @injector.get('$location')
        spyOn(location, 'path')
        @scope.viewCocktail(@cocktailRecipes[1])
        expect(location.path).toHaveBeenCalledWith('/cocktails/1')


    describe 'cocktail recipe index', ->
      it 'sets up the list of recent cocktail recipes', ->
        expect(@scope.cocktailRecipes.length).toEqual(2)

      it 'calls the backend', ->
        expect(@scope.cocktailRecipes).toEqualData(@cocktailRecipes)

    describe 'CRUD a cocktail', ->
      describe 'creating a cocktail', ->
        it 'launches the dialog, then refreshes the cocktails', ->
          mdDialog = @injector.get('$mdDialog')
          spyOn(mdDialog, 'show').and.callThrough()
          @scope.addRecipe()
          expect(mdDialog.show).toHaveBeenCalled()
          @http.whenGET(@templateRequest).respond(200)
          @http.whenGET('/ingredients').respond(200, @ingredients)
          @http.flush()

      describe 'editing a cocktail', ->
        it 'launches the dialog, then refreshes the cocktails', ->
          toEdit =
            id: 42
            name: "Moscow Mule"
            description: "A great cocktail on a hot day"
            instructions: "Shake the vodka and lime juice well. Serve over ice and top with ginger beer"
          mdDialog = @injector.get("$mdDialog")
          spyOn(mdDialog, 'show').and.callThrough()
          @scope.editRecipe(42)
          expect(mdDialog.show).toHaveBeenCalled()
          @http.whenGET('/cocktails/42').respond(200, toEdit)
          @http.whenGET(@templateRequest).respond(200)
          @http.whenGET('/ingredients').respond(200, @ingredients)
          @http.flush()

      describe 'deleting a cocktail', ->
        it 'posts to the backend', ->
          cocktail =
            id: 2
            name: 'Margarita (Cadillac)'

          @scope.delete(2)
          @http.whenGET('/cocktails/2').respond(200, cocktail)
          @http.expectDELETE('/cocktails/2').respond(204)
          @http.flush()




# vim: set ts=8 sw=2 tw=0 ft=coffee et :
