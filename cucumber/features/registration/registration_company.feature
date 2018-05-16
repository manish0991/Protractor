@registration @registration_company
Feature: Company and Role Registration

  Background:
    Given I am on the Venzee web site
    And a user is registered

  @ready
  Scenario: Successful company and role registration w/ Logo
    Then Enter CucumberCorp information into the company field
    Then Enter random domain into the domain field
	Then Enter http://qa.venzee.com information into the website field
    Then Upload logo FiveMB.jpg
	Then select the type of industry I'm working in
    Then select what best describes my Company
    Then set up my company
    Then I see the Products page
    Then I logout from the application

  @ready
  Scenario: Successful company and role registration w/o Logo
    Then Enter CucumberCorp information into the company field
    Then Enter random domain into the domain field
	Then Enter http://qa.venzee.com information into the website field
    Then select the type of industry I'm working in
    Then select what best describes my Company
    Then set up my company
    Then I see the Products page
    Then I logout from the application

  @ready
  Scenario: No role selected when registering a company
    Then Enter CucumberCorp information into the company field
    Then Enter random domain into the domain field
    Then Enter http://cucumber.com information into the website field
    Then select the type of industry I'm working in
    Then click set up my company
    Then The error message is Please select what best describes your company
    Then I logout from the application 

  @ready
  Scenario: No industry selected when registering a company
    Then Enter CucumberCorp information into the company field
    Then Enter random domain into the domain field
    Then Enter http://cucumber.com information into the website field
    Then click set up my company
    Then Tip message is Industry is required.
    Then I logout from the application 

  @ready
  Scenario: Company domain matches existing user name
    Then Enter the existing user's username into the domain field
    Then Tip message is Company domain matches existing username
    Then I logout from the application 

  @ready
  Scenario: Company domain matches existing company domain
    And a company is registered
    Then register a new user
    Then Enter the existing user domain into the domain field
    Then Tip message is Company domain is unavailable
    Then I logout from the application

#  Scenario: Logo bounders - too large (>3 MB)
#    Then Enter Venzee information into the company field
#    Then Enter venzeecom information into the domain field
#    Then Best describes me Companies send me spreadsheets
#    Then Upload logo "c:\Users\Aleksei\Pictures\Venzee\Image3_02MB.jpg"
#    Then Wrong image size message
#    Then Base URL
#    Then Logout click 

@ready
  Scenario: Logo bounders - close to max (~2.99 MB)
    Then Enter CucumberCorp information into the company field
    Then Enter random domain into the domain field
	Then Enter http://qa.venzee.com information into the website field
    Then Upload logo TwoPointNine.jpg
	Then select the type of industry I'm working in
    Then select what best describes my Company
    Then set up my company
    Then I see the Products page
    Then I logout from the application

  #additional
#Then Then I should be taken to a landing page to await email verification
#And I should receive an email with a link to verify my address