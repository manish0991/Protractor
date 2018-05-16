@product_import @product_mgmt
Feature: Add Product - Form

  Individual product records can be added by populating a form.
  Specs for adding a product catalog is defined separately.

  Background:
  
    Given I have chosen to add products for my organization

##########################################################################################	
  @ready
  Scenario: Product with minimum (required) info entered
  
    When An existing catalog 'chairs' is selected
    And Enter random sku into the recordid field    
    And 'Chair' is product name
    #And A CHR1234 is entered as SKU
    And A cost of '150.59' is entered
    And Currency remains the catalog default
    And IMAP policy remains the catalog default
    And 'Add this product' is selected

    Then The product details are saved
    And An alert appears saying: "'Chair' has been added"
    And The product is viewable in the product list as entered 
    And The product is viewable in the detailed product screen as entered 
    And I logout from the application  
  
##########################################################################################
  @ready
  Scenario: Minimum info + inventory / save and add another
  
    When An existing catalog 'chairs' is selected  
    And 'Big Chair' is product name
    And Enter random sku into the recordid field
    And A cost of 99350 is entered
    #And Currency is changed to Canadian
    And IMAP policy is changed to '2.24'
    #And Status is 'Discontinued'
    #And An inventory amount of 100 is entered
    And 'Save, and add another' is selected

    Then The product details are saved
    And I logout from the application
    
##########################################################################################
  @ready
  Scenario: Minimum info + available date
  
    When An existing catalog 'chairs' is selected  
    And 'Free Chair' is product name
    And Enter random sku into the recordid field
    And A cost of 0 is entered
    And IMAP policy is changed to '1.1'
    And 'Add this product' is selected

    Then The product details are saved
    And An alert appears saying: "'Free Chair' has been added"
    And The product is viewable in the product list as entered 
    And The product is viewable in the detailed product screen as entered 
    And I logout from the application
    
##########################################################################################
  @ready
  Scenario: Required + Optional Info
  
    When An new catalog named 'Tables' is created  
    And 'Coffee Table' is product name
    And Enter random sku into the recordid field
    And A cost of '230.99' is entered
    And IMAP policy is changed to '1'
    And Multiple links to videos are added
    And 'Add this product' is selected

    Then The product details are saved
    And An alert appears saying: "'Cofee Table' has been added"
    And The product is viewable in the product list as entered 
    And The product is viewable in the detailed product screen as entered  
    And I logout from the application
    
##########################################################################################
  @ready
  Scenario: Images added
  
    Given The minimum required info is entered
    And 5 or fewer JPG or PNG images are added via browsing, each under 5 MB
    And 'Add this product' is selected

    Then The product details are saved
    And An alert appears saying: "'Chair' has been added"
    And The product is viewable in the product list as entered 
    #And The first image added is the primary/default image
    And The product is viewable in the product list as entered 
    And The product is viewable in the detailed product screen as entered 
    And I logout from the application
    
##########################################################################################
    #Authentication popup displayed when I click Upload image button - Need to look for the same.
	@ready
  Scenario: Specifications added
  
    Given The minimum required info is entered
    And 10 or more specification rows
    And Each row has a field name & field value pairs added
    And 'Add this product' is selected

    Then The product details are saved
    And An alert appears saying: "'Chair' has been added"
    And The product is viewable in the product list as entered 
    And The product is viewable in the detailed product screen as entered   
    And I logout from the application
    
##########################################################################################
    @ready
   Scenario: Default IMAP and Currency values
  
    When An existing catalog 'chairs' is selected  
    
    #Then Currency defaults to the catalog's setting
    Then IMAP policy defaults to the catalog's setting  
    And I logout from the application
    
##########################################################################################
    @ready
  Scenario: New product added to first page as most recent
  
    When A catalog with over 150 products exists
    And I navigate to the last page
    And I add a product
    And I select 'add'
    
    Then the product is added to the top of the list
    And I logout from the application
   

##########################################################################################
  # Choosing Catalog
  @ready
  Scenario: Choosing Catalog - nothing entered
    Given an existing catalog named 'Table' exists for my organization
    When A catalog is being selected
    #And A catalog name has not been entered
    
    Then The list of all catalogs is displayed
    And I logout from the application
    
##########################################################################################
    @ready
  Scenario: Choosing Catalog - name match / display
    Given an existing catalog named 'Table' exists for my organization
    And an existing catalog named 'ChairsNew' exists for my organization
    And an existing catalog named 'Bike' exists for my organization
    When A catalog is being selected
    And The first few characters of a catalog name has been entered
    
    Then The list of available catalogs that start with the entered text is displayed
    And I logout from the application

##########################################################################################    
    @ready
  Scenario: Choosing Catalog - selection
    When A catalog with over 150 products exists
    When A catalog is being selected
    And The first few characters of a catalog name has been entered
    And A catalog is selected
    
    Then The details of the catalog are displayed
    And I logout from the application
  
##########################################################################################

  # Variants - full spec covered something, below is scenarios related to parent product
  @ready
  Scenario: Choosing to create variants
    
    When The required info for a product is entered
    And The option to add variants is selected
    And I click Add this product
    
    Then The product is saved
    And The 'Add product variant' screen appears 
    And I logout from the application

##########################################################################################
  # Other Scenarios - general
  
  @ready
  Scenario: Action cancelled
  
    When The required info for a product is entered
    And 'cancel' is selected

    Then The product details are not saved
    And I logout from the application
    
##########################################################################################
  # FAILURES  
     @NA
  Scenario: Image limit exceeded - start already at limit
  
    When An existing product already has the limit of 10 images
    And One or more image files is selected for upload
   
    Then The following message appears: "This product already has 10 images. Additional images are not permitted."
    And The image is not added
    
	
##########################################################################################
   @NA
  Scenario: Image limit exceeded - start below limit
  
    When An existing product has less than the limit of 10 images (e.g. it has 9)
    And Multiple image files for the existing product is selected for upload 
    And The total number of images will now exceed the limit of 10
  
    Then The following message appears: "This product will exceed the 10 image limit. Select fewer images and try again"
    And The upload is cancelled for all files
    And The images are not added
    
##########################################################################################
   @NA
  Scenario: File size limit exceeded - single file
  
    When An existing product does not have any images
    And Multiple image files for that record are selected for upload
    And At least one of the image file exceeds 10MB
    
    Then The following message appears: "One or more of the selected files exceeds the 5MB size limit."
    And The valid images files are uploaded
   
##########################################################################################
   #Invalid Scenario
      @NA
  Scenario: Duplicate SKU attempted
  
    When Products exist
    And A new product is added with the SKU of an existing product
    #And The required fields are completed
    And I click Add this product
    
    Then The following message appears: "The SKU is not unique."
    #And The valid images files are uploaded
    And I logout from the application