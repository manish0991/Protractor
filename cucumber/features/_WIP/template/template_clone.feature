@Template
Feature: Clone Template

  Cloning is a combination of editing and creating a template. The Create Template page appears pre-populated,
  The name defaults to 'Clone of <existing page name>'. Otherwise the page functions exactly as Create Template
  
  Background:
  
    Given I have chosen to clone an existing template
    
  Scenario: Default
  
    When The Clone page appears
    Then The template name defaults to "Clone of <selected template's name">
    And The other fields in the template appear as last saved
  
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
    And The cloned new template is available with the new name
    And the 'creation date' is current
    
  Scenario: Template clone cancelled
  
    When Clone template is 'cancelled'
    
    Then The template is  not created
    And I am returned to the View Templates page
    And the template does not appear in the list
    
 
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
