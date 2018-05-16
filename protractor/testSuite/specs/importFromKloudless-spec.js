var baseSpec    = require('./base-spec.js');
var importFromKloudlessPage = require('../pages/importFromKloudlessPage.js');


describe('Verify file import from kloudless',function(){

  baseSpec.initSetup();

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {

    // Clear our crap !

  });

  it('Should verify user can import file from Onedrive', function() {
   importFromKloudlessPage.importFromOnedrive();
  });


  it('Should verify user can import file from Dropbox', function() {
   importFromKloudlessPage.importFromDropbox();
  });


  it('Should verify user can import file from FTP', function() {
   importFromKloudlessPage.importFromFTP();
  });
  
  
  


  

});
