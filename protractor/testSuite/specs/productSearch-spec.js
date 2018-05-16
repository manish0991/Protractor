var baseSpec    = require('./base-spec.js');
var productSearch = require('../pages/productSearch.js');
var productUploadFlowPage  = require('../pages/productUploadFlowPage.js');
var billingPage = require('../pages/billingPage.js');


describe('Verify the Product Search',function(){

  //baseSpec.initSetup();
   //baseSpec.initSetup("TEST REGISTRATION");
   
  baseSpec.initSetup();

  afterAll(function () {

  });

  it('Should verify user can search products', function() {
	//billingPage.Registration();
    //productUploadFlowPage.uploadProductsCSV();
    productSearch.search();
    
  });
  
  it('Should verify user can download(XLS)after product search', function() {
	
    productSearch.downloadXLX();
    
  });
  
  it('Should verify user can download(XLSX)after product search', function() {
	
    productSearch.downloadXLX();
    });
	
  it('Should verify user can download(CSV)after product search', function() {
	
    productSearch.downloadCSV();
    
  });

});
