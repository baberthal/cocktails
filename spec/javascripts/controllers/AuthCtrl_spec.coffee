#= require spec_helper

describe 'AuthCtrl', ->
  beforeEach ->
    @controller('AuthCtrl', { $scope: @scope })
    @Auth = @model('Auth')
    templateRequest = new RegExp("\/templates\/*")
    @http.expectGET(templateRequest).respond(200)
    @http.flush()

  describe 'controller initialization', ->
    describe 'logging in', ->
