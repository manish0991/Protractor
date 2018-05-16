@product_mgmt @product_import
Feature: Add Product - CSV

  Bulk products can be added via CSV upload process
  
  Background:
  
    Given I have signed into Venzee
    And I have access the Products page  
  

  Scenario: Add products in bulk using csv
    Given I have chosen to add products using CSV
    And I choose AUD Currency
    And Enter random catalogname into the collectionName field
    #And I make catalog Public
    And Enter 1.5 information into the collectionImap field
    #And I choose AUD Currency
    And I browsed the valid CSV file
    And I click Next button
    And I complete the mapping process
    
    
    