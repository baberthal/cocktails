angular.module('controllers').controller "CocktailAddCtrl", [
  '$scope',
  '$state',
  'Ingredient',
  'Cocktail',
  '$mdDialog',
  ($scope, $state, Ingredient, Cocktail, $mdDialog) ->
    $scope.isSubmitting = false
    self = this

    $scope.cancel = ->
      $mdDialog.cancel()

    $scope.cocktail = new Cocktail

    $scope.saveRecipe = (recipe) ->
      $scope.isSubmitting = true
      recipe.create().then(->
        $state.go('home')
      ).finally ->
        $scope.isSubmitting = false
        $mdDialog.hide()

    Ingredient.query().then (results) ->
      ingredients = results
      ingredients.map (ing) ->
        ing._lowername = ing.name.toLowerCase()
        ing._lowertype = ing.ingredientType.toLowerCase()
        ing
      $scope.ingredients = ingredients

    querySearch = (query) ->
      results = if query
        $scope.ingredients.filter(createFilterFor(query))
      else
        []
      results

    createFilterFor = (query) ->
      lowercaseQuery = angular.lowercase(query)
      (ingredient) ->
        ingredient._lowername.indexOf(lowercaseQuery) == 0 or
          ingredient._lowertype.indexOf(lowercaseQuery) == 0

    self.selectedItem = null
    self.searchText = null
    self.querySearch = querySearch
    self.selectedIngredients = []


]
