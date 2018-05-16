Feature: Integration

	Background:
		Given the user has signed into Venzee

		#@all_test 
		Scenario: Create an integration
			Given a user is on the marketplace page
			
			When enter the following info
		        |Integration Name|
		        |Integration Description|
				|Frequency|

		    Then enter the following fields
		    	|Store URL|
		    	|API Key|
				|API Secret|
		    	And sees the new integration in my integrations list
				

		#@all_test 
		Scenario: Edit an integration 

			Given has created an integration
				And a user is on the Edit this integration page

			When change the following information
				|Integration Name|
		        |Integration Description|

		    And sees the updated integration in my integrations list

		#@all_test
		Scenario: Delete an integration 

			Given has created an integration 	
				And a user is on the Edit this integration page
			When deletes an integration
			Then doesn't see the integration in my integrations list 

		



