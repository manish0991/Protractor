@partner_management @search_group
Feature: Partner segmentation into groups

	#In order to manage group of partners
	#A user 
	#Should be able to quickly search groups

	Background:
		Given a user and a company are registered
		
	#@all_test 
	Scenario: Filter unavailable 
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781293/preview
	
		Given a user is on the Partners page
		Then does not see the filter window
		 
	#@all_test @smoke_test
	Scenario: All partners
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781293/preview
	
		Given a user is on the Partners page
			And has an active user 
			And has a pending user

		When selects all partners in the search field

		Then sees all the partners 

	#@all_test 
	Scenario: Pending partners
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781293/preview
	
		Given a user is on the Partners page
			And has an active user 
			And has a pending user

		When selects pending invitations in the search field

		Then sees only the pending user
		
	#@all_test 
	Scenario: Filter by setup partner group
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781293/preview
	
		Given a user is on the Partners page
			And has a partner group

		When selects the group in the search field

		Then sees users attached to the group
		
