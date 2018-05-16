@manage_org
Feature: Delete Organization

  As an admin I want to delete my organization.
  
  Background:
  
    Given I am an Admin
    
  Scenario: Delete organization
  
    When I am in Manage Registration
    And I delete my organization
  
    Then A confirmation message appears saying: "Deleting your organization cannot be reversed.  Do you want to continue?"
    And After confirmation the organization is removed from the partner list of other organizations
    But the organization's data is available to exist partners 
    And The user is logged out and returned to Venzee's home page
    And The user can no longer log into Venzee
