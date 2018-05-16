var baseSpec         = require('./base-spec.js');
var registrationPage = require('../pages/registrationPage.js');


describe('Verify the Registration & Login',function(){

  baseSpec.initSetup("TEST REGISTRATION");  // Make sure the Auto-Login is set to OFF for those test, and make sure the user is logged out.

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {
  });

  it('Verify a user can register and land on the dashboard when choosing "I received a lot of spreadsheet"', function() {
    registrationPage.userRegisterChoosingIReceiveSpreadsheet();
    registrationPage.validateLandOnDashboarAsRetailer(); // Because default choice is "I receive a lot of spreadsheet"
    registrationPage.logout();
  });


  it('Verify a user can register and land on the dashboard when choosing "I send spreadsheets to lots of companies"', function() {
    registrationPage.userRegisterChoosingISendSpreadsheet();
    registrationPage.validateLandOnRetailer();
	registrationPage.logout();
  });


  xit('Verify a user can\'t register with bad email', function() {
    registrationPage.userCantRegisterWithBadEmail();
  });


  xit('Verify a user can\'t register with bad password', function() {
    registrationPage.userCantRegisterWithBadPassword();
  });

});
