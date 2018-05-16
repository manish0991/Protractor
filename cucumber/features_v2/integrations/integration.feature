@integrations
Feature: Integration

	Background:
		Given the user has signed into Venzee

		@all_test 
		Scenario: Create 1-click integration (WooCommerce)
			Given a user is on the Integrations page
			     And user is on Setup your Integration screen
			
			When enter the following info
		        |Integration Name|
		        |Integration Description|
				|Update Frequency|
                And I see the authentication page
				
		    Then enter the following info
		    	|The Store URL|
		    	|API Key|
				|API Secret|
		    	And sees the new integration in the integration list
				#need to close the create an integration page

		#@all_test @smoke_test 
		Scenario: Edit 1-click integration (WooCommerce) 

			Given has created an integration
				And a user is on the Edit an integration page

			When change the following information
				|Integration Name|
		        |Integration Description|
				And see the changes in the integration list

		@all_test 
		Scenario: Delete 1-click integration (WooCommerce) 

			Given has created an integration 	
				And a user is on the Edit an integration page
			When deletes an integration
			Then the integration is no longer displayed in my integration list 

		

		#@all_test
		Scenario: Invalid integration name at creation

			Given a user is on the Integration page		
			When creates a new integration with an empty name
		    Then sees a message advising him the integration name isn't valid

		#@all_test
		Scenario: Invalid integration name at edition

			Given a user is on the Integration page	
				And has created an integration 	
				And a user is on the Edit a custom integration page
			When edits the integration with an empty name
		    Then sees a message advising him the integration name isn't valid

		




