#= require spec_helper

describe 'IngredientsCtrl', ->
  beforeEach ->
    @setupController('IngredientsCtrl')
    @Ingredient = @model('Ingredient')
    @ingredients = [
      {
        id: 1
        name: 'Gin'
      },
      {
        id: 2
        name: 'Whiskey'
      }
    ]
    @http.whenGET('/ingredients').respond(@ingredients)
    @templateExpectations()

  describe 'controller initialization', ->
    describe 'ingredient index', ->
      it 'sets up the list of ingredients', ->
        expect(@scope.ingredients.length).toEqual(2)

      it 'calls the backend', ->
        expect(@scope.ingredients).toEqualData(@ingredients)


