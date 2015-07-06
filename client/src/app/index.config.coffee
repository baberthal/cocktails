angular.module "cocktails"
  .config ($logProvider, $mdIconProvider, AuthProvider, gravatarServiceProvider, $mdThemingProvider) ->
    $logProvider.debugEnabled true
    $mdIconProvider
      .defaultFontSet('material-icons')
      .icon('defaultAvatar', 'assets/images/avatar-1.svg')

    AuthProvider.loginPath('/api/users/sign_in.json')
    AuthProvider.logoutPath('/api/users/sign_out.json')
    AuthProvider.registerPath('/api/users.json')

    gravatarServiceProvider.defaults =
      size: 100
      default: 'mm'

    $mdThemingProvider.theme('dark')
      .primaryPalette('grey', {
        'default': '800'
      })
      .accentPalette('yellow')
