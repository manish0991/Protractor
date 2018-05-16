var basePage = require('./basePage.js');
var cd = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');

var ImportFromKloudlessPage = function () {

  //Dashborad screen locators
  var dashboardIcon = element(by.xpath("//*[@id='localizejs']/div/div[2]/div/div[1]"));
  var addSourceData = element(by.css('.livetile__container--collections')); 
  var addCollectionBtn = element(by.buttonText('Add'));
  var addRecordslink = element(by.linkText('Add records'));
  var addProductPageTitle  = element(by.xpath("//h2[text()='Import from']"));
  var uploadFile = element(by.css('.btn.btn-success.push--left.soft--bottom.soft--top'));
  var addDataOption          = element.all(by.css(".dropdown__menu.dropdown__menu--list>li>a")).get(8);
  var addDataItem          = element(by.xpath("//a[text()='Import']"));
  // Add
  
  var sideMenuAdd          = element.all(by.css(".fa-upload")).get(0);
  var sideMenuAddPro       = element(by.xpath("//div[@class='layout-user--sidebar__menu']/div[1]/button[1]/span"));
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
  
  // Kloudless UI screen
  var assrtText = element.all(by.xpath("//h4[text()='cloud solution']"));
  var cloudSolution = element.all(by.css('.soft--top.ng-isolate-scope')).get(0);
  var assrtOneDrive = element.all(by.css('.foldertext')).get(0);
  var documentFolder = element.all(by.xpath("//*[@id='fs-view-body']/tr[1]/td[1]")); 
  var selectCSV = element.all(by.xpath("//*[@id='fs-view-body']/tr/td[1]"));
  var selectButton = element.all(by.xpath("//div[@class='buttonscontainer']//a[text()='Select']"));
  var selectOneDrive = element.all(by.xpath("//div[@class='containall']/div[2]/ul/li[3]"));
  var emailField = element.all(by.xpath("//input[@name='loginfmt']"));
  var dropboxEmailField = element.all(by.xpath("//input[@name='login_email']"));
  var dropboxPasswordField = element.all(by.xpath("//input[@name='login_password']"));
  var passwordField = element.all(by.xpath("//input[@name='passwd']"));
  var nextBtn = element.all(by.xpath("//input[@class='btn btn-block btn-primary']"));
  var signInBtn = element.all(by.xpath("//input[@class='btn btn-block btn-primary']"));
  var dropboxSignInBtn = element.all(by.xpath("//button[@class='login-button signin-button button-primary']"));
  var backButton = element.all(by.xpath("//a[@class='backbtn']"));
  var iFrame = element.all(by.xpath("//*[@id='ng-app']/body/iframe[8]"));
  var dropboxAllowBtn = element.all(by.xpath("//*[@id='authorize-form']/button[2]"));
  var ftpURL = element.all(by.xpath("//*[@id='id_domain']"));
  var ftpUsername = element.all(by.xpath("//*[@id='username']"));
  var ftpPassword = element.all(by.xpath("//*[@id='password']"));
  var ftpSubmit = element.all(by.xpath("//input[@name='form-submit']"));
  //var backButton = element.all(by.xpath("//input[@name='form-submit']"));
  
  //Test file for creating the collection
 
  
  var filePath = path.join(__dirname, "../../testData/")
  

  this.importFromOnedrive = function(){

  // From the dashboard, go to the Products screen
  
  //browser.driver.sleep(2000);
  expect(sideMenuAddPro.isPresent()).toBe(true);
  sideMenuAddPro.click();
  addDataItem.click();
  browser.driver.sleep(5000);
  cloudSolution.click();
  browser.driver.sleep(5000);
  
  
  var driver = browser.driver;
  browser.switchTo().frame(driver.findElement(protractor.by.css('.kloudless-modal')));
  browser.findElement(protractor.By.xpath("//div[@class='containall']/div[2]/ul/li[3]")).click();
  browser.sleep(5000);
  
  browser.getAllWindowHandles().then(function(handles){
    browser.switchTo().window(handles[1]).then(function(){
        //do your stuff on the pop up window
    });
});
  browser.driver.sleep(2000);
  emailField.sendKeys("qaautomationtest@outlook.com");
  nextBtn.click();
  passwordField.sendKeys("dolpho@dolpho");
  browser.driver.sleep(2000);
  signInBtn.click();
  browser.getAllWindowHandles().then(function(handles){
    browser.switchTo().window(handles[0]).then(function(){
        //do your stuff on the pop up window
    });
});

  browser.switchTo().frame(driver.findElement(protractor.by.css('.kloudless-modal')));
  browser.findElement(protractor.By.xpath("//*[@id='fs-view-body']/tr[1]/td[1]")).click();
  browser.sleep(5000); 
  browser.findElement(protractor.By.xpath("//*[@id='fs-view-body']/tr/td[1]")).click();
  browser.findElement(protractor.By.xpath("//div[@class='buttonscontainer']//a[text()='Select']")).click();
  browser.driver.sleep(5000);
  browser.refresh();
  
  
  
  
  //browseFiles.sendKeys(filePath+"ACMEElectronics.csv");
  //browser.driver.sleep(10000);
  //importButton.click();

  //From the Products screen, go to the Add products to a new collection screen
  //addUpdateProduct.click();

  //collectionType.isPresent().then(function(isVisible) {
  //  if (isVisible) {
   //   addToNewCollection.click();
    //  nextBtnText.click();
    //}
  //});
  
 
  //collectionNewName.sendKeys(cd.collection.collectionNewName);
  //browser.driver.sleep(5000);  // Need a sleep to wait for the takeover to close

    
  // Hit next button once file browsed.
  //nextButton.click();
  //browser.driver.sleep(10000);  // Need a sleep to wait for the takeover to close

  // Hit Next button at Which row contains your labels ? screen.
  //NextRow.click();
 // browser.driver.sleep(10000); 
 
  // Hit Next button at Choose what you would like to import
  //nextBtnText.click();
  //browser.driver.sleep(10000);  
  
  //nextBtnText.click();
  //browser.driver.sleep(10000); 
  
  // Need a sleep to wait for the takeover to close

  // Select SKU at How do you identify your products? page and then hit Next button
  //expect(sku.isPresent()).toBe(true);
  //sku.click();
  //nextBtnText.click();

  // Hit Skip at Setup your variants (optional) page
  //skipButton.click();

  // Hit Skip at Identify your image filename(s) page
  //skipButton.click();

  // Hit Confirm at Please take a moment to confirm your choices page
 // confirmButton.click();
  //browser.driver.sleep(12000);  // Need a sleep to wait for the takeover to close

  
  //expect(viewTheseProducts.isPresent()).toBe(true);

  };

  
 
  
   this.importFromDropbox = function(){
	   
  browser.driver.sleep(1000);   
  dashboardIcon.click();   
  browser.driver.sleep(1000);
  expect(sideMenuAddPro.isPresent()).toBe(true);
  sideMenuAddPro.click();
  addDataItem.click();
  //expect(assrtText.getText()).toContain("CLOUD SOLUTION");
  browser.driver.sleep(5000);
  cloudSolution.click();
  browser.driver.sleep(5000);
  var driver = browser.driver;
  //browser.findElement(protractor.By.xpath("//*[@id='fs-view-body']/tr/td[1]")).click();
  browser.switchTo().frame(driver.findElement(protractor.by.css('.kloudless-modal')));
  browser.findElement(protractor.By.xpath("//button[@class='button accountsbutton']")).click();
  browser.findElement(protractor.By.xpath("//*[@id='account-dropdown']/ul/li[2]")).click();
  browser.findElement(protractor.by.css('.alert')).click();
  var EC = protractor.ExpectedConditions;
  browser.wait(EC.alertIsPresent(), 5000, "Alert is not getting present :(")
  browser.switchTo().alert().accept();
  browser.sleep(5000);
  
  browser.findElement(protractor.By.xpath("//div[@class='containall']/div[2]/ul/li[1]")).click();
  browser.sleep(3000);
  browser.getAllWindowHandles().then(function(handles){
    browser.switchTo().window(handles[1]).then(function(){
        //do your stuff on the pop up window
    });
});
  browser.driver.sleep(2000);
  dropboxEmailField.sendKeys("automationtest@outlook.com");
  //nextBtn.click();
  dropboxPasswordField.sendKeys("1qaz!QAZ");
  browser.driver.sleep(2000);
  dropboxSignInBtn.click();
  dropboxAllowBtn.click();
  
  browser.getAllWindowHandles().then(function(handles){
    browser.switchTo().window(handles[0]).then(function(){
        //do your stuff on the pop up window
    });
});

  browser.switchTo().frame(driver.findElement(protractor.by.css('.kloudless-modal')));
  //browser.findElement(protractor.By.xpath("//*[@id='fs-view-body']/tr[1]/td[1]")).click();
  browser.sleep(5000); 
  browser.findElement(protractor.By.xpath("//*[@id='fs-view-body']/tr/td[1]")).click();
  browser.findElement(protractor.By.xpath("//div[@class='buttonscontainer']//a[text()='Select']")).click();
  browser.driver.sleep(10000);
  browser.refresh();
  
  

   };
  
   
  this.importFromFTP = function(){

  browser.driver.sleep(1000);   
  dashboardIcon.click();   
  browser.driver.sleep(1000);
  expect(sideMenuAddPro.isPresent()).toBe(true);
  sideMenuAddPro.click();
  addDataItem.click();
  //expect(assrtText.getText()).toContain("CLOUD SOLUTION");
  browser.driver.sleep(5000);
  cloudSolution.click();
  browser.driver.sleep(5000);
  var driver = browser.driver;
  browser.switchTo().frame(driver.findElement(protractor.by.css('.kloudless-modal')));
  browser.findElement(protractor.By.xpath("//button[@class='button accountsbutton']")).click();
  browser.findElement(protractor.By.xpath("//*[@id='account-dropdown']/ul/li[2]")).click();
  browser.findElement(protractor.by.css('.alert')).click();
  var EC = protractor.ExpectedConditions;
  browser.wait(EC.alertIsPresent(), 5000, "Alert is not getting present :(")
  browser.switchTo().alert().accept();
  browser.sleep(5000);
  
  browser.findElement(protractor.By.xpath("//div[@class='containall']/div[2]/ul/li[2]")).click();
  browser.sleep(3000);
  browser.getAllWindowHandles().then(function(handles){
    browser.switchTo().window(handles[1]).then(function(){
        //do your stuff on the pop up window
    });
});
  browser.driver.sleep(2000);
  ftpURL.sendKeys("qacloudftp.venzee.com");
  ftpUsername.sendKeys("qauser");
  //nextBtn.click();
  ftpPassword.sendKeys("qwerty123");
  browser.driver.sleep(2000);
  ftpSubmit.click();
  
  browser.getAllWindowHandles().then(function(handles){
    browser.switchTo().window(handles[0]).then(function(){
        //do your stuff on the pop up window
    });
});
   
  browser.switchTo().frame(driver.findElement(protractor.by.css('.kloudless-modal')));
  browser.findElement(protractor.By.xpath("//div[@class='backcontain']/a[1]")).click();
  browser.sleep(3000); 
  browser.findElement(protractor.By.xpath("//*[@id='fs-view-body']/tr[1]/td[1]")).click();
  browser.findElement(protractor.By.xpath("//div[@class='buttonscontainer']//a[text()='Select']")).click();
  browser.driver.sleep(5000);
  browser.refresh();
  
   };

  
  

};


ImportFromKloudlessPage.prototype = basePage; // extend basePage...
module.exports = new ImportFromKloudlessPage();
