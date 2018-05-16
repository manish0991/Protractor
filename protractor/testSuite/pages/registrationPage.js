var basePage = require('./basePage.js');
var cd       = require('./configData.js');

var RegistrationPage = function () {
 
  // CMS Sign In button locator
  var loginButton      = element(by.xpath("//a[text()='Login']"));
  var signUpButton     = element(by.xpath("//a[text()='Sign up!']"));
 
  // Registration Step 1 locators
  var email                = element(by.xpath("//*[@id='register']/fieldset/div/div[4]/input"));
  var password             = element.all(by.css('.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required.ng-valid-pattern.ng-valid-minlength')).get(1);
  var registerButton       = element.all(by.css('.btn--large.btn--full')).get(1);
  var exisitingEmailErrMsg = element(by.css('.form-field__msg--error'));
  var invalidEmailErrMsg   = element(by.css('.form-field__msg--error'));
  var pwdTooSmallErrMsg    = element(by.css('.form-field__msg--hint'));
  var emptyPwdErrMsg       = element(by.css('.form-field__msg--error'));
  var pwdNoNumberErrMsg    = element(by.css('.form-field__msg--error'));

  // Registration Step 2 locators
  var firstName               = element.all(by.css('.form-field__input')).get(0);
  var lastName                = element.all(by.css('.form-field__input')).get(1);
  var companyName             = element(by.name("orgDisplayName"));
  var companyWebsite          = element(by.name("orgWebsiteUrl"));
  var howDoYouUseSpreadsheet  = element.all(by.css('.register-spreadsheets__option'));
  var completeSetupButton     = element(by.buttonText('Continue'));
  var doneButton              = element(by.css('.btn--large.btn--third__full.push-double--top'));
  var continueButton          = element(by.css('.btn--large.btn--half__full.push-double--top.btn--center'));
  var donebtn                 = element(by.css('.btn--primary.form-content__buttons'));
  var phoneNumber             = element(by.name("phone"));
  var portal                  = element.all(by.css(".form-field__input.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required"));
  var close                  = element.all(by.css(".btn.btn--large.btn--rm-hover"));
  var sideMenuProfile  = element(by.xpath("//button[@class='layout-user--sidebar__profile-image ng-isolate-scope']"));
  var logoutMenuItem   = element.all(by.xpath("//a[text()='Log Out']"));
  
  
  var dashHeader       = element.all(by.css('.db__heading')); 
  var dashHeaderPlan      = element.all(by.css('p.ng-scope'));
  var appcuesOverlay   = element(by.css('.appcues-coachmarks-backdrop'));
  var dashboardIcon = element(by.css(".layout-user--sidebar__logo"));

  // Product List Locators
  var pageTitle            = element(by.css(".float--left"));
  var pageMsg              = element(by.xpath("//h3[text()='Adding products is quick and easy.']"));
  var dataIntro            = element(by.css('.data-introduction'));
  var addUpdateProduct     = element(by.css('[ng-click="create.selectOption(2)"]'));
  var searchBox            = element(by.css('.solutions__search__input.ng-pristine.ng-untouched.ng-valid'));
  
  

  this.userRegisterChoosingIReceiveSpreadsheet = function() {
    
    // From the CMS, click the Sign Up button  
    //signUpButton.click().then(function(){
    //  global.isAngularSite(true);  
    //});
    
        
    // Step 1
    
    //registerButton.click();
	browser.driver.sleep(2000);
	//browser.getCurrentUrl().then(function(url){
  //var user_id=url.split("user/")[1].replace("/profile","");
	browser.get('https://qa-app.venzee.com/register/step1');
    //signUpButton.click();
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
    
  }


  this.userRegisterChoosingISendSpreadsheet = function() {
    
    // From the CMS, click the Sign Up button  
    //loginButton.click().then(function(){
    //  global.isAngularSite(true);  
    //});
    
    // Step 1
	//browser.get('register/step1');
	browser.get('https://qa-app.venzee.com/register/step1');
	browser.driver.sleep(1000);
	//signUpButton.click();
	email.sendKeys(cd.randomUser2.email);  
    password.sendKeys(cd.randomUser2.password);
	registerButton.click();
	browser.driver.sleep(2000);
	expect(continueButton.isPresent()).toBe(true);
	firstName.sendKeys(cd.randomUser2.firstname);
    lastName.sendKeys(cd.randomUser2.lastname);
    phoneNumber.sendKeys("9998887776");
    companyName.sendKeys(cd.randomUser2.companyName);
    companyWebsite.sendKeys(cd.randomUser2.companyWebsite);
	browser.executeScript('window.scrollTo(0,600);').then(function () {
    
    })
	expect(howDoYouUseSpreadsheet.isPresent()).toBe(true);
	howDoYouUseSpreadsheet.get(1).click();  // 0 = Receive Spreadsheet, 1 = Send Spreadsheet
	//doneButton.click();
	continueButton.click();
	browser.driver.sleep(1000);
	//portal.sendKeys(cd.partner.portal);
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
	
  }

  this.userCantRegisterWithBadEmail = function() {
    
    // From the CMS, click the Sign Up button  
    signUpButton.click().then(function(){
      global.isAngularSite(true);  
    });
        
    // Existing email
    email.sendKeys(cd.user.email);  
    password.sendKeys(cd.user.password);
    registerButton.click();
    
    expect(exisitingEmailErrMsg.isPresent()).toBe(true);  // Don't check the text, just the error message is present

    // Invalid email
    email.clear();
    password.clear();
    email.sendKeys("invalidemail.com");  
    password.sendKeys(cd.user.password);
    registerButton.click();

    expect(invalidEmailErrMsg.isPresent()).toBe(true);  // Don't check the text, just the error message is present

  }


  this.userCantRegisterWithBadPassword = function(){

    // Password too small
    email.clear();
    password.clear();
    email.sendKeys(cd.user.email);  
    password.sendKeys("qwe1");
    registerButton.click();

    expect(pwdTooSmallErrMsg.isPresent()).toBe(true);  // Don't check the text, just the error message is present

    // No number in the password
    email.clear();
    password.clear();
    email.sendKeys(cd.user.email);  
    password.sendKeys("qwertyuio");
    registerButton.click();

    expect(pwdNoNumberErrMsg.isPresent()).toBe(true);  // Don't check the text, just the error message is present

    // Empty password
    email.clear();
    password.clear();
    email.sendKeys(cd.user.email);  
    registerButton.click();

    expect(emptyPwdErrMsg.isPresent()).toBe(true);  // Don't check the text, just the error message is present

  }



  this.validateLandOnDashboarAsRetailer = function(){
	  browser.driver.sleep(2000);
	expect(element(by.xpath("//div[contains(text(), 'Have vendors email spreadsheets directly to your account')]")).isPresent()).toBe(true);
  }


  //this.validateLandedOnProductList = function(){
	 //browser.driver.sleep(5000);
	this.validateLandOnRetailer = function(){
		//browser.driver.sleep(2000);
	expect(element(by.xpath("//div[contains(text(), 'Give customers and sales reps access to your products and updates.')]")).isPresent()).toBe(true);
	
	//expect(element(by.xpath("//div[@class='ng-scope']/span[1]")).isPresent()).toBe(true);
	browser.driver.sleep(3000);
	//expect(retailersText.isPresent()).toBe(true);
  }

  this.logout = function(){

    sideMenuProfile.click();
        
    logoutMenuItem.click().then(function(){
      global.isAngularSite(false);  // The CMS isn't an Angular site
    });

  }

};

RegistrationPage.prototype = basePage; // extend basePage...
module.exports = new RegistrationPage();
