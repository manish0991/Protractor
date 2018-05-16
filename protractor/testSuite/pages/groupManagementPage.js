var basePage = require('./basePage.js');
var cd = require('./configData.js');

var groupManagementPage = function () {


  // Add Group
  var sideMenuAdd          = element.all(by.css(".fa-plus")).get(1);
  var inviteVendors  =  element(by.linkText('Add Retailers'));
  var invitations = element(by.id('invitations'));
  var email = element(by.xpath("//input[@type='email']"));
  var createGroup          = element(by.xpath("//button[text()='Create Group']"));
  var takeoverText         = element.all(by.css(".vz-takeover__grand-heading.push-double--bottom"));
  var groupName            = element.all(by.css(".form-field__input")).get(0);
  var groupDescription     = element.all(by.css(".form-field__input")).get(1);
  var createGroupBtn       = element.all(by.css(".vz-btn-process--nospinner")).get(0);
  var retailerPageText     = element.all(by.css(".text--small.soft--right")).get(0);
  var groupBtn             = element(by.xpath("//div[@class='partners__groups']/ul/li[3]"));
  var deleteGroupIcon      = element(by.xpath("//span[@class='fa fa-trash']"));  
  var deleteBtn            = element.all(by.css(".btn.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope")).get(0);
  var addProductBtn        = element(by.xpath("//div[@class='text--right push--bottom']/button[2]"));
  var removeGroupText      = element.all(by.css(".text--small.text--center")).get(0);
  var removeGroupBtn       = element(by.xpath("//div[@class='text--center']/button[2]"));
  var editGroupBtn         = element.all(by.css(".fa.fa-edit")).get(1);
  var editGroupTextarea    = element.all(by.css(".form-field__input")).get(0);
  var submitGroupBtn       = element.all(by.css(".edit-in-place__input__submit")).get(0);
  var sideMenuPartners      = element(by.xpath("//div[@class='layout-user--sidebar__menu']/div[4]"));
  var partnersItem          = element(by.xpath("//div[@class='layout-user--sidebar__menu']/div[4]/ul/li[1]"));
  var dashboardIcon         = element(by.css(".layout-user--sidebar__logo"));


  this.addGroup = function() {
	  
	  

  //email.sendKeys(cd.partner.email+",");
  
  dashboardIcon.click();
  browser.driver.sleep(1000);
  sideMenuPartners.click();
  browser.driver.sleep(1000);
  partnersItem.click();
  browser.driver.sleep(2000);
  expect(createGroup.isPresent()).toBe(true);
  createGroup.click();
  expect(takeoverText.isPresent()).toBe(true);
  groupName.sendKeys('Automation Group');
  groupDescription.sendKeys('Automation Group Description');
  createGroupBtn.click();
  expect(retailerPageText.isPresent()).toBe(true);
   };	

   
  this.renameGroup = function() {

  groupBtn.click (); 
  //browser.refresh();
  browser.driver.sleep(2000);
  editGroupBtn.click(); 
  editGroupTextarea.clear();
  editGroupTextarea.sendKeys('Updated Automation Group');
  //expect(takeoverText.isPresent()).toBe(true);
  submitGroupBtn.click();
  browser.driver.sleep(2000);
  groupBtn.click (); 
  
   };	 
   
   this.deleteGroup = function() {

  browser.driver.sleep(1000);
  deleteGroupIcon.click(); 
  removeGroupBtn.click();
  //browser.driver.sleep(2000);
  expect(groupBtn.isPresent()).toBe(true);
  
  
   };	 
   
   
   

};

groupManagementPage.prototype = basePage; // extend basePage...
module.exports = new groupManagementPage();