var basePage = require('./basePage.js');
var cd = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');

var filtering = function () {

  //the locators declaration for the current page
  var dashboardIcon = element(by.css(".layout-user--sidebar__logo"));
  var closeIntercom = element(by.css(".intercom-launcher-hovercard-close-active"));
  

  //Templates screen
  
  var addTemplate = element(by.linkText('Add Template'));

  //Add New Template screens

  var templateName = element(by.name('templateName'));
  var templateDescription = element(by.xpath("//textarea[@name='description']"));
  var chooseStatus = element.all(by.css('[ng-click="$select.activate()"]')).get(3);
  var chooseFormat = element(by.xpath("//span[text()='Choose format']"));
  var templateFormat = element(by.xpath("//label[@label='File']/input"));
  var fileType = element(by.xpath("//label[@label='CSV']/input"));
  var templateStatus = element(by.xpath("//span[text()='Enable']"));
  var nextButton = element(by.css('.vz-btn-process'));
  var templatePlan = element(by.xpath("//span[text()='BASIC']"));
  var pageBody = element(by.xpath("//body"));

  //Build your template screen
  var fieldName = element(by.name('fieldName'));
  var fieldType = element.all(by.css('[ng-click="$select.activate()"]')).get(0);
  var textField = element(by.xpath("//span[text()='Text']"));
  var addFieldButton = element(by.xpath("//a[contains(text(),'Add Field')]"));
  var fieldName2 = element(by.xpath("//*[@id='add-template']/fieldset/div/div[1]/div[2]/div/div[1]/input[1]"));
  var fieldType2 = element(by.xpath("//*[@id='add-template']/fieldset/div/div[1]/div[2]/div/div[2]/div[1]/a/span[1]"));
  var imageField = element(by.xpath("//ul[@class='select2-result-single']/li[7]/div"));
  var saveButton = element(by.xpath("//span[contains(text(),'Save')]"));


  //Connectivity screen
  var connectivityIcon  = element.all(by.css(".fa-download")).get(0);
  var connectivityItem   = element(by.linkText('Lists'));
  var bigRetailMarket   = element(by.xpath("//a[text()='Big Retailers and Marketplaces']"));
  var createExport      = element.all(by.css(".btn.btn--large.btn--primary")).get(0);
  var productTab = element(by.xpath("//div[@class='ng-isolate-scope']/ul/li[2]/a"));
  var overviewTab = element(by.xpath("//div[@class='ng-isolate-scope']/ul/li[1]/a"));
  var myTemplate = element.all(by.css('.solutions__item__image__wrapper')).get(0);
  var selectTemplate = element(by.css(".table-template__item.table-template__item--name"));
  var selectProductTemplate = element(by.xpath("//td[text()='Products']"));
  //var findTemplate = element(by.css(".solutions__search__input"));
  var findTemplate = element(by.xpath("//input[@class='solutions__search__input ng-pristine ng-untouched ng-valid']"));
  var existingProducts = element(by.xpath("//span[text()='Export existing products']"));
  var selectSource = element.all(by.css(".select2-result-label.ui-select-choices-row-inner")).get(0);
  var selectCatogery = element.all(by.css(".mapping-field__header")).get(0);
  var selectSKU = element.all(by.css(".mapping-field__header")).get(1);
  var requiredCatogery = element.all(by.css(".mapping-field__header")).get(0);
  var recomCatogery = element.all(by.css(".mapping-field__header")).get(3);
  var selectSKUField = element.all(by.css(".mapping-field__header")).get(2);
  
  
  //Create Dynamic collection
  var collectionName = element(by.name('collectionName'));
  var prepareYourExport = element(by.xpath("//button[@type='submit']"));
  var doneButtonExportName = element(by.xpath("//button[text()='Done']"));
  var doneButton = element(by.css(".btn.btn--purple.btn.vz-btn-process.ng-isolate-scope"));
  //var doneButtonExportName = element(by.css(".btn.btn--purple.vz-btn-process.vz-btn-process--nospinner "));
  var selectCollection = element(by.xpath("//span[text()='Export existing products']"));
  var doneBtn = element(by.css(".btn.btn--purple.btn.vz-btn-process.ng-isolate-scope"));
  var doneButton1 = element(by.css(".btn.btn--large.btn--primary"));
  var title = element.all(by.css('.btn.btn--medium.btn--full.text--left.ng-scope.ng-isolate-scope')).get(5);
  var productType = element.all(by.repeater('attribute in mapping.current.dataAttributes')).get(3);
  var skuAttri = element.all(by.repeater('attribute in mapping.current.dataAttributes')).get(5);
  var brandAttri = element.all(by.repeater('attribute in mapping.current.dataAttributes')).get(0);
  var productTypeField = element.all(by.css('.mapping-field__header')).get(2);
  var bodyHtmlField = element.all(by.css('.mapping-field__header')).get(5);
  var viewMore = element.all(by.xpath("//span[text()='View More']")).get(1);
  var showAll = element.all(by.css('.mapping-field__show-all')).get(0);
  var image_First = element.all(by.css('.mapping-field__header')).get(33);
  var publishedScopeField = element.all(by.css('.mapping-field__header')).get(20);
  var publishedSelectOption = element.all(by.css('.select2-default'));
  var webOption = element.all(by.css('.select2-result-label.ui-select-choices-row-inner')).get(0);
  var SecondOption = element.all(by.css('.vz-radio__outer-ring.border--green')).get(1);
  var connectToshopifyText = element.all(by.css('.export-fields__heading'));
  var updatedbtn = element.all(by.css('.pointer')).get(4);
  var sku = element.all(by.repeater('attribute in mapping.current.dataAttributes')).get(5);
  var name = element.all(by.repeater('attribute in mapping.current.dataAttributes')).get(4);
  var nameattribute = element.all(by.repeater('.mapping-field__header')).get(2);
  var imageFieldMap = element.all(by.css('.mapping-field__header')).get(1);
  var imageTab = element.all(by.css('.attributes-panel__header.tabbed-nav.soft--left>a')).get(1);
  var imageAttri = element(by.css(".btn.btn--medium.btn--full.text--left.ng-scope"));
  var exportBtn1  = element.all(by.css('.btn.btn--large.btn--primary.ng-binding')).get(0);
  var exportBtn2  = element.all(by.css('.btn.btn--large.btn--primary.ng-binding')).get(0);
  var submitButton = element(by.css(".btn.btn--large.btn--primary"));
  var checkMyExport = element(by.xpath("//button[text()='Check my Export for Errors']"));
  var checkMyExportButton = element(by.xpath("//button[text()='Check my Export for Errors']"));
  var exportProduct = element(by.xpath("//div[@class='text--center soft--bottom']"));
  var selectCSV1 = element(by.css(".export-fields__option"));
  var exportBtn = element(by.css(".btn.btn--large.btn--primary.soft--sides.btn.vz-btn-process.ng-isolate-scope.vz-btn-process--nospinner"));
  var closeIcon = element(by.css(".text--purple.vz-takeover__close.vz-text-4rem"));
  var viewProduct = element(by.css(".btn.btn--primary.btn--large"));
  var exportButton = element(by.css(".btn.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope"));
  var previewExport = element(by.xpath("//div[@class='push--bottom text--right']/button [1]"));
  var closeTakeover = element(by.css(".text--purple.vz-takeover__close.vz-text-4rem"));
  var selectSourceCollection = element(by.css(".ui-select-search.select2-input"));
  var masterSourceCollection = element(by.css(".select2-result-label.ui-select-choices-row-inner"));
  var nameSourceAttribute = element.all(by.css(".btn.btn--medium.btn--full.text--left.ng-scope")).get(2);
  var skuSourceAttribute = element.all(by.css(".btn.btn--medium.btn--full.text--left.ng-scope")).get(4);
  var selectCollectionDrop = element(by.css(".select2-choice.ui-select-match"));
  var selectSlaveCollection = element.all(by.css(".select2-result-label.ui-select-choices-row-inner")).get(1);
  var inventoryQuanField = element.all(by.css('.mapping-field__header')).get(24);
  var inventorySourceAttribute = element.all(by.css(".btn.btn--medium.btn--full.text--left.ng-scope")).get(2);
  var draftCollection = element.all(by.css(".btn.btn--large")).get(1);
  var draftTakeoverText = element(by.xpath("//h1[text()='Your draft has been saved']"));
  var returnDashboard = element(by.xpath("//div[@class='vz-takeover__btn-actions']/a[2]"));
  var doneButn1 = element(by.xpath("//button[text()='Export']"));
  var doneButtonToshowExport = element.all(by.css(".btn.btn--purple.btn--large"));
  
  //Edit Dynamic collection
  var existingSourceCollection = element(by.xpath("//span[@class='float--left ng-binding']"));
  
  //Delete Dynamic collection
  var settingsButton = element(by.css(".btn.btn--large.btn--icon.ng-scope"));
  var addProductButton = element(by.css(".btn.btn--large.btn--add.btn--primary"));
  var deleteButton = element(by.css(".btn.btn--large.ng-scope"));
  var deleteCollButton = element(by.css(".btn.btn--large.btn--rm-hover.btn.vz-btn-process.ng-isolate-scope"));
  
   //Dashborad screen locators
  
  var addSourceData = element(by.css('.livetile__container--collections')); 
  var addCollectionBtn = element(by.buttonText('Add'));
  var addRecordslink = element(by.linkText('Add records'));
  var addProductPageTitle  = element(by.xpath("//h2[text()=' Add Products']"));
  var addDataItem          = element(by.linkText('Import Products'));

  // Add
  var sideMenuAdd          = element.all(by.css(".fa-plus")).get(1);
  var addUpdateProduct     = element(by.css('[ng-click="create.selectOption(2)"]'));
  var NextRow = element(by.css('[ng-click="row.nextStep()"]'));
  var startUpload = element(by.css('.vz-btn-process__content'));
  var addExportProduct     = element(by.css('[ng-click="create.selectOption(0)"]'));
  
   // Data
  var sideMenuData         = element.all(by.css(".fa-list")).get(0);
  var dataItem             = element(by.linkText('Product Lists'));
  var productPageTitle     = element(by.xpath("//a[contains(text(),'Lists')]"));
  var sideOptionBtn = element.all(by.css(".fa.fa-ellipsis-h")).get(0);
  var editOptionBtn = element(by.xpath("//a[contains(text(),'Edit Export')]"));
  
 //Add collection screens
  var addToNewCollection = element.all(by.css('.radio-list__circle')).get(0);
  var updateCollection = element.all(by.css('.radio-list__circle')).get(1);
  var collectionName = element(by.name('collectionName'));
  var selectDataSource = element.all(by.css('[ng-click="$select.activate()"]')).get(0);
  var localDrive = element(by.xpath("//span[text()='Local drive']"));
  var browseFiles = element(by.name('file'));
  var chooseCollection = element.all(by.css('.select2-chosen.ng-binding')).get(0);
  var collectionNameType = element(by.xpath("//div[@class='select2-search']/input"));
  var selectExistingCollection = element.all(by.css('.select2-highlighted')).get(0);
  var updateCollectionName = element(by.name('collectionName'));
  var importDataSource = element.all(by.css('[ng-click="$select.activate()"]')).get(1);
  var browseBtn = element(by.buttonText('Browse files'));
  var nextButton = element(by.xpath("//button[@type='submit']"));
  var nextBtnText = element(by.buttonText('Next'));
  var skubtn = element(by.xpath("//var[@class = 'ng-binding' and contains(text(), 'sku')]"));
  var skipButton = element(by.buttonText('Skip'));
  var confirmButton = element(by.xpath("//button[@type='submit']"));
  var rowError = element(by.css('[ng-message=row.errors]'));
  var urlButton = element.all(by.css('.vz-radio__outer-ring.border--green')).get(1);
  var imageattru = element(by.xpath("//var[@class = 'ng-binding' and contains(text(), 'image')]"));
  
  //Complete screen
  var csvGoToShareOption = element(by.css('[ng-click="csv.goToShareStep()"]'));
  var viewTheseProducts = element(by.xpath("//div[contains(@class, 'data-row__content__text')]/span[contains(text(), 'View these products')]"));
  var updateText = element(by.css('.data-introduction.ng-scope'));
  
  // Product screen
  var settingsBtn = element(by.buttonText('Settings'));
  var addProductBtn = element(by.buttonText('Add Products'));
  var deleteBtn = element(by.buttonText('Delete'));
  var deleteCollBtn = element.all(by.xpath("//button[@type='submit']")).get(0);
  var productlist = element.all(by.css('.grid-table__row__content')).get(0);
  // Export screen
  var exportBtn = element(by.buttonText('Export'));
  
  // Locator for filtering
  
  var filterMyProduct = element(by.css('.btn.btn--large.btn--primary'));
  var chooseAttribute = element.all(by.css('.select2-choice.ui-select-match.select2-default')).get(0);
  var attribute = element.all(by.xpath("//span[text()='name']"));
  var attributeSecond = element.all(by.xpath("//span[text()='status']"));
  var searchFor = element.all(by.css('.form-field__input.ng-pristine.ng-untouched')).get(0);
  var apply = element.all(by.css('.btn.btn--flat.push--right')).get(0);
  var match = element.all(by.css('.select2-choice.ui-select-match')).get(1);
  var partailMatchOpt = element.all(by.css('.select2-result-label.ui-select-choices-row-inner')).get(0);
  var fullMatchOpt = element.all(by.css('.select2-result-label.ui-select-choices-row-inner')).get(1);
  var addFilter = element.all(by.xpath("//span[text()= 'Add Filter']"));
  var filterDone = element.all(by.xpath("//button[@class='btn btn--large btn--primary']"));
  var filterRemove = element.all(by.css('.btn.btn--flat')).get(4);
  var remove = element.all(by.xpath("//div[@class='vz-takeover__btn-actions']/a[2]"));
  
  
 
  var filePath = path.join(__dirname, "../../testData/")
  
  
  
  
  this.fullMatch = function(){

   //Redirect at Connectivity screen
  dashboardIcon.click();
  browser.driver.sleep(2000);
  expect(connectivityIcon.isPresent()).toBe(true);
  connectivityIcon.click();
  browser.driver.sleep(2000);
  bigRetailMarket.click();
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
  browser.driver.sleep(5000);
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
  
 // expect(collectionName.isPresent()).toBe(true);
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "fm");
    //});
  browser.driver.sleep(5000);
  doneButtonExportName.click();
  
  //prepareYourExport.click().then(function(){
 // browser.driver.sleep(5000);
  
  expect(selectCollection.isPresent()).toBe(true);
  selectCollection.click();
    //});
  selectSourceCollection.sendKeys("acme01");
  masterSourceCollection.click()
  
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  doneBtn.click();
  browser.driver.sleep(2000);	
  
  
  browser.executeScript('window.scrollTo(0,400);').then(function () {
    
})
  expect(filterMyProduct.isPresent()).toBe(true);
  filterMyProduct.click();
  browser.driver.sleep(2000);	
  chooseAttribute.click();
  attribute.click();
  searchFor.sendKeys("Chrome");
  apply.click();
  browser.driver.sleep(10000);
  doneButton1.click();
  browser.driver.sleep(5000);
  
  //selectSKU.click();
  title.click();
  productTypeField.click();
  productType.click();
  browser.driver.sleep(2000);
  exportBtn1.click();
  browser.driver.sleep(4000);
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExport.click();
  //browser.driver.sleep(2000);
  browser.driver.sleep(3000);
  
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  connectivityIcon.click();
  browser.driver.sleep(2000);
  connectivityItem.click()
  browser.driver.sleep(2000);
  expect(productPageTitle.isPresent()).toBe(true);
  //expect(assrtText.getText()).toContain("Your file is ready for download");
  browser.driver.sleep(2000);
  //updatedbtn.click();
  //productlist.click();
  
  
  
  };
  
  this.fullPartialMatch = function(){

  //Redirect at Connectivity screen
  dashboardIcon.click();
  browser.driver.sleep(3000);
  expect(connectivityIcon.isPresent()).toBe(true);
  connectivityIcon.click();
  browser.driver.sleep(2000);
  bigRetailMarket.click();
  findTemplate.sendKeys("shopify"); 
  myTemplate.click();
  browser.driver.sleep(5000);
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
  
  expect(collectionName.isPresent()).toBe(true);
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "fpm");
    //});

  browser.driver.sleep(4000);
  doneButtonExportName.click();
  expect(selectCollection.isPresent()).toBe(true);
  selectCollection.click();
   // });
  selectSourceCollection.sendKeys("acme01");
  masterSourceCollection.click()
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  doneBtn.click();
  browser.driver.sleep(2000);	
  
  
  browser.executeScript('window.scrollTo(0,400);').then(function () {
    
})
  expect(filterMyProduct.isPresent()).toBe(true);
  filterMyProduct.click();
  browser.driver.sleep(2000);	
  chooseAttribute.click();
  attribute.click();
  searchFor.sendKeys("Intellignet Watches");
  apply.click();
  browser.driver.sleep(10000);
  addFilter.click();
  chooseAttribute.click();
  attributeSecond.click();
  searchFor.sendKeys("Available");
  match.click();
  partailMatchOpt.click();
  apply.click();
  browser.driver.sleep(10000);
  //browser.executeScript("arguments[0].scrollIntoView();", doneBtn.getWebElement());
  filterDone.click();
  browser.driver.sleep(5000);
  
  //selectSKU.click();
  title.click();
  productTypeField.click();
  productType.click();
  browser.driver.sleep(2000);
  
  exportBtn1.click();
  browser.driver.sleep(5000);
  
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExport.click();
  //browser.driver.sleep(2000);
  browser.driver.sleep(3000);
  
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  connectivityIcon.click();
  browser.driver.sleep(2000);
  connectivityItem.click()
  expect(productPageTitle.isPresent()).toBe(true);
  browser.driver.sleep(3000);
  updatedbtn.click();
  productlist.click();
  browser.driver.sleep(2000);
  productTab.click();
  //expect(filterText.isPresent()).toBe(true);
  overviewTab.click();
  
  
  };
  
  
  this.editFiltering = function(){
  
  editOptionBtn.click();
  expect(existingSourceCollection.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(2000);
  browser.executeScript('window.scrollTo(0,400);').then(function () {
    
  })
  expect(filterMyProduct.isPresent()).toBe(true);
  filterMyProduct.click();
  browser.driver.sleep(2000);	
  filterRemove.click();
  expect(remove.isPresent()).toBe(true);
  remove.click();
  browser.driver.sleep(2000);
  chooseAttribute.click();
  browser.driver.sleep(2000);
  
  browser.executeScript('window.scrollTo(0,500);').then(function () {
    
})
  attributeSecond.click();
  browser.driver.sleep(1000);
  searchFor.sendKeys("Pre-Order");
  match.click();
  partailMatchOpt.click();
  apply.click();
  browser.driver.sleep(10000);
  
  filterDone.click();
  browser.driver.sleep(10000);
  exportBtn2.click();
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExportButton.click();
  //browser.driver.sleep(2000);
  browser.driver.sleep(3000);
 
  };
  
  
   this.partialMatch = function(){
	   
  dashboardIcon.click();
  browser.driver.sleep(2000);
  expect(connectivityIcon.isPresent()).toBe(true);
  connectivityIcon.click();
  browser.driver.sleep(2000);
  bigRetailMarket.click();
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
  browser.driver.sleep(5000);
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
  
  expect(collectionName.isPresent()).toBe(true);
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "pm");
    //});

  browser.driver.sleep(3000);
  doneButtonExportName.click();
  expect(selectCollection.isPresent()).toBe(true);
  selectCollection.click();
   // });
  selectSourceCollection.sendKeys("acme01");
  masterSourceCollection.click()
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  doneBtn.click();
  browser.driver.sleep(2000);	
  
  
  browser.executeScript('window.scrollTo(0,400);').then(function () {
    
})
  expect(filterMyProduct.isPresent()).toBe(true);
  filterMyProduct.click();
  browser.driver.sleep(2000);	
  chooseAttribute.click();
  attribute.click();
  searchFor.sendKeys("Bluetooth");
  match.click();
  partailMatchOpt.click();
  apply.click();
  browser.driver.sleep(10000);
  //doneBtn.click();
  doneButton1.click();
  browser.driver.sleep(5000);
  
  //selectSKU.click();
  title.click();
  productTypeField.click();
  productType.click();
  browser.driver.sleep(2000);
  
  exportBtn1.click();
  browser.driver.sleep(3000);
   browser.executeScript('window.scrollTo(0,400);').then(function () {
    
})
  
  browser.driver.sleep(2000);
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  
  checkMyExport.click();
  browser.driver.sleep(2000);
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  connectivityIcon.click();
  browser.driver.sleep(2000);
  connectivityItem.click()
  expect(productPageTitle.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  //updatedbtn.click();
  //productlist.click();
  
  
  };
  
 
  
 
 };


filtering.prototype = basePage; // extend basePage...
module.exports = new filtering();
