@product_import @product_csv_upload
Feature: CSV File Upload - different product info combination

  Where user is importing product data including variants via CSV file.
  CSV files at a minimum must have a Product ID and Product Name column.
  Imports will create new product records where an existing Unique ID is not found for a catalog.  
  If  a Unique ID is found, its product records will be updated.  
  Products with a status of "Deleted" are not (hard) deleted, but marked as ‘deleted’ (soft)
  
  File are limited to 100MB
  Image column can contain multiple filenames that are delimited.
  
  Background:
  
    Given I am on Venzee website
    And I am in the Product page
    And I choose to upload products via CSV file
  
  # ADD - Happy  
     @NA
  Scenario: Happy Path - minimum info / new catalog / no variants (inline)
    
    Given I have a csv file with the minimum info and no variants
    # minimum = Unique ID (SKU) and product name
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'MinNewNoVar' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #SKU
    And I map the Product Name column
    And I skip mapping any other columns
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'MinNewNoVar' catalog
    
	   @NA
  Scenario: Happy Path - optional info / new catalog / no variants (inline)
  
    Given I have a csv file with the minimum info, optional info and no variants
    # minimum = SKU and product name
    # optional = cost, currency, status, inventory, available date, description, supplier, image filenames, video URLs
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'MinNewOpt' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #SKU
    And I map the Product Name column
    And I map the optional columns
    And I review the mapping and accept without making changes
  
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'MinNewOpt' catalog
    
	   @NA
  Scenario: Happy Path - custom info / new catalog / no variants (inline)
    
    Given I have a csv file with the minimum info, Unique ID is custom, and no variants
    # minimum = Unique ID (e.g. Product ID) and product name
   
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'MinNewCus' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #Product ID
    And I map the Product Name column
    And I skip mapping any other columns
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'MinNewCus' catalog
  
     @NA
  Scenario: Happy Path - upload file is UTF-8 encoded
    
    Given I have a csv file that is UTF-8 encoded
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'UTF8' as the catalog name
    And I enter the currency as CAD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the minumum columns
    And I map any optional columns
    And I review the mapping and accept without making changes
    
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'UTF8' catalog
    
	   @NA
  Scenario: Happy Path - New product with status of ‘Deleted’ (should be added)
  
    Given I have a csv file with the minimum info, status column and no variants
    # minimum = SKU and product name
    # optional = status
    And Status of products in csv has a value of 'Deleted'
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'Deleted' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #SKU
    And I map the Product Name column
    And I map the Status column
    And I review the mapping and accept without making changes
  
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'Deleted' catalog
    And The products have a status of 'Deleted'
  
     @NA
  Scenario: Happy Path - New product with different status values
  
    Given I have a csv file with the minimum info, status column and no variants
    # minimum = SKU and product name
    # optional = status
    And Status of a product in csv has a value of 'Available' #acceptable value
    And Status of a products in csv has a value of 'Back Order' #acceptable value
    And Status of a products in csv has a value of 'PRE-ORDER' #acceptable value
    And Status of a products in csv has a value of 'pending' #acceptable value
    And Status of a products in csv has a value of 'discontinued' #acceptable value
    And Status of a products in csv has a value of 'deleted' acceptable value 
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'StatusCheck' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #SKU
    And I map the Product Name column
    And I map the Status column
    And I review the mapping and accept without making changes
  
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'StatusCheck' catalog
    And The products have their status value retained
  
     @NA
  Scenario: Happy Path - Cost symbols stripped
  
    Given I have a csv file with the minimum info, cost and no variants
    # minimum = SKU and product name
    # optional = cost
    And Cost of a product in csv has a value of '99,999' #saved as 99999
    And Cost of a products in csv has a value of '99,999.99' #saved as 99999.99
    And Cost of a products in csv has a value of '$999' #saved as 999
    And Cost of a products in csv has a value of '$999.99' #saved as 999.99
    And Cost of a products in csv has a value of 'USD9,999' #saved as 9999
    And Cost of a products in csv has a value of '9,999.997 dolars' #saved as 9999.99
    
    # all non-numeric characters to be stripped (e.g. '$',',','USD') leaving only numbers and 2 decimals - max.
    # e.g. USD$99,999.99 = 99999.99
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'CostStripping' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #SKU
    And I map the Product Name column
    And I map the Cost column
    And I review the mapping and accept without making changes
  
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'CostStripping' catalog
    And The products have their costs value stripped
    
	   @NA
  Scenario: Happy Path - Image column contains valid delimiter 
  
    Given I have a csv file with the minimum info, image column and no variants
    # minimum = SKU and product name
    # optional = image
    And Image of a product contains one filename and no delimiter #valid
    And Image of a product contains multiple filenames delimited by a "," #valid
    And Image of a product contains multiple filenames delimited by a ";" #valid
    And Image of a product contains multiple filenames delimited by a "|" #valid
    And Image of a product contains multiple filenames delimited by a "~" #invalid, so treated as one long file name
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'DelimitedImages' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #SKU
    And I map the Product Name column
    And I map the Image column
    And I review the mapping and accept without making changes
  
    Then A confirmation screen appears indicating how many products were uploaded
    And All the products in the CSV are viewable in the 'DelimitedImages' catalog
    And The products images have been properly parsed #confirm in the back end first and is to be confirmed in the image upload spec
  
  # ADD - Failures
     @NA
  Scenario: New catalog - Duplicated unique ID
  
    Given I have a csv file with two products that share the same Unique ID (e.g. SKU)
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'Duplicate' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #SKU
    And I map the Product Name column
    And I skip any additional columns
    And I review the mapping and accept without making changes
  
    Then An error screen appears indicating that duplicate products were found
    And The 'Duplicate' catalog is not created
  
     @NA
  Scenario: non UTF-8 encoded file
  
    Given I have a csv file that is not UTF-8 encoded
   
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'NonUTF8' as the catalog name
    And I enter the currency as CAD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    
    Then An error screen appears indicating that the file is invalid
    And The 'NonUTF8' catalog is not created
    
	   @NA
  Scenario: Product with invalid Status
  
    Given I have a csv file with the minimum info, status column and no variants
    # minimum = SKU and product name
    # optional = status
    And Status of products in csv has a value of 'Obsolete' #invalid status
    
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'Obsolete' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    And I map the Unique ID column #SKU
    And I map the Product Name column
    And I map the Status column
    And I review the mapping and accept without making changes
  
    Then An error screen appears indicating that the file is invalid
    And The 'Obsolete' catalog is not created
    
	   @NA
  Scenario: CSV file over 100MB upload
  
    Given I have a csv file that is over 100MB
  
    When I choose Upload product using a CSV file
    And I create a new catalog
    And I enter 'TooLarge' as the catalog name
    And I enter the currency as USD
    And I keep privacy and IMAP at their default values
    And I browse to the csv file (above)
    
    Then An error screen appears indicating that the file is too large
