#= require spec_helper

describe 'MyBarCtrl', ->
  beforeEach ->
    @controller('MyBarCtrl', { $scope: @scope })
    @user =
      username: 'foobar1'
      email: 'foobar1@example.com'
      id: 37
    @scope.currentUser = @user
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
    templateRequest = new RegExp("\/templates\/*")
    @http.expectGET('/bars').respond(200)
    @http.expectGET('/bars/available_cocktails.json').respond(200)
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
        @newItem =
          userId: 37
          name: 'Whiskey'
        @scope.addIngredient(@ingredients[1])
        @http.expectPOST('/bars').respond(201)
        @http.whenGET('/bars').respond(200, @newItem)
        @http.flush()
        expect(@scope.userBar).toEqualData(@newItem)



