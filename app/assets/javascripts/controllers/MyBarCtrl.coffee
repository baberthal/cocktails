angular.module('controllers')
.controller 'MyBarCtrl', [
  '$scope',
  'Ingredient',
  'Bar',
  ($scope, Ingredient, Bar) ->

    Bar.query().then (results) ->
      $scope.userBar = results


    Ingredient.query().then (results) ->
      $scope.ingredients = results

    $scope.addIngredient = (ingredient) ->
      $scope.userBar.push(ingredient)
      index = $scope.ingredients.indexOf(ingredient)
      $scope.ingredients.splice(index, 1)

    $scope.saveBar = (bar) ->
      if $scope.currentUser
        for item in $scope.userBar
          do (item) ->
            toCreate = new Bar
            toCreate.userId = $scope.currentUser.id
            toCreate.ingredient_id = item.id
            toCreate.save()

]
