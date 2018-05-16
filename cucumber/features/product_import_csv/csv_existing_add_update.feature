@product_import @product_csv_upload_update_catalog
Feature: CSV File Upload - add new products / update products in existing catalog

  Where user is importing product data including variants via CSV file.
  CSV files at a minimum must have a Product ID and Product Name column.
  Imports will create new product records where an existing Unique ID is not found for a catalog.  
  If  a Unique ID is found, its product records will be updated.  
  Products with a status of "Deleted" are not (hard) deleted, but marked as ‘deleted’ (soft)
  
  Background:
  
    Given I am on Venzee website
    And I am in the Product page
    And I choose to upload products via CSV file
  
  #Happy Path
     @NA
  Scenario: Happy Path - update catalog / minimum info / no variants (inline)
  
    Given I have a catalog 'UpMinNoVar' with existing products and no variants
    And I have a csv file with the same products in 'UpMinNoVar'  and no variants
    And The products in the file have updated names
   
    When I choose Upload product using a CSV file
    And I choose the existing 'UpMinNoVar' catalog
    #no mapping required - previous mappings should be remembered
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were updated
    And All the products in the CSV are viewable in the 'UpMinNoVar' catalog
    And The products have updated product names
  
     @NA
  Scenario: Happy Path - update catalog / optional info / no variants (inline)
  
    Given I have a catalog 'UpOptNoVar' with existing products and no variants
    And I have a csv file with the same products in 'UpOptNoVar'  and no variants
    And The products in the file have updates to all the optional fields
    #optional = cost, currency, status, inventory, available date, description, supplier, image filenames, video URLs
   
    When I choose Upload product using a CSV file
    And I choose the existing 'UpOptNoVar' catalog
    #no mapping required - previous mappings should be remembered
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were updated
    And All the products in the CSV are viewable in the 'UpOptNoVar' catalog
    And The products have updates to all the optional fields
    #optional = cost, currency, status, inventory, available date, description, supplier, image filenames, video URLs
  
     @NA
  Scenario: Happy Path - update catalog / variants - custom unique ID field
    
    Given I have a catalog 'UpOptVarCus' with existing products and variants
    And I have a csv file with the same products in 'UpOptVarCus' and variants #variants have ParentId
    And The Unique ID field is custom (e.g. Product ID instead of SKU)
    And The variants in the file have updates to all the optional fields
    #optional = parent ID, cost, currency, status, inventory, available date, description, supplier, image filenames, video URLs
    
    When I choose Upload product using a CSV file
    And I choose the existing 'UpOptVarCus' catalog
    #no mapping required - previous mappings should be remembered
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were updated
    And All the products in the CSV are viewable in the 'UpOptVarCus' catalog
    And The variants have updates to all the optional fields
    #optional = parent ID, cost, currency, status, inventory, available date, description, supplier, image filenames, video URLs
  
     @NA
  Scenario: Existing products removed (Status marked as ‘deleted’)
    
    Given I have a catalog 'UpDel' with existing products and no variants
    And I have a csv file with the same products in 'UpDel' and no variants
    And The products in the file have a Status of 'Deleted'
    
    When I choose Upload product using a CSV file
    And I choose the existing 'UpDel' catalog
    #no mapping required - previous mappings should be remembered
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were updated
    And All the products in the CSV are viewable in the 'UpDel' catalog
    And The products have a Status of 'Deleted'
    
  # Failure
     @NA
  Scenario: Existing Catalog - Uploading a CSV file that doesn’t contain the same column header
  
    Given I have a catalog 'UpChange' which was created from a csv with only minum columns
    #minimum = Unique ID, product name
    And I have a csv file with the same products in 'UpChange' and some additional columns
    
    When I choose Upload product using a CSV file
    And I choose the existing 'UpChange' catalog
    
    Then An error screen appears indicating the forma/layout of CSV doesn't match the original
    And No changes ocurred to the 'UpChange' catalog
  
  # Future
  #Scenario: No unique ID provided for a specific product then the products should be added
  

