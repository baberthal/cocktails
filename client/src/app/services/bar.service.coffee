angular.module 'cocktails'
  .factory 'Bar', (RailsResource) ->
    class Bar extends RailsResource
      @configure url: '/api/bars', name: 'bar'
