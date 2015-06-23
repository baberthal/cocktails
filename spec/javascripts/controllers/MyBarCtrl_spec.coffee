#= require spec_helper

describe 'MyBarCtrl', ->
  beforeEach ->
    @controller('MyBarCtrl', { $scope: @scope })
    @Bar = @model('Bar')
    @Ingredient = @model('Ingredient')
    @http.expectPOST('/users/sign_in.json').respond(201)
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
    templateRequest = new RegExp("\/templates\/*")
    @http.expectGET(templateRequest).respond(200)
    @http.whenGET('/ingredients').respond(@ingredients)
    @http.flush()

  describe 'controller initialization', ->
    describe 'listing ingredients to add', ->
      it 'sets up the list of available ingredients', ->
        expect(@scope.ingredients.length).toEqual(2)

      it 'calls the backend', ->
        expect(@scope.ingredients).toEqualData(@ingredients)

    describe 'adding ingredients to the bar', ->
      it 'adds an ingredient to the users bar', ->
        @scope.addIngredient(@ingredients[1])
        expect(@scope.userBar).toEqualData([@ingredients[1]])



