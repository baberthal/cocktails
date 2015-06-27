angular.module('controllers').controller "CocktailAddCtrl", [
  '$scope',
  '$state',
  'Ingredient',
  'Cocktail',
  '$mdDialog',
  ($scope, $state, Ingredient, Cocktail, $mdDialog) ->
    self = @

    $scope.isSubmitting = false

    Ingredient.query().then (results) ->
      $scope.ingredients = results

    $scope.cancel = ->
      $mdDialog.cancel()

    self.selectedItem = null
    self.searchText = null
    self.querySearch = querySearch

    $scope.cocktail = new Cocktail

    $scope.saveRecipe = (recipe) ->
      $scope.isSubmitting = true
      recipe.create().then(->
        $state.go('home')
      ).finally ->
        $scope.isSubmitting = false
        $mdDialog.hide()

    mapIngredients = (ingredients) ->
      return ingredients.map( (ing) ->
        ing._lowername = ing.name.toLowerCase()
        return ing
      )

    querySearch = (query) ->
      results = if query then $scope.ingredients.filter( createFilterFor(query)) else []



]
