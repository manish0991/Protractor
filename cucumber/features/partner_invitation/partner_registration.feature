@partner_invitation
Feature: Receiving partner invitation

	In order to access the shared products and collection from a user
	An partner
	Should be able to accept the user invitation 

	Background:
		Given I have an invitation link #Partner email invitation simulation
	
	   @NA
	Scenario: unregistered Venzee partner invitation
	
		Given that the invitation token is still valid
		When the partner clicks on the invitation link
		Then the partner should be redirected to the user registration page
		And the user will be added to the partner's partners list
		And the partner will be added to the user's partners list
	
	   @NA
	Scenario: registered and not logged Venzee partner invitation 
	
		Given that the partner is already registered on Venzee
		And the invitation token is still valid
		And the partner is not logged
		When the partner clicks on the invitation link 
		And the partner signs into Venzee
		Then the user will be added to the partner's partner list
		And the partner will be added to the user's partners list
	
	   @NA	
	Scenario: registered and logged Venzee partner invitation 
	
		Given that the partner is already registered on Venzee
		And the invitation token is still valid
		When the partner clicks on the invitation link 
		Then the user will be added to the partner's partner list
		And the partner will be added to the user's partners list
	
	   @NA
	Scenario: Invalid token (inviter removed invitee, inviter has cancelled his account, token expired)
	#root page = venzee.com
		
		When the partner clicks on the invitation link
		And the token is not valid
		Then the partner should be redirected to the root page 