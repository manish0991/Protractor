@user_management @invite_user
Feature: Invite User

  Background:
    Given a user is on the Venzee web site

###################################################################

  @all_test @smoke_test 
  Scenario: Invite a non-Venzee user
     Given a user and a company are registered
      And a user is logged in
    Then a user received an invitation
      And the user invitation token is still valid
      And is not register on Venzee
    When clicks on the invitation link
      And user completes the registration process
      
    #Then sees the Menu Nav page
      And the user will be added to the company users list
      And sees the collection created by users that belong to the same company

###################################################################


  #@all_test @smoke_test
  Scenario: Invite a Venzee user

    Given a user received an invitation
      And the invitation token is still valid
      And is register on Venzee
    When clicks on the invitation link
      And login to Venzee
      
    Then sees the Dashboard overview page
      And the user will be added to the company users list
      And sees the collection created by users that belong to the same company

###################################################################


  #@all_test  @smoke_test 
  Scenario: Validate the invitation of a user

  	 Given a user and a company are registered
      And a user is logged in
  	And is on the invite user page
  	When user enters a valid email address
    	And sends the user invitations
    	#And gets redirect to the users page
    	And sees the pending invitation in the users list
	Then an email will be sent to the users

  ###################################################################

  #@all_test  
  Scenario: Invite a user that is already part of the company

     Given a user and a company are registered
      And already invited another user
      And a user is logged in
    And is on the invite user page
    When enters a valid email address from a user that already belong to the company
      And sends the invitations
      And gets redirect to the users page
      And sees user in the users list
  Then the invite is ignored

###################################################################

  #@all_test @smoke_test 
  Scenario: Remove an existing user from the company

     Given a user and a company are registered
	  And a user is logged in
      And is admin from the company
      And already invited another user
      And is on the users page
    When removes a user
    #Then the user name is no longer displayed in the user list

###################################################################

  @all_test  
  Scenario: Grant admin permission

     Given a user and a company are registered
      And is admin from the company
      And is on the users page
    When selects a user
      And grants him the admin persmission
  Then a purple ribbon will be displayed beside the selected user's name
