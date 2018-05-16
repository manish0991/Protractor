var basePage = require('./basePage.js');
var cd = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');

var ProductUploadFlowPage = function () {

  //Dashborad screen locators
  var dashboardIcon = element(by.css(".layout-user--sidebar__logo"));
  var addSourceData = element(by.css('.livetile__container--collections')); 
  var addCollectionBtn = element(by.buttonText('Add'));
  var addRecordslink = element(by.linkText('Add records'));
  var addProductPageTitle  = element(by.xpath("//h2[text()='Import from']"));
  var uploadFile = element(by.css('.btn.btn-success.push--left.soft--bottom.soft--top'));
  var addDataOption          = element.all(by.css(".dropdown__menu.dropdown__menu--list>li>a")).get(8);
  var addDataItem          = element(by.xpath("//a[text()='Import']"));
  // Add
  
  var sideMenuAdd          = element.all(by.css(".fa-upload")).get(0);
  var sideMenuAddPro          = element(by.xpath("//div[@class='layout-user--sidebar__menu']/div[1]/button[1]/span"));
  var addUpdateProduct     = element(by.xpath("//span[text()='Create a product list']"));
  var NextRow = element(by.css('[ng-click="include.nextStep()"]'));
  var startUpload = element(by.css('.vz-btn-process__content'));
  //var addExportProduct     = element(by.css('[ng-click="create.selectOption(0)"]'));
  var addExportProduct          = element(by.xpath("//*[@id='ImportProductsAndExport']/div/div[3]"));
  //Add collection screens
  var collectionType = element(by.css('.radio-list__circle'));
  var addToNewCollection = element.all(by.css('.radio-list__circle')).get(0);
  var updateCollection = element.all(by.css('.radio-list__circle')).get(1);
  var collectionName = element(by.name('collectionName'));
  var selectDataSource = element.all(by.css('.select2-choice.ui-select-match.select2-default')).get(0);
  var localDrive = element(by.xpath("//span[text()='Local drive']"));
  var browseFiles = element(by.name('file'));
  var chooseCollection = element.all(by.css('.select2-chosen.ng-binding')).get(0);
  var collectionNameType = element(by.xpath("//div[@class='select2-search']/input"));
  var selectExistingCollection = element.all(by.css('.select2-highlighted')).get(0);
  var updateCollectionName = element(by.name('collectionName'));
  var importDataSource = element.all(by.css('.select2-choice.ui-select-match.select2-default')).get(1);
  var productPageTitle     = element(by.xpath("//h2[text()=' Imported']"));
  
  
  
  //var upload1 = element(by.xpath("//input[@name='file']"));
  var browseBtn = element(by.buttonText('Browse files'));
  var nextButton = element(by.xpath("//button[@type='submit']"));
  var nextBtnText = element(by.buttonText('Next'));
  var sku = element(by.xpath("//var[@class = 'ng-binding' and contains(text(), 'sku')]"));
  var skipButton = element(by.buttonText('Skip'));
  var confirmButton = element(by.xpath("//button[@type='submit']"));
  var rowError = element(by.css('[ng-message=row.errors]'));
  var urlButton = element.all(by.css('.vz-radio__outer-ring.border--green')).get(1);
  var imageattru = element(by.xpath("//var[@class = 'ng-binding' and contains(text(), 'image')]"));
  var verifytext = element(by.buttonText('Next'));
  
  //Complete screen
  var csvGoToShareOption = element(by.css('[ng-click="csv.goToShareStep()"]'));
  var viewTheseProducts = element.all(by.xpath("//span[text()='View these products']"));
  var updateText = element(by.css('.data-introduction.ng-scope'));
  
  // Product screen
  var overview = element(by.xpath("//ul[@class='nav nav-tabs nav-justified']/li[2]/a"));
  var settingsBtn = element(by.buttonText('Settings'));
  var addProductBtn = element(by.buttonText('Add Products'));
  var deleteBtn = element(by.buttonText('Delete'));
  var deleteCollBtn = element.all(by.xpath("//button[@type='submit']"));
  
  // Add product vai Form 
  var productlist = element.all(by.css('.grid-table__row__content')).get(0);
  var ellipsisIcon = element.all(by.css('.fa.fa-ellipsis-h')).get(0);
  var editButton = element(by.xpath("//div[@class='tab-pane ng-scope active']/div/div[2]/div/ul/li[1]/a"));
  var addproductVaiForm = element.all(by.css('.form-group.ng-scope>h4')).get(0);
  var labelValue2 = element(by.xpath("//div[@class='form-group__fields']/div[1]/ng-form/div[2]/input"));
  var saveChangeButton = element.all(by.css('.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope')).get(0);
  var productPage = element(by.xpath("//h2[text()=' Imported']"));
  var sideOptionBtn = element.all(by.css(".fa.fa-ellipsis-h")).get(0);
  var DeleteOptionBtn = element.all(by.xpath("//a[contains(text(),'Delete')]"));
  //var importButton = element(by.xpath("//button[text()='Import']"));
  var importButton = element.all(by.css(".btn.btn--medium")).get(0);
  var collectionNewName = element(by.name('collectionName'));
  var searchBox = element(by.xpath("//input[@placeholder='Search']"));

  //Test file for creating the collection
 
  
  var filePath = path.join(__dirname, "../../testData/")
  

  this.uploadProductsCSV = function(){

  // From the dashboard, go to the Products screen
  
  browser.driver.sleep(2000);
  expect(sideMenuAddPro.isPresent()).toBe(true);
  sideMenuAddPro.click();
  addDataItem.click();
  expect(addProductPageTitle.isPresent()).toBe(true);
  browseFiles.sendKeys(filePath+"ACMEElectronics.csv");
  browser.driver.sleep(10000);
  importButton.click();

  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();

  collectionType.isPresent().then(function(isVisible) {
    if (isVisible) {
      addToNewCollection.click();
      nextBtnText.click();
    }
  });
  
 
  collectionNewName.sendKeys(cd.collection.collectionNewName);
  browser.driver.sleep(5000);  // Need a sleep to wait for the takeover to close

    
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
  browser.driver.sleep(10000); 
 
  // Hit Next button at Choose what you would like to import
  //nextBtnText.click();
  //browser.driver.sleep(10000);  
  
  //nextBtnText.click();
  //browser.driver.sleep(10000); 
  
  // Need a sleep to wait for the takeover to close

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
  browser.driver.sleep(12000);  // Need a sleep to wait for the takeover to close

  
  expect(viewTheseProducts.isPresent()).toBe(true);

  };

  
  this.deleteCollections = function(){
	  
  
  
 // expect(csvGoToShareOption.isPresent()).toBe(true);

  // From the completion screen, go to the Products screen
 // viewTheseProducts.click();
  browser.driver.sleep(2000);
  sideOptionBtn.click();
  DeleteOptionBtn.click();
  browser.driver.sleep(2000);
  deleteCollBtn.click();
  //expect(productPageTitle.isPresent()).toBe(true);
  
  

 };
 
 this.updateProducts = function(){
	 
  browser.driver.sleep(2000);
  expect(sideMenuAddPro.isPresent()).toBe(true);
  sideMenuAddPro.click();
  addDataItem.click();
  expect(addProductPageTitle.isPresent()).toBe(true);
  browseFiles.sendKeys(filePath + "ACMEElectronics.csv");
  browser.driver.sleep(10000);
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
 
  
  browser.driver.sleep(5000);  // Need a sleep to wait for the takeover to close

  	
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
  browser.driver.sleep(10000);

  // Hit Next button at Choose what you would like to import
  //nextBtnText.click();
  //browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Select SKU at How do you identify your products? page and then hit Next button
  sku.click();
  nextBtnText.click();
  browser.driver.sleep(10000);

  // Hit Skip at Setup your variants (optional) page
  skipButton.click();
  browser.driver.sleep(10000);
  // Hit Skip at Identify your image filename(s) page
  skipButton.click();
  //browser.driver.sleep(5000);

  // Hit Confirm at Please take a moment to confirm your choices page
  confirmButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  
  expect(viewTheseProducts.isPresent()).toBe(true);
 
  // From the dashboard, go to the Products screen
  browser.driver.sleep(2000);
  expect(sideMenuAddPro.isPresent()).toBe(true);
  sideMenuAddPro.click();
  addDataItem.click();
  expect(addProductPageTitle.isPresent()).toBe(true);
  browseFiles.sendKeys(filePath + "ACMEupdate.csv");
  browser.driver.sleep(10000);
  importButton.click();

  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();


      updateCollection.click();
      nextBtnText.click();
  
  
 
  //Enter collection name, select data source as local drive, browse file
  chooseCollection.click();
  collectionNameType.click();
 
  collectionNameType.sendKeys(cd.collection.updateCollectionName);
  browser.driver.sleep(5000); 
  selectExistingCollection.click();
  
  browser.driver.sleep(3000);  // Need a sleep to wait for the takeover to close

  	
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
  //browser.driver.sleep(5000);

  // Hit Next button at Choose what you would like to import
  //nextBtnText.click();
  //browser.driver.sleep(5000);  // Need a sleep to wait for the takeover to close

  // Select SKU at How do you identify your products? page and then hit Next button
  sku.click();
  nextBtnText.click();
  browser.driver.sleep(5000);

  // Hit Skip at Setup your variants (optional) page
  skipButton.click();
  browser.driver.sleep(5000);
  // Hit Skip at Identify your image filename(s) page
  skipButton.click();
  browser.driver.sleep(5000);

  // Hit Confirm at Please take a moment to confirm your choices page
  confirmButton.click();
  browser.driver.sleep(12000);  // Need a sleep to wait for the takeover to close

  
  expect(viewTheseProducts.isPresent()).toBe(true);

  };
  
   this.updateProductsForm = function(){

  viewTheseProducts.click();
  browser.driver.sleep(5000);
  overview.click();
  productlist.click();
  browser.driver.sleep(3000);
  ellipsisIcon.click();
  editButton.click();
  expect(addproductVaiForm.isPresent()).toBe(true);
  labelValue2.clear();
  labelValue2.sendKeys('Updated Automation Product');
  browser.executeScript("arguments[0].scrollIntoView();", saveChangeButton.getWebElement());
  saveChangeButton.click();
  browser.driver.sleep(3000);  
 // expect(productPage.isPresent()).toBe(true);
  

   };
  
   
  this.validatedUpdatedProduct = function(){

  // From the dashboard, go to the Products screen
  
  expect(updateText.isPresent()).toBe(true);

   };

  
  this.uploadImages = function(){

  // From the dashboard, go to the Products screen
  sideMenuAdd.click();
  browser.driver.sleep(1000);
  expect(addDataOption.isPresent()).toBe(true);
  //browser.driver.sleep(1000);
  addDataOption.click();
  browser.driver.sleep(2000);
  searchBox.sendKeys("ACME Image.csv");
  browser.actions().sendKeys(protractor.Key.ENTER).perform();
  browser.driver.sleep(2000);
  importButton.click();
  

  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();
  
  //expect(addProductPageTitle.isPresent()).toBe(true);

  //From the Products screen, go to the Add products to a new collection screen
  //addExportProduct.click();

  collectionType.isPresent().then(function(isVisible) {
    if (isVisible) {
      addToNewCollection.click();
      nextBtnText.click();
    }
  });
  

  //Enter collection name, select data source as local drive, browse file
  //collectionName.click();
  //collectionNewName.sendKeys(cd.collection.collectionNewName);
  collectionName.sendKeys(cd.collection.collectionName + "URL");
  //selectDataSource.click();
  
  	
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
  browser.driver.sleep(10000);

  // Hit Next button at Choose what you would like to import
 // nextBtnText.click();
  //browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Select SKU at How do you identify your products? page and then hit Next button
  sku.click();
  nextBtnText.click();
  browser.driver.sleep(5000);

  // Hit Skip at Setup your variants (optional) page
  skipButton.click();
  browser.driver.sleep(5000);
  // Hit Next at Identify your image filename(s) page
  urlButton.click();
  imageattru.click();
  nextBtnText.click();
  confirmButton.click();
  browser.driver.sleep(2000);  // Need a sleep to wait for the takeover to close 

  };

  
  
};


ProductUploadFlowPage.prototype = basePage; // extend basePage...
module.exports = new ProductUploadFlowPage();
