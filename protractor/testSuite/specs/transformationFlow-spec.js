var baseSpec               = require('./base-spec.js');
var transformationFlowPage = require('../pages/transformationFlowPage.js');
var productUploadFlowPage  = require('../pages/productUploadFlowPage.js');  // You can use the uploadProduct(), deleteColelction() from the ProductUploadFlow test
var loginPage   = require('../pages/loginPage.js');

describe('Verify the Transformation Flow',function(){

  baseSpec.initSetup();
  //loginPage.login2nd();

  // Run after all test from a specific spec file
  // Think about the sucess case and try to fail some test to make sure the errors are handled.
  // ex: If the test "upload 50 img crash", we should then delete the source collection.
  afterAll(function () {
    // Deleting the existing source collection to clean up the account
  });


  xit('Should verify user can create a template', function() {
  transformationFlowPage.createTemplate();
  });

  it('Should verify user can transform 500 products', function() {
  transformationFlowPage.transformProduct();
  
  });
  
  it('Should verify user can export dynamic product to XLS', function() {
  transformationFlowPage.exportToXLS();
  });

  it('Should verify user can export dynamic product to XLSX', function() {
  transformationFlowPage.exportToXLSX();
  });
  
  it('Should verify user can export dynamic product to CSV', function() {
  transformationFlowPage.exportToCSV();
  });
  
  it('Should verify user can delete the transformed a collection', function() {
  transformationFlowPage.deleteTransformation();
   });
   
  it('Should verify user can see preview of product', function() {
  transformationFlowPage.previewProduct();
  });
  
  it('Should verify user can create Draft collection', function() {
  transformationFlowPage.draftCollection();
  });
  
  it('Should verify user can create Dynamic collection using draft collection', function() {
  transformationFlowPage.draftDynamicCollection();
  transformationFlowPage.deleteTransformation();
  });

  it('Should verify user can transform 10 images', function() {
  productUploadFlowPage.uploadImages();
  transformationFlowPage.transformImages();
  });
  
  it('Should verify user can update 10 transform images', function() {
  transformationFlowPage.updateImage();  
	  
  });
  
  it('Should verify user can transform products with shopify template', function() {
  transformationFlowPage.transformProductsWithShopify();
	  
  });
  
  it('Should verify user can edit export which was transformed with shopify template', function() {
  transformationFlowPage.editProductsWithShopify();
    
  });
  
  it('Should verify user can transform with specifications table', function() {
  transformationFlowPage.specificationsWidget();
  transformationFlowPage.deleteTransformation();
  });
  
  it('Should verify user can create Search & Replace rule', function() {
  transformationFlowPage.searchReplace();
  transformationFlowPage.deleteTransformation();
  });
  
  it('Should verify user can transform with missing Value rule', function() {
  transformationFlowPage.missingValue();
  transformationFlowPage.deleteTransformation();
  });
  
  xit('Should verify user can update 100 transform products', function() {
  transformationFlowPage.updateTransformProducts();
	  
  });
  
  xit('Should verify user can transform products with multiple source', function() {
  transformationFlowPage.transformProductwithMultipleSource();
  
  });
  
  xit('Should verify user can transform with Math widget', function() {
  productUploadFlowPage.uploadImages();
  transformationFlowPage.mathWidget();
  });
  
  xit('Should verify user can delete a template', function() {});
 

});