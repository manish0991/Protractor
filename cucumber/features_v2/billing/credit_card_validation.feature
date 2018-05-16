@billing
Feature: Features related to credit card validation

	Background:
		Given a user and a company are registered
			And a user is logged in
			And is on the billing page
			And is editing his payment method information

	#@all_test
	Scenario: Invalid first name format
	
		When a user enters characters other than alphabetic in the first name field

		Then sees an error advising him of the correct name format
	
	#@all_test
	Scenario: Invalid last name format
	
		When a user enters characters other than alphabetic in the last name field
	
		Then sees an error advising him of the correct name format
		
	#@all_test
	Scenario: Invalid CVC format
	
		When a user enters characters other than digits in the CVC field

		Then sees an error advising him of the correct credit card number format
		
	#@all_test
	Scenario: CVC is too short
	
		When a enters a CVC number that is shorter than 3 digits long

		Then sees an error advising him of the correct number of digits for the CVC
	
	#@all_test
	Scenario: CVC is too long
	
		When a user enters a CVC number that is longer than 3 digits long

		Then sees an error advising him of the correct number of digits for the CVC
		
	#@all_test
	Scenario: Invalid credit card format
	
		When a user enters characters other than digits in the credit card number field

		Then sees an error advising him of the correct credit card number format
		
	#@all_test
	Scenario: Credit Card is too short
	
		When a user enters a card number that is shorter than 16 digits long

		Then sees an error advising him of the correct number of digits for the credit card
	
	#@all_test
	Scenario: Credit Card is too long
	
		When a user enters a card number that is longer than 16 digits long

		Then sees an error advising him of the correct number of digits for the credit card
		
	#@all_test
	Scenario: Invalid date
	
		When a user enters an expiration date that will occur before the next payment

		Then sees an error advising him that the expiring date is too soon
	
	#@all_test
	Scenario: Successful payment method edition
	#credit card validation done by stripe
	
		Given a user had already subscribed to a paid plan
			And has a payment method #meaning: user can't add a payment method without subscribing to a paid plan 
		
		When selects to edit a payment method
			And enters the following info
				|credit card number         |
				|CVC                        |
				|credit card's expiry month |
				|credit card's expiry year  |
				|first name                 |
				|last name                  |
			
		And Stripe validates the credit card information
		
		Then the payment method must be saved
			And sees the updated payment method on the billing page
	
	#@all_test @tsmoke_test
	Scenario: Invalid credit card
	#credit card validation done by stripe
	
		Given a user had already subscribed to a paid plan
			And has a payment method #meaning: user can't add a payment method without subscribing to a paid plan 
		
		When elects to edit a payment method
			And enters the following info
				|credit card number         |
				|CVC                        |
				|credit card's expiry month |
				|credit card's expiry year  |
				|first name                 |
				|last name                  |
			
		And stripe does not validate the payment information
		
		Then the services remain as-is
			And the payment information won't be save
 
   
   