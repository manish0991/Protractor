# coding: utf-8
@language_bar
Feature: Multi-language tests     

  #@ready 
  #Scenario: Verify that default language is the user's browser language
  #  Then the default language is English
  #  Then web page should be in English


  #@smoke_test 
  Scenario Outline: Verify the language switch on the public website
    Given a user is on the home page
	#venzee.com 
    When changes language to <language> 
    Then sees the home page in <language> 

    Examples: 
      #| language  |
      |English|
      |Español|
      |Português|
      #| Français  | not implemented yet

  #@smoke_test 
  Scenario Outline: Verify the language switch on the dev portal
    Given the user is on the Dev portal home page #developer.venzee.com 
    When changes language to <language> 
    Then sees the home page in <language> 

    Examples: 
      | language  |
      | English   |
      | Español   |
      | Português |
      #| Français  | not implemented yet

  #@smoke_test
  Scenario Outline: Switch language in user profile settings
    Given a user and a company are registered
      And a user is logged in
      And a user is on the Profile Settings page
    When changes the language to <language> 
    Then sees the Profile Settings page in <language> 

    Examples: 
      | language  |
      | English   |
      | Español   |
      | Português |
      #| Français  | not implemented yet