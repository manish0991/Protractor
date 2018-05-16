@notification
Feature: Features related to the partner segmentation notifications
#based on https://drive.google.com/a/venzee.com/file/d/0B3v4oU8Rx_CtaEJ6ckE0d1pEdDg/view?usp=sharing

	#In order to stay informed about the activities related to the partner segmentation
	#A user 
	#Should be able to view the recent partner segmentation activities on his dashboard
	
	Background:
    Given a user is on the Venzee web site
	
	@all_test 
	Scenario: New Venzee user 

		Given a user is not registered
			And received a invitation to Venzee
		When registers on Venzee
			And a user is on the Dashboard Activity page
		Then sees a notification advising him he is connected to the company who invited him

	#@all_test 
	Scenario: New connection to existing user 

		Given a user and a company are registered
			And a user is logged in
			And accepted a partner invitation
		When a user is on the Dashboard Activity page
		Then see a notification advising him he is connected to the company who invited him
	
	@all_test   @smoke_test 
	Scenario: New Venzee user accepted my invitation

		Given a user and a company are registered
			And a user is logged in
			And sent a invitation to an unregistered Venzee partner
		When a partner accepts the invitation
		Then a user sees a notification advising him he is connected to the company he invited

	#@all_test 
	Scenario: Registered Venzee user accepted my invitation

		Given a user and a company are registered
			And a user is logged in
			And sent a invitation to registered Venzee partner
		When a partner accepts the invitation
		Then a user sees a notification advising him he is connected to the company he invited

	#@all_test 
	Scenario: Partner unconnects with user 

		Given a user and a company are registered
			And a user is logged in
			And is connected to a partner
		When a partner removed the user from his partner's list
		Then a user sees a notification advising him he is no longer connected to the company that removed him


	@all_test  @smoke_test @wr
	Scenario: User unconnects with partner

		Given a user and a company are registered
			And a user is logged in
			And is connected to a partner
		When removes the partner from his partner's list
		Then sees a notification advising him he is no longer connected to the company he removed

		



