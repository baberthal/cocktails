angular.module "cocktails"
  .controller "NavController",
    ($scope, $state, $mdSidenav) ->
      $scope.toggleLeft = ->
        $mdSidenav('left').toggle()
