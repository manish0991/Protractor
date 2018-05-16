@user_mgmt
Feature: Resend Invitation

  As an Admin, I want to resend invitations to pending members.
  
  Background:
  
    Given I am an Admin
    And I have chosen to view users in my organization
    
  Scenario: Invitation Resent
  
    When There is at least one member with a pending invite
    And 'Resend Invitation' is selected for a member
  
    Then A confirmation message is displayed saying: "Resend invitation to this member?"
    And Upon confirmation, the existing invitation token is killed
    And A new token is generated
    And A new email with new link/token is sent to the address on record
    And The member remains in pending status
    And The new invite date is displayed on user/member list
      
   Scenario: Acting on a revoked invitation
  
    When There is at least one member with a pending invite
    And The invitation has been resent
    And The invitee accesses the link in the original email
    
    Then The invitee is taken to a TBD page #404-type page
    
  
