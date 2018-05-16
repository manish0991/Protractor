var baseSpec    = require('./base-spec.js');
var groupManagnment    = require('../pages/groupManagementPage.js');


describe('Verify groups',function(){

  //Open Browser and Login to the application
  baseSpec.initSetup();

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {
	  
  });

  it('Verify user is able to create group', function() {
    groupManagnment.addGroup();
	
  });
  
  it('Verify user can rename group', function() {
    groupManagnment.renameGroup();
  });
  
  it('Verify user can delete group', function() {
    groupManagnment.deleteGroup();
  });
  
  
 

});
