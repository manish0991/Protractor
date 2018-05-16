var basePage = require('./basePage.js');
var cd = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');

var TransformationFlowPage = function () {

  //the locators declaration for the current page
  var dashboardIcon = element(by.css(".layout-user--sidebar__logo"));
  var closeIntercom = element(by.css(".intercom-launcher-hovercard-close-active"));
  var exportedProducts = element(by.css('.livetile__container.livetile__container--dynamicdata>footer'));


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
  var connectivityItem      = element.all(by.css(".dropdown__menu.dropdown__menu--list>li>a")).get(9);
  var createExport      = element.all(by.css(".btn.btn--large.btn--primary")).get(0);
  var overviewTab      = element(by.xpath("//div[@class='ng-isolate-scope']/ul/li[2]/a"));
  var productTab       = element(by.xpath("//div[@class='ng-isolate-scope']/ul/li[2]/a"));
  var activeTab         = element(by.xpath("//div[@class='ng-isolate-scope']/ul/li[3]/a"));
  var draftTab = element(by.xpath("//div[@class='ng-isolate-scope']/ul/li[2]/a"));
  var myTemplate = element.all(by.css('.solutions__item__image__wrapper')).get(0);
  var selectTemplate = element(by.css(".table-template__item.table-template__item--name"));
  var selectProductTemplate = element(by.xpath("//div[@class='table-template__container']/table/tbody/tr[3]/td[1]"));
  var findTemplate = element(by.css(".solutions__search__input"));
  var existingProducts = element(by.xpath("//span[text()='Export existing products']"));
  var secondChooseList = element(by.xpath("//div[@class='grid-table__row grid-table__row--export-product']/div[2]/div[1]/a"));
  var selectSource = element.all(by.css(".select2-result-label.ui-select-choices-row-inner")).get(0);
  var selectCatogery = element.all(by.css(".mapping-field__header")).get(0);
  var selectSKU = element.all(by.css(".mapping-field__header")).get(1);
  var requiredCatogery = element.all(by.css(".mapping-field__header")).get(0);
  var recomCatogery = element.all(by.css(".mapping-field__header")).get(3);
  var selectSKUField = element.all(by.css(".mapping-field__header")).get(2);
  
  
  //Create Dynamic collection
  var collectionName = element(by.name('collectionName'));
  var prepareYourExport = element(by.xpath("//button[@type='submit']"));
  var doneButton = element(by.css(".btn.btn--purple.btn.vz-btn-process.ng-isolate-scope"));
  var doneButtonExportName = element(by.xpath("//button[text()='Done']"));
  var selectCollection = element(by.css(".select2-arrow"));
  var sourceCollection = element(by.xpath("//ul[@class='select2-result-single']/li[1]//*[contains(@ng-bind-html, 'option.name')]"));
  var doneBtn = element(by.xpath("//div[@class='tog__options__active']/button"));
  var skip = element.all(by.css('.btn.btn--large.btn--default')).get(0);
  var title = element.all(by.css('.btn.btn--medium.btn--full.text--left.ng-scope.ng-isolate-scope')).get(6);
  var productType = element.all(by.css('.btn.btn--medium.btn--full.text--left.ng-scope.ng-isolate-scope')).get(3);
  var skuAttri = element.all(by.repeater('attribute in mapping.current.dataAttributes')).get(5);
  var brandAttri = element(by.xpath("//span[text()='brand']"));
  var productTypeField = element.all(by.css('.mapping-field__header')).get(2);
  var bodyHtmlField = element.all(by.css('.mapping-field__header')).get(5);
  var viewMore = element.all(by.xpath("//span[text()='View More']")).get(1);
  var showAll = element.all(by.css('.mapping-field__show-all')).get(0);
  var image_First = element(by.xpath("//var[text()='image_1']"));
  var image_FirstFocus = element(by.xpath("//var[text()='barcode']"));
  var publishedScopeField = element(by.xpath("//var[text()='published_scope']"));
  var position = element(by.xpath("//var[text()='position']"));
  var publishedSelectOption = element.all(by.css('.select2-default'));
  var webOption = element.all(by.css('.select2-result-label.ui-select-choices-row-inner')).get(0);
  var SecondOption = element.all(by.css('.vz-radio__outer-ring.border--green')).get(1);
  var connectToshopifyText = element.all(by.css('.export-fields__heading'));
  var updatedbtn = element.all(by.css('.pointer')).get(4);
  var sku = element(by.xpath("//span[text()='sku']"));
  var name = element(by.xpath("//span[text()='name']"));
  var nameattribute = element.all(by.repeater('.mapping-field__header')).get(2);
  var imageFieldMap = element.all(by.css('.mapping-field__header')).get(1);
  var imageTab = element.all(by.css('.attributes-panel__header.tabbed-nav.soft--left>a')).get(1);
  var imageAttri = element(by.css(".btn.btn--medium.btn--full.text--left.ng-scope"));
  var exportBtn1  = element.all(by.css('.btn.btn--large.btn--primary.ng-binding')).get(0);
  var exportBtn2  = element(by.xpath("//div[@class='push--bottom text--right']/button[3]"));
  var checkMyExport = element(by.xpath("//button[text()='Check my Export for Errors']"));
  var checkMyExport1 = element.all(by.css(".btn.btn--large.btn--primary")).get(0);
  var checkMyExportButton = element(by.xpath("//button[text()='Check my Export for Errors']"));
  var exportProduct = element(by.xpath("//div[@class='text--center soft--bottom']"));
  var selectCSV1 = element(by.css(".export-fields__option"));
  var exportBtn = element(by.css(".btn.btn--large.btn--primary.soft--sides.btn.vz-btn-process.ng-isolate-scope.vz-btn-process--nospinner"));
  var closeIcon = element(by.css(".text--purple.vz-takeover__close.vz-text-4rem"));
  var viewProduct = element(by.css(".btn.btn--primary.btn--large"));
  var exportButton = element(by.css(".btn.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope"));
  var previewExport = element(by.xpath("//*[@id='preview_export']"));
  var closeTakeover = element(by.css(".text--purple.vz-takeover__close.vz-text-4rem"));
  var selectSourceCollection = element(by.css(".ui-select-search.select2-input"));
  var selectSecondList = element.all(by.css(".select2-choice.ui-select-match.select2-default")).get(0);
  var masterSourceCollection = element(by.css(".select2-result-label.ui-select-choices-row-inner"));
  var nameSourceAttribute = element.all(by.css(".btn.btn--medium.btn--full.text--left.ng-scope")).get(2);
  var skuSourceAttribute = element.all(by.css(".btn.btn--medium.btn--full.text--left.ng-scope")).get(4);
  var selectCollectionDrop = element(by.css(".select2-choice.ui-select-match"));
  var selectSlaveCollection = element.all(by.css(".select2-result-label.ui-select-choices-row-inner")).get(1);
  var inventoryQuanField = element(by.xpath("//div[@class='mapping-field mapping-field--category ng-scope']/div[2]/div[23]/div/div/div[2]"));
  var grams = element(by.xpath("//div[@class='mapping-field mapping-field--category ng-scope']/div[2]/div[21]/div/div/div[2]"));
  var inventorySourceAttribute = element(by.xpath("//div[@class='push--top text--left']/div/button[3]"));
  var saveDraft = element(by.xpath("//button[text()='Save Draft']"));
  var draftTakeoverText = element(by.xpath("//h1[text()='Your draft has been saved']"));
  var returnDashboard = element(by.xpath("//div[@class='vz-takeover__btn-actions']/a[2]"));
  var doneButn1 = element(by.xpath("//button[text()='Export']"));
  var doneButtonToshowExport = element.all(by.css(".btn.btn--purple.btn--large"));
  
  //Edit Dynamic collection
  var existingSourceCollection = element(by.xpath("//span[@class='float--left ng-binding']"));
  
  //Delete Dynamic collection
  var editExport = element(by.css(".btn.btn--large.btn--basic.ng-scope"));
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
  var sideMenuFile          = element.all(by.css(".fa-upload")).get(0);
  var addFileItem          = element.all(by.css(".dropdown__menu.dropdown__menu--list>li>a")).get(8);
  var sideMenuAdd          = element(by.xpath("//button[@class='btn']/span[@class='fa fa-plus']"));
  var addUpdateProduct     = element.all(by.css('.radio-list__circle')).get(0);
  var NextRow = element(by.css('[ng-click="row.nextStep()"]'));
  var startUpload = element(by.css('.vz-btn-process__content'));
  var addExportProduct     = element(by.xpath("//*[@id='ImportProductsAndExport']/div/div[3]"));
  
   // Data
  var sideMenuData         = element.all(by.css(".fa-list")).get(0);
  var dataItem             = element(by.linkText('Products'));
  var productPageTitle     = element(by.xpath("//a[contains(text(),'Lists')]"));
  var sideOptionBtn = element.all(by.css(".fa.fa-ellipsis-h")).get(0);
  var editOptionBtn = element.all(by.xpath("//div[@class='dropdown open']/ul/li[1]/a"));
  
 //Add collection screens
  var collectionType = element(by.css('.radio-list__circle'));
  var addToNewCollection = element.all(by.css('.radio-list__circle')).get(0);
  var updateCollection = element.all(by.css('.radio-list__circle')).get(1);
  var collectionName = element(by.name('collectionName'));
  var selectDataSource = element.all(by.css('.select2-choice.ui-select-match.select2-default')).get(0);
  var localDrive = element(by.xpath("//span[text()='Local drive']"));
  var browseFiles = element(by.name('file'));
  var chooseCollection = element.all(by.css('.select2-choice.ui-select-match.select2-default')).get(0);
  var collectionNameType = element(by.xpath("//div[@class='select2-search']/input"));
  var selectExistingCollection = element.all(by.css('.select2-result-label.ui-select-choices-row-inner')).get(0);
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
  var exportTheseProducts = element(by.xpath("//span[text()= 'Export these products to a solution, marketplace or retailer']"));
  
  // Product screen
  var settingsBtn = element(by.buttonText('Settings'));
  var addProductBtn = element(by.buttonText('Add Products'));
  var deleteBtn = element(by.buttonText('Delete'));
  var deleteCollBtn = element.all(by.xpath("//span[text()='Delete']"));
  var productlist = element.all(by.css('.grid-table__row__content')).get(0);
  var DeleteOptionBtn = element.all(by.xpath("//div[@class='dropdown open']/ul/li[3]/a"));
  var sideDeleteOpt = element.all(by.xpath("//li[@class='ng-scope']/a[text()='Delete']"));
  var exportDownloadBtn = element.all(by.xpath("//div[@class='dropdown open']/ul/li[2]/a"));
  var addDataOption          = element.all(by.css(".dropdown__menu.dropdown__menu--list>li>a")).get(8);
  var searchBox = element(by.xpath("//input[@placeholder='Search']"));
  var importButton = element.all(by.css(".btn.btn--medium")).get(0);
  
  // Export screen
  var exportBtn = element(by.buttonText('Export'));
  var selectCSV = element.all(by.css(".export-products__file")).get(2);
  var selectXLS = element.all(by.css(".export-products__file")).get(0);
  var selectXLSX = element.all(by.css(".export-products__file")).get(1);
  var selectExport = element(by.css('.float--right.btn.btn--large.btn--primary'));
  var assrtText = element.all(by.xpath("//span[text()='Your file is ready for download']"));
  var downloadBtn = element.all(by.css('.btn.btn--large')).get(0);
  var addButton = element.all(by.css('.btn.btn--large.btn--add.btn--primary')).get(0);
  var addBtn = element.all(by.css('.btn.btn--large.btn--add.btn--primary')).get(0);
 
  // Locator for all rules
  var specRule = element(by.xpath("//p[text()='Product Specifications']"));
  var specAttribute = element.all(by.css('.withremove.ng-invalid.ng-invalid-required.ng-valid-server')).get(0);
  var attributeName = element(by.css('.form-field__input.form-field__input--mandatory-star'));
  var rowName1 = element.all(by.css('.display--inline-block.withremove.ng-invalid')).get(0);
  var selectAttribute1 = element.all(by.css('.select2-choice.ui-select-match.select2-default')).get(0);
  var rowName2 = element.all(by.css('.display--inline-block.withremove.ng-invalid')).get(1);
  var selectAttribute2 = element.all(by.css('.select2-choice.ui-select-match.select2-default')).get(0);
  var applyButton = element.all(by.css('.btn.btn--large.btn--primary')).get(1);
  var specWidget = element.all(by.css('.widget-row.push--bottom.ng-scope')).get(3);
  var specWidget = element.all(by.css('.widget-row.push--bottom.ng-scope')).get(3);
  var advTab = element(by.xpath("//a[text()='Advanced']"));
  var wrenchIcon = element(by.xpath("//body[@id='tinymce']/p/tt"));
  var searchReplace = element(by.xpath("//p[text()='Search and Replace']"));
  var searchReplaceAttribute = element(by.xpath("//span[text()='Choose an attribute']"));
  var missingValueAttribute = element(by.xpath("//span[text()='Choose attribute']"));
  var replaceField = element.all(by.css('.form-field__input.ng-pristine.ng-invalid.ng-invalid-required')).get(0);
  var withField = element.all(by.css('.form-field__input.ng-pristine.ng-untouched.ng-valid.ng-valid-required.ng-valid-server')).get(0);
  var applyBtn = element(by.xpath("//button[text()='Apply']"));
  var inputbody = element(by.xpath("//div[@id='mceu_9']"));
  var chooseAttribute = element.all(by.css('.select2-chosen.ng-binding')).get(1);
  var selectAttribute  = element.all(by.css('.select2-result-label.ui-select-choices-row-inner')).get(6);
  var secondAtributeField = element.all(by.css('.withremove.ng-invalid.ng-invalid-required.ng-valid-server')).get(0);
  var missingValuerule = element(by.xpath("//p[text()='Missing Values']"));
  var selectMissingList = element.all(by.css(".select2-result-label.ui-select-choices-row-inner")).get(0);
  var selectMissingSource = element.all(by.css(".select2-result-label.ui-select-choices-row-inner")).get(6);
 
  var filePath = path.join(__dirname, "../../testData/")
  
  
  
  this.createTemplate = function(){

  	//Redirect at Template screen
  browser.driver.getCurrentUrl().then(function(url){
  browser.driver.get(url.replace("dashboard", "templates"));
  expect(addTemplate.isPresent()).toBe(true);
  	});

  	//Add new template 
  addTemplate.click().then(function(){
  expect(templateName.isPresent()).toBe(true);
  	});

  templateName.sendKeys(cd.template.templateName);

  templateDescription.sendKeys(cd.template.templateDescription);
  	
  

  chooseFormat.click().then(function(){
  expect(templateFormat.isPresent()).toBe(true);
  templateFormat.click();
  pageBody.click();
    });
	
  chooseFormat.click().then(function(){
  expect(fileType.isPresent()).toBe(true);
  fileType.click();
  pageBody.click();
    });
	

  chooseStatus.click().then(function(){
  expect(templateStatus.isPresent()).toBe(true);
  templateStatus.click();
    });

  nextButton.click().then(function(){
  expect(fieldName.isPresent()).toBe(true);
    });

 fieldName.sendKeys("SKU");

  fieldType.click().then(function(){
  expect(textField.isPresent()).toBe(true);
  textField.click();
    });
	
  addFieldButton.click().then(function(){
  expect(addFieldButton.isPresent()).toBe(true);
    });		
	
  fieldName2.sendKeys("Image");

  fieldType2.click().then(function(){
  expect(imageField.isPresent()).toBe(true);
  imageField.click();
    });
	
	
  nextButton.click().then(function(){
  expect(saveButton.isPresent()).toBe(true);
    });

  nextButton.click().then(function(){
  expect(addTemplate.isPresent()).toBe(true);
    });

  };

  this.transformProduct = function(){

    //Redirect at Connectivity screen
  dashboardIcon.click();
  browser.driver.sleep(3000);
  connectivityIcon.click();
  //expect(connectivityItem.isPresent()).toBe(true);

  connectivityItem.click() //.then(function(){
  browser.driver.sleep(2000);	  
  //browser.refresh(); 
  createExport.click();
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
  browser.driver.sleep(5000);  
  //Redirect to Export Flow
  //expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click();
     
  //myTemplate.click();
  //browser.driver.sleep(2000);

  //selectTemplate.click()//.then(function(){
  expect(collectionName.isPresent()).toBe(true);
  collectionName.sendKeys(cd.collection.dynamicCollectionName);
    //});
  browser.driver.sleep(2000);
  doneButtonExportName.click(); 
  //prepareYourExport.click().then(function(){
  expect(selectCollection.isPresent()).toBe(true);
  selectCollection.click();
    //});

  sourceCollection.click()
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  doneBtn.click();
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(5000);
  
  //selectSKU.click();
  sku.click();
  productTypeField.click();
  productType.click();
  browser.driver.sleep(2000);
  
  exportBtn1.click();
  browser.driver.sleep(2000);
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExport.click();
  
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  
  exportProduct.click();
  
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  connectivityIcon.click();
  browser.driver.sleep(2000);
  connectivityItem.click()
  browser.driver.sleep(2000);
  expect(productPageTitle.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  updatedbtn.click();
  //productlist.click();
  
  
  };
  
  this.updateTransformProducts = function(){
  browser.driver.sleep(2000);
  expect(sideMenuAdd.isPresent()).toBe(true);
  sideMenuAdd.click();
  addDataItem.click();
  expect(addProductPageTitle.isPresent()).toBe(true);

  //From the Products screen, go to the Add products to a new collection screen
  addExportProduct.click();

  collectionType.isPresent().then(function(isVisible) {
    if (isVisible) {
      addToNewCollection.click();
      nextBtnText.click();
    }
  });
  

  //Enter collection name, select data source as local drive, browse file
  collectionName.click();

  updateCollectionName.sendKeys(cd.collection.updateCollectionName);
  selectDataSource.click();
  
  localDrive.click();
  
  //browser.executeScript('document.getElementsByName('file').value = filePath');
  
  browseFiles.sendKeys(filePath + "ACMEElectronics.csv");
  
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  	
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
  browser.driver.sleep(10000);

  // Hit Next button at Choose what you would like to import
  nextBtnText.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Select SKU at How do you identify your products? page and then hit Next button
  skubtn.click();
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
  browser.driver.sleep(15000);  // Need a sleep to wait for the takeover to close

  
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
    
  //Redirect to Export Flow
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()

  //selectTemplate.click()
     
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "update");
  //doneButton.click() 
  doneButtonExportName.click();
  doneBtn.click();
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(1000);
  
  //selectSKU.click();
  title.click();
  productTypeField.click();
  name.click();
  browser.driver.sleep(2000);
  exportBtn1.click();
  browser.driver.sleep(2000);
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  checkMyExport.click();
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  sideMenuAdd.click();
  addDataItem.click();
  expect(addProductPageTitle.isPresent()).toBe(true);

  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();


      updateCollection.click();
      nextBtnText.click();
  
  
 
  //Enter collection name, select data source as local drive, browse file
  chooseCollection.click();
  collectionNameType.click();
 
  collectionNameType.sendKeys(cd.collection.updateCollectionName);
  browser.driver.sleep(8000); 
  selectExistingCollection.click();
  
  selectDataSource.click();
  
  localDrive.click();
  
  //browser.executeScript('document.getElementsByName('file').value = filePath');
  
  browseFiles.sendKeys(filePath + "ACMEupdate.csv");
  
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  	
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  NextRow.click();
  
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  
  expect(viewTheseProducts.isPresent()).toBe(true);

  
  };
  
  this.transformImages = function(){

  //Redirect at Connectivity screen
  exportTheseProducts.click();
  expect(findTemplate.isPresent()).toBe(true);
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
  browser.driver.sleep(5000);
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
  //selectTemplate.click()
     
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "test");
  browser.driver.sleep(3000);
  doneButtonExportName.click();  
  
  browser.driver.sleep(2000);
  
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  browser.driver.sleep(2000);
  //browser.driver.sleep(1000);
  doneBtn.click();
  browser.driver.sleep(3000);
  //doneBtn.click();
   browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  skip.click();
  browser.driver.sleep(5000);
  //browser.driver.sleep(3000);
  sku.click();
  browser.driver.sleep(2000);
  selectSKUField.click();
  nameSourceAttribute.click();
  
   
  recomCatogery.click();
  browser.executeScript("arguments[0].scrollIntoView();", showAll.getWebElement());
  showAll.click();
  browser.driver.sleep(1000);
  browser.executeScript("arguments[0].scrollIntoView();", image_FirstFocus.getWebElement());
  browser.driver.sleep(2000);
  expect(image_First.isPresent()).toBe(true);
  //browser.executeScript("arguments[0].scrollIntoView();", image_First.getWebElement());
  image_First.click();
  //imageFieldMap.click();
  browser.driver.sleep(2000);
  imageTab.click();
  imageAttri.click();
  browser.driver.sleep(1000);
  exportBtn1.click();
  browser.driver.sleep(4000);
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExport.click();
  //exportButton.click();
  browser.driver.sleep(2000);
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  //sideMenuData.click();
  connectivityIcon.click();
  expect(connectivityItem.isPresent()).toBe(true);
  browser.driver.sleep(1000);
  connectivityItem.click();
  expect(productPageTitle.isPresent()).toBe(true);
  browser.driver.sleep(2000);
 
  
  };
  
   this.transformList = function(){

  //Redirect at Connectivity screen
  //findTemplate.sendKeys("shopify");  
  //myTemplate.click();
  
  
  element(by.xpath("//h2[text()='Build Compatible Exports for your Apps and Sales Channels']")).getText().then(function(text){
       if(text==='Build Compatible Exports for your Apps and Sales Channels')
         element(by.xpath("//*[@id='ng-app']/body/div[1]/div/div/a")).click();
        else {
        //do nothing
    }
    });
  
  browser.driver.sleep(2000);
  findTemplate.sendKeys("shopify");
  
  browser.driver.sleep(2000);
  myTemplate.click();
  browser.driver.sleep(5000);
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
  //selectTemplate.click()
     
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "test");
  browser.driver.sleep(3000);
  doneButtonExportName.click();  
  
  browser.driver.sleep(2000);
  //browser.executeScript("arguments[0].scrollIntoView();", doneBtn.getWebElement());
  //browser.driver.sleep(2000);
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(2000);
  
  
 // browser.executeScript("arguments[0].scrollIntoView();", image_First.getWebElement());
  //selectCatogery.click();
  //selectSKU.click();
  sku.click();
  browser.driver.sleep(2000);
  selectSKUField.click();
  nameSourceAttribute.click();
  
  exportBtn1.click();
  browser.driver.sleep(4000);
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExport.click();
  //exportButton.click();
  browser.driver.sleep(2000);
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  browser.driver.sleep(2000);
  expect(connectToshopifyText.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  dashboardIcon.click();
  
  //connectivityIcon.click();
  
  //connectivityItem.click()
  //expect(productPageTitle.isPresent()).toBe(true);
  
  };
  
  
   this.createSecondList = function(){

  //Redirect at Connectivity screen
  //findTemplate.sendKeys("shopify");  
  //myTemplate.click();
  
  browser.driver.sleep(2000);
  dashboardIcon.click();
  browser.driver.sleep(2000);
  connectivityIcon.click();
  //expect(connectivityItem.isPresent()).toBe(true);
  connectivityItem.click()
  createExport.click();
  
  element(by.xpath("//h2[text()='Build Compatible Exports for your Apps and Sales Channels']")).getText  
 ().then(function(text){
        if(text==='Build Compatible Exports for your Apps and Sales Channels')
            element(by.xpath("//*[@id='ng-app']/body/div[1]/div/div/a")).click();
        else {
        //do nothing
    }
    });
  
 
  expect(findTemplate.isPresent()).toBe(true);
  findTemplate.sendKeys("shopify");
  browser.driver.sleep(2000);
  myTemplate.click();
  browser.driver.sleep(5000);
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
  //selectTemplate.click()
     
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "testqa");
  browser.driver.sleep(3000);
  doneButtonExportName.click();  
  browser.driver.sleep(2000);
  existingProducts.click();
  browser.driver.sleep(3000);
  selectSource.click();
  browser.driver.sleep(2000);
  
  
  doneBtn.click();
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(2000);
  
  //selectCatogery.click();
  //selectSKU.click();
  sku.click();
  browser.driver.sleep(2000);
  selectSKUField.click();
  nameSourceAttribute.click();
  
   
  
  exportBtn1.click();
  browser.driver.sleep(4000);
  
  
  };
  
  
   this.updateImage = function(){

  //Redirect at Connectivity screen

  sideMenuFile.click();
  browser.driver.sleep(1000);
  expect(addFileItem.isPresent()).toBe(true);
  addFileItem.click();
  //addDataOption.click();
  browser.driver.sleep(2000);
  searchBox.sendKeys("ACME ImageUpdate.csv");
  browser.actions().sendKeys(protractor.Key.ENTER).perform();
  browser.driver.sleep(2000);
  importButton.click();
  

  //From the Products screen, go to the Add products to a new collection screen
  //addUpdateProduct.click();

  //From the Products screen, go to the Add products to a new collection screen
  addUpdateProduct.click();


      updateCollection.click();
      nextBtnText.click();
  
  
 
  //Enter collection name, select data source as local drive, browse file
  browser.driver.sleep(2000); 
  expect(chooseCollection.isPresent()).toBe(true);
  chooseCollection.click();
  collectionNameType.click();
 
  collectionNameType.sendKeys(cd.collection.collectionName);
  browser.driver.sleep(5000); 
  selectExistingCollection.click();
  
  browser.driver.sleep(4000);  // Need a sleep to wait for the takeover to close

  	
  // Hit next button once file browsed.
  nextButton.click();
  browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  expect(viewTheseProducts.isPresent()).toBe(true);
  dashboardIcon.click();
  exportedProducts.click();
  expect(updatedbtn.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  updatedbtn.click();
  productlist.click();
  expect(overviewTab.isPresent()).toBe(true);
  productTab.click();
  
  expect(element(by.xpath("//div[contains(@style,'FMIimages/10015-25gunmetal-01.jpg')]")).isPresent()).toBe(true);
  
  };
  
   this.transformProductsWithShopify = function(){

  //Redirect at Connectivity screen
  browser.driver.sleep(3000);
  connectivityIcon.click();
  //expect(connectivityItem.isPresent()).toBe(true);

  connectivityItem.click() //.then(function(){
  browser.driver.sleep(2000);
  createExport.click();
  expect(findTemplate.isPresent()).toBe(true);
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
  browser.driver.sleep(5000);  
  //Redirect to Export Flow
  expect(selectProductTemplate.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  selectProductTemplate.click()
     
  //Enter dynamic collection name
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "Shopify");
  //doneButton.click() 
  browser.driver.sleep(2000);
  doneButtonExportName.click();
  //Select Source collection
  browser.driver.sleep(2000);
  existingProducts.click();
  browser.driver.sleep(3000);
  selectSource.click();
  browser.driver.sleep(2000);
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  doneBtn.click();
  browser.driver.sleep(3000);
  doneBtn.click();
  browser.driver.sleep(4000);
  
  title.click();
  productTypeField.click();
  productType.click();
  browser.driver.sleep(2000);
  recomCatogery.click();
  browser.driver.sleep(1000);
  //selectSKUField.click();
  //skuAttri.click();
  
  //Selecting values from multiple choice field
  browser.executeScript("arguments[0].scrollIntoView();", showAll.getWebElement());
  showAll.click();
  
  browser.executeScript("arguments[0].scrollIntoView();", position.getWebElement());
  browser.driver.sleep(1000);
  expect(publishedScopeField.isPresent()).toBe(true);
  publishedScopeField.click();
  publishedSelectOption.click();
  webOption.click();
  exportBtn1.click();
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExport.click();
  
  //Transformation Starts 
  browser.driver.sleep(3000);
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  connectivityIcon.click();
  
  connectivityItem.click()
  expect(productPageTitle.isPresent()).toBe(true);
  //updatedbtn.click();
  //productlist.click();
  
  };
  
  
  this.searchReplace = function(){

  //Redirect at Connectivity screen
  browser.driver.sleep(3000);
  connectivityIcon.click();
  //expect(connectivityItem.isPresent()).toBe(true);

  connectivityItem.click() //.then(function(){
  browser.driver.sleep(2000);
  createExport.click();
  expect(findTemplate.isPresent()).toBe(true);
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
  browser.driver.sleep(5000);  
  //Redirect to Export Flow
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
     
  //Enter dynamic collection name
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "sr");
  //doneButton.click() 
  browser.driver.sleep(2000);
  doneButtonExportName.click();
  //Select Source collection
  browser.driver.sleep(2000);
  existingProducts.click();
  browser.driver.sleep(3000);
  selectSource.click();
   browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(3000);
  doneBtn.click();
  browser.driver.sleep(5000);
  //requiredCatogery.click(); 
  
  //Mapping attributes 
  //selectSKU.click();
  title.click();
  productTypeField.click();
  productType.click();
  browser.driver.sleep(2000);
  recomCatogery.click();
  browser.driver.sleep(1000);
   
  //selectSKUField.click();
  advTab.click();
  browser.driver.sleep(2000);
  searchReplace.click();
  browser.driver.sleep(5000);
  searchReplaceAttribute.click();
  selectAttribute.click();
  
  replaceField.sendKeys("Dress"); 
  //ptor.actions().sendKeys(protractor.Key.ENTER).perform();
  withField.sendKeys("Automation");
  applyBtn.click();
 
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            }); 
  exportBtn1.click();
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExport.click();
  
  //Transformation Starts 
  browser.driver.sleep(3000);
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  connectivityIcon.click();
  connectivityItem.click()
  expect(productPageTitle.isPresent()).toBe(true);
  browser.driver.sleep(3000);
  //updatedbtn.click();
  //productlist.click();
 
  
  };
  
  
  
  this.editProductsWithShopify = function(){

  //Redirect to lists screen
  browser.driver.sleep(2000);
  updatedbtn.click();
  sideOptionBtn.click();
  editOptionBtn.click();
  //browser.driver.sleep(2000);
  //expect(existingSourceCollection.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(7000);
  browser.executeScript("arguments[0].scrollIntoView();", recomCatogery.getWebElement());
  browser.driver.sleep(2000);
  recomCatogery.click();
  browser.driver.sleep(1000);
  //selectSKU.click();
  //viewMore.click();
 // browser.driver.sleep(1000);
  
  //Mapping another attribute
  bodyHtmlField.click();
  brandAttri.click();
  browser.executeScript("arguments[0].scrollIntoView();", showAll.getWebElement());
  showAll.click();
  
  //Selecting default value 
  browser.executeScript("arguments[0].scrollIntoView();", position.getWebElement());
  browser.driver.sleep(1000);
  publishedScopeField.click();
  publishedSelectOption.click();
  SecondOption.click();
  
  exportBtn1.click();
  expect(checkMyExport.isPresent()).toBe(true);
  
  //Transformation starts
  checkMyExport.click();
  expect(editExport.isPresent()).toBe(true);
  browser.driver.sleep(2000);
  sideOptionBtn.click();
  browser.driver.sleep(2000);
  expect(sideDeleteOpt.isPresent()).toBe(true);
  sideDeleteOpt.click();
  browser.driver.sleep(2000);
  deleteCollBtn.click();
  browser.driver.sleep(2000);
  //expect(createExport.isPresent()).toBe(true);
  
  
  };
  
   this.transformProductwithMultipleSource = function(){

  //Redirect at Connectivity screen
  connectivityIcon.click();
  connectivityItem.click();
  createExport.click();
  expect(findTemplate.isPresent()).toBe(true);
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
    
  //Redirect to Export Flow
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
     
  //Enter dynamic collection name
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "2Source");
  //doneButton.click() 
  doneButtonExportName.click();
  //Select Source collection
  browser.driver.sleep(3000);
  existingProducts.click();
  browser.driver.sleep(1000);
  selectSourceCollection.sendKeys("master collection");
  masterSourceCollection.click();
  browser.driver.sleep(1000);
  secondChooseList.click();
  browser.driver.sleep(2000);
  selectSecondList.sendKeys("Inventory");
  masterSourceCollection.click();
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            }); 
  doneBtn.click();
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(3000);
  //requiredCatogery.click();
  //Mapping attributes 
  selectSKU.click();
  nameSourceAttribute.click();
  productTypeField.click();
  skuSourceAttribute.click();
  selectCollectionDrop.click();
  selectSlaveCollection.click();
  browser.driver.sleep(2000);
  recomCatogery.click();
  //browser.driver.sleep(1000);
  //viewMore.click();
  browser.driver.sleep(1000);
  browser.executeScript("arguments[0].scrollIntoView();", showAll.getWebElement());
  showAll.click();
  browser.executeScript("arguments[0].scrollIntoView();", grams.getWebElement());
  browser.driver.sleep(2000);
  expect(inventoryQuanField.isPresent()).toBe(true);
  inventoryQuanField.click();
  inventorySourceAttribute.click();
  browser.driver.sleep(2000);
  //exportBtn1.click();
  exportBtn2.click();
  
  //browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport1.isPresent()).toBe(true);
  checkMyExport1.click();
  
  //Transformation Starts 
  browser.driver.sleep(3000);
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  
  connectivityIcon.click();
  
  connectivityItem.click()
  expect(productPageTitle.isPresent()).toBe(true);
  
  updatedbtn.click();
  productlist.click();
 
  
  };
  
  
  this.previewProduct = function(){

  //Redirect at Connectivity screen
  browser.driver.sleep(2000);
  connectivityIcon.click();
  //expect(connectivityItem.isPresent()).toBe(true);

  connectivityItem.click() //.then(function(){
  browser.driver.sleep(2000);
  createExport.click();
  expect(findTemplate.isPresent()).toBe(true);
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
  browser.driver.sleep(5000); 
  //Redirect to Export Flow
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
     
  //Enter dynamic collection name
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "pre");
  //doneButton.click() 
  browser.driver.sleep(3000);
  doneButtonExportName.click();
  //Select Source collection
  existingProducts.click();
  browser.driver.sleep(2000);
  selectSource.click();
  browser.driver.sleep(2000);
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  doneBtn.click();
  browser.driver.sleep(2000);
  doneBtn.click();
  browser.driver.sleep(2000);
  title.click();
  productTypeField.click();
  productType.click();
  browser.driver.sleep(2000);
  previewExport.click();
  //expect(nameText.isPresent()).toBe(true);
  closeTakeover.click();
  
  };
  
  this.draftCollection = function(){

  //Redirect at Connectivity screen
  browser.driver.sleep(2000);
  saveDraft.click();
  //connectivityItem.click();
  expect(draftTakeoverText.isPresent()).toBe(true);
   
  returnDashboard.click();
    
  //dashboardIcon.click();
  browser.driver.sleep(2000);
  connectivityIcon.click();
  
  connectivityItem.click()
  expect(productPageTitle.isPresent()).toBe(true);
 // updatedbtn.click();
  //productlist.click();
  
  
  };
  
  this.draftDynamicCollection = function(){

  //Redirect at Connectivity screen
  //draftTab.click();
  browser.driver.sleep(2000);
  updatedbtn.click();
  sideOptionBtn.click();
  editOptionBtn.click();
  //connectivityItem.click();
  //expect(draftTakeoverText.isPresent()).toBe(true);
  browser.driver.sleep(3000);
  doneBtn.click();
  
  browser.executeScript('window.scrollTo(0,400);').then(function () {
    
})
  expect(skip.isPresent()).toBe(true);
  skip.click();
  browser.driver.sleep(10000);
 // doneBtn.click();
 // browser.driver.sleep(3000);
 // exportBtn1.click();
  doneButn1.click();
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExportButton.getWebElement());
  checkMyExportButton.click();
  expect(editExport.isPresent()).toBe(true);
  
  };
  
   this.deleteTransformation = function(){
	  
  
 // browser.executeScript("arguments[0].scrollIntoView();", deleteButton.getWebElement());
  
  sideOptionBtn.click();
  //expect(editExport.isPresent()).toBe(true);
  DeleteOptionBtn.click();
  browser.driver.sleep(2000);
  deleteCollBtn.click();
  browser.driver.sleep(2000);
  //browser.refresh();
  //expect(productPageTitle.isPresent()).toBe(true);
  };
  
  
  this.specificationsWidget = function(){
	  
  
  //Redirect at Connectivity screen
  browser.driver.sleep(3000);
  connectivityIcon.click();
  //expect(connectivityItem.isPresent()).toBe(true);

  connectivityItem.click() //.then(function(){
  browser.driver.sleep(2000);	
  createExport.click();
  expect(findTemplate.isPresent()).toBe(true);
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
  browser.driver.sleep(5000);  
  //Redirect to Export Flow
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
     
  //Enter dynamic collection name
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "Spec");
  //doneButton.click() 
  browser.driver.sleep(3000);
  doneButtonExportName.click();
  //Select Source collection
  browser.driver.sleep(2000);
  existingProducts.click();
  browser.driver.sleep(3000);
  selectSource.click();
  browser.driver.sleep(2000);
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  doneBtn.click();
  browser.driver.sleep(3000);
  doneBtn.click();
  browser.driver.sleep(5000);
 // requiredCatogery.click(); 
  
  //Mapping attributes 
  //selectSKU.click();
  title.click();
  productTypeField.click();
  productType.click();
  browser.driver.sleep(2000);
  recomCatogery.click();
  browser.driver.sleep(1000);
   
  //recomCatogery.click();
  bodyHtmlField.click();
  advTab.click();
  browser.driver.sleep(2000);
  specRule.click();
  browser.driver.sleep(5000);
  specAttribute.sendKeys("Title");
  
  //replaceField.sendKeys("Title"); 
  chooseAttribute.click();
  selectAttribute.click();
  
  browser.driver.sleep(2000);
  //ptor.actions().sendKeys(protractor.Key.ENTER).perform();
  selectAttribute2.click();
  webOption.click();
  specAttribute.sendKeys("BrandName");
  
  applyBtn.click();
  
  browser.executeScript('window.scrollTo(0,0);').then(function(){
                //console.log('++++++SCROLLED UP+++++');
            });
 
  exportBtn1.click();
  
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExport.click();
  
  //Transformation Starts 
  browser.driver.sleep(3000);
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  
  connectivityIcon.click();
  
  connectivityItem.click()
  expect(productPageTitle.isPresent()).toBe(true);
  //activeTab.click();
  //updatedbtn.click();
  //productlist.click();
 
  };
  
  this.missingValue = function(){
	  
  
   //Redirect at Connectivity screen
  browser.driver.sleep(3000);
  connectivityIcon.click();
  //expect(connectivityItem.isPresent()).toBe(true);

  connectivityItem.click() //.then(function(){
  browser.driver.sleep(2000);
  createExport.click();
  expect(findTemplate.isPresent()).toBe(true);
  findTemplate.sendKeys("shopify");  
  myTemplate.click();
  browser.driver.sleep(5000);  
  //Redirect to Export Flow
  expect(selectProductTemplate.isPresent()).toBe(true);
  selectProductTemplate.click()
     
  //Enter dynamic collection name
  collectionName.sendKeys(cd.collection.dynamicCollectionName + "ms");
  browser.driver.sleep(3000); 
  doneButtonExportName.click();
  //Select Source collection
  browser.driver.sleep(2000);
  existingProducts.click();
  browser.driver.sleep(3000);
  selectSourceCollection.sendKeys("source with empty value");
  masterSourceCollection.click();
  browser.executeScript('window.scrollTo(0,0);').then(function(){
               
            });
  browser.driver.sleep(1000);
  doneBtn.click();
  browser.driver.sleep(3000);
  doneBtn.click();
  browser.driver.sleep(5000);
  //requiredCatogery.click(); 
  
  //Mapping attributes 
  //selectSKU.click();
  title.click();
  
  productTypeField.click();
  productType.click();
  browser.driver.sleep(2000);
  recomCatogery.click();
  browser.driver.sleep(1000);
   
  //selectSKUField.click();
  advTab.click();
  browser.driver.sleep(2000);
  missingValuerule.click();
  browser.driver.sleep(5000);
  missingValueAttribute.click();
  selectMissingList.click();
 
  replaceField.sendKeys("Automation Testing"); 
  browser.driver.sleep(2000);
  //ptor.actions().sendKeys(protractor.Key.ENTER).perform();
  //withField.sendKeys("Automation");
  applyBtn.click();
  
  exportBtn1.click();
  
  browser.executeScript("arguments[0].scrollIntoView();", checkMyExport.getWebElement());
  expect(checkMyExport.isPresent()).toBe(true);
  checkMyExport.click();
  
  //Transformation Starts 
  browser.driver.sleep(3000);
  browser.executeScript("arguments[0].scrollIntoView();", exportProduct.getWebElement());
  exportProduct.click();
  expect(connectToshopifyText.isPresent()).toBe(true);
  dashboardIcon.click();
  connectivityIcon.click();
  connectivityItem.click()
  expect(productPageTitle.isPresent()).toBe(true);
  //updatedbtn.click();
  //productlist.click();
 
  
  };
  
  
  
  this.exportToXLS = function(){
	  
   
  // From the My export screen, go to the product downlaod screen
  sideOptionBtn.click();
  exportDownloadBtn.click();
  expect(selectXLS.isPresent()).toBe(true);
  selectXLS.click();
  selectExport.click();
  expect(assrtText.getText()).toContain("Your file is ready for download");
  downloadBtn.click();
  browser.driver.sleep(1000);
  
  };
  this.exportToXLSX = function(){
	  
   
  // From the My export screen, go to the product downlaod screen
  sideOptionBtn.click();
  exportDownloadBtn.click();
  expect(selectXLS.isPresent()).toBe(true);
  selectXLSX.click();
  selectExport.click();
  expect(assrtText.getText()).toContain("Your file is ready for download");
  downloadBtn.click();
  browser.driver.sleep(1000);
  
  };
  this.exportToCSV = function(){
	  
   
  // From the My export screen, go to the product downlaod screen
  sideOptionBtn.click();
  exportDownloadBtn.click();
  expect(selectXLS.isPresent()).toBe(true);
  selectCSV.click();
  selectExport.click();
  expect(assrtText.getText()).toContain("Your file is ready for download");
  downloadBtn.click();
  browser.driver.sleep(1000);
  
  };
  
 };


TransformationFlowPage.prototype = basePage; // extend basePage...
module.exports = new TransformationFlowPage();
