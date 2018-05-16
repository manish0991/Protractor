@localize
Feature: Read Monthly Consumption

  Background:
    Given a user is logged to Localize

  Scenario: Read monthly consumption for 2 projects
  
    When the user is on the Website project
    Then read the number of page viewed in the last 30 days

    When the user is on the Zendesk KB project
    Then read the number of page viewed in the last 30 days

    And write localize data in the result file
