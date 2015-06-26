#= require spec_helper
extractNames = (arr) -> a.name for a in arr
extractActions = (arr) -> a.action for a in arr

describe 'MainCtrl', ->
  beforeEach ->
    @setupController('MainCtrl', true)
    @rootScope = @injector.get('$rootScope')
    @Auth = @model('Auth')
    @http.whenPOST('/users/sign_in.json').respond(201, @user)
    @templateExpectations()

  describe 'controller initialization', ->
    describe 'Auth', ->
      it 'knows about the current user', ->
        expect(@scope.currentUser).toBeDefined

      describe 'register and login', ->
        beforeEach ->
          @mdDialog = @injector.get('$mdDialog')
          spyOn(@mdDialog, 'show')
          @mdToast = @injector.get('$mdToast')
          spyOn(@mdToast, 'show').and.stub()


        it 'shows the registration dialog', ->
          @scope.register()
          expect(@mdDialog.show).toHaveBeenCalled

        it 'shows the login dialog', ->
          @scope.login()
          expect(@mdDialog.show).toHaveBeenCalled

        describe 'devise event broadcasts', ->
          it 'broadcasts new-registration', ->
            @rootScope.$broadcast('devise:new-registration')
            expect(@mdToast.show).toHaveBeenCalled()

          it 'broadcasts logout', ->
            @rootScope.$broadcast('devise:logout', user = @user)
            expect(@mdToast.show).toHaveBeenCalled()
            expect(@scope.currentUser).toEqual({})

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

    describe 'utility functions', ->
      it 'knows how to go to a state', ->
        state = @injector.get('$state')
        spyOn(state, 'go')
        @scope.goTo('home')
        expect(state.go).toHaveBeenCalledWith('home')

