@user_mgmt
Feature: Change User Roles

  As an Admin, I want to change the roles of a members in my organization
  
  Background:
  
    Given I am an Admin
    And I have chosen to view users in my organization
    
  Scenario: Single Admin - change role to regular member
  
    When There is at least one regular member in the organization
    And There is only one Admin in the organization
    And The Admin is selected
  
    Then The option to change roles is not available #disabled or not visible
      
   Scenario: Multi Admins - change role to regular member
  
    When There is at least one regular member in the organization
    And There is at leat two Admins in the organization
    And All members are selected
  
    Then The option to change roles and 'assign as regular member' is not available #disabled or not visible
    # all selected items can only have one change applied, and each org needs at least 1 Admin 
    
  Scenario: Change Regular Members to Admin
  
    When There is at least one regular member in the organization
    And All members are selected
    And 'Change role - Assign as Admin' is selected
    
    Then The selected members are changed to Admins
    And An alert appears saying: "<x> users have be assigned as 'Admin'"
    
   Scenario: Change Admin to Regular Member
  
    When There are at least two Admins in the organization
    And One Admin is selected
    And 'Change role - Assign as Regular Member' is selected
    
    Then The selected Admin is changed to a Regular member
    And An alert appears saying: "1 user has been assigned as 'Regular Member'"
    
  Scenario: Member belongs to two organizations - role changed in one
  
    When A member belongs to the current organization as Regular Member
    And The same member belongs to another organization as Regular Member
    And 'Change role - Assign as admin' is selected
    
    Then The selected member is changed to Admin
    And An alert appears saying: "1 user has been assigned as 'Admin'"
    And The user remains a Regular Member in the other organization
  
