angular.module('controllers')
.controller 'AuthCtrl', [
  '$scope',
  '$state',
  'Auth',
  '$mdDialog',
  '$mdToast',
  ($scope, $state, Auth, $mdDialog, $mdToast) ->
    $scope.login = ->
      Auth.login($scope.user).then ->
        $state.go('home')
        $mdDialog.hide()

    $scope.register = ->
      Auth.register($scope.user).then ->
        $state.go('home')
        $mdDialog.hide()

    $scope.cancel = ->
      $mdDialog.cancel()

    $scope.signedIn = Auth.isAuthenticated
    $scope.logout = Auth.logout

]
