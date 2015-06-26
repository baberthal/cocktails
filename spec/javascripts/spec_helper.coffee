#= require support/bind-poly
#= require application
#= require angular-mocks
#= require support/sinon
#= require support/jasmine-sinon

customMatchers =
  toEqualData: (util, customEqualityTesters) ->
    compare: (actual, expected) ->
      result = {}
      result.pass = angular.equals(actual, expected)
      result


beforeEach(module("cocktails"))

beforeEach ->
  jasmine.addMatchers(customMatchers)

beforeEach ->
  @setupController = (ctrl, user = false, cocktailId = null)->
    inject (_$httpBackend_, $rootScope, $location, $controller, $injector, $state, $stateParams) ->
      @scope = $rootScope.$new()
      @http  = _$httpBackend_
      @location = $location
      @controller = $controller
      @state = $state
      @stateParams = $stateParams
      @injector = $injector
      @model = (name) =>
        @injector.get(name)

    if cocktailId
      @controller(ctrl, { $scope: @scope, cocktailId: cocktailId})
    else
      @controller(ctrl, { $scope: @scope })

    if user
      @user =
        username: 'foobar1'
        email: 'foobar1@example.com'
        id: 37
      @scope.currentUser = @user

  @loadFixtures = ->
    @newUser =
      username: 'foobar1'
      email: "foobar1@example.com"
      password: 'foobar1secret'

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

    @oldCocktail =
      id: 3
      name: 'Margarita'
      description: 'A classic marg'
      instructions: 'Mix and serve over ice'

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

    @searchResults = [
      {
        id: 2
        name: 'Margarita (Cadillac)'
      },
      {
        id: 1
        name: 'Margarita'
      }
    ]


  @templateExpectations = ->
    request = new RegExp("\/templates\/*")
    @http.expectGET(request).respond(200)
    @http.flush()

  @setupDirective = ->
    inject (_$compile_, $rootScope, _$httpBackend_) ->
      @scope = $rootScope.$new()
      @compile = _$compile_
      @http = _$httpBackend_

afterEach ->
  @http.verifyNoOutstandingExpectation()
  @http.verifyNoOutstandingRequest()
  @http.resetExpectations()


#  vim: set ts=8 sw=2 tw=0 ft=coffee et :
