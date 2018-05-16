var basePage = require('./basePage.js');
var cd = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');
var registrationPage = require('../pages/registrationPage.js');

var ProductUploadFlowScreen = function () {

  //Dashborad screen locators

  var addSourceData = element(by.css('.livetile__container--collections')); 
  var addCollectionBtn = element(by.buttonText('Add'));
  var addRecordslink = element(by.linkText('Add records'));
  var files  = element(by.xpath("//h2[text()='Files']"));
  var searchBox = element(by.xpath("//input[@placeholder='Search']"));
  var importButton = element(by.xpath("//button[text()='Import']"));
  var addDataItem          = element.all(by.css(".dropdown__menu.dropdown__menu--list>li>a")).get(8);
  var formLink             = element(by.linkText('Add Products'));
  
  // Add
  var sideMenuAdd          = element.all(by.css(".fa-upload")).get(0);
  var addUpdateProduct     = element(by.xpath("//span[text()='Create a product list']"));
  var NextRow = element(by.css('[ng-click="include.nextStep()"]'));
  var startUpload = element(by.css('.vz-btn-process__content'));
  
  //Add collection screens
  var collectionType = element(by.css('.radio-list__circle'));
  var addToNewCollection = element.all(by.css('.radio-list__circle')).get(0);
  var collectionNewName = element(by.name('collectionName'));
  var collectionMissingName = element(by.name('collectionName'));
  var collectionParentmissingNewName = element(by.name('collectionName'));
  var collectionMergedNewName = element(by.name('collectionName'));
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
  var parent = element(by.xpath("//var[@class = 'ng-binding' and contains(text(), 'parent part number')]"));
  
  //Error screen
  var duplicateError = element(by.xpath("//h5[contains(@class, 'vz-slidetoggle__title--errorlog')]/span[contains(text(), 'Duplicate ID')]"));
  var missingError = element(by.xpath("//h5[contains(@class, 'vz-slidetoggle__title--errorlog')]/span[contains(text(), 'Missing ID')]"));
  var variantError = element(by.xpath("//h5[contains(@class, 'vz-slidetoggle__title--errorlog')]/span[contains(text(), 'Variants')]"));
  var mergedcellError = element(by.xpath("//h5[contains(@class, 'vz-slidetoggle__title--errorlog')]/span[contains(text(), 'Merged Cells')]"));
  var closeErrorTakeover = element(by.css('.vz-takeover__close'));
  
    // Data
  var sideMenuData         = element.all(by.css(".fa-upload")).get(0);
  var dataItem             = element(by.linkText('Lists'));
  var productPageTitle     = element(by.xpath("//input[@placeholder='Search']"));
  var sideOptionBtn = element.all(by.css(".fa.fa-ellipsis-h")).get(0);
  var DeleteOptionBtn = element.all(by.xpath("//a[text()='Delete']"));
  var updatedbtn = element.all(by.css('.pointer')).get(3);
  var deleteCollBtn = element.all(by.xpath("//button[@type='submit']"));
  var addProductBtn = element(by.buttonText('Add Products'));
  var viewTheseProducts = element.all(by.xpath("//span[text()='View these products']"));
  

  //Test file for creating the collection
  var filePath = path.join(__dirname, "../../testData/")

  this.uploadDuplicateIdCSV = function(){

  // From the dashboard, go to the Products screen
  sideMenuAdd.click();
  browser.driver.sleep(1000);
  expect(addDataItem.isPresent()).toBe(true);
  addDataItem.click();
  browser.driver.sleep(2000);
  searchBox.sendKeys("Duplicate_IDs.csv");
  browser.actions().sendKeys(protractor.Key.ENTER).perform();
  browser.driver.sleep(2000);
  importButton.click();
  

  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();

  collectionType.isPresent().then(function(isVisible) {
    if (isVisible) {
      addToNewCollection.click();
      nextBtnText.click();
    }
  });
  
 
  //Enter collection name, select data source as local drive, browse file

  collectionNewName.sendKeys(cd.collection.collectionNewName);
  
  
  browser.driver.sleep(5000);  
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
 browser.driver.sleep(10000); 
 

  // Select SKU at How do you identify your products? page and then hit Next button
  expect(sku.isPresent()).toBe(true);
  sku.click();
  nextBtnText.click();

  // Hit Skip at Setup your variants (optional) page
  skipButton.click();

  // Hit Skip at Identify your image filename(s) page
  skipButton.click();

  // Hit Confirm at Please take a moment to confirm your choices page
  confirmButton.click();
  //browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  expect(duplicateError.isPresent()).toBe(true);
  closeErrorTakeover.click();
  browser.driver.sleep(3000);
  viewTheseProducts.click();
  browser.driver.sleep(5000);
  };
  
  
  this.uploadMissingIdCSV = function(){

  // From the dashboard, go to the Products screen
  sideMenuAdd.click();
  browser.driver.sleep(1000);
  expect(addDataItem.isPresent()).toBe(true);
  addDataItem.click();
  browser.driver.sleep(2000);
  searchBox.sendKeys("Missing_IDs.csv");
  browser.actions().sendKeys(protractor.Key.ENTER).perform();
  browser.driver.sleep(2000);
  importButton.click();
  

  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();

  collectionType.isPresent().then(function(isVisible) {
    if (isVisible) {
      addToNewCollection.click();
      nextBtnText.click();
    }
  });
  
 
  //Enter collection name, select data source as local drive, browse file

  collectionNewName.sendKeys(cd.collection.collectionNewName);
  
  
  browser.driver.sleep(5000);  
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
 browser.driver.sleep(10000); 
 

  // Select SKU at How do you identify your products? page and then hit Next button
  expect(sku.isPresent()).toBe(true);
  sku.click();
  nextBtnText.click();

  // Hit Skip at Setup your variants (optional) page
  skipButton.click();

  // Hit Skip at Identify your image filename(s) page
  skipButton.click();

  // Hit Confirm at Please take a moment to confirm your choices page
  confirmButton.click();
  //browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  expect(missingError.isPresent()).toBe(true);
  closeErrorTakeover.click();
  browser.driver.sleep(2000);
  viewTheseProducts.click();
  };
  
  this.deletelist = function(){
 
  sideOptionBtn.click();
  DeleteOptionBtn.click();
  browser.driver.sleep(2000);
  deleteCollBtn.click();
  browser.driver.sleep(2000);
  //expect(productPageTitle.isPresent()).toBe(true);
  
  };
  

  this.uploadParentProductMissingCSV = function(){

  // From the dashboard, go to the Products screen
  sideMenuAdd.click();
  browser.driver.sleep(1000);
  addDataItem.click();
  browser.driver.sleep(2000);
  searchBox.sendKeys("Parent_product_missing.csv");
  browser.actions().sendKeys(protractor.Key.ENTER).perform();
  browser.driver.sleep(2000);
  importButton.click();
  

  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();

  collectionType.isPresent().then(function(isVisible) {
    if (isVisible) {
      addToNewCollection.click();
      nextBtnText.click();
    }
  });
  
 
  //Enter collection name, select data source as local drive, browse file

  collectionParentmissingNewName.sendKeys(cd.collection.collectionParentmissingNewName);
  //selectDataSource.click();
  
  //localDrive.click();
  
  //browser.executeScript('document.getElementsByName('file').value = filePath');
  //browseFiles.sendKeys(filePath+"Parent_product_missing.csv");
  
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

    
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
  browser.driver.sleep(8000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Choose what you would like to import
  //nextBtnText.click();
  //browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Select SKU at How do you identify your products? page and then hit Next button
  expect(sku.isPresent()).toBe(true);
  sku.click();
  nextBtnText.click();

  // Hit Skip at Setup your variants (optional) page
  parent.click();
  nextBtnText.click();

  // Hit Skip at Identify your image filename(s) page
  browser.executeScript("arguments[0].scrollIntoView();", skipButton.getWebElement());
  skipButton.click();

  // Hit Confirm at Please take a moment to confirm your choices page
  confirmButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close
  expect(variantError.isPresent()).toBe(true);
  closeErrorTakeover.click();
  browser.driver.sleep(2000);
  viewTheseProducts.click();

  };
  
  this.uploadMergedCellCSV = function(){

 // From the dashboard, go to the Products screen
  sideMenuAdd.click();
  browser.driver.sleep(1000);
  addDataItem.click();
  browser.driver.sleep(2000);
  searchBox.sendKeys("Test file_Merged Cells.xls");
  browser.actions().sendKeys(protractor.Key.ENTER).perform();
  browser.driver.sleep(2000);
  importButton.click();
  

  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();

  collectionType.isPresent().then(function(isVisible) {
    if (isVisible) {
      addToNewCollection.click();
      nextBtnText.click();
    }
  });
  
 
  //Enter collection name, select data source as local drive, browse file

  collectionNewName.sendKeys(cd.collection.collectionNewName);
  
  
  browser.driver.sleep(5000);  
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
 browser.driver.sleep(10000); 
 

  // Select SKU at How do you identify your products? page and then hit Next button
  expect(sku.isPresent()).toBe(true);
  sku.click();
  nextBtnText.click();

  // Hit Skip at Setup your variants (optional) page
  skipButton.click();

  // Hit Skip at Identify your image filename(s) page
  skipButton.click();

  // Hit Confirm at Please take a moment to confirm your choices page
  confirmButton.click();
  //browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  expect(mergedcellError.isPresent()).toBe(true);
  closeErrorTakeover.click();
  browser.driver.sleep(2000);
  viewTheseProducts.click();

  };
  
};

ProductUploadFlowScreen.prototype = basePage; // extend basePage...
module.exports = new ProductUploadFlowScreen();