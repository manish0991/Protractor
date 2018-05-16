@Template
Feature: Edit Template

  Edit Template works exactly like Create Template, except the screen is pre-populated, a template can be deleted, and 
  the list of connected organizations is provided.  This majority of Scenarios in this feature file should be kept in 
  sync with 'Create Template'
  
  Background:
  
    Given I have chosen to edit an existing template
    
  
  Scenario: Default
    
    When The selected template appears
    Then The fields in the template appear as last saved
    
  Scenario: Template fields change
  
    When A field name is changed to a valid description
    And A field row is added with a valid descripiton
    And A field row is deleted
    And The template is 'saved'
    
    Then The template should be saved
    And I am returned to the View Templates page
    And the 'modified date' is current
    And the saved template reflects the changes
    
  Scenario: Template name changed
    
    When The template name is changed to something unique for this organization
    And The template name is between 1 and 75 alpha-numeric characters
    And The template is 'saved'
    
    Then The template should be saved
    And I am returned to the View Templates page
    And The modified template is available with the new name
    And the 'modified date' is current
    
  Scenario: Template edit cancelled
  
    When The a field name is changed
    And A field row is deleted
    And A field row is added
    And The template is 'cancelled'
    
    Then The template remains unchanged
    And I am returned to the View Templates page
    
   Scenario: Template Deletion
  
    When The templates is deleted
    
    Then A message appears saying: "Are you sure you want to delete this template?"
    And After confirming I am returned to the View Templates page
    And The template is no longer available
    
  Scenario: Template Deletion is Canclled 
  
    When The templates is deleted
    
    Then A message appears saying: "Are you sure you want to delete this template?"
    And After cancelling the action I am returned to the Edit Templates page
    
    
  ###################################
  # Invalid information
  Scenario: Template name used
  
    When The template name is changed to something not unique for this organization
    And The template is 'saved'
    
    Then the following message appears: "The template name has already been used."
    
  Scenario: Template name too long
  
    When The template name is changed to something longer than 75 characters
    And The template is 'saved'
    
    Then the following message appears: "The template name must be be 75 characters or less."
    
  Scenario: Template name missing
  
    When The template name is cleared
    And The template is 'saved'
    
    Then the following message appears: "A template name must be entered."

  Scenario: Field name too long
  
    When At least one field row's label is changed to greater than 30 characters
    And A valid template name is entered
    And The template is 'saved'
    
    Then the following message appears: "Each field must be be 30 characters or less."
    
  Scenario: Field name is blank
  
    When At least one field row's label is cleared
    And A valid template name is entered
    And The template is 'saved'
    
    Then the following message appears: "A name must be provided for each field."
