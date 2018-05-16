var baseSpec    = require('./base-spec.js');
var profilePage = require('../pages/profilePage.js');


describe('Verify Profile Page',function(){

  //Open Browser and Login to the application
  baseSpec.initSetup();

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  // afterAll(function () {});
  it('Should verify user can change his basic information in Profile page', function() {
    profilePage.changeBasicInformation();
  });

  it('Should verify the user can change the language to spanish, chinese and back to english', function() {
    profilePage.verifyLanguageChange();
  });

  it('Should verify the user can set a profile picture', function() {
    profilePage.changeProfilePicture();
	
  });

  xit('Should verify the user can change password and can login back', function() {
    profilePage.verifyChangePassword();
  });
});
