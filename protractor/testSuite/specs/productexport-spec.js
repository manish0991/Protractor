var baseSpec    = require('./base-spec.js');
var productexport = require('../pages/productexport.js');


describe('Verify the Product export',function(){

  baseSpec.initSetup();

  
  afterAll(function () {

    // Clear our crap !

  });

  it('Should verify user can export product to CSV', function() {
    productexport.exportToCSV();
  });


  it('Should verify user can export product to XLS', function() {
    productexport.exportToXLS();
  });


 it('Should verify user can export product to XLSX', function() {
    productexport.exportToXLSX();
  
  });

  
  it('Should verify user can export original images', function() {
    productexport.exportOriginalImages();
  });
  
  
  it('Should verify user can export resize images', function() {
    productexport.exportResizeImages();
  });
  
  
});
