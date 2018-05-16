var basePage = require('./basePage.js');
var cd = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');

var Productexport = function () {

  //Dashborad screen locators

  var addSourceData = element(by.css('.livetile__container--collections')); 
  var addCollectionBtn = element(by.buttonText('Add'));
  var addRecordslink = element(by.linkText('Add records'));
  var addProductPageTitle  = element(by.xpath("//h2[text()=' Add Products']"));
  var addDataItem          = element.all(by.xpath("//a[contains(@href,'/products/create')]")).get(0);

  // Add
  var sideMenuAdd          = element.all(by.css(".fa-plus")).get(1);
  var addUpdateProduct     = element(by.css('[ng-click="create.selectOption(2)"]'));
  var NextRow = element(by.css('[ng-click="row.nextStep()"]'));
  var startUpload = element(by.css('.vz-btn-process__content'));
  
  //Add collection screens
  var collectionType = element(by.css('.radio-list__circle'));
  var addToNewCollection = element.all(by.css('.radio-list__circle')).get(0);
  var collectionName = element(by.name('collectionName'));
  var selectDataSource = element.all(by.css('.select2-choice.ui-select-match.select2-default')).get(0);
  var localDrive = element(by.xpath("//span[text()='Local drive']"));
  var browseFiles = element(by.name('file'));
  
  //var upload1 = element(by.xpath("//input[@name='file']"));
  var browseBtn = element(by.buttonText('Browse files'));
  var nextButton = element(by.xpath("//button[@type='submit']"));
  var nextBtnText = element(by.buttonText('Next'));
  var sku = element(by.xpath("//var[@class = 'ng-binding' and contains(text(), 'sku')]"));
  var skipButton = element(by.buttonText('Skip'));
  var confirmButton = element(by.xpath("//button[@type='submit']"));
  var rowError = element(by.css('[ng-message=row.errors]'));
  
  //Complete screen
  var csvGoToShareOption = element(by.css('[ng-click="csv.goToShareStep()"]'));
  var viewTheseProducts = element(by.xpath("//div[contains(@class, 'data-row__content__text')]/span[contains(text(), 'View these products')]"));
  
  
  // Product screen
  var exportBtn = element(by.buttonText('Export'));
  var exportDownloadBtn = element.all(by.xpath("//div[@class='dropdown open']/ul/li[1]/a"));
  var selectCSV = element.all(by.css(".export-products__file")).get(2);
  var selectXLS = element.all(by.css(".export-products__file")).get(0);
  var selectXLSX = element.all(by.css(".export-products__file")).get(1);
  var selectExport = element.all(by.css('.float--right.btn.btn--large.btn--primary')).get(0);
  var assrtText = element.all(by.xpath("//span[text()='Your file is ready for download']"));
  var downloadBtn = element.all(by.css('.btn.btn--large')).get(0);
  var createExport = element.all(by.css('.btn.btn--large.btn--primary.ng-scope')).get(0);
  var addBtn = element.all(by.css('.btn.btn--large.btn--add.btn--primary')).get(0);
  var importBtn = element.all(by.css('.btn.btn--large.btn--primary.float--right')).get(0);
  
  // Product screen
  var settingsBtn = element(by.buttonText('Settings'));
  var addProductBtn = element(by.buttonText('Add Products'));
  var deleteBtn = element(by.buttonText('Delete'));
  var deleteCollBtn = element.all(by.xpath("//button[@type='submit']")).get(0);
  var sideOptionBtn = element.all(by.css('.fa.fa-ellipsis-h')).get(0);
  var exportOptionBtn = element.all(by.xpath("//div[@class='dropdown open']/ul/li[1]/a"));
  var imageTab = element.all(by.xpath("//div[@class='tabbed-nav']/a[2]"));
  var originalImages = element(by.xpath("//span[text()='Export Images']"));
  var resizeImages = element(by.xpath("//span[text()='Resize images and make them web or print ready']"));
  var inputResize = element(by.xpath("//div[@class='form-field']/input"));
  var compressionType = element(by.xpath("//span[text()='Choose web or print ready']"));
  var webReady = element(by.xpath("//a[text()='Web ready images']"));
  var sideMenuData         = element.all(by.css(".fa-upload")).get(0);
  var dataItem             = element.all(by.css(".dropdown__menu.dropdown__menu--list>li>a")).get(7);
  var productPageTitle     = element(by.xpath("//h2[text()=' Lists']"));
  var DeleteOptionBtn = element.all(by.xpath("//a[contains(text(),'Delete')]"));
  var productPage = element(by.xpath("//h2[text()=' Imported']"));
  
  

  //Test file for creating the collection
  var filePath = path.join(__dirname, "../../testData/" + "ACMEElectronics.csv")

  
this.exportToCSV = function(){

  sideMenuData.click();
  browser.driver.sleep(2000);
  dataItem.click();
  browser.driver.sleep(3000);
  sideOptionBtn.click();
  exportDownloadBtn.click();
  expect(selectCSV.isPresent()).toBe(true);
  selectCSV.click();
  selectExport.click();
  expect(assrtText.getText()).toContain("Your file is ready for download");
  //browser.wait(EC.elementToBeClickable(downloadBtn), 5000);
  downloadBtn.click();
  expect(productPageTitle.isPresent()).toBe(true);
   
  
  };

  this.exportToXLS = function(){

  // From the dashboard, go to the Products screen
  browser.driver.sleep(2000);
  sideOptionBtn.click();
  exportDownloadBtn.click();
  selectXLS.click();
  selectExport.click();
  expect(assrtText.getText()).toContain("Your file is ready for download");
  downloadBtn.click();
  expect(productPageTitle.isPresent()).toBe(true);
  
  
  };
  
  this.exportToXLSX = function(){
  browser.driver.sleep(2000);  
  sideOptionBtn.click();
  exportDownloadBtn.click();
  selectXLSX.click();
  selectExport.click();
  expect(assrtText.getText()).toContain("Your file is ready for download");
  downloadBtn.click();
  expect(productPageTitle.isPresent()).toBe(true);
  
  
  
   };
  
  this.exportOriginalImages = function(){
	  
  browser.driver.sleep(2000);
  sideOptionBtn.click();
  exportDownloadBtn.click();
  imageTab.click();
  originalImages.click();
  selectExport.click();
  expect(assrtText.getText()).toContain("Your file is ready for download");
  downloadBtn.click();
  expect(productPageTitle.isPresent()).toBe(true);
  
  
   };
  
  this.exportResizeImages = function(){
  browser.driver.sleep(2000);  
  sideOptionBtn.click();
  exportDownloadBtn.click();
  imageTab.click();
  resizeImages.click();
  inputResize.sendKeys("40");
  compressionType.click();
  webReady.click();
  selectExport.click();
  expect(assrtText.getText()).toContain("Your file is ready for download");
  downloadBtn.click();
  expect(productPageTitle.isPresent()).toBe(true);
  
  
  };
  
};


Productexport.prototype = basePage; // extend basePage...
module.exports = new Productexport();
