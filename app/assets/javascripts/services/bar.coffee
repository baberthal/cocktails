angular.module('services')
.factory 'Bar', [
  'RailsResource',
  (RailsResource) ->
    class Bar extends RailsResource
      @configure url: '/bars', name: 'bar'
]
