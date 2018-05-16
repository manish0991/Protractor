@registration
Feature: Happy Path Registration

  Background:
    Given a user is on the Venzee web site

  @all_test 
  Scenario: Successful user & company registration
  
  # Register the user
   Given a user is on the Register User page
    When enter the following info
        |firstname|
        |lastname|
        |email|
        |company name|
        |phone|
        |password twice|
     And register the user
    Then sees the Nav Menu page
      And sees the following info in the profile settings page
        |firstname|
        |lastname|
        |email|
        |phone|
      And sees the following info in the company settings page
        |company name|
        |company domain|


###################################################################
  @all_test
  Scenario: Successful login using email

    Given a user and a company are registered
      And a user is on the Login page
     When enter valid credential
      And Login to the application
     Then see the Products page

  @all_test
  Scenario: email already taken
  Given a user is on the Register User page
    And already created an account with his email address
  When enters the following info
        |firstname|
        |lastname|
        |email|
        |company name|
        |phone|
        |password twice|
  Then sees an error message saying the email is already taken

  @all_test
  Scenario: Create a new company
  Given a user and a company are registered
    And a user is on the Dashboard overview page
  When adds a company and adds the following information 
        |company name|
        |phone|
  Then the company is created
    And sees the following info in the company settings page
        |company name|
        |company domain|