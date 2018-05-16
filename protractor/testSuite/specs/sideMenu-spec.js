var baseSpec    = require('./base-spec.js');
var sideMenu    = require('../pages/sideMenuPage.js');


describe('Verify Side Menu',function(){

  //Open Browser and Login to the application
  baseSpec.initSetup();

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {});

  xit('Verify Add link', function() {
    sideMenu.checkAddLink();
  });

  it('Verify Data link', function() {
    sideMenu.checkDataLink();
  });

  it('Verify Connectivity link', function() {
    sideMenu.checkConnectivityLink();
  });

  it('Verify Partners link', function() {
    sideMenu.checkPartnersLink();
  });

  it('Verify MAP link', function() {
    sideMenu.checkMAPLink();
  });

  xit('Verify eComm link', function() {
    sideMenu.checkECommLink();
  });

  it('Verify Settings link', function() {
    sideMenu.checkSettingsLink();
  });

  it('Verify Profile link', function() {
    sideMenu.checkProfileLink();
  });

});
