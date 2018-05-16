@partner_invitation
Feature: Invite Partner

	#In order to share products and collections with my partners
	#A user 
	#Should be able to add one or more partners

	Background:
		Given I have signed into Venzee
		And a company is registered
		

	@ready @partner_list_display
	Scenario: List of partners
	#display all relationships
	#settings associated to partners = name, email, company logo, groups
	
		Given that the user have <partners> partners
		When the user  access the partners page
		Then the user should see a list of <partners> partners
		And all the settings associated to partners 
	
	   @NA
	Scenario: Invite a new partner
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781287/preview

	
		Given that the user has entered valid email address
		And he selected a suggested message
		When the user sends the invitations
		Then the user should be redirected to the partners page
		And <email> email will be sent to the partners
		
		Then I visit partners page
		#Given that the user has entered <email> valid email address
		And I add a partner
		Then User is available in the list
		Then I logout from the application
		And I redirect to yopmail
		And Enter Invited Email
		And I Open Invitation mail
		Then I join the venzee
		Then I switch to current tab
		#And he selected a suggested message
		#When the user sends the invitations
		#Then the user should be redirected to the partners page
		#And <email> email will be sent to the partners
		
	   @NA
	Scenario: Partner already invited and accepted the request
	
		Given that the user has entered an email address from a partner he already invited
		And the partner accepted the invitation
		When the user sends the invitation
		Then the user should be redirected to the partners page
		And no new invitation will be sent
		And the user gets notified that the partner is already in the user's partner list
	
	   @NA
	Scenario: Partner already invited and the request is pending
	
		Given that the user has entered an email address from a partner he already invited
		And the partner did not accept the invitation
		When the user sends the invitation
		Then the user should be redirected to the partners page
		And an new email will be sent to the partner
		And the invitation timer for this partner will be reset 
		
	   @NA
	Scenario: Partner accepted the invitation 
	#based on https://projects.invisionapp.com/share/3R2GSL9ZN#/screens
	
		Given that the user has invited an partner
		And the partner has accepted the invitation
		And the user didn't signed into Venzee since the partner accepted the invitation
		When the user access the partners page
		Then the user gets notified about the accepted invitation
		And the user can see the personal information of his partner
	
	   @NA
	Scenario: Remove an unregistered partner 
	
		Given that the user has invited an partner
		And the partner did not register 
		When the user removes the partner
		Then the partner should be removed the user's partner list
		And the user should be removed from the partner's partner list
		And the partner should should not appear in the user's groups he was added
		And the user's collection is not shared with the removed partner anymore
	
	   @NA
	Scenario: Remove a registered partner 
	
		Given that the user has invited an partner
		And the partner registered
		When the user removes the partner
		Then the partner should be removed the user's partner list
		And the user should be removed from the partner's partner list
		And the partner should should not appear in the user's groups he was added
		And the user's collection is not shared with the removed partner anymore
		
