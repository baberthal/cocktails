angular.module "cocktails"
  .config ($logProvider, $mdIconProvider, AuthProvider, gravatarServiceProvider) ->
    $logProvider.debugEnabled true
    $mdIconProvider.defaultFontSet('material-icons')

    AuthProvider.loginPath('/api/users/sign_in.json')
    AuthProvider.logoutPath('/api/users/sign_out.json')
    AuthProvider.registerPath('/api/users.json')

    gravatarServiceProvider.defaults =
      size: 100
      default: 'mm'
