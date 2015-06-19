angular.module('services')
.factory 'userService', [
  'Auth',
  (Auth) ->
    userService = {}
    Auth.currentUser().then (user) ->
      userService.user = user
    , (error) ->
    userService
]

