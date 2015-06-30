angular.module "cocktails"
  .config ($logProvider, $mdIconProvider) ->
    # Enable log
    $logProvider.debugEnabled true
    # Set options third-party lib
    $mdIconProvider.defaultFontSet('material-icons')
