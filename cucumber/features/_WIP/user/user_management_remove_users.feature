@user_mgmt
Feature: Remove Users

  As an Admin, I want to remove members from my organization.
  
  Background:
  
    Given I am an Admin
    And I have chosen to view users in my organization
    
  Scenario: Only member is Admin
  
    No members added to org yet
  
    When Admin is only member of the organization
  
    Then The option to remove user is not available #disabled or not visible
      
  Scenario: Member belongs to multiple organization
  
    When A member belongs to at least 2 organizations
    And The member is not an Admin
    And The 'Remove' action is taken
    
    Then A confirmation message appears saying: "Remove this user from the organization?"
    And When confirmed, the user is removed from the current organization
    But The user remains a member in the other organization(s)
    
  Scenario: Member belongs to one organization
  
    When A member belongs to 1 organization
    And The member is not an Admin
    And The 'Remove' action is taken
    
    Then A confirmation message appears saying: "Remove this user from the organization?"
    And When confirmed, the user is removed from the current organization
    And The user is removed from Venzee
  
  Scenario: Member belongs to multiple groups
  
    When A member belongs to at least 2 groups in an organization
    And The member is not an Admin
    And The 'Remove' action is taken
    
    Then A confirmation message appears saying: "Remove this user from the organization?"
    And When confirmed, the user is removed from the current organization
    And The member is removed from all groups to which it belonged
    
  Scenario: Multiple members removed
  
    When At least two members belong to only one organization
    And The members are not Admins
    And The 'Remove' action is taken
    
    Then A confirmation message appears saying: "Remove these <#> users from the organization?"
    And When confirmed, the users are removed from the current organization
    And The users are removed from Venzee
  
