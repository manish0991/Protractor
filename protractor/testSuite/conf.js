// ------------------------------------------------------------------------------------------------
// REFERENCE 
//  - conf.js file : https://github.com/angular/protractor/blob/master/docs/referenceConf.js
//  - Download Firefox v36 : https://ftp.mozilla.org/pub/firefox/releases/36.0.4/win32/en-US/
// ------------------------------------------------------------------------------------------------

var fs    = require('fs');
var slack = require('./helpers/slack.js');

exports.config = {

  // To start/stop selenium on each run
  seleniumServerJar: "../node_modules/selenium-server-standalone-jar/jar/selenium-server-standalone-2.53.1.jar",
  
  // To manage the selenium server independently (open a cmd -> $ webserver-manager start)
  //seleniumAddress: 'http://localhost:4444/wd/hub',  

  restartBrowserBetweenTests: false,

  // plugins: [{
    // package:                   'jasmine2-protractor-utils',
	//screenshotPath:'./reports/screenshots',
    // screenshotOnExpectFailure: true,
    // screenshotOnSpecFailure:   true,
    // clearFoldersBeforeTest:    true,
	//htmlReportDir: '../reports/htmlReports',
    // htmlReportDir:             '..\reports',
    
    // failTestOnErrorLog: {
        // failTestOnErrorLogLevel: 200000,
        // excludeKeywords:         ['favicon', 'keyword2']
    // }

  // }] ,

  capabilities: {
    browserName: 'chrome',
    //'binary': '/Users/aslam/webdriver/chromedriver',
    //shardTestFiles: true,
    //maxInstances: 4
	  //browserName: 'firefox',
    //firefox_binary: "~\Library\Application Support\Firefox\Profiles\892pd1sn.default",
  },

/*  multiCapabilities: [
    {browserName: 'firefox'}, 
    {browserName: 'chrome'}
  ],
*/
  framework: 'jasmine2',

  specs: ['specs/*-spec.js'],

  // exclude: ['spec/doNotRunInChromeSpec.js'],  // How to exclude a spec file !

  suites: {
    check_setup: 'specs/checkSetup.js',
    smoke_test:  ['specs/registration-spec.js',
                  'specs/profile-spec.js'],
    todo:        ['specs/sideMenu-spec.js'],
    todo2:       ['specs/registration-spec.js']
  },

  getPageTimeout:    15000,
  allScriptsTimeout: 600000000,

  beforeLaunch: function () {},


  onPrepare: function() {
		
    return global.browser.getProcessedConfig().then(function (config) {

      // browser.manage().timeouts().pageLoadTimeout(30000);
      browser.driver.manage().timeouts().implicitlyWait(15000);
      
      browser.driver.manage().window().setSize(1280, 968);
      //browser.driver.manage().window().setPosition(-1280, 50);
      browser.manage().window().maximize();

      global.isAngularSite = function(flag){
          browser.ignoreSynchronization = !flag;
      };

      global.getAngularSite = function(){
          return (!browser.ignoreSynchronization);
      };

      global.presenceOf  = protractor.ExpectedConditions.presenceOf;
      global.EC = protractor.ExpectedConditions;


      var SpecReporter = require('jasmine-spec-reporter');
      jasmine.getEnv().addReporter(new SpecReporter({displayStacktrace: false}));

      // Custom reporter by Marco
      jasmine.getEnv().addReporter(new function() {

        var testResultSuccessful = true;

        this.jasmineStarted = function(suiteInfo) {
         // console.log('Running suite with ' + suiteInfo.totalSpecsDefined);
         // console.log("testResultSuccessful : " + testResultSuccessful);
        };

        this.specDone = function(result) {
          if (result.failedExpectations.length > 0) {
          //  console.log("That spec failed....");
            testResultSuccessful = false;
          }
        };

        this.suiteDone = function(result){
          //console.log('Suite: ' + result.description + ' was ' + result.status);
          for(var i = 0; i < result.failedExpectations.length; i++) {
            console.log('AfterAll ' + result.failedExpectations[i].message);
            console.log(result.failedExpectations[i].stack);
          }
        };

        this.jasmineDone = function() {

          if (testResultSuccessful){
            //slack.post("Hell Yeah, all the test passed !");
          }
          else {
            //slack.post("There's a test that failed.  See the logs...");
          }
        
        };

      });



      var jasmineReporters = require('jasmine-reporters');
      jasmine.getEnv().addReporter(new jasmineReporters.JUnitXmlReporter({
          consolidateAll: true,
		  
         filePrefix: 'results',
         savePath: 'reports'
      }));

      var Jasmine2HtmlReporter = require('protractor-jasmine2-html-reporter');
      jasmine.getEnv().addReporter(new Jasmine2HtmlReporter({
          savePath: 'reports',
          takeScreenshotsOnlyOnFailures:true
      }));   

    });

  },

  // Options to be passed to Jasmine-node.

  // Finally removed all the duplicate stack trace by removing those option


  jasmineNodeOpts: {

    isVerbose: false,
    includeStackTrace: false,
    showColors: true,
    defaultTimeoutInterval: 1800000

  }

};
