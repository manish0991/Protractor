@dashboard
Feature: Dashboard - MAP

  The Dashboard provides quick oversight to an organizations 
  products, partners, integration, recent activity, and received invites.

  This spec addresses reporting on MAP violations

  Background:
    Given I have signed into Venzee
	And a company is registered
	
  Scenario: No MAP violations
  #test general display without validations 
  #this is default display also before MAP implemented/MVP
  
    When I access Venzee for the first time
    #And I access the dashboard without performing any other tasks
  
    Then The "MAP" widget displays 0 resolved and 0 open violations
    #And a graph is displayed that spans the widget
    
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077986
      
  #FUTURE
  Scenario: 1 violation - Open
  #test general display 
  
    When There is 1 MAP violation
    And The violation is 'open'
    
    Then The "MAP" widget displays the graph with 1 'open' violation
    And The graph spans the widget
    
  
  Scenario: 1 violation - Resolved
  #test general display 
  
    When There is 1 MAP violation
    And The violation is 'resolved'
    
    Then The "MAP" widget displays the graph with 1 'resolved' violation
    And The graph spans the widget
    
  Scenario: Open and Resolved Violations 
  #test multi status display
  
    When I have 10 resolved violations
    And I have 5 open violations
    And I access the dashboard
    
    Then The "MAP" widget displays the 15 violations
    And The status of each violation is displayed in a bar graphic
    And The number of violations in each status is displayed with the bar graphic
    And The order of statuses in the graphic is: Resolved, Open
    And The size of the section for each status is proportional to the number of violatins
    
