ChipCtrl = ($timeout, $q, Ingredient) ->
  self = this
  querySearch = (query) ->
    results = if query then self.ingredients.filter(createFilterFor(query)) else []
    results

  createFilterFor = (query) ->
    lowercaseQuery = angular.lowercase(query)
    (ingredient) ->
      ingredient._lowername.indexOf(lowercaseQuery) == 0 or ingredient._lowertype.indexOf(lowercaseQuery) == 0

  loadIngredients = ->
    Ingredient.query().then (results) ->
      ingredients = results
      ingredients.map (ing) ->
        ing._lowername = ing.name.toLowerCase()
        ing._lowertype = ing.ingredientType.toLowerCase()
        ing

  self.selectedItem = null
  self.searchText = null
  self.querySearch = querySearch
  self.selectedIngredients = []
  self.ingredients = loadIngredients()
  return

'use strict'
angular.module('controllers').controller 'CocktailAddCtrl', ChipCtrl
return




# angular.module('controllers')
#   .controller("CocktailAddCtrl", [
#     '$scope',
#     'Cocktail',
#     'Ingredient',
#     '$mdDialog',
#     ($scope, Cocktail, Ingredient, $mdDialog) ->
#       self = this
#       self.selectedItem = null
#       self.searchText = null
#       self.querySearch = querySearch
#       self.ingredients = loadIngredients()



#       createFilterFor = (query) ->
#         return filterFn(ingredient) ->
#           return (ingredient._lowername.indexOf(lowercaseQuery) == 0) ||
#             (ingredient._lowertype.indexOf(lowercaseQuery) == 0)

#       loadIngredients = ->
#         Ingredient.query().then (results) ->
#           ingredients = results

#         ingredients.map (ing) ->
#           ing._lowername = ing.name.toLowerCase()
#           ing._lowertype = ing.ingredientType.toLowerCase()
#           ing

#       $scope.cancel = ->
#         $mdDialog.cancel()

#       $scope.save = ->


#   ])
