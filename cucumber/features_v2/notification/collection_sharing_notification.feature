@notification
Feature: Features related to the collection sharing notifications
#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781462/preview

	#In order to stay informed about the activities related to the collections sharing
	#A user 
	#Should be able to view the recent collection sharing activities on his dashboard

	Background:
		Given a user and a company are registered
     		And a user is logged in
		
	#@all_test @smoke_test 
	Scenario: A partner shared a collection with me 

		Given a partner shared a collection with a user 
		When a user is on the Dashboard Activity page
		Then sees a notification advising him a company has shared a collection with him

	#@all_test 
	Scenario: A partner removed the user from the group

		Given a partner has shared a collection with a user 
			And a partner removed a user from the group he shared to collection to
		When a user is on the Dashboard Activity page
		Then sees a notification advising him a company has stopped sharing a collection with him

	#@all_test 
	Scenario: A partner removed a group

		Given a partner has shared a collection with a user 
			And a partner removed the group
		When a user is on the Dashboard Activity page
		Then sees a notification advising him a company has stopped sharing a collection with him

	#@all_test @smoke_test
	Scenario: A partner stopped sharing a collection to a group

		Given a partner has shared a collection with a user 
			And stopped sharing this collection to the group the user is in
		When a user is on the Dashboard Activity page
		Then sees a notification advising him a company has stopped sharing a collection with him

	#@all_test @smoke_test
	Scenario: Share collection for the first time

		Given a user created a group 
			And added partners to the group
			And created a collection
		When shares the collection with a group
			And a user is on the Dashboard Activity page
		Then sees a notification advising him he shared a collection to the number of partners in the group

	#@all_test 
	Scenario: Share collection to new partners

		Given a user created a group 
			And added partners to the group
			And created a collection
			And shared a collection to a group
		When adds new partners to the group
			And a user is on the Dashboard Activity page
		Then sees a notification advising him he shared a collection to the number of partners he added in the group

	#@all_test 
	Scenario: Stop sharing a collection to a group

		Given a user created a group 
			And added partners to the group
			And created a collection
			And shared a collection to a group
		When stops sharing the collection to a group
			And a user is on the Dashboard Activity page
		Then sees a notification advising him he stopped sharing a collection to the number of partners in the group


	#@all_test 
	Scenario: Create a group

		Given a user created a group
		When a user is on the Dashboard Activity page
		Then sees a notification advising he created a group

	#@all_test 
	Scenario: Remove a group

		Given a user has shared a collection with a group 
			And removed the group
		When a user is on the Dashboard Activity page
		Then sees a notification advising he remove the group
			And sees a notification advising him he stopped sharing a collection to the number of partners in the group