@account_settings
Feature: Integrations / API Keys

  API keys can be generated to enable integrations with external applications.
  
  Background:
  
    Given I am an Admin
    And I want to manage integrations
    
  Scenario: Generate 1st Key
  
    When I have no generated keys
    And I select to generate a new key
    
    Then A random alpha-numeric key-string is automatically generated
    And A description between 1 and 100 alpha-numeric characters can be entered
    And The key is saved when 'save' is selected
    
  Scenario: List Existing Key
  
    When A key exists
    
    Then The date stamp appears as follows for each key:  "Created by [user email] mmm dd, yyyy" #e.g. Nov 23, 2014
    And The description of each key appears
  
  Scenario: Edit Key Description
  
    When A key exists
   
    Then The description can be edited (between 1 and 100 alpha-numeric characters)
    
   
  Scenario: Copy Key
  
    When A key exists
    And 'Copy Key' is selected
    
    Then The key is copied to the computers clipboard
   
   
  Scenario: Delete Key
  
    When A key exists
    And 'Delete Key' is selected
    
    Then A confirmation prompt appears saying: "Are you sure you want to delete this key?"
    And When the prompt is confirmed, the key is deleted
    And An alert appears saying: "Your API key has been deleted"
  
 
