var baseSpec    = require('./base-spec.js');
var productUploadFlowPage = require('../pages/productUploadFlowPage.js');


describe('Verify the Product upload Flow',function(){

  baseSpec.initSetup();

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {

    // Clear our crap !

  });

  it('Should verify user can upload a csv of 500 products', function() {
   productUploadFlowPage.uploadProductsCSV();
  });


  xit('Should verify user can upload a xsl of 500 products', function() {
   productUploadFlowPage.uploadProductsXSL();
  });


  xit('Should verify user can upload a xslx of 500 products', function() {
   productUploadFlowPage.uploadProductsXSLX();
  });
  
  
  it('Should verify user can update product vai Form', function() {
   //productUploadFlowPage.uploadProductsCSV();
   productUploadFlowPage.updateProductsForm();
  });
  
  it('Should verify we can delete the collection (and keeps the account clean !)', function() {
  productUploadFlowPage.deleteCollections();
  });


  xit('Should verify user can map 50 images and match it to product', function() {
   productUploadFlowPage.uploadImages();
  });


  xit('Should verify user can update 100 product with a csv', function() {
  productUploadFlowPage.updateProducts();
  productUploadFlowPage.validatedUpdatedProduct();
  });

  xit('Should verify user can update 10 images', function() {
  productUploadFlowPage.updateImages();
  productUploadFlowPage.validateMismatchImg();
  productUploadFlowPage.validatedAddedImg();
  productUploadFlowPage.validatedUpdatedImg();
  });


  

});
