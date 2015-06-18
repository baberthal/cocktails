angular.module('controllers')
.controller 'AuthCtrl', [
  '$scope',
  '$state',
  'Auth',
  '$mdDialog',
  ($scope, $state, Auth, $mdDialog) ->
    $scope.login = ->
      Auth.login($scope.user).then ->
        $state.go('home')

    $scope.register = ->
      Auth.register($scope.user).then ->
        $state.go('home')

    $scope.cancel = ->
      $mdDialog.cancel()

]
