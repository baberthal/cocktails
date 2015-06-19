#= require support/bind-poly
#= require application
#= require angular-mocks
#= require support/sinon
#= require support/jasmine-sinon

customMatchers =
  toEqualData: (util, customEqualityTesters) ->
    compare: (actual, expected) ->
      result = {}
      result.pass = angular.equals(actual, expected)
      result


beforeEach(module("cocktails"))

beforeEach ->
  jasmine.addMatchers(customMatchers)

beforeEach inject (_$httpBackend_, $rootScope, $location, $controller, $injector, $state, $stateParams) ->
  @scope = $rootScope.$new()
  @http  = _$httpBackend_
  @location = $location
  @controller = $controller
  @state = $state
  @stateParams = $stateParams
  @injector = $injector
  @model = (name) =>
    @injector.get(name)

# beforeEach ->
#   templateRequest = new RegExp("\/templates\/*")
#   @http.expectGET(templateRequest).respond(200)

afterEach ->
  @http.verifyNoOutstandingExpectation()
  @http.verifyNoOutstandingRequest()
  @http.resetExpectations()


#  vim: set ts=8 sw=2 tw=0 ft=coffee et :
