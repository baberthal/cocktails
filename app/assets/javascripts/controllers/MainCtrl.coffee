angular.module('controllers').controller "MainCtrl", [
  '$scope',
  '$state',
  '$mdSidenav',
  '$mdDialog',
  'Auth',
  '$mdToast',
  ($scope, $state, $mdSidenav, $mdDialog, Auth, $mdToast) ->
    Auth.currentUser().then (user) ->
      $scope.currentUser = user

    $scope.signedIn = Auth.isAuthenticated
    $scope.logout = Auth.logout

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

    $scope.defaultUser =
      username: "Username"
      avatar: "avatars:svg-1"
      email: "username@example.com"

    $scope.register = (ev) ->
      $mdDialog.show(
        controller: 'AuthCtrl'
        templateUrl: '/templates/register.tmpl.html'
        parent: angular.element(document.body)
        targetEvent: ev
      )

    $scope.login = (ev) ->
      $mdDialog.show(
        controller: 'AuthCtrl'
        templateUrl: '/templates/login.tmpl.html'
        parent: angular.element(document.body)
        targetEvent: ev
      )

    $scope.$on('devise:new-registration', (e, user) ->
      $scope.currentUser = user
      $mdToast.show(
        $mdToast.simple()
          .content('Welcome to Cocktails!')
          .position('top right')
      )
    )

    $scope.$on('devise:login', (e, user) ->
      $scope.currentUser = user
      $mdToast.show(
        $mdToast.simple()
          .content("Login Successful! Welcome back, #{user.username}")
          .position('top right')
      )
    )

    $scope.$on('devise:logout', (e, user) ->
      $mdToast.show(
        $mdToast.simple()
          .content("Goodbye #{user.username}! Hope to see you soon!")
          .position('top right')
      )
      $scope.currentUser = {}
    )

]
