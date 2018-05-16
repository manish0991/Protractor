@ExportFile
Feature: Export Product Data - File Download

  Export of product records from any source (original, template transformation) as file 
  in one of the support formats
  
  Scenario: Successful export of original product inventory
  
    Export of products as uploaded; meaning the records have not undergone
    any transformation
  
    Given I have chosen to export original inventory
    When I select <InventoryAmount> from the list
    And The selected inventory crosses catalogs that don't have all fields in common
    # e.g. products in a catalog 1 have a field named 'Description' and products in
    # catalog 2 have a field named 'Product Description' not on product 1
    And Choose the <ExportFormat>
    And I select the 'Export' action
        
    Then I'm sent a link to my registered email to download the file when its generated
    And The product file is generated in the <ExportFormat>
    And The contents of the file match the original product records in Venzee
    And All field names presented in the inventory are in the field
    # e.g. Fields 'Description' and 'Product Description' are in the file
    And The event is registered in Intercom #https://venzeedev.atlassian.net/wiki/pages/viewpage.action?pageId=16449617    
    
#    Examples:
#    |InventoryAmount|ExportFormat|
#    |Some|JSON|
#    |All|CSV|
    
  Scenario: Successful export of transformed product inventory
  
    Export of products generated from a template
  
    Given I have chosen to export transformed product records
    When I select <InventoryAmount> from the list
    And The selected inventory crosses templates that don't have all fields in common
    # e.g. products in a template 1 have a field named 'Description' and products in
    # template 2 have a field named 'Product Description' not on product 1
    And Choose the <ExportFormat>
    And I select the 'Export' action
        
    Then I'm sent a link to my registred email to download the file when its generated
    And The product file is generated in the <ExportFormat>
    And The contents of the file match the transformed product records in Venzee
    # e.g. Fields 'Description' and 'Product Description' are in the file
    And The event is registered in Intercom #https://venzeedev.atlassian.net/wiki/pages/viewpage.action?pageId=16449617    
    
#    Examples:
#    |InventoryAmount|ExportFormat|
#    |Some|JSON|
#    |All|CSV|
    
  Scenario: Export Link Expired
    
    Given A link was generated over 24 hrs ago
    And I access that link
    
    Then I receive a message indicating the link has expired
