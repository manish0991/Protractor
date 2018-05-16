@billing
Feature: Features related to the billing notifications

	Background:
		Given a user and a company are registered
		And has an active paid plan
	
	#@all_test
	Scenario: Credit card on file is expiring
	
		Given the user's credit card will expire in less than 30 days 
			And a user is logged in
		Then sees a credit card's expiration notification
			And must be given the opportunity to edit his payment method
		
	#@manual_testing
	Scenario: Annual subscription is expiring 
	
		Given the user's annual subscription will expire within 60 to 90 days
			And a user is logged in
		Then sees a subscription renewal notification
	
	#@manual_testing
	Scenario: Successful reoccurring payments
	
		Given a user signed up for the recurring payment
			And a user is logged in
			And the payment has passed
			
		Then will get the premium services related to his subscription
			And sees a renewed subscription notification
		
	#@manual_testing 
	Scenario: Failed reoccurring payments (less than 14 days)
		
		Given a user signed up for the recurring payment
			And a user is logged in
			And the payment has failed
			And the expiration date was less than 14 days ago 

		Then won't get the premium services anymore
			And the premium services configured must not be deleted
			And receives a expiration notification
	
	#@manual_testing
	Scenario: Failed reoccurring payments (more than 14 days)
	
		Given a user didn't sign up for the recurring payment
			And the payment has failed
			And the expiration date was more than 14 days ago
		When logs in Venzee
		Then won't get the premium services anymore
			And the premium services configured must be deleted
			And receives a deletion notification 
	
		
	