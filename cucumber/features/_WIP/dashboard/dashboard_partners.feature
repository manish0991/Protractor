@dashboard
Feature: Dashboard - Partners

  The Dashboard provides quick oversight to an organizations 
  products, partners, integration, recent activity, and received invites.

  This spec addresses reporting on connected partners.

  Background:
  
    Given I have signed into Venzee
        
  Scenario: No Partners
  #test general display without partners
  
    When I access Venzee for the first time
    And I access the dashboard without performing any other tasks
  
    Then The "Partners" widget displays instructional text to invite the first partner
    And a sample graphic is displayed
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077986
      
  Scenario: Partner Invited
  #test general display 
  
    When I have invited a partner
    And I access the dashboard
    
    Then The "Partners" widget displays the graph with 1 partner invite 
    And The graph spans the widget
    
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077993
  
  Scenario: Partner Active
  #test general display 
  
    When I have invited a partner
    And the partner has accepted the invitation
    And I access the dashboard
    
    Then The "Partners" widget displays the graph with 1 active partner 
    And The graph spans the widget
    
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077993
    
  Scenario: Invited and Active Partners 
  #test multi status display
  
    When I have 10 active partners
    And I have 5 invited (that have not respondend yet)
    And I access the dashboard
    
    Then The "Partners" widget displays the 15 partners
    And The status of each partner is displayed in a bar graphic
    And The number of partners in each status is displayed with the bar graphic
    And The order of statuses in the graphic is: Active, Invited
    And The size of the section for each status is proportional to the number of partners
  
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077993
  
  Scenario: Viewing Partners Screen
  
    When I have at least 1 invited or active partners
    And I access the Dashboard
    And I click the 'Manage Partners' link
    
    Then The Manage Partners screen is displayed
    And The screen displays invited and active partners
    
