## Protractor Venzee Test Framework

### Pre requisite (verified)

    node.js >= 4.6.x
    protractor >= 4.0.x
    chromedriver >= 2.25
    selenium-server-standalone = 2.53.1 (3.0.x doesn't work at all for now)
    Java jre >= 1.8.x

### Installation Instruction

1. Install protractor `$ npm install -g protractor`  
2. Download the latest version of chromedriver and make sure it's available in your path https://chromedriver.storage.googleapis.com/index.html
3. Clone the QA repository `git clone https://github.com/venzee/qa.git`
4. Go to ../qa/protractor and run `npm install`


### Running the test

Theres 3 test suite, you can use :
Go to `/qa/protractor/testSuite/`
    
    protractor conf.js --specs specs/checkSetup.js   // Use this one to test your protractor setup
    protractor conf.js                               // Run the test that are fully working

### ToDo

- Clean up the triple error list / stack trace we get !  It's painfull when 1 test crash...
- Check to fit cucumber with Protractor / otherwise, user stories or test scenarios ?
- Create a "hint place" to stock all the trick we'll find.  Maybe in the readme ?

### Known Issues
- Don't run with firefox (to enable multi-browser capabilities)
- There's 2 "reports" folder created each run under /protractor and /protractor/testSuite. Need to do a clean up in the reports plugin

## Protractor Guide

**Click on a button**

    var completeSetupButton = element(by.buttonText('Complete Setup'))
    completeSetupButton.click();

**Click on a link**
   
    tbd
   
**Side Menu**
    
    var SideMenuProfile  = element(by.xpath("//button[@class='layout-user--sidebar__profile-image']"));
    var logoutMenuItem   = element(by.css('[ng-click="sidenav.logout()"]'));
    SideMenuProfile.click();
    logoutMenuItem.click();

**Click on a radio button**

    <ul class="radio-list push--bottom ng-scope" ng-if="!register.userInvitation">
      <li class="radio-list__item">
        <label class="radio-list__label">
          <input class="radio-list__radio ng-untouched ng-valid ng-valid-required ng-dirty ng-valid-parse" type="radio" name="describe" value="receive spreadsheet" ng-model="register.orgDescription" required="" vz-submitted="">
          <span class="radio-list__text">Companies send me lots of spreadsheets</span>
          <span class="radio-list__circle"></span>
        </label>
      </li>
      <li class="radio-list__item">
        <label class="radio-list__label">
          <input class="radio-list__radio ng-untouched ng-valid ng-valid-required ng-dirty" type="radio" name="describe" value="send spreadsheet" ng-model="register.orgDescription" required="" vz-submitted="">
          <span class="radio-list__text">I send spreadsheets to lots of companies</span>
          <span class="radio-list__circle"></span>
        </label>
      </li>
    </ul>

    var howDoYouUseSpreadsheet  = element.all(by.css('.radio-list__text'));
    howDoYouUseSpreadsheet.get(1).click();

**Click on dropdown**

    tbd

**Write in text field**

    var firstName = element(by.name("firstName"));
    firstName.sendKeys("Protractor");

**Read a text field**

If there's multiple item

    var dashHeader = element.all(by.css('.db__heading'));

    // Lood through all
    dashHeader.each(function(header, index) {
      // Will print 0 First, 1 Second, 2 Third.
      header.getText().then(function (text) {
        console.log(index, text);
      });
    });

    // Get specific index
    dashHeader.get(2).getText().then(function(text){
      console.log(text);
    });

    // Validate the content
    expect(dashHeader.get(0).getText()).toBe("Get Started");
    
**Read a page title**

    var siteTitle = element(by.id("vz-title-01"));
    expect(siteTitle.getText()).toEqual('Your Product Information isn’t compatible with Jet. So what else is new?')

**Read specific text in a page**

    var pageMsg   = element(by.xpath("//h3[text()='Adding products is quick and easy.']"));
    expect(pageMsg.isPresent()).toBe(true);

    var pageTitle = element(by.css(".float--left"));
    expect(pageTitle.getText()).toBe("Products");

**Read a dropdown value**

    tbd
    
**Validate Error Message**

    <div ng-messages="registerForm.password.$error" class="form-field__label__errors ng-active">
      <!-- ngMessage: required -->
      <!-- ngMessage: minlength -->
      <!-- ngMessage: pattern --><label class="form-field__msg form-field__msg--error ng-scope" ng-message="pattern">Password must contain at least one letter and number.</label>
    </div>

    var pwdNoNumberErrMsg = element(by.css('.form-field__msg--error'));
    expect(pwdNoNumberErrMsg.isPresent()).toBe(true);  // Don't check the text, just the error message is present
