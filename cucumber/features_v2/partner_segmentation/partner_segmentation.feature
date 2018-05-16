@partner_management @partner_segmentation
Feature: Manage partners in groups

	#In order to easily share products and collections with partners
	#A user 
	#Should be able to manage partners in groups

	Background: 
		Given a user and a company are registered
		And a user is logged in
		
	@all_test
	Scenario: adding user to an existing group
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781289/preview
	
		Given a user is on the invite partner page
			And has an active partner

		When selects partner
			And add him to the group

		Then the partner is added to the group 
			And the collections shared with the group is shared with the partner
			And sees an alert advising him the partner was added to the group
		
	@all_test @smoke_test 
	Scenario: remove users from a group
		Given a user is on the invite partner page
			And has an active partner
			And added him to a group

		When selects partner 
			And removes him from the group

		Then the partners groups is removed from the group 
			And the collections shared with the group is not shared with the partner anymore
			And sees an alert advising him the partner was removed from the group