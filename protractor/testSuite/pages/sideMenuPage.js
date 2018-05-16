var basePage = require('./basePage.js');
var cd = require('./configData.js');

var SideMenuPage = function () {

  //the locators declaration for the current page
  var dashboardIcon = element(by.css(".layout-user--sidebar__logo"));

  // Add
  var sideMenuAdd          = element.all(by.css(".fa-plus")).get(1);

  // Add --> Data
  var addDataItem          = element(by.xpath("//a[text()='Import']"));
  var addProductPageTitle  = element(by.xpath("//h2[text()='Import from']"));
  var closeTakeover  = element(by.xpath("//div[@class='vz-takeover-purple__container ng-scope']/a"));
  
  // Add --> Parners
  var addPartnersItem      = element(by.xpath("//a[text()='Add Retailers']"));
  var partnerPageTitle     = element(by.css(".vz-takeover__grand-heading.push-double--bottom.ng-scope"));
  var partnerPageCancel    = element.all(by.css('.btn.btn--large.push--bottom-half--right.btn--rm-hover')).get(0);

  // Add --> Users
  var addUsersItem         = element.all(by.css('[ng-click="sidenav.addUser()"]')).get(0);
  var addUserPageTitle     = element(by.xpath("//h1[contains(text(), 'Invite Team Members to')]"));
  var userPageCancel       = element.all(by.css('[ng-click="inviteUsers.close()"]')).get(1);

  // Data
  var sideMenuData         = element.all(by.css(".fa-upload")).get(0);
  var dataItem             = element(by.linkText('Lists'));
  var productPageTitle     = element(by.xpath("//h2[text()=' Lists']"));
  
  // Connectivity
  var sideMenuConnectivity  = element.all(by.css(".fa-download")).get(0);
  var connectivityItem      = element(by.linkText('Lists'));
  var connectivityPageTitle = element(by.xpath("//a[contains(@href,'/integrations/')]"));

  // Partners
  var sideMenuPartners      = element(by.xpath("//div[@class='layout-user--sidebar__menu']/div[4]"));
  var partnersItem          = element(by.xpath("//div[@class='layout-user--sidebar__menu']/div[4]/ul/li[1]"));
  var addPartnersItem2      = element.all(by.linkText('Add Partners')).get(1);
  var partnersPageTitle     = element(by.xpath("//div[@class='ng-scope']/span[1]"));  // Check the button cause there's no title

  // MAP
  var sideMenuMAP           = element.all(by.css(".fa-exclamation")).get(0);
  var MAPItem               = element(by.xpath("//a[text()='MAP Violations']"));
  //var MAPIntercomChat       = element(by.css(".intercom-sheet-header"));

  // eComm
  var sideMenuEComm         = element(by.css(".fa-file-text"));
  var closeIntercom         = element(by.css(".intercom-sheet-header-close-button"));
  // To be completed... there no code yet !


  // Settings
  var sideMenuSettings        = element(by.css(".fa-cog"));

  // Settings --> Company Settings
  var companySettingsItem   = element(by.linkText('Company Settings'));
  //var companySettingsItem   = element(by.xpath("//a[contains(@href,'/profile')]"));
  var companySettingsPage   = element(by.xpath("//h4[contains(text(),'Company Profile')]"));
  //var companySettingsPage   = element(by.xpath("//h2[contains(text(),'Company Settings')]"));

  // Settings --> Billing
  var billingItem           = element(by.css('[ng-click="sidenav.goBilling()"]'));
  //var billingPageTitle      = element(by.xpath("header[class='billing__plan__header billing__plan__header--basic ng-binding ng-scope']"));
  var billingPageTitle           = element(by.css('[ng-click="sidenav.goBilling()"]'));

  // Settings --> Add User
  var addUsersItem2         = element.all(by.css('[ng-click="sidenav.addUser()"]')).get(2);

  // Profile
  var sideMenuProfile         = element(by.css('.layout-user--sidebar__profile-image'));
  var userProfileItem         = element(by.css('.profile--text'));
  var userProfilePage         = element(by.xpath("//h4[contains(text(),'Profile')]"));
 
  this.checkAddLink = function(){

    // Check Add -> Add Data
    sideMenuAdd.click();
    addDataItem.click();
    expect(addProductPageTitle.isPresent()).toBe(true);
	closeTakeover.click();
    dashboardIcon.click();

    // Check Add -> Add Partners
    sideMenuAdd.click();
    addPartnersItem.click();
    expect(partnerPageTitle.isPresent()).toBe(true);
    partnerPageCancel.click();
    browser.driver.sleep(1000);  // Need a sleep to wait for the takeover to close
    dashboardIcon.click();
    
    // Check Add -> Add User
    sideMenuAdd.click();
    addUsersItem.click();
    expect(addUserPageTitle.isPresent()).toBe(true);
    userPageCancel.click();
    browser.driver.sleep(1000);  // Need a sleep to wait for the takeover to close
    dashboardIcon.click();

  }


  this.checkDataLink = function(){
    sideMenuData.click();
	browser.driver.sleep(1000);
    dataItem.click();
    expect(productPageTitle.isPresent()).toBe(true);
    dashboardIcon.click();
  }


  this.checkConnectivityLink = function(){
    sideMenuConnectivity.click();
    connectivityItem.click();
    expect(connectivityPageTitle.isPresent()).toBe(true);
    dashboardIcon.click();
  }


  this.checkPartnersLink = function(){
    sideMenuPartners.click();
	browser.driver.sleep(1000);
    partnersItem.click();
    expect(partnersPageTitle.isPresent()).toBe(true);
    dashboardIcon.click();
  }


  this.checkMAPLink = function(){
    sideMenuMAP.click();
	browser.driver.sleep(1000);
    MAPItem.click();
    //expect(MAPIntercomChat.isPresent()).toBe(true);
    //closeIntercom.click();
    dashboardIcon.click();

  }


  this.checkECommLink = function(){
    //sideMenuEComm.click();
  }


  this.checkSettingsLink = function(){
    
    // Settings --> Company Settings
    sideMenuSettings.click();
	browser.driver.sleep(1000);
    companySettingsItem.click();
    expect(companySettingsPage.isPresent()).toBe(true);
    dashboardIcon.click();

    // Settings --> Billing
    sideMenuSettings.click();
    billingItem.click();
    //expect(billingPageTitle.isPresent()).toBe(true);
    dashboardIcon.click();

    // Settings --> Add Users
    sideMenuSettings.click();
    addUsersItem2.click();
    expect(addUserPageTitle.isPresent()).toBe(true);
    userPageCancel.click();
    browser.driver.sleep(1000);  // Need a sleep to wait for the takeover to close
    dashboardIcon.click();

  }


  this.checkProfileLink = function(){
    sideMenuProfile.click();
    userProfileItem.click();
	browser.driver.sleep(1000);
    expect(userProfilePage.isPresent()).toBe(true);
  }
 
};

SideMenuPage.prototype = basePage; // extend basePage...
module.exports = new SideMenuPage();
