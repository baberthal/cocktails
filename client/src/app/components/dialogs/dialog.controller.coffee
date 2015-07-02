angular.module "cocktails"
  .controller 'DialogController',
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
