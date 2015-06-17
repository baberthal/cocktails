#= require spec_helper
extractNames = (arr) -> a.name for a in arr
extractSrefs = (arr) -> a.action for a in arr

describe 'NavCtrl', ->
  beforeEach ->
    @controller('NavCtrl', { $scope: @scope })
    templateRequest = new RegExp("\/templates\/*")
    @http.expectGET(templateRequest).respond(200)
    @http.flush()
    @mdSidenav = @injector.get('$mdSidenav')

  describe 'controller initialization', ->
    describe 'navbar actions', ->
      it 'has the toggle left actions', ->
        expect(@scope.toggleLeft()).toBeDefined()



# vim: set ts=8 sw=2 tw=0 ft=coffee et :
