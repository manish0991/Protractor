@ExportFile
Feature: Export Product Images - File Download

  Original product images can be exported from inventory or transformed/templated products.
  Users are emailed a link to the generated ZIP file that contains original main and secondary images
  in their original file name and format.  ZIP file folder structure reflects source name (e.g. vendor Samsung) and catalog
  
  Scenario: Successful export of original images from inventory
  
    Export of products images from a source (e.g. vendor) that has multiple catalogs
  
    Given I have added products for multiple brand (catalogs) for <ProductSource>
    And the products have main and secondary images
    And I have chosen to export original images
    
    When I select products from the list accross multiple catalogs for <ProductSource>
    And I select the 'Export' action
        
    Then I'm sent a link to my registered email to download the zip file when its generated
    And The extracted contents of the file are in separate folders per source and catalog
    #e.g. Samsung\Televisions and Samsung\Smartphones
    And The images are in their original name, type and size 
    And The event is registered in Intercom #https://venzeedev.atlassian.net/wiki/pages/viewpage.action?pageId=16449617    
    
 #   Examples:
 #   |ProductSource|
 #   |Same source/supplier|
 #   |Multiple sources/supplier| 
        
        
  Scenario: Successful export of original images from templates
  
    Export of products from a template (e.g. vendor) that has multiple catalogs
  
    Given I have added products for multiple brand (catalogs) for <ProductSource>
    And the products have main and secondary images
    And the products have been transformed using a template
    And I have chosen to export template images
    
    When I select products from the list accross multiple catalogs for <ProductSource>
    And I select the 'Export' action
        
    Then I'm sent a link to my registered email to download the zip file when its generated
    And The extracted contents of the file are in separate folders per source and catalog
    #e.g. Samsung\Televisions and Samsung\Smartphones
    And The images are in their original name, type and size 
    And The event is registered in Intercom #https://venzeedev.atlassian.net/wiki/pages/viewpage.action?pageId=16449617    
    
 #   Examples:
 #   |ProductSource|
 #   |Same source/supplier|
 #   |Multiple sources/supplier|
    
  Scenario: Export Link Expired
    
    Given A link was generated over 24 hrs ago
    And I access that link
    
    Then I receive a message indicating the link has expired
