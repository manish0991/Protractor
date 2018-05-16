var baseSpec         = require('./base-spec.js');
var billingPage = require('../pages/billingPage.js');
var transformationFlowPage = require('../pages/transformationFlowPage.js');
var productUploadFlowPage  = require('../pages/productUploadFlowPage.js'); 


describe('Verify billing feature',function(){

  baseSpec.initSetup("TEST REGISTRATION");  // Make sure the Auto-Login is set to OFF for those test, and make sure the user is logged out.

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {
  });

 
  
  xit('Verify user can create one export under free plan', function() {
  billingPage.Registration();
  //productUploadFlowPage.uploadImages();
  transformationFlowPage.transformList();
  
    
  });
  
  xit('Verify user see the billing takeover when trying to create second export under free plan', function() {
   transformationFlowPage.createSecondList();
   billingPage.billingtakeover();
  
    
  });
  
  xit('Verify a user can upgrade plan', function() {
  //billingPage.Registration();	  
  billingPage.upgradePlan();
  
    
  });
  
  
  xit('Verify a user can update payment method', function() {
  billingPage.updatePaymentMethod();
  //billingPage.logout();
    
  });
 

});
