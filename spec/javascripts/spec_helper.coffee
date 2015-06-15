# Teaspoon includes some support files, but you can use anything from your own support path too.
# require support/jasmine-jquery-1.7.0
# require support/jasmine-jquery-2.0.0
# require support/jasmine-jquery-2.1.0
# require support/sinon
# require support/your-support-file
#
#= require support/bind-poly
#= require application
#= require angular-mocks
#
# Deferring execution
# If you're using CommonJS, RequireJS or some other asynchronous library you can defer execution. Call
# Teaspoon.execute() after everything has been loaded. Simple example of a timeout:
#
# Teaspoon.defer = true
# setTimeout(Teaspoon.execute, 1000)
#
# Matching files
# By default Teaspoon will look for files that match _spec.{js,js.coffee,.coffee}. Add a filename_spec.js file in your
# spec path and it'll be included in the default suite automatically. If you want to customize suites, check out the
# configuration in teaspoon_env.rb
#
# Manifest
# If you'd rather require your spec files manually (to control order for instance) you can disable the suite matcher in
# the configuration and use this file as a manifest.
#
# For more information: http://github.com/modeset/teaspoon


beforeEach(module("cocktails"))

beforeEach inject(_$httpBackend_,_$compile_,$rootScope,$controller,$location,$injector,$timeout) ->
  @scope = $rootScope.$new()
  @http = _$httpBackend_
  @compile = _$compile_
  @location = $location
  @controller = $controller
  @injector = $injector
  @timeout = $timeout
  @model = (name) ->
    @injector.get(name)
  @eventLoop =
    @flush: =>
      @scope.$digest()
  @sandbox = sinon.sandbox.create()

afterEach ->
  @http.resetExpectations()
  @http.verifyNoOutstandingExpectation()

#  vim: set ts=8 sw=2 tw=0 ft=coffee et :
