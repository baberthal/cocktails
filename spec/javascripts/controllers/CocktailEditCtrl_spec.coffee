#= require spec_helper

describe 'CocktailEditCtrl', ->
  beforeEach ->
    @setupController('CocktailEditCtrl', false, 3)
    @Cocktail = @model('Cocktail')
    @oldCocktail =
      id: 3
      name: 'Margarita'
      description: 'A classic marg'
      instructions: 'Mix and serve over ice'
    @http.whenGET('/cocktails/3').respond(200, @oldCocktail)
    @templateExpectations()

  describe 'controller initialization', ->
    describe 'editing a cocktail', ->
      it 'can properly update the cocktail', ->
        updated =
          name: 'Archer Marg'
          description: '5 ingredients...'

        @scope.cocktail.name = updated.name
        @scope.cocktail.description = updated.description
        @scope.saveRecipe(@scope.cocktail)
        @http.expectPUT('/cocktails/3').respond(204)
        @http.flush()

      it 'can close the dialog', ->
        mdDialog = @injector.get('$mdDialog')
        spyOn(mdDialog, 'cancel')
        @scope.cancel()
        expect(mdDialog.cancel).toHaveBeenCalled()

