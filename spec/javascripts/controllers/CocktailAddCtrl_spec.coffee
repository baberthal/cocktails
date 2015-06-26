#= require spec_helper

describe 'CocktailAddCtrl', ->
  beforeEach ->
    @setupController('CocktailAddCtrl')
    @mdDialog = @injector.get('$mdDialog')
    @Cocktail = @model('Cocktail')
    spyOn(@mdDialog, 'cancel')
    @ingredients = [
      {
        name: 'Kosher Salt'
        ingredientType: 'Garnish'
      },
      {
        name: 'Lime Juice'
        ingredientType: 'Fruit Juice'
      }
    ]
    @http.whenGET('/ingredients').respond(200, @ingredients)
    @templateExpectations()

  describe 'controller initialization', ->
    describe 'listing available ingredients', ->
      it 'sets up the list of available ingredients', ->
        expect(@scope.ingredients).toEqualData(@ingredients)

    describe '$mdDialog', ->
      it 'knows how to close the dialog', ->
        expect(@scope.cancel).toBeDefined()
        @scope.cancel()
        expect(@mdDialog.cancel).toHaveBeenCalled()

    describe 'saving a recipe', ->
      newCocktail =
        name: 'Margarita'
        description: '5 ingredients...'

      it 'posts to the backend', ->
        @scope.cocktail = new @Cocktail
        @scope.cocktail.name = "Margarita"
        @scope.cocktail.description = '5 ingredients..'
        @scope.saveRecipe(@scope.cocktail)
        @http.expectPOST('/cocktails').respond(201,newCocktail)
        @http.flush()
        expect(@location.path()).toBe("/")



