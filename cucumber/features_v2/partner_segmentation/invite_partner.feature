@partner_management @invite_partner
Feature: Happy Path Invite Partner

  Background:
    Given a user is on the Venzee web site

###################################################################

  @all_test @smoke_test 
  Scenario: Unregistered partner registration

    Given a partner received an invitation
      And the invitation token is still valid
      And is not register on Venzee
    When clicks on the invitation link
      And completes the registration process
      
    Then sees the Dashboard screen
    #depends of the survey's result
      And the user will be added to the partner's partners list
      And the partner will be added to the user's partners list

	

###################################################################

  @all_test  @smoke_test 
  Scenario: Invite Partner

  	 Given a user and a company are registered
      And a user is logged in
  	And is on the invite partner page
  	When enters a valid email address
    	And selects a suggested message
    	And sends the invitations
    	And gets redirect to the partners page
    	And sees the pending invitation in the partners list
	Then an email will be sent to the partners

###################################################################

  @all_test @smoke_test 
  Scenario: Access shared collection
  
	  Given a user and a company are registered
     And a user is logged in
     And has at least one partner that shared a collection
     And is on the product records page
   When opens the collections list
    And selects a shared collection
   Then sees the shared collection

  @all_test @smoke_test 
  Scenario: Access shared Export Ready collection
  
    Given a user and a company are registered
     And a user is logged in
     And has at least one partner that shared an Export Ready collection
     And is on the on the Export Ready Records page page
   When opens the Export Ready collections list
    And selects a shared Export Ready collection
   Then sees the shared Export Ready collection