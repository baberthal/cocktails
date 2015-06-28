angular.module('controllers')
.controller("NavCtrl", [
  '$scope', '$state', '$mdSidenav',
  ($scope, $state, $mdSidenav) ->
    $scope.toggleLeft = ->
      $mdSidenav('left').toggle()

])
