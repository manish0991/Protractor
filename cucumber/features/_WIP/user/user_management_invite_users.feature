@user_mgmt
Feature: Invite Users

  As an admin I want to invite new members to my organization.
  
  Background:
  
    Given I am an Admin
    And I have chosen invite people to my organization
    
  Scenario: Successful invite - internal, new users
  
    Invite one or more members of same organization that are not registered on Venzee
  
    When <NumberOfInvites> valid email addresses are entered
    And Recipients are in my company #i.e. have same email domain
    And None of the Recipients are registered on Venzee
    And A <Role> is selected
    And A personal note is added saying: "Hop on to Venzee, it's amazing!"
    And 'Send' is selected
  
    Then An email is sent to each receipient via Intercom
    And Each email has a unique link and token
    And Each email has the personal note included
    And An alert appears indicating that the emails are sent
    And Each invite is tracked in Intercom with a tag of: Invited
    And Each invitee is listed in User Management with a pending status
    
#    Examples:
#      |Role|NumberOfInvites|
#      |Companies send me spreadsheets|1|
#      |I use spreadsheets to update the companies I do business with|2|
#      |Systems critical to my business aren’t connected|5|
#      |I export data to multiple channels|10|
#      |Not sure|30|
      
  Scenario: Successful invite - external, existing users
  
    Invite one or more members of external organization that are registered on Venzee
  
    When <NumberOfInvites> valid email addresses are entered
    And Recipients are not in my company #i.e. done have same email domain
    And All the Recipients are registered on Venzee
    And A <Role> is selected
    And A personal note is added saying: "Join the #nomorespreadsheets! bandwagon"
    And 'Send' is selected
  
    Then An email is sent to each receipient via Intercom
    And Each email has a unique link and token
    And Each email has the personal note included
    And An alert appears indicating that the emails are sent
    And Each invite is tracked in Intercom with a tag of: Invited
    And Each invitee is listed in User Management with a pending status
    
#    Examples:
#      |Role|NumberOfInvites|
#      |Companies send me spreadsheets|1|
#      |I use spreadsheets to update the companies I do business with|2|
#      |Systems critical to my business aren’t connected|5|
#      |I export data to multiple channels|10|
#      |Not sure|15|
  
  ############
  # Errors / Invalid Data
  
  Scenario: Some email addresses are formatted incorrectly
  
    When Some valid email addresses are entered
    And Some invalid email addresses are entered (i.e. not proper x@y.com format)
    And A role is selected
    And 'Send' is selected
  
    Then A message should appear saying "One or more email addresses entered is invalid"
    And No invitations are sent
  

