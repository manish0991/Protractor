@manage_org
Feature: Update Organization

  As an admin I want to update my company information.
  
  Background:
  
    Given I am an Admin
    
  Scenario: Update organization
  
    When I change my company name
    And The company name is not already registered
    And I change my company logo
    And 'udpate' is selected
  
    Then My organization details are updated
    
  Scenario: Update organization - registered company
  
    When I change my company name
    And The company name is already registered
    And 'udpate' is selected
  
    Then I should receive the following error message: "That company name has already been registered."
