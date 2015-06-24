#= require spec_helper

describe 'CocktailAddCtrl', ->
  beforeEach ->
    @controller('CocktailAddCtrl', { $scope: @scope })
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

      it 'filters the ingredients', ->
        expected =
          name: 'Kosher Salt'
          ingredientType: 'Garnish'
          _lowername: 'kosher salt'
          _lowertype: 'garnish'
        expect(@controller.querySearch('salt')).toEqualData(expected)



