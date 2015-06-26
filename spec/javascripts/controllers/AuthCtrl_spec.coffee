#= require spec_helper

describe 'AuthCtrl', ->
  beforeEach ->
    @setupController('AuthCtrl')
    # @controller('AuthCtrl', { $scope: @scope })
    @Auth = @model('Auth')
    # templateRequest = new RegExp("\/templates\/*")
    @user =
      username: 'foobar1'
      email: "foobar1@example.com"
      password: 'foobar1secret'
    @templateExpectations()
    # @http.expectGET(templateRequest).respond(200)
    # @http.flush()

  describe 'controller initialization', ->
    describe 'logging in', ->
      it 'properly calls the backend and logs in the user', ->
        @scope.login()
        @http.whenPOST('/users/sign_in.json').respond(201, @user)
        @http.flush()
        expect(@scope.signedIn).toBeTruthy()

    describe 'registering', ->
      it 'properly calls the backend and registers the user', ->
        @scope.user = @user
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








