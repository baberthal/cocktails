#= require spec_helper

describe 'recipeCard directive', ->
  beforeEach ->
    @compile = @injector.get("$compile")
    @scope.cocktailRecipe =
      name: 'Margarita (Cadillac)'
      description: 'A classic marg with Grand Marnier'

  it 'replaces the element with the appropriate content', ->
    element = @compile("<recipe-card></recipe-card>")(@scope)
    req = new RegExp("\/templates\/*")
    @http.expectGET(req).respond(200)
    @http.flush()
    expect(element.html()).toContain("Details")
