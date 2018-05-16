@product_mgmt @product_catalog
Feature: product catalog - edit

  When viewing products for an existing catalog, the catalog settings can be editted

 # The following can be entered
 #   - Catalog name (unique for org)
 #   - Shareable (public / private)
 #   - IMAP policy amount (optional)
 #   - Currency
  
  Background:
  
    Given I have signed into Venzee
    #And At least one public and one private catalog exists
    #And The public catalog is shared
    And I have access the Products page
    And At least one public and one private catalog exists
    
    
  # Happy Path
  Scenario: Edit - Name
  
    When I have selected a single catalog
    And I have chosen to edit the catalog settings
    And I change the name of the catalog
    And I Save
    
    Then the product view appears
    And The catalog name is changed
    And The products appear under the new the catalog
    And The Previous catalog name is no longer listed
  
  Scenario: Edit - Change to private
  
    When I have selected a public catalog
    And I have chosen to edit the catalog settings
    And I make the catalog private
    And I Save
    
    Then the product view appears
    And The catalog name is no longer shared
    
  Scenario: Edit - Change to public
  
    When I have selected a private catalog
    And I have chosen to edit the catalog settings
    And I make the catalog public
    And I Save
    
    Then the product view appears
    And The catalog can now be shared
  
   @ready
   Scenario: Edit - New IMAP
  
    When I have selected a single catalog
    And I have chosen to edit the catalog settings
    And I change the IMAP policy to a different valid value
    And I Save
    
    Then the product view appears
    And all products in the catalog have the new IMAP policy
  
  Scenario: Edit - IMAP cleared
  
    When I have selected a single catalog
    And I have chosen to edit the catalog settings
    And I clear the IMAP
    And I Save
    
    Then the product view appears
    And all products in the catalog have the IMAP policy cleared
  
  @ready
  Scenario: Edit - Currency
  
    When I have selected a single catalog
    And I have chosen to edit the catalog settings
    And I change the Currency to a different value
    And I Save
    
    Then the product view appears
    And all products in the catalog have the new currency
    
  # Failures
  Scenario: Edit - Existing Name
  
    When I change the name of the catalog to an existing name
   
    Then a tooltip appears saying the catalog name already exists
