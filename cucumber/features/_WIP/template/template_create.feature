@Template
Feature: Create Template

  A template defines the fields names (i.e. attributes) that users require for other systems.
  
  Background:
  
    Given I have chosen to create a new template
    And No template rows have been added
    
  Scenario: Successful creation of template
  
    When new field rows are added with <FieldNames> using 'add a row'
    And Each field row's label is 1 to 30 alpha-numeric characters
    And The template name is unique
    And The template name is between 1 and 75 alpha-numeric characters
    And The template is 'saved'
    
    Then a new template should be created
    And I am returned to the View Templates page
    And The created template is available
    And the 'creation date' is current
    
#    Examples:
#    |FieldNames|
#    |Name|
#    |SKU|
#    |Cost|
#    |Status|
#    |Specification|
    
  Scenario: Template creation cancelled
  
    When The template is 'cancelled'
    Then I am returned to the View Templates page
    
  ###################################
  # Invalid information
  Scenario: Template name used
  
    When at least 1 field row is added
    And Each field row's label is 1 to 30 alpha-numeric characters
    And The template name is not unique for this organization
    And The template is 'saved'
    
    Then the following message appears: "The template name has already been used."
    
  Scenario: Template name too long
  
    When at least 1 field row is added
    And Each field row's label is 1 to 30 alpha-numeric characters
    And The template name is longer than 75 characters
    And The template is 'saved'
    
    Then the following message appears: "The template name must be be 75 characters or less."
    
  Scenario: Template name missing
  
    When at least 1 field row is added
    And Each field row's label is 1 to 30 alpha-numeric characters
    And The template name is blank
    And The template is 'saved'
    
    Then the following message appears: "A template name must be entered."

  Scenario: Field name too long
  
    When at least 1 field row is added
    And at least one field row's label is greater than 30 characters
    And A valid template name is entered
    And The template is 'saved'
    
    Then the following message appears: "Each field must be be 30 characters or less."
    
  Scenario: Field name is blank
  
    When at least 1 field row is added
    And at least one field row's label is empty
    And A valid template name is entered
    And The template is 'saved'
    
    Then the following message appears: "A name must be provided for each field."
