@product_mgmt
Feature: Add Variants - added from/after adding a parent

  Variants are the same as products.  However variants have a parent id / reference.
  The spec for products covers the core of adding variants. This spec addresses nuances of variants.

  Background:
  
    Given I have chosen to add products via form

   @NA	
  Scenario: Add Variants - parent pre-selected - info copied (display test)
  
    When I choose to add a parent product 
    And I select the 'add variants' option
    And In the 'Add Variant' screen I select 'copy info from parent'

    Then The screen is populated with the parent products information
    And The parent product's images are copied
	
    @NA
  Scenario: Add Variants - parent pre-selected - info copied and unchanged - saved
  
    When I choose to add a parent product
    And I select the 'add variants' option
    And In the 'Add Variant' screen I select 'copy info from parent'
    And I don't change the values in any of the fields
    And I keep the existing images
    And I select 'Add' 

    Then The variant is added to the product list under the parent
    And The variant field values are as above #matching the parent
    And The parent product remains as original
       
	   @NA
  Scenario: Add Variants - parent pre-selected - info copied and changed - saved
  
    When I choose to add a parent product
    And I select the 'add variants' option
    And In the 'Add Variant' screen I select 'copy info from parent'
    And I change the values for all of the fields
    And I remove the existing images
    And I add new images
    And I select 'Add' 

    Then The variant is added to the product list under the parent
    And The variant field values are changed as edited above
    And The parent product field values remain unchanged
    
	   @NA
  Scenario: Add Variants - parent pre-selected - info not copied - saved
  
    When I choose to add a parent product
    And I select the 'add variants' option
    And I add the required information
    And I added the optional information
    And I add new images
    And I select 'Add' 

    Then The variant is added to the product list under the parent

  ####################################
  # Add variant without preselection  
  # same as above Scenarios except a parent has to be selected first
  
     @NA
  Scenario: Add Variants - parent not selected - display

    When I add a Product name 'ParentProduct' to catalog 'ParentCat'
    And I choose to add a variant
    And I search for 'ParentProduct' as the parent product
    And I select 'Next'
 
    Then The 'Add Variant' screen appears for 'ParentProduct'
	
     @NA
  Scenario: Add Variants - parent not selected - info copied and changed - saved

    When I add a Product name 'ParentProduct' to catalog 'ParentCat'
    And In the 'Add Variant' screen I select 'copy info from parent'
    And I name the vairant 'ChildProduct'
    And I change the values for the remaining fields
    And I remove the existing images
    And I add new images
    And I select 'Add' 

    Then The variant is added to the product list under the parent
    And The variant field values are changed as edited above
    And The parent product field values remain unchanged
    
  #########################################
  # Add variant from product profile panel

     @NA
  Scenario: Add Variants - From Parent Profile Panel

    When I am viewing a parent product profile (from list)
    And From the profile panel I choose to add a variant
    And I add the variant on the product takeover form
 
    Then variant is added to the product list
    And The variant product is highlighted in the list
    # i.e. user sees / has the newly added variant product added
  
