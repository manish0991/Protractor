@templates
Feature: Template

	Background:
		Given a user is on the Venzee web site
		And a user and a company are registered
		And user login to the application

		@all_test @smoke_test 
		
		Scenario: Create a template 
			Given a user is on the Create a template page
			
			When enter the following info
		        |Name|
		        |Description|
		        |Category|
		        |Publish|
		        |Logo|

		    	And I define template schema

		    Then previews the fields
		    	And the template is saved		    	
		    	And sees the new template in the template list
		    	#And sees a notification saying he added a template #not imeplemented yet

		@all_test @smoke_test 
		Scenario: Edit a template (basic information)

			Given a user has created a template
			     	And is on the Edit a template page

			When change the following information
				|Name|
		        |Description|
		        |Category|
		        |Publish|
		        |Logo|

		    Then template is saved
		    	And sees a notification saying he edited a template 

		@all_test @smoke_test @dlt
		Scenario: Edit a template (schema)

			Given a user has created a private template
				And is on the Edit a template schema page

			When edits the template

		    #Then previews the fields		    	
		    	And template is saved
               And sees a notification saying he edited a template
			   
		@all_test  @smoke_test @dlt
		Scenario: Delete a template

			Given a user has created a template 	
				And is on the Edit a template page
			When deletes a template
			Then doesn't see the template in the template list
				And sees a notification saying he deleted a template 

		@all_test
		Scenario: Preview public template

			Given a public template has been created
				And a user is on the template library page
			When clicks on the template
			Then previews the fields

		@all_test  @smoke_test 
		Scenario: Copy template

			Given a user has created a private template 	
				And is on the Edit a template page
			When copy a template
			    And is on a new edit template page
			When change the following information
				|Name|
		        |Description|
		        |Category|
		        |Publish|
		        |Logo|

		    Then the template is now saved		    	
		    	And sees template in the template list

        @all_test @smoke_test 
		Scenario: Edit a copied template (schema)

			Given a user has created a private template
                And is on the Edit a template page
			   
            When copy a template
                And is on a new edit template schema page
			    And edits the template

		    #Then previews the fields		    	
		    	And the template is now saved
            And sees a notification saying he edited a template