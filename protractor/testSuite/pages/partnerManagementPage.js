var basePage = require('./basePage.js');
var cd = require('./configData.js');
var side = require('./sideMenuPage.js');
var path = require('path');
var registrationPage = require('../pages/registrationPage.js');

var PartnerManagementPage = function () {


  // Add Partners
  var sideMenuAdd          = element.all(by.css(".fa-plus")).get(1);
  var inviteVendors  =  element(by.linkText('Add Retailers'));
  var invitations = element(by.id('invitations'));
  var email = element(by.xpath("//input[@type='email']"));
  var selectGroupButton    = element.all(by.css(".radio-list__circle")).get(0);
  var groupName            = element(by.xpath("//input[contains(@class, 'form-field__input') and (@name='groupName')]"));
  var shareMyProductBtn    = element.all(by.css(".btn.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope")).get(0);
  var addPartnerBtn        = element.all(by.css(".flush--top")).get(0);
  var gridHover            = element.all(by.css(".grid-table__td-large")).get(0);
  var removeBtn            = element.all(by.css(".rm-link")).get(0);
  var takeoverText         = element.all(by.css(".vz-takeover__grand-heading.ng-scope>span")).get(0);  
  var deleteBtn            = element.all(by.css(".btn.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope")).get(0);
  var groupBtn             = element.all(by.css(".groups-dropdown__btn.btn.btn--large")).get(0);
  var manageGroupBtn       = element.all(by.css(".flush--top.text--center")).get(0);
  var removeGroupCheckbox  = element.all(by.css(".vz-checkbox__input.ng-pristine.ng-untouched.ng-valid.ng-valid-required")).get(0);
  var removeGroupBtn       = element.all(by.css(".groups-dropdown__btn.btn.btn--large")).get(1);
  var groupTakeoverText    = element.all(by.css(".vz-takeover__grand-heading.ng-scope>span")).get(0);
  var deleteGroupBtn       = element.all(by.css(".btn.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope")).get(0);
  var addGroup             = element.all(by.css(".groups-dropdown__btn.btn.btn--primary.btn--add.btn--large")).get(0);
  var retailers            = element.all(by.css(".fa.fa-users")).get(1);
  
  


  this.addPartner = function() {

  sideMenuAdd.click(); // Expand + menu aty dashboard
  inviteVendors.click(); // Click on invite Vendors link

  expect(invitations.isPresent()).toBe(true);
  
  email.sendKeys(cd.partner.email+",");
  browser.driver.sleep(2000);
  //email.sendKeys("testing@yopmail.com"+",");

    // Need a sleep to wait for the takeover to close
  selectGroupButton.click();
  groupName.click();
  groupName.sendKeys(cd.partner.group);
  shareMyProductBtn.click();
  expect(addPartnerBtn.isPresent()).toBe(true);
   };	

   
  this.deleteRetailer = function() {

  gridHover.click(); 
  removeBtn.click(); 
  expect(takeoverText.isPresent()).toBe(true);
  deleteBtn.click();
  expect(addPartnerBtn.isPresent()).toBe(true);
   };	 
   
   this.deleteGroup = function() {
	   
  groupBtn.click ();
  expect(manageGroupBtn.isPresent()).toBe(true);
  manageGroupBtn.click(); 
  removeGroupCheckbox.click(); 
  browser.driver.sleep(2000);
  removeGroupBtn.click();
  expect(groupTakeoverText.isPresent()).toBe(true);
  deleteGroupBtn.click();
  expect(addGroup.isPresent()).toBe(true);
  retailers.click();
  
   };	 
   
   
   

};

PartnerManagementPage.prototype = basePage; // extend basePage...
module.exports = new PartnerManagementPage();