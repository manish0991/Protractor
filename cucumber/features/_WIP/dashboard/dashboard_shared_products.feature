@dashboard
Feature: Dashboard - Shared Products

  The Dashboard provides quick oversight to an organizations 
  products, partners, integration, recent activity, and received invites.

  This spec addresses reporting on a products shared by partners.

  Background:
  
    Given I have signed into Venzee
        
  Scenario: No Catalogs / Products  
  #test general display without products
  
    When I access Venzee for the first time
    And I access the dashboard without performing any other tasks
  
    Then The 'Partner Catalog' widget displays instructional text
    And a sample graphic is displayed
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077986
      
  Scenario: Single Partner / Catalog with Products 
  #test general display with products
  
    When I have accessed the catalog for a single partner
    And I access the dashboard
    
    Then The 'Partner Catalog' widget displays the parnter's catalog in a drop down
    And The number of products in the catalog is displayed
    And The status of each product is displayed in a bar graph
    And The number of products in each status is displayed with the bar graphic
    And The graph spans the widget
    And I have the option of viewing the catalog
    
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63078067
    
  Scenario: Multiple Parnters / Catalog with Products 
  #test multi catalog display / behaviour
  
    When I access a catalog named 'Cat1' with 5 products from 'CPartner'
    And I access a second catalog named 'Cat2' with 10 products from 'APartner'
    And I create a third catalog named 'Cat3' with 15 products from 'BPartner'
    And I access the dashboard
    
    Then The 'Partner Catalog' widget displays the 3 partners' catalogs in the drop down
    And the catalogs are listed in ascending alpha order #1) 'APartner/Cat2' 2) 'BPartner/Cat3' 3) 'CPartner/Cat1'
    And 'APartner/Cat2' is displayed and selected by default #first catalog selected by default
    And The info for the 10 products from 'APartner/Cat2' are displayed
    And When I switch to 'BPartner/Cat3' the info from its 15 products is displayed
    And When I switch to 'CPartner/Cat1' the info from its 5 products is displayed
    
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63078067
  
  Scenario: Catalog with all products statuses (statii?) 
  
    When I access a partner's catalog named 'PartCatStatus' with 190 products
    And 100 products have status 'Available'
    And 50 products have status 'Back Order'
    And 25 products have status 'Pre Order'
    And 10 products have status 'Discontinued'
    And 5 products have status 'Pending'
    And I access the dashboard
    
    Then The 'Partner Catalog' widget displays the products in 'PartCatStatus'
    And The number of products I added to the catalog is displayed
    And The status of each product is displayed in a bar graphic
    And The number of products in each status is displayed with the bar graphic
    And The order of statuses in the graphic is: Available, Back Order, Pre Order, Discontinued, Pending
    And The size of the section for each status is proportional to the number of products
    
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63078067
    
  Scenario: Viewing Catalogs in Product Screen
  
    When I have access to a catalog named 'Cat1' with 5 products from a parnter 'Partner1'
    And I have access to a second catalog named 'Cat2' with 10 products from a parnter 'Partner2'
    And I have access to a third catalog named 'Cat3' with 15 products from a parnter 'Partner3'
    And I access the dashboard
    
    Then The 'Partner Catalog' widget defaults to Cat1
    And When I access 'View this Catalogue' I am taken to the product list for 'Cat1'
    And When I return to the Dashboard, switch to 'Cat2' and  'View this Catalogue' I am taken to its product list
    And When I return to the Dashboard, switch to 'Cat3' and  'View this Catalogue' I am taken to its product list
    
