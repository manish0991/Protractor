var basePage = require('./basePage.js');
var cd       = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');

var billingPage = function () {
 
  // CMS Sign In button locator
  var signUpButton   = element(by.xpath("//a[text()='Sign up!']"));
 
  // Registration Step 1 locators
  var email                = element(by.xpath("//*[@id='register']/fieldset/div/div[4]/input"));
  var password             = element.all(by.css('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required.ng-valid-pattern.ng-valid-minlength')).get(1);
  var registerButton       = element.all(by.css('.btn--large.btn--full')).get(1);
  

  // Registration Step 2 locators
  var firstName               = element.all(by.css('.form-field__input')).get(0);
  var lastName                = element.all(by.css('.form-field__input')).get(1);
  var companyName             = element(by.name("orgDisplayName"));
  var companyWebsite          = element(by.name("orgWebsiteUrl"));
  var howDoYouUseSpreadsheet  = element.all(by.css('.register-spreadsheets__option'));
  var completeSetupButton     = element(by.buttonText('Continue'));
  var phoneNumber               = element(by.name("phone"));
  var portal                  = element.all(by.css(".form-field__input.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required"));
  var close                  = element.all(by.css(".btn.btn--large.btn--rm-hover"));
  
  // Dahboard Locators
  var sideMenuProfile  = element(by.xpath("//button[@class='layout-user--sidebar__profile-image']"));
  var logoutMenuItem   = element(by.css('[ng-click="sidenav.logout()"]'));
  var dashHeader       = element.all(by.css('.db__heading')); 
  var dashHeaderPlan      = element.all(by.css('p.ng-scope'));
  var dashboardIcon = element(by.css(".layout-user--sidebar__logo"));
  var snapshot  = element(by.xpath("//h1[text()='Snapshot']"));
  
  // Billing Page Locators
  var sideMenuAdd          = element.all(by.css(".fa-plus")).get(0);
  var sideMenuSettings        = element(by.css(".fa-cog"));
  var billingItem      = element(by.css('[ng-click="sidenav.goBilling()"]'));
  var billingPageTitle  = element(by.css('[ng-click="sidenav.goBilling()"]'));
  var upgradeBasic  = element(by.xpath("//div[@class='billing ng-scope']/article/ul[1]/li[1]/div/div[2]/button"));
  var cardNumber = element.all(by.css('.takeover-billing-form__number-input'));
  var updatedcardNumber = element.all(by.css('.takeover-billing-form__number-input'));
  var cvvNumber = element.all(by.css('.takeover-billing-form__cvv-input'));
  var monthField = element.all(by.css('.billing-form__choice-input')).get(0);
  var selectMonth = element.all(by.css('.select2-result-label.ui-select-choices-row-inner')).get(0);
  var yearField = element.all(by.css('.billing-form__choice-input')).get(1);
  var selectYear = element.all(by.css('.select2-result-label.ui-select-choices-row-inner')).get(2);
  var cardholderName = element.all(by.css('.push-half--top'));
  var upgradeBtn = element.all(by.css('.btn.btn--large.btn--primary'));
  var downgradebtn = element.all(by.css('.btn--basic'));
  var downgradeText = element.all(by.css('.vz-takeover__grand-heading'));
  var downgradeButton = element.all(by.css('.btn.btn--large.btn--rm-hover'));
  var paymentMethod = element(by.xpath("//div[@class='push--top']/button[1]"));
  var billingTakeoverTitle = element(by.css(".vz-takeover__grand-heading"));
  var cancelButton  = element.all(by.css(".btn.btn--large.btn")).get(1);
  var doneButton              = element.all(by.css('.btn--large.btn--third__full.push-double--top'));
  var searchBox            = element(by.css('.solutions__search__input.ng-pristine.ng-untouched.ng-valid'));
  var continueButton          = element(by.css('.btn--large.btn--half__full.push-double--top.btn--center'));
  var donebtn                 = element(by.css('.btn--primary.form-content__buttons'));
  
  // Product Page
  var sideMenuAddPro          = element(by.xpath("//div[@class='layout-user--sidebar__menu']/div[1]/button[1]/span"));
  var addDataItem          = element(by.xpath("//a[text()='Import']"));
  var addProductPageTitle  = element(by.xpath("//h2[text()='Import from']"));
  var browseFiles = element(by.name('file'));
  var importButton = element.all(by.css(".btn.btn--medium")).get(0);
  var addUpdateProduct     = element(by.xpath("//span[text()='Create a product list']"));
  var addToNewCollection = element.all(by.css('.radio-list__circle')).get(0);
  var nextBtnText = element(by.buttonText('Next'));
  var collectionNewName = element(by.name('collectionName'));
  var nextButton = element(by.xpath("//button[@type='submit']"));
  var NextRow = element(by.css('[ng-click="include.nextStep()"]'));
  var sku = element(by.xpath("//var[@class = 'ng-binding' and contains(text(), 'sku')]"));
  var skipButton = element(by.buttonText('Skip'));
  var confirmButton = element(by.xpath("//button[@type='submit']"));
  var collectionType = element(by.css('.radio-list__circle'));
  var filePath = path.join(__dirname, "../../testData/")
  var connectivityIcon  = element.all(by.css(".fa-download")).get(0);
  var connectivityItem  = element(by.xpath("//a[text()='Apps and Sales Channels']"));
  
  
  // Billing Takeover
  
  var closeButton                 = element(by.xpath("//a[@class='text--purple vz-takeover__close vz-text-4rem']"));
  var quitButton                 = element(by.xpath("//a[text()='Quit Export']"));
  
  // Settings
  var sideMenuSettings  = element(by.css(".fa-cog"));
  
  // Connectivity
  var sideMenuConnectivity  = element.all(by.css(".fa-plug")).get(0);
  var myTemplate = element.all(by.css('.solutions__item__image__wrapper')).get(3);
  var selectTemplate = element(by.css(".plan--basic"));
  

  this.Registration = function() {
    
    // From the CMS, click the Sign Up button  
  //signUpButton.click().then(function(){
  //global.isAngularSite(true);  
   // });
    
        
    // Step 1
	browser.driver.sleep(2000);
    signUpButton.click();
    email.sendKeys(cd.randomUser1.email);  
    password.sendKeys(cd.randomUser1.password);
	registerButton.click();
	
	browser.driver.sleep(2000);
	expect(continueButton.isPresent()).toBe(true);
    firstName.sendKeys(cd.randomUser1.firstname);
    lastName.sendKeys(cd.randomUser1.lastname);
	
    phoneNumber.sendKeys("9998887776");
	//browser.driver.sleep(2000);
	
	companyName.sendKeys(cd.randomUser1.companyName);
    companyWebsite.sendKeys(cd.randomUser1.companyWebsite);
	browser.executeScript('window.scrollTo(0,600);').then(function () {
    
    })
	expect(howDoYouUseSpreadsheet.isPresent()).toBe(true);
	howDoYouUseSpreadsheet.get(0).click();  // 0 = Receive Spreadsheet, 1 = Send Spreadsheet
	//doneButton.click();
	continueButton.click();
	browser.driver.sleep(2000);
	portal.sendKeys(cd.partner.portal);
    doneButton.click();
	expect(searchBox.isPresent()).toBe(true);
	browser.driver.sleep(2000);
	browser.executeScript('window.scrollTo(0,400);').then(function () {
    
    })
	browser.driver.sleep(2000);
	expect(donebtn.isPresent()).toBe(true);
	donebtn.click();
	
	//donebtn.click();
  close.click();
  browser.driver.sleep(3000);
  dashboardIcon.click();
    
  browser.driver.sleep(2000);
  expect(sideMenuAddPro.isPresent()).toBe(true);
  sideMenuAddPro.click();
  addDataItem.click();
  expect(addProductPageTitle.isPresent()).toBe(true);
  browseFiles.sendKeys(filePath+"ACMEElectronics.csv");
  browser.driver.sleep(10000);
  importButton.click();
  //addUpdateProduct.click();

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
  dashboardIcon.click();
  connectivityIcon.click();
  browser.driver.sleep(2000); 
  connectivityItem.click();
  
  //expect(viewTheseProducts.isPresent()).toBe(true);
    
  };


  this.upgradePlan = function() {
    
     // Settings --> Billing
	 
  browser.driver.sleep(5000);
  sideMenuSettings.click();
  billingItem.click();
  //browser.executeScript("arguments[0].scrollIntoView();", upgradeBasic.getWebElement());

  //upgradeBasic.click();
  
  var elm = element.all(by.css('.billing__plan__header.text--uppercase.ng-binding.billing__plan__header--basic')).get(0);
  browser.executeScript("arguments[0].scrollIntoView();", elm.getWebElement());

//elm.click();
  upgradeBasic.click();
  browser.driver.sleep(2000);
  
  cardNumber.sendKeys(cd.randomUser3.cardNumber);
  cvvNumber.sendKeys(cd.randomUser3.cvvNumber);
  monthField.click();
  selectMonth.click();
  yearField.click();
  selectYear.click();
  cardholderName.sendKeys(cd.randomUser3.cardholderName);
  upgradeBtn.click();
  browser.driver.sleep(2000);
  //dashboardIcon.click();
  //browser.driver.sleep(1000);
  //expect(addProductPageTitle.isPresent()).toBe(true);
	
  };

   
    this.billingtakeover = function() {
	  
  
  expect(closeButton.isPresent()).toBe(true);
  closeButton.click();
  dashboardIcon.click();
  quitButton.click();  
  browser.driver.sleep(5000);
  expect(snapshot.isPresent()).toBe(true);
  //cancelButton.click();
   };
   
  this.updatePaymentMethod = function() {
	  
  
  browser.driver.sleep(2000);  
  
  browser.executeScript("arguments[0].scrollIntoView();", paymentMethod.getWebElement());
  paymentMethod.click()
  browser.driver.sleep(2000);
  expect(updatedcardNumber.isPresent()).toBe(true);
  updatedcardNumber.sendKeys('4012888888881881');
  browser.driver.sleep(2000);
  cvvNumber.sendKeys('344');
  
  monthField.click();
  selectMonth.click();
  yearField.click();
  selectYear.click();
  cardholderName.sendKeys('Vivek');
  upgradeBtn.click();
  browser.driver.sleep(3000);
  sideMenuProfile.click();
  logoutMenuItem.click()
      
   };
   
  
  
  this.logout = function(){

  //sideMenuProfile.click();
        
  logoutMenuItem.click().then(function(){
  global.isAngularSite(false);  // The CMS isn't an Angular site
    });

  };

};

billingPage.prototype = basePage; // extend basePage...
module.exports = new billingPage();
