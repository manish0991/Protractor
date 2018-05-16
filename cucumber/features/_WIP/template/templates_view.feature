@Template
Feature: View Templates

  The list of user-created and Venzee-created (pre-defined) templates is provided with a
  name and creation/modification date.  The list can be filtered.  From the list templates can be:
  Edited & Deleted, Cloned and Connected
  
  Background:
  
    Given I have user-defined templates available
    And Pre-defined templates are also available
    
  Scenario: Filter to All  (Default)
    
    When The selected page appears
    Then The list of all template names are displayed
    And Date displays creation / modification dates
    And The list is sorted in ascending alpha order
    
  Scenario: Filter to User-defined
  
    When I filter to user-defined templates
    Then The list of user-defined template names are displayed
    And Date displays creation / modification dates
    And The list is sorted in ascending alpha order
    
  Scenario: Filter to Pre-defined
  
    When I filter to pre-defined templates
    Then The list of pre-defined template names are displayed
    And Date displays creation / modification dates
    And The list is sorted in ascending alpha order
    
  Scenario: Sort Fields 
  
    When I sort <FieldName> in <FieldOrder>
    Then The list is sorted and displayed accordingly
    
#    Examples:
#    |FieldName|FieldOrder|
#    |Template Name|Ascending|
#    |Template Name|Descending|
#    |Date|Ascending|
#    |Date|Descending|
    # date is a date - whether it's creation or modification date is irrelevant
    
