var basePage = require('./basePage.js');
var cd = require('./configData.js');

var teamManagementPage = function () {


  // Add Team Members
  var sideMenuAdd          = element.all(by.css(".fa-plus")).get(1);
  var inviteMembers  =  element(by.linkText('Invite Team Members'));
  
  
  var invitations = element(by.linkText('Invite Team Members to'));
  var email = element(by.xpath("//input[@type='email']"));
  
  var sendInviationBtn    = element.all(by.css(".vz-btn-process.ng-isolate-scope")).get(0);
  var addTeamMemberBtn        = element.all(by.css(".flush--top.btn.btn--large.btn--primary.btn--add")).get(0);
  var gridHover            = element.all(by.css(".grid-table__td-large")).get(0);
  var removeBtn            = element.all(by.css(".rm-link.ng-scope")).get(0);
  var takeoverText         = element.all(by.css(".vz-takeover__grand-heading.ng-scope>span")).get(0);  
  var deleteBtn            = element.all(by.css(".btn.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope")).get(0);
  var emailBox            = element.all(by.css(".tags"));
  
   // Settings
  var sideMenuSettings        = element(by.css(".fa-cog"));
  var addUsersItem2         = element.all(by.css('[ng-click="sidenav.addUser()"]')).get(2);

  this.inviteTeamMember = function() {

  sideMenuSettings.click(); 
  browser.driver.sleep(2000);
  addUsersItem2.click();
  //inviteMembers.click(); 
  emailBox.click();
  //expect(invitations.isPresent()).toBe(true);
  email.sendKeys(cd.partner.email+",");
  browser.driver.sleep(2000);
  sendInviationBtn.click();
  browser.driver.sleep(10000);
 
   };	

   
  this.deleteTeamMember = function() {

  //gridHover.click(); 
  removeBtn.click(); 
  expect(takeoverText.isPresent()).toBe(true);
  deleteBtn.click();
  expect(addTeamMemberBtn.isPresent()).toBe(true);
   };	 
  
   
   

};

teamManagementPage.prototype = basePage; // extend basePage...
module.exports = new teamManagementPage();