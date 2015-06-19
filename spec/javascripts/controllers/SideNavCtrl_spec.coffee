#= require spec_helper
extractNames = (arr) -> a.name for a in arr
extractActions = (arr) -> a.action for a in arr

describe 'SideNavCtrl', ->
  beforeEach ->
    @controller('SideNavCtrl', { $scope: @scope })
    # @http.expectPOST('/users/sign_in.json').respond(200)
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
        srefs = extractActions(@scope.menu)
        expect(srefs.length).toBe(5)

    describe 'current user info', ->
      it 'has a current user', ->
        expect(@scope.currentUser).toBeDefined

      it 'knows about the default user', ->
        expect(@scope.defaultUser.username).toBe("Username")
        expect(@scope.defaultUser.email).toBe("username@example.com")
        expect(@scope.defaultUser.avatar).toBe("avatars:svg-1")

