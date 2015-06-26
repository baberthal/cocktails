#= require spec_helper

describe 'AuthCtrl', ->
  beforeEach ->
    @setupController('AuthCtrl')
    @Auth = @model('Auth')
    @loadFixtures()
    # @user =
    #   username: 'foobar1'
    #   email: "foobar1@example.com"
    #   password: 'foobar1secret'
    @templateExpectations()

  describe 'controller initialization', ->
    describe 'logging in', ->
      it 'properly calls the backend and logs in the user', ->
        @scope.login()
        @http.whenPOST('/users/sign_in.json').respond(201, @newUser)
        @http.flush()
        expect(@scope.signedIn).toBeTruthy()

    describe 'registering', ->
      it 'properly calls the backend and registers the user', ->
        @scope.user = @newUser
        @scope.register()
        @http.whenPOST('/users.json').respond(201)
        @http.flush()
        expect(@scope.signedIn).toBeTruthy()

    describe 'cancelling the dialog', ->
      it 'calls $mdDialog.cancel()', ->
        mdDialog = @injector.get('$mdDialog')
        spyOn(mdDialog, 'cancel')
        @scope.cancel()
        expect(mdDialog.cancel).toHaveBeenCalled()








