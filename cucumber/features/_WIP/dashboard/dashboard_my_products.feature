@dashboard
Feature: Dashboard - My Products

  The Dashboard provides quick oversight to an organizations 
  products, partners, integration, recent activity, and received invites.

  This spec addresses reporting on a users own products.

  Background:
    Given I have signed into Venzee
	And a company is registered
     
	@Vivek321vivek 
  Scenario: No Catalogs / Products  
  #test general display without products
  
    When I access Venzee for the first time
    And I access the dashboard without performing any other tasks
    Then I visit products/catalog/?page=1&per_page=50 page
    Then The "Import Products" widget displays instructional text to create the first catalog
    And a sample graphic is displayed
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077986
      
  Scenario: Single Catalog with Products 
  #test general display with products
  
    When I have added products to a catalog
    And I access the dashboard
    
    Then The "Import Products" widget displays the catalog in a drop down
    And The number of products I added to the catalog is displayed
    And The status of each product is displayed in a bar graph
    And The number of products in each status is displayed with the bar graphic
    And The graph spans the widget
    And I have the option of viewing the catalog
    
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077993
    
  Scenario: Multiple Catalog with Products 
  #test multi catalog display / behaviour
  
    When I create a catalog named 'CatProd10' with 10 products
    And I create a second catalog named '20CatProd' with 20 products
    And I create a third catalog named 'ACatalog' with 5 products
    And I access the dashboard
    
    Then The "Import Products" widget displays the 3 catalogs in the drop down
    And the catalogs are listed in ascending alpha order #1) '20CatProd' 2) 'ACatalog' 3) CatProd10
    And '20CatProd' is displayed and selected by default #first catalog selected by default
    And The info for the 20 products from '20CatProd' are displayed
    And When I switch to 'ACatalog' the info from its 5 products is displayed
    And When I switch to 'CatProd10' the info from its 10 products is displayed
    
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077993
  
  Scenario: Catalog with all products statuses (statii?) 
  
    When I have create a catalog name 'CatStatus' with 190 products
    And 100 products have status 'Available'
    And 50 products have status 'Back Order'
    And 25 products have status 'Pre Order'
    And 10 products have status 'Discontinued'
    And 5 products have status 'Pending'
    And I access the dashboard
    
    Then The "Import Products" widget displays the products in 'CatStatus'
    And The number of products I added to the catalog is displayed
    And The status of each product is displayed in a bar graphic
    And The number of products in each status is displayed with the bar graphic
    And The order of statuses in the graphic is: Available, Back Order, Pre Order, Discontinued, Pending
    And The size of the section for each status is proportional to the number of products
    
    #https://projects.invisionapp.com/share/M627GD24H#/screens/63077993
    
  Scenario: Viewing Catalogs in Product Screen
  
    When I create a catalog named 'Cat1' with 5 products
    And I create a second catalog named 'Cat2' with 10 products
    And I create a third catalog named 'Cat3' with 15 products
    And I access the dashboard
    
    Then THe widget defaults to Cat1
    And When I access 'View this Catalogue' I am taken to the product list for 'Cat1'
    And When I return to the Dashboard, switch to 'Cat2' and  'View this Catalogue' I am taken to its product list
    And When I return to the Dashboard, switch to 'Cat3' and  'View this Catalogue' I am taken to its product list