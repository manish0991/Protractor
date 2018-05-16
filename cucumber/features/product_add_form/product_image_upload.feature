@product_import @Product_Image_Upload
Feature: Product and Product Image File Upload
  
  Individual images files for a particular product or variant can be uploaded using the browser's standard file select/open dialog.
  Filenames must match that provided in CSV in order to be associated with a product.
  Filenames that don't match that provided in the CSV are ignored.
  
  Max 10 images, of 5MB each. The first image listed (in CSV) is considered the main image
  
  Background:
  
    Given I am on Venzee website
    And I am in the Product page
    And I choose to upload product images
  
  # ADD  - HAPPY PATH
     @NA
  Scenario: New Images - Single Image
  
    When Product records containing image filenames are already uploaded (in CSV file)
    And The CSV contained only single image products
    And The image column was mapped during CSV upload
    And The existing products do not have any images uploaded
    And I select to upload the images for the above CSV
    
    Then the images are uploaded
    And Each product record correctly displays the uploaded image
  
     @NA
  Scenario: New Images - Multiple Images
  
    When Product records containing image filenames are already uploaded (in CSV file)
    And The CSV contained multi-image products #note: first filename in CSV is treated as the primary
    And Each product has under 10 images
    And The image column was mapped during CSV upload
    And The existing products do not have any images uploaded
    And I select to upload the images for the above CSV
    And Each file is under 5MB
    
    Then the images are uploaded
    And Each product record correctly displays the uploaded images
    And The first image (from CSV) is the main image
  
  # UPDATE - HAPPY PATH
     @NA
  Scenario: Existing images replaced
  
    When Product records contain multiple exisitng images
    And I select to upload the images for products in the catalog
    And the filenames match existing names (uploaded in the original CSV)
    
    Then the images are uploaded
    And the existing product images are replaced
    And Each product record correctly displays the uploaded images
   
  # IMAGE COMPRESSION (THUMBNAILS) - HAPPY PATH (TBD based on Filepicker support)
     @NA
  Scenario: Image compression not required
  
    When Product records containing image filenames are already uploaded (in CSV file)
    And The CSV contained only single image products
    And The image column was mapped during CSV upload
    And The existing products do not have any images uploaded
    And I select to upload the images for the above CSV
    And Both the height and width of the images do not exceed 300 pixels
    
    Then The compressed version of the images are a duplicate of the original
    And Each product record correctly displays the uploaded images
  
     @NA
  Scenario: Compression based on height 
  
    When Product records containing image filenames are already uploaded (in CSV file)
    And The CSV contained only single image products
    And The image column was mapped during CSV upload
    And The existing products do not have any images uploaded
    And I select to upload the images for the above CSV
    And The height of the images exceed 300 pixels
    And The height of the images is greater than their width
    
    Then The images are compressed to 300h x [width / (original height / 300)]  
    And Each product record correctly displays the uploaded images
  
     @NA
  Scenario: Compression based on width
  
    When Product records containing image filenames are already uploaded (in CSV file)
    And The CSV contained only single image products
    And The image column was mapped during CSV upload
    And The existing products do not have any images uploaded
    And I select to upload the images for the above CSV
    And The width of the images exceed 300 pixels
    And The width of the images is greater than their width
    
    Then The images are compressed to 300w x [height / (original width / 300)]  
    And Each product record correctly displays the uploaded images

	   @NA
  Scenario: Filename not found
  
    When Product records containing image filenames are already uploaded (in CSV file)
    And The CSV contained only single image products
    And The image column was mapped during CSV upload
    And The existing products do not have any images uploaded
    And I select to upload the images for the above CSV
    And the selected file names do not match the CSV
    
    Then no product images are uploaded
    And no messaging appears
    And Each product record displays no images

  # INVALID  
     @NA
  Scenario: File size limit exceeded - single file
  
    When The existing products do not have any images uploaded
    And I select to upload the images
    And I selected multiple image files for an existing product
    And At least one of the image file exceeds 5MB
    
    Then The following message appears for each invalid image: "One or more of the selected files exceeds the 5MB size limit."
    And The valid images files are uploaded
    And Each product record correctly displays the uploaded images
  
     @NA
  Scenario: File number limit exceeded - start already at limit
  
    When An existing product already has the limit of 10 images
    And I select to upload images 
    And One or more image files for the existing product is selected for upload
    
    Then The following message appears: "Product Image already has 10 images. Additional images are not permitted."
  
     @NA
  Scenario: File number limit exceeded - start below limit
  
    When An existing product has less than the limit of 10 images (e.g. it has 9)
    And I select to upload multiple images 
    And The total number of images will now exceed the limit of 10
    
    Then The following message appears: "Product Image will exceed the 10 image limit. Select fewer images and try again"
    And The upload is cancelled for all files
  
     @NA
  Scenario: Invalid file types - images and otherwise
    
    When The existing products do not have any images uploaded
    And I select to upload the images
    And I select a TIFF file  #unsupported
    And I select a BMP file #unsupported
    And I select a GIF file #unsupported
    And I select a PDF file #unsupported
    And I select a DOCX file #unsupported
    And I select a TXT file #unsupported
    
    Then The following message appears for each invalid file: "This file type is not supported"

  
