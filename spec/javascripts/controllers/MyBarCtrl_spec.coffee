#= require spec_helper

describe 'MyBarCtrl', ->
  beforeEach ->
    @setupController('MyBarCtrl', true)
    @Bar = @model('Bar')
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
    @http.whenGET('/bars').respond(200)
    @http.whenGET('/bars/available_cocktails.json').respond(200)
    @http.whenGET('/ingredients').respond(@ingredients)
    @templateExpectations()

  describe 'controller initialization', ->
    describe 'listing ingredients to add', ->
      it 'sets up the list of available ingredients', ->
        expect(@scope.ingredients.length).toEqual(2)

      it 'calls the backend', ->
        expect(@scope.ingredients).toEqualData(@ingredients)

    describe 'adding ingredients to the bar', ->
      it 'adds an ingredient to the users bar', ->
        @newItem =
          userId: 37
          name: 'Whiskey'
        @scope.addIngredient(@ingredients[1])
        @http.expectPOST('/bars').respond(201, @newItem)
        @scope.userBar = @newItem
        @http.expectGET('/bars').respond(200, @newItem)
        expect(@scope.userBar).toEqualData(@newItem)
        @http.flush()



