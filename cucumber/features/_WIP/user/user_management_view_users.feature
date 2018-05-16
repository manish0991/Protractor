@user_mgmt
Feature: View Users

  As an Admin, I want to display the members of my organization.
  
  Background:
  
    Given I am an admin
    And I have chosen to view users in my organization
    
  Scenario: Only member is Admin
  
    No members added to org yet
  
    When Admin is only member of the organization

    Then The user list has one entry
    And 'Admin' is listed as role
    And First and Last name are listed
    And Position is listed
      
  Scenario: External members joined the organization
  
    When At least 5 External members have been added to the organization
    And At least 10 Internal members are part of the organization
    
    Then The user list has all the internal and external members
    And The list is sorted in ascending order by first name, last name, company
    And 'Admin' is listed as role for the Admin member(s)
    And First and Last name are listed for all members
    And Company is listed for external members
    And Position is listed for all members
    And Pagination occurs after the first 10 members in the list
    
  Scenario: Members are in a group
  
    When External members have been added to the organization
    And Internal members are part of the organization
    And The list is sorted in ascending order by first name, last name, company
    And External members belong to a group name 'External'
    And Internal members belong to a group named 'Internal'
    And The Admin belongs to both 'External' and 'Internal'
    
    Then The user list has all the internal and external members
    And The list is sorted in ascending order by first name, last name, company
    And 'Admin' is listed as role for the Admin member(s)
    And First and Last name are listed for all members
    And Company is listed for external members
    And Position is listed for all members
    And Group name 'External' is listed for external members
    And Group name 'Internal' is listed for internal members
    And Group names 'External' and 'Internal' is listed for both members
    
  Scenario: Pending invitations
  
    When Admin is the only member
    And Invites have been sent out but not responded to

    Then The user list contains Admin and invitees
    And The list is sorted in ascending order by first name, last name, company
    And 'Admin' is listed as role for the Admin
    And First and Last name are listed for all members
    And Company is listed for any external members
    And Position is listed for all members
    And The list displays the invitation date for pending members
    And Pagination occurs if more than 10 members exist
