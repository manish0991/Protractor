@filestack
Feature: Read Monthly Consumption

  Background:
    Given a user is logged to Filestack

  Scenario: Read monthly consumption for 4 environment
  
    When the user is on the PROD application
    Then read the number of images uploaded to date

    When the user is on the QA application
    Then read the number of images uploaded to date
     
    When the user is on the DEV application
    Then read the number of images uploaded to date
     
    When the user is on the SANDBOX application
    Then read the number of images uploaded to date

    And write filestack data in the result file
