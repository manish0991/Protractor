@product_import @product_mgmt
Feature: Edit Product - List and Form

  Individual product records can be edited by bulk action or form (for single product)

  Background:
  
    Given I have chosen to view products for my organization
    And At least one catalog exists
  
  # HAPPY PATH 
     @NA
  Scenario: Product Status Changed
  
    When A catalog with 12 products exists
    And The catalog is viewed
    And 2 of the products is selected in the list and the status is changed to 'Available'
    And 2 different products are selected in the list and the status is changed to 'Back Order'
    And 2 different products are selected in the list and the status is changed to 'Pre Order'
    And 2 different products are selected in the list and the status is changed to 'Discontinued'
    And 2 different products are selected in the list and the status is changed to 'Pending'
  
    Then The selected products have their respective statuses updated
    And for each status there are two products 
    
  # FAILURES 
