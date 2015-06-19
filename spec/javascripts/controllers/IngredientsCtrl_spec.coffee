#= require spec_helper

describe 'IngredientsCtrl', ->
  beforeEach ->
    @controller('IngredientsCtrl', { $scope: @scope })
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
    # templateRequest = new RegExp("\/templates\/*")
    # @http.expectGET(templateRequest).respond(200)
    @http.whenGET('/ingredients').respond(@ingredients)
    @http.flush()

  describe 'controller initialization', ->
    describe 'ingredient index', ->
      it 'sets up the list of ingredients', ->
        expect(@scope.ingredients.length).toEqual(2)

      it 'calls the backend', ->
        expect(@scope.ingredients).toEqualData(@ingredients)


