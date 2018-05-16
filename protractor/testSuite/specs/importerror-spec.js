var baseSpec    = require('./base-spec.js');
var ProductUploadFlowScreen = require('../pages/importError.js');
var registrationPage = require('../pages/registrationPage.js');


describe('Verify the Import Error Flow',function(){

  baseSpec.initSetup();

  
  afterAll(function () {

    // Clear our crap !

  });
  
  it('Should verify user can see duplicate error takeover if file has duplicate record id for one of product', function() {
    ProductUploadFlowScreen.uploadDuplicateIdCSV();
	ProductUploadFlowScreen.deletelist();
  });


  it('Should verify user can see missing error takeover if file has missing record id for one of product', function() {
    ProductUploadFlowScreen.uploadMissingIdCSV();
	ProductUploadFlowScreen.deletelist();
  });
  
  it('Should verify user can see variant error takeover if file has missing parent', function() {
    ProductUploadFlowScreen.uploadParentProductMissingCSV();
	ProductUploadFlowScreen.deletelist();
  });
  
  it('Should verify user can see merged cell error takeover if file has merged cell', function() {
    ProductUploadFlowScreen.uploadMergedCellCSV();
	ProductUploadFlowScreen.deletelist();
  });

});
