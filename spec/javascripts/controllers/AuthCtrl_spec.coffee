#= require spec_helper

describe 'AuthCtrl', ->
  beforeEach ->
    @controller('AuthCtrl', { $scope: @scope })
    @Auth = @model('Auth')
    @http.flush()

  describe 'controller initialization', ->
    describe 'logging in', ->



