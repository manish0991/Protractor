@transformations
Feature: Transformation

	Background:
		Given a user is on the Venzee web site
		And a user and a company are registered
		And user login to the application

		@all_test 
		Scenario: Create a transformation
			Given products exist in the product list
				And the user created a template
				And is on the create a transformation page
			
			When selects the template and the source collection
		    		And enters the ER collection name and the description
			    	And maps the required fields

		    Then sees the confirmation screen
			     And sees products in the Export Ready list
			     #And sees a notification saying he added products

		#@all_test @smoke_test 
		Scenario: Edit a transformation

			Given has created a transformation
				And a user is on the Edit a transformation page

			When user changes the mappings


		    #Then sees the confirmation screen
			     #And sees products in the Export Ready list
			     And sees a notification saying he updated products

		#@all_test @smoke_test 
		Scenario Outline: Update Export Ready Records

			Given has created a transformation records
				And a user is on the Data page

			When edits products via <method>


		    #Then sees the confirmation screen
			     And sees updated products in the Export Ready list
			     And sees a notification saying he updated products

			Examples: 
			|method|
			|csv   |
			#|form  |
			#|integration|

		@all_test @smoke_test  
		Scenario: Create math widget

			Given products with add additional exist in the product list
				And the user created a template
				And is on the create a transformation page
			
			When selects the template and the source collection
		    		And enters the ER collection name and the description
			    	And maps the required fields
			    	And create a custom math widget

		    Then sees the confirmation screen
			     And sees products in the Export Ready list
                 And sees a notification saying he added products
				 
		@all_test @smoke_test 
		Scenario: Create Spec table widget

			Given products with add additional exist in the product list
				And the user created a template with html
				And is on the create a transformation page
			
			#When selects the template and the source collection

		    	When selects the template and the source collection
		    		And enters the ER collection name and the description
			    	#And maps the required fields
			    	And create a custom spec table widget

		    Then sees the confirmation screen
			     And sees products in the Export Ready list
			     And sees the product details panel with that display the HTML table

		
		@all_test 
		Scenario: Transform images
		
			Given products available in the product list
			  	And associated images to those products
			
			When selects the template and the source collection
		    	And enters the ER collection name and the description
			    #And maps the required fields
			    And checks the transform images

		    Then sees the confirmation screen
			     #And sees products in the Export Ready list
			     #And sees the images thumbnails
			     And sees a notification saying that product were added
				 
		@all_test @smoke_test 
		Scenario: Create padding widget

			Given products with add additional exist in the product list
				And the user created a template with text 
				And is on the create a transformation page
			
			When selects the template and the source collection
		    		And enters the ER collection name and the description
			    	And maps the required fields
			    	And create a custom padding widget

		    Then sees the confirmation screen
			     And sees products in the Export Ready list
			     And sees the product's one of column with the padding character 
				 
		@all_test @smoke_test 
		Scenario: Create case widget

			Given products with added additional exist in the product list
				And the user created a template with text 
				And is on the create a transformation page
			
			When selects the template and the source collection
		    		And enters the ER collection name and the description
			    	And maps the required fields
			    	And create a custom case widget

		    Then sees the confirmation screen
			     And sees products in the Export Ready list
			     And sees the product's one of column with the all capitals case character 



