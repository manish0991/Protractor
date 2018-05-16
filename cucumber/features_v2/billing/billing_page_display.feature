@billing
Feature: Features related to the display of the billing page

	Background:
		Given a user is on the Venzee web site
		And a user and a company are registered
		And user login to the application
		

	@all_test @smoke_test 
	Scenario: current subscription
	
		Given a user is on the billing page
		Then sees the plan he is currently subscribed
		
	@all_test
	Scenario: terms of payment

		Given user is on the Terms of Payment page
		Then sees the Terms of Payment
		
	@all_test @smoke_test 
	Scenario: billing history

		Given user had subscribed to a paid plan
			And is on the Billing history page
		Then sees the billing history
		#list of each charges, refund or changes in the user's account
		
