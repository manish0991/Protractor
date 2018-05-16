@product_mgmt
Feature: View (Single) Product Profile

  Full detail for an individual product is displayed in a profile screen.

  Background:
  
    Given I have chosen to view original products in my organization

	   @NA
  Scenario: Parent Product - only required details displayed - no variants
  
    When a product has been added with a name
    And a SKU/ID has been added
    And Cost has been added
    And Currency has been added
    And Status added
    And I select an individual product to view from the list

    Then The product profile shows all the required information (above) for that product
    And VRI is displayed
    And The optional data/labels(e.g. IMAP, supplier, specs, tags, ) are not displayed
    
	   @NA
  Scenario: Parent Product - Optional details displayed
  
    When a product has been added with the required fields (name, SKU/ID, Cost, Currency, Status)
    And Supplier is included
    And IMAP is included
    And Inventory is included
    And Available date is included
    And Primary and secondary images are included
    And Multiple video URLs are included
    And Multiple tags are included
    And Multipe specification (attribute/value pairs) are included
    And Description is included

    Then The product profile shows the all the required information for that product
    And The product profile shows the all the optional information for that product
   
      @NA
  Scenario: Parent Product with Variants
  
    When A product has been added
    And Multiple variants have been added for the above product (parent)
    And The variants included an image
    And I select to view the parent product from the list

    Then The product profile shows the all the required information for that product
    And The product profile shows any optional information for that product
    And The image, name, SKU, Cost, Currenncy, and optionally IMAP is displayed for the variants
    
	   @NA
  Scenario: Variant/Child Product
  
    When A product has been added
    And Multiple variants have been added for the above product (parent)
    And The variants included an image
    And I select to view a variant product from the list

    Then The product profile shows the all the required information for that product
    And The product profile shows any optional information for that product
    And The image, name, SKU, Cost, Currenncy, and optionally IMAP is displayed for the parent product
    And The image, name, SKU, Cost, Currenncy, and optionally IMAP is displayed for the other variants (i.e. siblings)

  ########################################
  # Selecting an item in the profile panel
     @NA
  Scenario: Parent Viewed - Variant Selected
  
    When A product has been added
    And A variant has been added for the above product (parent)
    And I select to view the parent product from the list (i.e. in panel)
    And In the panel I select the above variant

    Then The variant product row is highlighted in the list
    And The variant product row is unchecked
    And The variant product is displayed in the profile panel
    
	   @NA
  Scenario: Variant Viewed - Parent Selected
  
    When A product has been added
    And A variant has been added for the above product (parent)
    And I select to view the variant product from the list (i.e. in panel)
    And In the panel I select the above parent

    Then The parent product row is highlighted in the list
    And The parent product row is unchecked
    And The parent product is displayed in the profile panel
