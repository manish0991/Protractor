@zapier
Feature: Read Monthly Consumption

  Background:
    Given a user is logged to Zapier

  Scenario: Read monthly consumption for 2 projects
  
    When click on the avatar
    Then read the number of tasks done in the last 30 days

    And write Zapier data in the result file
