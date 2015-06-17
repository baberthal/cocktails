#= require spec_helper
extractNames = (arr) -> a.name for a in arr
extractSrefs = (arr) -> a.action for a in arr

describe 'NavCtrl', ->
  beforeEach ->
    @controller('NavCtrl', { $scope: @scope })
    templateRequest = new RegExp("\/templates\/*")
    @http.expectGET(templateRequest).respond(200)
    @http.flush()

  describe 'controller initialization', ->
    describe 'nav menu items', ->
      it 'has menu items', ->
        expect(@scope.menu).toBeDefined()
        expect(@scope.menu.length).toBeGreaterThan(1)

      it 'has the right menu items', ->
        fakeMenuItems = [
          'Search',
          'Recently Added Cocktails',
          'What can I make?',
          'Browse Cocktails',
          'Browse Ingredients'
        ]
        extracted = extractNames(@scope.menu)
        expect(extracted).toEqualData(fakeMenuItems)

      it 'each menu item has a ui-sref', ->
        srefs = extractSrefs(@scope.menu)
        expect(srefs.length).toBe(5)

    describe 'current user info', ->
      it 'has a current user', ->
        expect(@scope.currentUser).toBeDefined

      it 'knows about the current user', ->
        expect(@scope.currentUser.name).toBe("Username")
        expect(@scope.currentUser.email).toBe("username@example.com")
        expect(@scope.currentUser.avatar).toBe("avatars:svg-1")


# vim: set ts=8 sw=2 tw=0 ft=coffee et :
