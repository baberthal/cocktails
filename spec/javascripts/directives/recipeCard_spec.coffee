#= require spec_helper

describe 'recipeCard directive', ->
  beforeEach ->
    @setupDirective()
    @scope.cocktailRecipe =
      name: 'Margarita (Cadillac)'
      description: 'A classic marg with Grand Marnier'

  it 'replaces the element with the appropriate content', ->
    element = @compile("<recipe-card></recipe-card>")(@scope)
    expect(element.html()).toContain("Details")
