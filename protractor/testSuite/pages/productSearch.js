var basePage = require('./basePage.js');
var cd = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');

var productSearch = function () {

  //Product search locators
   
  var searchBox    = element(by.xpath("//div[@class='layout-user--header__search--wrapper']/input[1]"));
  var searchText = element.all(by.css('.layout-user--content__header__container>h2')).get(0);
  var searchedCollection = element(by.xpath("//div[@class='search-results--collections-container']/ul[1]/li[2]/a"));
  var exportButton = element(by.css('.btn-export'));
  var selectXLS = element.all(by.css(".export-products__file")).get(0);
  var selectXLSX = element.all(by.css(".export-products__file")).get(1);
  var selectCSV = element.all(by.css(".export-products__file")).get(2);
  var exportBtn = element(by.css('.float--right.btn.btn--large.btn--primary'));
  var takeoverText = element(by.css('.export-products__loading-heading'));
  var downloadButton = element.all(by.css(".btn.btn--large")).get(0);
  var dashboardIcon = element(by.css(".layout-user--sidebar__logo"));
 
  //Complete screen
  var csvGoToShareOption = element(by.css('[ng-click="csv.goToShareStep()"]'));
  var viewTheseProducts = element(by.xpath("//div[contains(@class, 'data-row__content__text')]/span[contains(text(), 'View these products')]"));
  var updateText = element(by.css('.data-introduction.ng-scope'));
  
  // Product screen
  var settingsBtn = element(by.buttonText('Settings'));
  var addProductBtn = element(by.buttonText('Add Products'));
  var deleteBtn = element(by.buttonText('Delete'));
  var deleteCollBtn = element.all(by.xpath("//button[@type='submit']")).get(0);
  
  

  //Test file for creating the collection
  //var filePath = path.join(__dirname, "../../testData/" + "ACMEElectronics.csv")
  //var filePath = path.join(__dirname, "../../testData/")

  this.search = function(){
	  
  //dashboardIcon.click();
  browser.driver.sleep(2000);
  searchBox.click();
  searchBox.sendKeys("Yeti Microphone");
  searchBox.sendKeys(protractor.Key.ENTER);
  browser.driver.sleep(2000);
  expect(searchText.isPresent()).toBe(true);
  
  };

  
  this.downloadXLX = function(){
	  
  browser.driver.sleep(1000);
  searchedCollection.click();
  browser.driver.sleep(2000);
  exportButton.click();
  expect(selectXLS.isPresent()).toBe(true);
  selectXLS.click();
  exportBtn.click();
  browser.driver.sleep(2000);
  downloadButton.click();
  browser.driver.sleep(2000);
  
  };
  
  this.downloadXLSX = function(){
  browser.driver.sleep(1000);
  searchedCollection.click();
  browser.driver.sleep(1000);
  exportButton.click();
  expect(selectXLS.isPresent()).toBe(true);
  selectXLSX.click();
  exportBtn.click();
  downloadButton.click();
  browser.driver.sleep(2000);
  };
  
  this.downloadCSV = function(){

  searchedCollection.click();
  browser.driver.sleep(1000);
  exportButton.click();
  browser.driver.sleep(1000);
  expect(selectXLS.isPresent()).toBe(true);
  selectCSV.click();
  exportBtn.click();
  downloadButton.click();
  browser.driver.sleep(2000);
  };
 

  
};


productSearch.prototype = basePage; // extend basePage...
module.exports = new productSearch();
