angular.module('controllers')
.controller 'MyBarCtrl', [
  '$scope',
  'Auth',
  'Ingredient',
  'Bar',
  ($scope, Auth, Ingredient) ->
    $scope.userBar = []

    Auth.currentUser().then (user) ->
      $scope.currentUser = user

    Ingredient.query().then (results) ->
      $scope.ingredients = results

    $scope.addIngredient = (ingredient) ->
      $scope.userBar.push(ingredient)

    $scope.saveBar = (bar) ->
      if $scope.currentUser
        barIds = b.id for b in bar
        Bar.new(bar)

]
