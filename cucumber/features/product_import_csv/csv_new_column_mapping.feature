@product_import @product_csv_upload_mapping
Feature: CSV Upload, going through the Column mapping process

  Where user is importing product data including variants via CSV file.
  CSV files at a minimum must have a Product ID and Product Name column.
  Imports will create new product records where an existing Unique ID is not found for a catalog.  
  If  a Unique ID is found, its product records will be updated.  
  Products with a status of "Deleted" are not (hard) deleted, but marked as ‘deleted’ (soft).
  
  Background:
  
    Given I am on Venzee website
    And I am in the Product page
    And I choose to upload products via CSV file
  
  #Happy Path
     @NA
  Scenario: I upload a product list into a new catalog
  
    Given I have a csv file with at least two products
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'Basic' as the catalog name
    And I enter the currency as CAD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the minimum / required columns
    And I map the optional columns
    And I review the mapping and accept without making changes
  
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'Basic' catalog

	   @NA
  Scenario: I upload a product list and I change the mapping before processing the file
  
    Given I have a csv file with at least two products
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'ChangeMap' as the catalog name
    And I enter the currency as CAD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the minimum / required columns
    And I map some of optional columns to values that are incorrect (e.g. cost mapped to inventory)
    And I review the mapping and change the incorrect mappings to correct ones
  
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'ChangeMap' catalog
    And The data matches the corrected column mappings
  
     @NA
  Scenario: Image URL's with proper delimiter is processed properly
  
    Given I have a csv file with products that have several Image URLs provided
    And the URLs are separated/delimited by a semicolon #actual delimiter TBD
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'ImageURL' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the minimum / required columns
    And I map the Image URL column
    And I skip the other columns
    And I review the mapping and accept without making changes
  
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'ImageURL' catalog
    And The products that contained multipe URLs have images properly displayed
    
	   @NA
  Scenario: Video URL's with proper delimiter is processed properly
  
    Given I have a csv file with products that have several Video URLs provided
    And the URLs are separated/delimited by a semicolon #actual delimiter TBD
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'VideoURL' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the minimum / required columns
    And I map the Video URL column
    And I skip the other columns
    And I review the mapping and accept without making changes
  
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'VideoURL' catalog
    And The products that contained multipe URLs have videos properly displayed
    
  # Failure
   @NA
  Scenario: Non-CSV File should be rejected from uploading
  
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'NonCSV' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    
    Then An error screen appears indicating the file is invalid
  
     @NA
  Scenario: Unique ID mapped to ‘wrong’ column
  
    Given I have a csv file with some products that have the same costs
  
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'BadID' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID to the Cost column
    And I map the Product Name correctly
    And I skip the other columns
    And I review the mapping and accept without making changes
  
    Then An error appears indicated the UniqueID column contains duplicate values
    And The 'BadID' catalog is not created
  
     @NA
  Scenario: Map to column/field that is already mapped (not allowed - will need to swap)
  
    Given I have a csv file with the minimum and optional columns
    # minimum = unique ID, product name
    # optional = cost, currency, status, inventory, available date, description, supplier, image filenames, video URLs
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'SwapCol' as the catalog name
    And I enter the currency as CAD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the minimum / required columns
    And I map the optional columns
    And I review the mapping and try and change mapping of "product name" to "product description"
  
    Then Product description is not available in the list of available columns #i.e. its already used
   
      @NA
  Scenario: Providing a Cost that is not numerical should make the csv upload rejected
  
    Given I have a csv file with costs that contain letters #i.e. non numeric/decimals
  
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'BadCosts' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID correctly
    And I map the Product Name correctly
    And I map the Cost correctly
    And I skip the other columns
    And I review the mapping and accept without making changes
  
    Then An error appears indicated the Cost column contains invalid values
    And The 'BadCosts' catalog is not created
  
     @NA
  Scenario: Providing a Available date that is not a valid date should make the csv upload rejected

    Given I have a csv file with available dates that are not in proper date format
  
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'BadDates' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID correctly
    And I map the Product Name correctly
    And I map the Available dates correctly
    And I skip the other columns
    And I review the mapping and accept without making changes
  
    Then An error appears indicated the Available date column contains invalid values
    And The 'BadDates' catalog is not created

	   @NA
  Scenario: Upload process cannot be completed without minimum fields mapped (i.e. name)
   
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'NoMinimum' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID correctly
    And I try to skip the Product name column
    
    Then I should be stoped from trying to skip the product name column
