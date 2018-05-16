@company_setting
Feature: Happy Path Company Setting

  Background:
    Given a user is on the Venzee web site

###################################################################
  @all_test @smoke_test
  Scenario: Edit Company Setting

   Given a user and a company are registered
     And a user is logged in
    Then a user is on the Company Settings page
     And change the following information
        |Company Picture|
        |Company Name|
        |Website|
        |No. of employees|
        |Country|
        |State/Province|
        |Industry|
        |describe|
    And save the Company Settings change
    Then change are reflected on the Company Settings