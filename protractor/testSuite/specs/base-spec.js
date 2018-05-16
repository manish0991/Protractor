var loginPage   = require('../pages/loginPage.js');
var envt        = require('./../environment.json');

var environment = process.env.environment || envt.env;
var url         = process.env.url         || (environment == 'qa' ? envt.qa.url : (environment == 'dev' ? envt.dev.url : (environment == 'stage' ? envt.stage.url : envt.qa.url)));


var BaseSpec = function () {

  this.initSetup = function (option) {

    // Run before all test
    // By default, the test start with a logged in user, on the dashboard.
    // The Registration test start on the CMS
    beforeAll(function () {

      //console.log("=====> OPTION : " + option);
    
      if (option == "TEST REGISTRATION") {
        browser.driver.get(url);
        global.isAngularSite(false);
        loginPage.logout(url);
      }

      else if (!option) {

        // By default qa.venzee.com
        browser.driver.get(url);
        global.isAngularSite(false);  // The CMS isn't an Angular site

        loginPage.login();
      }
    
    });


    // Run after all test
    afterAll(function () {
    });


    // Run before each test
    beforeEach(function () {


    });


    // Run after each test
    afterEach(function () {

      /*  Not sure what this code is doing....
      ------------------------------------------------------
      browser.getProcessedConfig().then(function (caps) {

        var browserName = caps.capabilities.browserName;

        if (browserName !== "internet explorer") {
      
          it('selecting a service shouldnt throw an error', function () {
            
            browser.manage().logs().get('browser').then(function (browserLog) {
                expect(browserLog.length).toEqual(0);
            });

          })
        }
      });

      browser.driver.sleep(2000);
      */    
    });
  }

}

module.exports = new BaseSpec();