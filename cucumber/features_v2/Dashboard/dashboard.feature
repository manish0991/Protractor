@dashboard
Feature: Happy Path dashboard links test

	Scenario: Pre-requisite
    	Given a user and a company are registered
      	  And a user is logged in
		
	#@smoke_test
    Scenario Outline: Verify all links in the Dashboard 

        Given user is on the dashboard page
            And a user clicks on the <page> link
        Then sees the <page> page

        Examples: 
        | page              |
        | Users             |
        | Partners          |
        | Source Data       |
        | Dynamic Data      |
        | Integration       |
        | View Marketplace  |
        | View Templates    |
        