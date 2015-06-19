angular.module('services')
.factory 'Bar', [
  'railsResourceFactory',
  (railsResourceFactory) ->
    resource = railsResourceFactory
      url: '/bars'
      name: 'bar'
]
