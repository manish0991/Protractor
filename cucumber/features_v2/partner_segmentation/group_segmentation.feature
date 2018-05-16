@partner_management @group_segmentation
Feature: Partner segmentation into groups

	#In order to easily share products and collections with partners
	#A user 
	#Should be able to manage groups

	Background:
		Given a user is on the Venzee web site
		And a user and a company are registered
		And user login to the application

	@all_test
	Scenario: Display Groups list
	
		Given a user is on the Group Management page
			And has created a group
		Then sees the group in the groups list
		


	@all_test
	Scenario: Group already exist

		Given a user is on the Group Management page

		When adds a new group
		
		Then the group is not be created
			And sees an alert advising him the group name already exist

		


	@all_test
	Scenario: Create a group with a partner
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781289/preview

		Given a user is on the invite partner page
			And has an active partner 

		When selects partner
			And creates a new group
		
		Then the group is created 
			And the partner are added the group
			And sees the group in the groups list 

		

	#@all_test @smoke_test 
	Scenario: delete a group
    #based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781295/preview
 
        Given has already created a group

        When deletes the group

        Then the group is deleted
        And partners associated to the group are disassociated
        #And collections shared with partners are not shared anymore #manual testing
        #And the user gets notified with a confirmation message	
		

	@all_test  
	Scenario: rename a group 
	
		Given a user is on the Group Management page
			And has already created a group

		When renames group
			And enters a valid group name
			And the group name doesn't already exist

		Then the group is renamed
			And sees an alert advising him the renaming was completed 
		

	@all_test
	Scenario: rename a group and name already exist
	
		Given a user is on the Group Management page
			And has already created a group
			And add a group
			
		When renames group
			And the group name already exist

		Then the group is not renamed
			And sees an alert advising him the group name already exist