#= require spec_helper

describe 'CocktailAddCtrl', ->
  beforeEach ->
    @controller('CocktailAddCtrl', { $scope: @scope })
    @mdDialog = @injector.get('$mdDialog')
    @location = @injector.get('$location')
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
    templateRequest = new RegExp("\/templates\/*")
    @http.expectGET(templateRequest).respond(200)
    @http.whenGET('/ingredients').respond(200, @ingredients)
    @http.flush()

  describe 'controller initialization', ->
    describe 'listing available ingredients', ->
      it 'sets up the list of available ingredients', ->
        expected = [
          {
            name: 'Kosher Salt'
            ingredientType: 'Garnish'
            _lowername: 'kosher salt'
            _lowertype: 'garnish'
          },
          {
            name: 'Lime Juice'
            ingredientType: 'Fruit Juice'
            _lowername: 'lime juice'
            _lowertype: 'fruit juice'
          }
        ]
        expect(@scope.ingredients).toEqualData(expected)

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



