@billing
Feature: Features related to the user's subscription

	Background:
	    Given a user is on the Venzee web site
		Given a user and a company are registered
		And user login to the application
		And a user is on the billing page
		
		
	#@all_test @smoke_test 
	Scenario: First time subscriber
			
		When selects a paid plan
			And enter the following info
  			|credit card number|
  			|CVC|
  			|credit card expiry month|
  			|credit card expiry year|
  			|CardHolder Name|
			And the payment has passed
		
		Then sees his subscribed plan
			And will get the premium services related to his subscription
		
		
	#@all_test
	Scenario: Update plan + new payment
	
		Given the user had already subscribed to a paid plan
		
		When a user selects a more expensive paid plan
			And selects a new payment method
			And enter the following info
				|credit card number|
				|CVC|
				|credit card expiry month|
				|credit card expiry year|
				|CardHolder Name|
			
		And the payment has passed
		
		Then sees his new subscribed plan
			# Manual Testing
			And the credit card will be charged
			And will get the premium services related to his upgraded subscription
	
	#@all_test @smoke_test 
	Scenario: Upgrade plan + payment method saved
	
		Given a user has at least one payment method saved
	
		When a user selects a more expensive paid plan
			And selects a payment method
			And the payment has passed
			
		Then sees his new subscribed plan
			# Manual Testing
			And the credit card will be charged
			And will get the premium services related to his upgraded subscription
			
	@all_test @smoke_test @edit
	Scenario: Cancel subscription
	
		Given the user had already subscribed to a paid plan
		
		When cancels his plans

		#Then sees his current plan
			# Manual Testing
			#And will get the premium services until the end of his billing cycle
		
	
	@all_test
	Scenario: Downgrade plan
	
		Given the user had already subscribed to an upgraded paid plan
		
		When selects a less expensive plan
			And selects a payment method
			And the payment has processed
		
		Then sees his subscribed plan
			# Manual Testing
			And won't get the upgraded services anymore
		
	
	@all_test
	Scenario: End of billing period
	
		Given a user has cancelled his plan
			# Manual Testing
			And the billing period is over

		# Manual Testing
		Then won't get the premium services anymore
		
	#@all_test @smoke_test 
	Scenario Outline: Successful promo code application
	
		Given the user selected a paid plan
		
		When the user enters promo code as <promo code>
		Then sees the total price gets a discount of <discount> 
		
		Examples:
		|promo code|discount|
		|1|5|

	
	@all_test
	Scenario: invalid promo code
	#figure out what is invalid (format? DB?)
		Given the user selected a paid plan
		
		When user enters an invalid promo code
		Then sees an error message saying that coupon code is invalid
		
	
	@all_test
	Scenario: expired promo code
		
		Given the user selected a paid plan
		
		When user enters an expired promo code
		Then sees an error message saying that coupon code is expired