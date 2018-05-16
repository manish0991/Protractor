var baseSpec    = require('./base-spec.js');
var teamManagnment    = require('../pages/teamManagementPage.js');


describe('Verify team member invitation',function(){

  //Open Browser and Login to the application
  baseSpec.initSetup();

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {
	  
  });

  it('Verify invite member', function() {
    teamManagnment.inviteTeamMember();
	
  });
  
  it('Verify admin can delete invited team member', function() {
    teamManagnment.deleteTeamMember();
  });
 

});
