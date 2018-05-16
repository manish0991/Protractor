@notification
Feature: Features related to the products changes notifications
#based on https://drive.google.com/a/venzee.com/file/d/0B3v4oU8Rx_CtaEJ6ckE0d1pEdDg/view?usp=sharing

	#In order to stay informed about activities related to the products changes
	#A user 
	#Should be able to view the products changes activity on his dashboard

	Background:
		Given a user and a company are registered
     		And a user is logged in
	
	#@all_test 	@smoke_test
    Scenario: A partner added records to a collection

     	Given a partner shared a collection with a user 
     		And a partner added product records to the collection
     	When a user is on the Dashboard Activity page
		Then sees a notification advising him a company added records to the collection

	#@all_test 
	Scenario: A partner updated records to a collection

     	Given a partner shared a collection with a user 
     		And a partner updated product records to the collection
     	When a user is on the Dashboard Activity page
		Then sees a notification advising him a company updated records to the collection

	#@all_test @smoke_test 	
	Scenario: A user added records to a collection

     	Given a user created a group 
			And added partners to the group
			And created a collection
			And shared a collection to a group
     	When adds product records to a collection
     		And a user is on the Dashboard Activity page
		Then sees a notification advising him added product records to a collection 

	#@all_test 
	Scenario: A user updated records to a collection

     	Given a user created a group 
			And added partners to the group
			And created a collection
			And shared a collection to a group
     	When updates product records to a collection
     		And a user is on the Dashboard Activity page
		Then sees a notification advising him updated product records to a collection 