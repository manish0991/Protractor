@user_mgmt
Feature: Revoke Invitation

  As an Admin, I want to revoke invitations to pending members.
  
  Background:
  
    Given I am an Admin
    And I have chosen to view users in my organization
    
  Scenario: Invitation Revoked
  
    When There is at least one member with a pending invite
    And 'Revoke Invitation' is selected for a member
  
    Then A confirmation message is displayed saying: "Revoke invitation to this member?"
    And Upon confirmation, the existing invitation token is killed
    And The pending member is removed from the organization
      
   Scenario: Acting on a revoked invitation
  
    When There is at least one member with a pending invite
    And The invitation has been revoked
    And The invitee accesses the emailed link
    
    Then The invitee is taken to a TBD page #404-type page
    
  
