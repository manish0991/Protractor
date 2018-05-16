@product_mgmt
Feature: View Original Products

  An organizations original products and original products from connected partners can be viewed.
  The products are displayed in a list than can be filtered/searched and sorted.
  
  Background:
  
    Given I have chosen to view original products in my organization
   
   @NA    
  Scenario: No products
  
    When No products have been added
    And No connections to partner organizations exist

    Then The product list has no entries
   
   @NA   
  Scenario: Original products from own organization
  
    When At least 50 products have been added to a caltalog
    And Some products have an IMAP policy/price
    And Some products have available inventory
    And Some products are discontinued
    And Some products on back order

    Then The product list has all the original products
    And The list is sorted in ascending order by product name
    And pagination occurs after the 50th product
    And 'Product Name' is listed for all items
    And SKU/ID is listed for all items
    And Cost is listed for all items
    And IMAP price is listed for the relevant items
    And Status of 'Available' is listed for relevant items
    And Inventory count is listed for the 'Available' items
    And Status of 'Discontinued' is listed for relevant items
    And Status of 'Back order' is listed for relevant items
    And Date is listed for the 'Back order' items
    And VRI is listed for all products
    
	   @NA
  Scenario: Original products from another organization
  
    When At leat 10 products have been added to a catalog
    And Some products have an IMAP policy/price
    And Some products have available inventory
    And Some products are discontinued
    And Some products on back order
    And I am connected to another organization / partner with its own products

    Then The product list has all the original products
    And The list is sorted in ascending order by product name
    And 'Product Name' is listed for all items
    And SKU/ID is listed for all items
    And Cost is listed for all items
    And IMAP price is listed for the relevant items
    And Status of 'Available' is listed for relevant items
    And Inventory count is listed for the 'Available' items
    And Status of 'Discontinued' is listed for relevant items
    And Status of 'Back order' is listed for relevant items
    And Date is listed for the 'Back order' items
    And VRI is listed for all products
    And The Partner name is listed for products that belong to another organization
    
	   @NA
  Scenario: Variant products displayed
    When 2 parents products have been added to a catalog
    And each parent product has at least 25 variants
    And the catalog is viewed
  
    Then The variants appear under its respective parent product
    And Each parent is displayed on its own page (i.e. pagination)
    And Each parent has all its variants appear on same page
    And The variant is indented to indicate (child) relationship
    And The variant has the same columns / data as the parent #name, sku/id, cost/currencny/imap,status/inventory, VRI
    
	   @NA
  Scenario: Columns can be sorted
    When At leat 10 products have been added to a catalog
    And Some products have a differnet name
    And Some products have a different cost
    And Some products have a different status
    And The respective column headings are clicked

    Then The product list is sorted in descending order (the first click) for each column
    And The product list is sorted in ascending order (when clicked again) for each column
