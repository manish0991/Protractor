@search
Feature: Search Product

    From any page in the app a search can be conducted for product records (original or transformed).

    The search is based on any of the standard fields:

      Name, SKU/ID, Cost, IMAP Cost, Status, Partner/Vendor
      Also searched are any 'custom' fields that appear in a product specification.

  Background:
  
    Given I have created original products
    And I have created transformed products
        

  Scenario: Search from Product Page - Standard Fields
  
    When I access product page
    And I conduct a search based on <ProductField>
  
    Then the matching products are displayed based on partial of whole match
    And the match results show matches from any product field
    And the match results show original records
    And the match results show transformed records
    
 #   Examples:
 #     |ProductField|
 #     |Name|
 #     |SKU/ID|
 #     |Cost|
 #     |IMAP Cost|
 #     |Status|
 #     |Partner/Vendor|
      
  Scenario: Search from Any Page - Non-standard fields
  
    When I add products that have custom (i.e. non-standard fields) #field loaded as product specs
    And I access the <SearchFromPage>
    And I conduct a search based on the contents of the specification
  
    Then the matching products are displayed based on partial of whole match
    And the match results show matches from the spec field
    And the match results show original records
    And the match results show transformed records
    
#     Examples:
#      |SearchFromPage|
#      |Dashboard|
#      |AccountSettings|
#      |Integrations|
#      |UserManagement|
#      |Billing|
#      |Partners|
