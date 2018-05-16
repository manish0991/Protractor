@profile_setting
Feature: Happy Path Profile Setting

  Background:
    Given a user is on the Venzee web site



###################################################################
  @all_test @smoke_test 
  Scenario: Edit Profile Settings

   Given a user and a company are registered
     And a user is logged in
    Then a user is on the Profile Settings page
     And change the following information
        |Profile Picture|
        |Position|
        |phone|
     And selects a frequency times for the notification
     And save the Profile Settings change
    Then change are reflected on the Profile Settings