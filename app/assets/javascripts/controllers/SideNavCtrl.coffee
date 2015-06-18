angular.module('controllers')
.controller "SideNavCtrl", [
  '$state',
  '$scope',
  '$mdSidenav',
  'Auth',
  '$http',
  '$mdDialog',
  ($state,$scope,$mdSidenav,Auth,$http,$mdDialog) ->
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

    $scope.goTo = (state) ->
      $state.go(state)


    $scope.signedIn = Auth.isAuthenticated
    $scope.logout = Auth.logout

    $scope.defaultUser =
      username: "Username"
      avatar: "avatars:svg-1"
      email: "username@example.com"

    Auth.currentUser().then (user) ->
      $scope.currentUser = user

    $scope.$on('devise:new-registration', (e, user) ->
      $scope.currentUser = user
      $scope.alert = "Welcome to Cocktails!"
    )

    $scope.$on('devise:login', (e, user) ->
      $scope.currentUser = user
      $scope.alert = "You successfully logged in"
    )

    $scope.$on('devise:logout', (e, user) ->
      $scope.currentUser = {}
    )

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

    $scope.register = (ev) ->
      $mdDialog.show(
        controller: 'AuthCtrl'
        templateUrl: '/templates/register.tmpl.html'
        parent: angular.element(document.body)
        targetEvent: ev
      )


]
