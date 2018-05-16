@manage_org
Feature: Create Organization

  User's that register outside of an invite create their own organization and become the admin by default.
  
  Background:
  
    Given I am registering independent of an invite
    
  Scenario: Create organization
  
    When I complete registration 
  
    Then An organization is created
    And the organization's name is the company name used at registration
    And I (the registered user) am the Admin of the organization
      