# coding: utf-8
@nav_takeover
Feature: Verify that all links which located on nav bar in dashboard are working

  Background:
    Given I am on the Venzee web site
    And a user is registered
    And a company is registered
    #And the user is logged in

  #@ready
  Scenario: Verify that all links are working, and the Nav takeover is showing/hidding
    When I click the nav takeover
    Then Nav should be displayed
    Then verify that 'Dashboard' link works
    #Then verify that 'MAP Monitoring' link works
    #Then verify that 'Partners' link works
    Then verify that 'Invite Partners' link works
    Then verify that 'Products' link works
    #Then verify that 'Add Products' link works
    #Then verify that 'Export Ready Products' link works
    #Then verify that 'Integrations' link works
    Then verify that 'Profile' link works
    Then verify that 'Settings' link works
    #Then verify that 'Users' link works
    When I click the nav takeover
    Then Nav bar shouldnt be displayed
    When I click the nav takeover
    Then I log out
    Then I should be redirected to the main page
    Then I shouldnt be logged in