var baseSpec         = require('./base-spec.js');
var productForm = require('../pages/productForm.js');


describe('Verify product add via Form',function(){

  
  baseSpec.initSetup();
  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {
  });

 
  
  xit('Verify a user can add product vai Form', function() {
  productForm.addProduct();
    
  });
  
  xit('Verify a user can edit product vai Form', function() {
  productForm.editProduct();
    
  });
  
  
  xit('Verify a user can add variant product vai Form', function() {
  productForm.addVariant();
    
  });
 

});
