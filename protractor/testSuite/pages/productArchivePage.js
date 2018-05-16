var basePage = require('./basePage.js');
var cd = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');

var productArchivePage = function () {

  //Dashborad screen locators
  var dashboardIcon = element(by.css(".layout-user--sidebar__logo"));
  var addProductPageTitle  = element(by.xpath("//h2[text()='Import from']"));
  var uploadFile = element(by.css('.btn.btn-success.push--left.soft--bottom.soft--top'));
  var addDataOption          = element.all(by.css(".dropdown__menu.dropdown__menu--list>li>a")).get(8);
  var addDataItem          = element.all(by.css(".dropdown__menu.dropdown__menu--list>li>a")).get(8);
  var sideMenuAdd          = element.all(by.css(".fa-upload")).get(0);
  var addUpdateProduct     = element(by.xpath("//span[text()='Create a product list']"));
  var NextRow = element(by.css('[ng-click="include.nextStep()"]'));
  
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
  var browseBtn = element(by.buttonText('Browse files'));
  var nextButton = element(by.xpath("//button[@type='submit']"));
  var nextBtnText = element(by.buttonText('Next'));
  var sku = element(by.xpath("//var[@class = 'ng-binding' and contains(text(), 'sku')]"));
  var skipButton = element(by.buttonText('Skip'));
  var confirmButton = element(by.xpath("//button[@type='submit']"));
  var archiveCheckbox = element(by.css('.vz-checkbox__input.ng-pristine.ng-untouched.ng-valid.ng-valid-required'));
  var assrtText = element(by.xpath("//h4[text()='Update an Existing List']"));
  
  //Complete screen
  var csvGoToShareOption = element(by.css('[ng-click="csv.goToShareStep()"]'));
  var viewTheseProducts = element.all(by.xpath("//span[text()='View these products']"));
  var updateText = element(by.css('.data-introduction.ng-scope'));
  
  // Product screen
  var overview = element(by.xpath("//ul[@class='nav nav-tabs nav-justified']/li[2]/a"));
  var firstProduct = element.all(by.css('.grid-table__row__content.grid-table__row--white.partner-row__hover-alt')).get(0); 
  var assrtAttributeText = element.all(by.xpath("//ul[@class='product-primary product-primary--alternate ng-scope']/li[7]/span[2]"));
  
  
  // Add product vai Form 
  var productlist = element.all(by.css('.grid-table__row__content')).get(0);
  var productPage = element(by.xpath("//h2[text()=' Imported']"));
  var sideOptionBtn = element.all(by.css(".fa.fa-ellipsis-h")).get(0);
  var DeleteOptionBtn = element.all(by.xpath("//a[contains(text(),'Delete')]"));
  var importButton = element.all(by.css(".btn.btn--medium")).get(0);
  var collectionNewName = element(by.name('collectionName'));
  var searchBox = element(by.xpath("//input[@placeholder='Search']"));
  

  //Test file for creating the collection
  var filePath = path.join(__dirname, "../../testData/")
  

  this.archiveProduct = function(){

  // From the dashboard, go to the Products screen
  browser.driver.sleep(1000);
  sideMenuAdd.click();
  browser.driver.sleep(1000);
  expect(addDataItem.isPresent()).toBe(true);
  addDataItem.click();
  browser.driver.sleep(2000);
  searchBox.sendKeys("acme archive file.csv");
  browser.actions().sendKeys(protractor.Key.ENTER).perform();
  browser.driver.sleep(2000);
  importButton.click();
  
  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();


      updateCollection.click();
      nextBtnText.click();
  
  
 
  //Enter collection name, select data source as local drive, browse file
  //expect(assrtText.getText()).toContain("Update an Existing List");
  browser.driver.sleep(3000);
  chooseCollection.click();
  collectionNameType.click();
 
  collectionNameType.sendKeys("acme source");
  browser.driver.sleep(5000); 
  selectExistingCollection.click();
  archiveCheckbox.click();
  
  browser.driver.sleep(3000);  // Need a sleep to wait for the takeover to close

  	
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close
  expect(viewTheseProducts.isPresent()).toBe(true);
  
  };
  
   this.archiveProductView = function(){

  viewTheseProducts.click();
  browser.driver.sleep(3000);
  overview.click();
  browser.driver.sleep(2000);
  firstProduct.click();
  expect(overview.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  overview.click();
  expect(assrtAttributeText.isPresent()).toBe(true);
  //expect(assrtAttributeText.getText()).toContain(" Inactive ");
  };
  
  
 this.unarchiveProduct = function(){

  // From the dashboard, go to the Products screen
  //browser.driver.sleep(1000);
  sideMenuAdd.click();
  browser.driver.sleep(1000);
  expect(addDataItem.isPresent()).toBe(true);
  addDataItem.click();
  browser.driver.sleep(2000);
  searchBox.sendKeys("acme unarchive.csv");
  browser.actions().sendKeys(protractor.Key.ENTER).perform();
  browser.driver.sleep(2000);
  importButton.click();
  
  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();


      updateCollection.click();
      nextBtnText.click();
  
  browser.driver.sleep(3000);
  chooseCollection.click();
  collectionNameType.click();
 
  collectionNameType.sendKeys("acme source");
  browser.driver.sleep(5000); 
  selectExistingCollection.click();
  //archiveCheckbox.click();
  
  browser.driver.sleep(3000);  // Need a sleep to wait for the takeover to close

  	
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close
  expect(viewTheseProducts.isPresent()).toBe(true);
  viewTheseProducts.click();
  browser.driver.sleep(3000);
  overview.click();
  browser.driver.sleep(2000);
  firstProduct.click();
  expect(overview.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  overview.click();
  expect(assrtAttributeText.isPresent()).toBe(true);
  //expect(assrtAttributeText.getText()).toContain(" Inactive ");
  };
  
  };
  

productArchivePage.prototype = basePage; // extend basePage...
module.exports = new productArchivePage();
