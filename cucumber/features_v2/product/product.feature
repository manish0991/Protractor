@product
Feature: Happy Path Product and Collection

  Background:
    Given a user is on the Venzee web site


###################################################################
  @all_test  @smoke_test
  Scenario: Create a basic product and a variant

  # Create the parent product
   Given a user and a company are registered
     And a user is logged in
     And a user is on the Add Product via Form page
    When enter the following info
        |Collection Name|
        |Record Id|
        |Additional Specification|
     And upload an image
     And choose to add a variant
     And add this product with a variant   
    Then see the Add Variant page
    
  # Create the Variant
    When a user copy info from the parent
    When enter the following info
      |Variant Record Id|
     And add the variant

  # Validate they are in the list
    Then see the product in the product list
     And see the variant in the product list



###################################################################
  @all_test @smoke_test 
  Scenario: Edit Catalog Setting

   Given a user and a company are registered
     And a user is logged in
     #And a user is on the Product List page
     And products exist in the product list
    When a user is on the Collection Settings page
     And change the following information
        |Catalog Name|
     And save the Collection Settings change
    Then change are reflected in the product list

###################################################################
 
  @smoke_test 
  Scenario: Upload a CSV
    Given a user and a company are registered
	  And a user is logged in
      And I'm on the Add product data using a CSV file page
     When I choose to create a new collection
      And I enter a collection name
      And I share the collection with everyone
      And I provide a valid csv file
      And I submit the file
     Then I see the mapping page
      And I map the Record Id
      #And I map the Record Name
      And I map the cost
      #And I'm done mapping
     #Then I see the confirmation screen
      #And I confirm my choice
      #And I skip to upload image
     Then I see my product in the product list

###################################################################
  @all_test
  Scenario: Add images to product record

    Given a user and a company are registered
      And a user is logged in
      And products exist in the product list
    #note for later: try to use a unique collection (if already created in a previous scenario do not create a new one)
      #And the image column was mapped during CSV upload #manual testing only
      #And the existing products do not have any images uploaded #manual testing only
    
    When adds images to his product records

    Then the images are uploaded
      And sees the collection
      And each product record correctly displays the uploaded thumbnail image

###################################################################
  @smoke_test 
  Scenario: Delete source collection
    Given a user and a company are registered
      And a user is logged in
      And products exist in the product list

    When deletes the collection
    #Then the collection is removed

      And sees there are no more collection

###################################################################
  @all_test 
  Scenario Outline: Sort records
    Given a user and a company are registered
      And a user is logged in
      And added products exist in the product list

    When sorts the collection by Product ID in <order> order

    Then sees the records sorted in <order> order by Product ID

    Examples:
      | order      | 
      | ascending  |
      | descending |
###################################################################
  @all_test 
  Scenario: Images mistmatched
    Given a user and a company are registered
      And a user is logged in
      #And products exist in the product list
      And added images to his product records
    
    #When some images are mistmached
      #And requests the error file

    Then downloads a CSV file
      #And sees the mismatched filenames
##################################################################
 #@all_test @smoke_test 
 Scenario: Copy product to new collection 
    Given a user and a company are registered
      And a user is logged in
      And products exist in the product list 
	  And select the product for copy
	  
	When product copied to new collection
	   Then sees new collection at data screen
##################################################################	
 @all_test @smoke_test 
 Scenario: Copy product to existing collection 
    Given a user and a company are registered
      And a user is logged in
      And products exist in the product list
	  And added a new collection
	  
	When copy product to the existing collection
	  #Then product added to the selected existing collection
	   
#################################################################
 #@all_test @smoke_test @set
 Scenario: Copy product to new collection (From Product Update page)
    Given a user and a company are registered
      And a user is logged in
      And products exist in the product list 
	  And a user is on the Dashboard page
	  
	When selects the product
	
    Then product copied to new collection
	   And sees new collection at data screen	
	   
################################################################
@all_test @smoke_test 
 Scenario: Copy product to existing collection (From Product Update page)

    Given a user and a company are registered
      And a user is logged in
      And products exist in the product list
	  And added a new collection
	  And a user is on the Dashboard page
	  
	#When selects the product
	
	Then copy product to the existing collection
	  #Then product added to the selected existing collection 
	  
##################################################################

@smoke_test 
  Scenario: Upload a CSV with row header
    Given a user and a company are registered
	  And a user is logged in
      And I'm on the Add product data using a CSV file page
     When I choose to create a new collection
      And I enter a collection name
      And I share the collection with everyone
      And I provide a csv file  
      And I upload the file
	  And I see row where the header row is
     Then I see the mapping page
      And I map the Product Id
      #And I map the Record Name
      And I map the cost
      #And I'm done mapping
     #Then I see the confirmation screen
      #And I confirm my choice
      #And I skip to upload image
     Then I see my product in the product list	  
	  