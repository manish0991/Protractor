var baseSpec    = require('./base-spec.js');
var productArchivePage = require('../pages/productArchivePage.js');


describe('Verify the Product Archive Feature',function(){

  baseSpec.initSetup();

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {

    // Clear our crap !

  });

  it('Should verify user is able to Archive products while updating a collection', function() {
   productArchivePage.archiveProduct();
  });

  it('Should verify user can see the Archived Products in the Product Lists', function() {
   productArchivePage.archiveProductView();
  });

  it('Should verify user is able to Unarchive products while updating a collection', function() {
   productArchivePage.unarchiveProduct();
  });

  

});
