var basePage = require('./basePage.js');

var ConfigData = function () {

  var randomUserId1 = Math.floor((Math.random() * 2000000) + 1);
  var randomUserId2 = Math.floor((Math.random() * 2000000) + 1);
  var randomUserId3 = Math.floor((Math.random() * 2000000) + 1);
  var randomParterId2 = Math.floor((Math.random() * 1000000) + 1);
  var randomCollectionId = Math.floor((Math.random() * 2000000) + 1);
  var randomCompany = Math.floor((Math.random() * 1000000) + 1);

  // This is the default user to use in the test for Protractor
  this.user = {
    firstname:      "Automated",
    lastname:       "Test User",
	email:          "automationuserqa@yopmail.com",   //QA test account
	//email:        "protractortest@yopmail.com",   //RSQA test account
	//email:        "vivekeivor988@yopmail.com",  //DEV test account 
	password:       "1qaz!QAZ",
    companyName:    "Protractor Inc.",
    companyWebsite: "Protractor.org",
    phoneNumber:    "565-687-9089",
  };

  // Used to test the registration.  Need a new email each time.
  this.randomUser1 = {
    firstname:      "Automated",
    lastname:       "Test Partner",
    email:          "marco+protractor" + randomUserId1 + "@venzee.com",
    password:       "123456789q",
    companyName:    "Protractor Corp" + randomCompany + "test",
    companyWebsite: "protractor.org",
    phoneNumber:    "565-687-9089",
  };

  // Used to test the registration.  Need a new email each time.
  this.randomUser2 = {
    firstname:      "Automated",
    lastname:       "Test Partner",
    email:          "marco+protractor" + randomUserId2 + "@venzee.com",
    password:       "123456789q",
    companyName:    "Protractor Corp" + randomCompany + "test",
    companyWebsite: "protractor.org",
    phoneNumber:    "565-687-9089",
  };
  
// Used to test the Billing.  Need a new email each time.
  this.randomUser3 = {
    firstname:      "Automated",
    lastname:       "Test Partner",
    email:          "marco+protractor" + randomUserId3 + "@venzee.com",
    password:       "123456789q",
    companyName:    "Protractor Corp" + randomCompany + "test",
    companyWebsite: "protractor.org",
    phoneNumber:    "565-687-9089",
	cardNumber:      "4242424242424242",
	cvvNumber:       "4208",
	cardholderName:  "Vivek"
  };
  
  
  // Could be use to test the invite partner
  this.partner = {
    firstname:      "Automated",
    lastname:       "Test Partner",
    email:          "protractor" + randomCollectionId + "@gmail.com",
    password:       "Cucumber!2015",
    companyName:    "Protractor Corp" + randomCompany + "test",
    companyWebsite: "Protractor.org",
    phoneNumber:    "565-687-9089",
	group:          "Group",
	portal:         "Retailer" + randomCollectionId + "qa001",
	retailerPortal: "Retailer" + randomCollectionId + "qa0001",
  };

  //Use to create new collections
  this.collection = {
    collectionName: "AutoCollection" + randomCollectionId + "test",
    dynamicCollectionName: "AutoDynamicCollection" + randomCollectionId + "test",
	collectionNewName: "Collection" + randomCollectionId + "qa",
	collectionMissingName: "TestCollection" + randomCollectionId + "qa",
	collectionParentmissingNewName: "QACollection" + randomCollectionId + "qa",
	collectionMergedNewName: "AutomationCollection" + randomCollectionId + "qa",
	updateCollectionName: "UpdateCollection" + randomCollectionId + "pro",
  };

  //Use to create new template
  this.template = {
    templateName: "AutoTemplate" + randomCollectionId + "test",
    templateDescription: "AutoTemplateDescription" + randomCollectionId + "test",
    fieldName: "ProtractorProductName" + randomCollectionId + "test",
  }
  
};


ConfigData.prototype = basePage; // extend basePage...
module.exports = new ConfigData();
