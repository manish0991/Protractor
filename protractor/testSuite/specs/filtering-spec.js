var baseSpec               = require('./base-spec.js');
var filtering = require('../pages/filtering.js');
var productUploadFlowPage  = require('../pages/productUploadFlowPage.js');  // You can use the uploadProduct(), deleteColelction() from the ProductUploadFlow test
var loginPage   = require('../pages/loginPage.js');
var transformationFlowPage = require('../pages/transformationFlowPage.js');

describe('Verify the Product filtering flow',function(){

  baseSpec.initSetup();
  //loginPage.login2nd();

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {
    // Deleting the existing source collection to clean up the account
  });


  it('Should verify user can create an export with full match', function() {
  filtering.fullMatch();
  transformationFlowPage.deleteTransformation();
  });


  it('Should verify user can create an export with partial match', function() {
  filtering.partialMatch();
  transformationFlowPage.deleteTransformation();
  });
  
  
  it('Should verify user can create an export with full & partial match', function() {
  filtering.fullPartialMatch();
  
  });
  
  it('Should verify that user can edit filter', function() {
  filtering.editFiltering();
  //transformationFlowPage.deleteTransformation();
  });
  
  
  

});