@product_import @product_csv_upload_parent_child
Feature: CSV File Upload - different parent/child combination

  Where user is importing product data including variants via CSV file.
  CSV files at a minimum must have a Product ID and Product Name column.
  Imports will create new product records where an existing Unique ID is not found for a catalog.  
  If  a Unique ID is found, its product records will be updated.  
  Products with a status of "Deleted" are not (hard) deleted, but marked as ‘deleted’ (soft(.
  
  Background:
  
    Given I am on Venzee website
    And I am in the Product page
    And I choose to upload products via CSV file
  
  # ADD - Happy  
     @NA
  Scenario: Happy Path - new catalog / variants - SKU is unique ID
 
    Given I have a csv file with variants #i.e. Parent ID column with valid values
    And The file contains some products with variants have 2 or more #i.e. Some parents have one child, others have at least 2
    And The file contains the SKU as the Unique ID
    And The file contains columns (i.e. attributes) only applicable to the child / variant #e.g. colour, size, etc.
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'NewVarSKU' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #SKU
    And I map the Product Name column
    And I map the Parent ID column
    And I map any other columns
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'NewVarSKU' catalog
    And The parent products have the appropriate child (variant) products
  
     @NA
  Scenario: Happy Path - new catalog / variants - custom unique ID
  
    Given I have a csv file with variants #i.e. Parent ID column with valid values
    And The file contains some products with variants have 2 or more #i.e. Some parents have one child, others have at least 2
    And The file contains the a custom column as the Unique ID #e.g. Product ID
    And The file contains columns (i.e. attributes) only applicable to the child / variant #e.g. colour, size, etc.
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'NewVarCus' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #e.g. Product ID
    And I map the Product Name column
    And I map the Parent ID column
    And I map any other columns
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'NewVarCus' catalog
    And The parent products have the appropriate child (variant) products
  
     @NA
  Scenario: Happy Path - new catalog / variants - child info overrides parent info
  
    Given I have a csv file with variants #i.e. Parent ID column with valid values
    And The file contains some products with variants have 2 or more #i.e. Some parents have one child, others have at least 2
    And The file contains columns (i.e. attributes) only applicable to the child / variant #e.g. colour, size, etc.
    And The file contains  variants that override parent value for particular attributes #e.g. cost
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'NewVarOver' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column 
    And I map the Product Name column
    And I map the Parent ID column
    And I map any other columns
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'NewVarOver' catalog
    And The parent products have the appropriate child (variant) products
    And The child products / variants with overrides have the appropriate values #e.g. cost
  
     @NA
  Scenario: Happy Path - new catalog / variants - child is orphaned
 
    Given I have a csv file with variants #i.e. Parent ID column with valid values
    And The file contains some products with variants have 2 or more #i.e. Some parents have one child, others have at least 2
    And The file contains  a variant with an invalid Parent ID #i.e. orphaned
    And The file contains columns (i.e. attributes) only applicable to the child / variant #e.g. colour, size, etc.
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'NewVarOrph' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column 
    And I map the Product Name column
    And I map the Parent ID column
    And I map any other columns
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'NewVarOrph' catalog
    And The parent products have the appropriate child (variant) products
  
  # FUTURE
  #Scenario: Happy Path - new catalog / variants - child without unique ID
