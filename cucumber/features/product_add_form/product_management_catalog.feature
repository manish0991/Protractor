@product_mgmt @product_catalog
Feature: product catalog - add

  When adding adding / editing a product in the form a new catalog can be entered.

 # The following must be entered
 #   - Catalog name (unique for org) - case insensitive
 #   - Shareable (public / private)
 #   - IMAP policy amount
 #   - Currency
  
  Background:
  
    Given I have signed into Venzee
    And I have access the Products page
    And I have chosen to add a product using the form
  
  @ready
  Scenario: Create Catalog - Public / IMAP = decimal
    Given No catalog exists
    #When I click Yes I do button
    And Enter Chairs information into the collectionName field
    And Enter 1.5 information into the collectionImap field
    And I make catalog Public
    And I choose US Dollar as Currency
    And I complete the required fields of the product details
    And I Save
    
    Then the product view appears
    And The Catalog is available under company catalogs in the product list
    And The product appears in the catalog
    And I logout from the application
  
  @ready
  Scenario: Create Catalog - Private / IMAP = whole number
  
    When No catalog exists
    And I enter 'Chairs' as the name of the catalog
    And Enter 1 information into the collectionImap field
    And I make catalog Private
    And I choose US Dollar as Currency
    And I complete the required fields of the product details
    And I Save
    
    Then the product view appears
    And The Catalog is available under company catalogs in the product list
    And The product appears in the catalog
    And I logout from the application
  
  
  ##################
  # Other Scenarios
  @ready
  Scenario: IMAP policy not entered
    #Given I click Yes I do button
    When I enter 'Chairs' as the name of the catalog
    And I Don't enter an IMAP policy
    And I make catalog Public
    And I choose Canadian Dollar as Currency
    And I complete the required fields of the product details
    And I Save
    
    Then An alert appears saying "IMAP policy must be entered" 
    #And Focus is placed on IMAP policy
    And I logout from the application

    @ready
  Scenario: Invalid IMAP policy entered
    Given I click Yes I do button
    When I enter 'Chairs' as the name of the catalog
    And Enter one information into the collectionImap field
    And I make catalog Public
    And I choose Canadian Dollar as Currency
    And I complete the required fields of the product details
    And I Save
    
    Then An alert appears saying "IMAP policy invalid" 
    #And Focus is placed on IMAP policy
    And I logout from the application
    
  @ready
  Scenario: Invalid numeric IMAP policy entered
    When I enter 'Chairs' as the name of the catalog
    And I click Yes I do button
    And Enter 0.5 information into the collectionImap field
    And I make catalog Public
    And I choose Canadian Dollar as Currency
    And I complete the required fields of the product details
    And I Save
    
    Then An alert appears saying "IMAP policy invalid" 
    #And Focus is placed on IMAP policy
    And I logout from the application
    
    @ready
  Scenario: Catalog name exists in organization
 
    Given an existing catalog named 'Chairs' exists for my organization
    When I enter 'Chairs' as the name of the catalog
    
    Then a tooltip appears saying "'Chairs' already exists." 
    And I logout from the application
    
    @ready
   Scenario: Catalog name exists in organization
  
    Given an existing catalog named 'chairs' exists for my organization
    When I enter 'chairs' as the name of the catalog
    
    Then a tooltip appears saying "'chairs' already exists." 
    And I logout from the application

   
