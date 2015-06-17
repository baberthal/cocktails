angular.module('controllers')
.controller "SideNavCtrl", [
  '$state',
  '$scope',
  '$mdSidenav',
  ($state,$scope,$mdSidenav) ->
    $scope.menu = [
        name: "Search"
        action: 'search'
        icon: "search"
      ,
        name: "Recently Added Cocktails"
        action: 'home'
        icon: "local_bar"
      ,
        name: "What can I make?"
        action: 'whatCanImake'
        icon: "live_help"
      ,
        name: "Browse Cocktails"
        action: 'cocktails'
        icon: 'local_bar'
      ,
        name: "Browse Ingredients"
        action: 'ingredients'
        icon: 'local_drink'
    ]

    $scope.currentUser =
      name: "Username"
      avatar: "avatars:svg-1"
      email: "username@example.com"

    $scope.userMenu = [
        name: 'My Account'
        action: 'currentUser.show'
        class: 'md-primary'
        icon: 'person'
      ,
        name: 'Log Out'
        action: 'logOut()'
        class: 'md-warn'
        icon: 'exit_to_app'
    ]

]