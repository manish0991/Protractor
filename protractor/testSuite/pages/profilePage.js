var basePage = require('./basePage.js');
var cd = require('./configData.js');
var path=require('path');
var loginPage = require('./loginPage.js');
var ProfilePage = function () {

  //the locators declaration for the current page
  var sideMenuProfile   = element(by.xpath("//button[@class='layout-user--sidebar__profile-image ng-isolate-scope']"));
  var profileMenu   = element(by.xpath("//button[@class='layout-user--sidebar__profile-image ng-isolate-scope active']"));
  var logoutMenuItem   = element(by.css('[ng-click="sidenav.logout()"]'));
  var yourProfileItem   = element(by.xpath("//a[@class='profile--text']/p[2]"));
  var phoneNumberEle    = element(by.name("phone"));
  var firstname         = element(by.name("firstName"));
  var lastname          = element(by.name("lastName"));
  var saveChangesButton = element.all(by.xpath("//button[@type='submit']")).get(0);
  var fileToUploadPath=   element(by.xpath("//input[@class='ng-pristine ng-untouched ng-valid']"));
  var newPassword          = element(by.name("newPassword"));
  var confirmNewPassword          = element(by.name("confirmNewPassword"));
  var saveChangesButtonForPassword = element(by.xpath("(//button[@type='submit'])[2]"));
  var languageChangeDropdown = element(by.xpath("//div[@class='form-group__fields']/div[1]/div/a"));
  var englishLanguageSelection=element(by.xpath("//span[text()='English']"));
  var spanishLanguageSelection=element(by.xpath("//li[2]/div/span"));
  var portugeseLanguageSelection=element(by.xpath("//li[3]/div/span"));
  var selectedlanguage = element.all(by.css('.select2-choice.ui-select-match')).get(0);
  var email            = element(by.name('username'));
  var password         = element(by.name('password'));
  var currentPassword            = element(by.name('currentPassword'));
  var submitButtonElem = element.all(by.buttonText('Login')).get(0);
  var loginButton      = element.all(by.css('[title="log"]')).get(0);
  var errorMessageForInvalidCredentials=element(by.xpath(".//*[@id='login']/fieldset/div/div[1]/label"));

  this.changeBasicInformation = function(){
    sideMenuProfile.click();
	browser.driver.sleep(3000);
    yourProfileItem.click();
    // Clear existing value
    firstname.clear();
    lastname.clear();
    phoneNumberEle.clear();

    // Write new value
    firstname.sendKeys(cd.user.firstname);
    lastname.sendKeys(cd.user.lastname);
    phoneNumberEle.sendKeys(cd.user.phoneNumber);
	browser.executeScript('window.scrollTo(0,400);').then(function () {
   
  })
   browser.driver.sleep(3000);

   saveChangesButton.click();
 
    // Validate the change
    //phoneNumberEle.getText().then(function(phoneNumber){
    //  console.log('Phone number : ' + phoneNumber);
    //  expect(phoneNumber).toEqual(cd.user.phoneNumber);
    //});

  };

  this.changeProfilePicture=function () {
    // From the dashboard, go to the user profile

    console.log('directory is'+__dirname);
    var fileToUpload = '../Images/venzee-logo.png';
    var absolutePath = path.resolve(__dirname, fileToUpload);
    console.log('absolutePath is'+absolutePath);
    //fileToUploadPath.click();
    fileToUploadPath.sendKeys(absolutePath);
	browser.executeScript('window.scrollTo(0,500);').then(function () {
   
})
    saveChangesButton.click();
	profileMenu.click();

    logoutMenuItem.click();
  };

  this.verifyLanguageChange=function(){
    browser.driver.sleep(3000);
	browser.executeScript('window.scrollTo(0,600);').then(function () {
   
    })
    languageChangeDropdown.click();
    spanishLanguageSelection.click();
    //Verify the Selected language is Spansih
    selectedlanguage.getText().then(function (selectedLanguage) {
      expect(selectedLanguage).toEqual('Español');
    });
   
    //Verify that the user should be able to select the Language as Portugese
	browser.driver.sleep(3000);
    languageChangeDropdown.click();
    portugeseLanguageSelection.click();
    //Verify the Selected language is Spansih
    selectedlanguage.getText().then(function (selectedLanguage) {
     expect(selectedLanguage).toEqual('Português');
   });
    browser.driver.sleep(3000);
    languageChangeDropdown.click();
    englishLanguageSelection.click();
    selectedlanguage.getText().then(function (selectedLanguage) {
      expect(selectedLanguage).toEqual('English');
   });
  };

  this.verifyChangePassword=function () {
    // Update New password
    currentPassword.clear();
    browser.sleep(500);
    currentPassword.sendKeys(cd.user.password);
    browser.sleep(500);
    newPassword.sendKeys(cd.user.newPassword);
    browser.sleep(500);
    confirmNewPassword.sendKeys(cd.user.newPassword);
    browser.sleep(500);
    saveChangesButtonForPassword.click();
    //Logout from Application
    sideMenuProfile.click();

    logoutMenuItem.click();
    global.isAngularSite(false);  // The CMS isn't an Angular site
    loginButton.click().then(function() {
      global.isAngularSite(true);
    });
    //console.log("Ready to login");
    email.clear();
    email.sendKeys(cd.user.email);
    password.clear();
    password.sendKeys(cd.user.password);
    submitButtonElem.click();
    browser.sleep(5000);
    errorMessageForInvalidCredentials.getText().then(function (errorMessage) {
      expect(errorMessage).toEqual('Invalid user credentials provided.');
    });

    email.clear();
    email.sendKeys(cd.user.email);
    password.clear();
    password.sendKeys(cd.user.newPassword);
    submitButtonElem.click();
    //console.log("already login");
    expect(sideMenuProfile.isPresent()).toBe(true);
    sideMenuProfile.click();
    yourProfileItem.click();
    currentPassword.clear();
    currentPassword.sendKeys(cd.user.newPassword);
    newPassword.clear();
    newPassword.sendKeys(cd.user.password);
    confirmNewPassword.clear();
    confirmNewPassword.sendKeys(cd.user.password);
    saveChangesButtonForPassword.click();

  };

};

ProfilePage.prototype = basePage; // extend basePage...
module.exports = new ProfilePage();
