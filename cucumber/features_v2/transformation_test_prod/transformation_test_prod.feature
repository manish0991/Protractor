@transformation_prod
Feature: Transformation test on Prod

  Background:
    Given a user is logged to Venzee
	
	Scenario: Basic transformation
  
    When user selects the template and the source collection
    And enters the Dynamic collection name and the description 
	
	When mapped the required fields
	And sees products in the Dynamic collection
	Then deletes the Dynamic collection