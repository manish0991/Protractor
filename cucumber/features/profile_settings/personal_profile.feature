@profile_settings
Feature: Update Personal Profile

  As a signed-in user I want to update my personal information: picture, name, role, email, phone #
  Also Venzee language

  Background:
    Given I have signed into Venzee application
    And I visit profile page

  @ready
  Scenario: Change personal profile
    Given I browse and select a JPG or PNG file for my image
    And I change my firstName to 'FName'
    And I change my lastName to 'LName'
    #And I change my position to '416 123-4567'
    And I change my email to 'fname.lname@venzee.com'
    And I select 'Save Changes'
    
    Then my profile is changed as setup above
    And when I leave the profile page and return the above settings remain
	And I logout from the application
  
  @ready
  Scenario: Change language
    Given I select to change my language from its current setting
    And I select 'Save Changes'
    
    Then The language of my profile page is changed
    #And when I leave browse the Venzee app the language is changed
    And when I logout and login, the Venzee size and app appear in the new languge
	And I Change the language to english
	And I select 'Save Changes'
	And I logout from the application
	
  @ready
  Scenario: Email format invalid
    Given I change my email to 'fname.lname@venzee'
    And I select 'Save Changes'
    
    Then A message appears indicating the email format is incorrect
	And I logout from the application
    
  # FAILURE
  @defect
  Scenario: Image too large
    Given I browse and select a FiveMB.jpg image
    #And The select images > 5MB
     
    Then A message appears indicating the file size is too large
  
  # FAILURE 
  @defect
  Scenario: Image incorrect format 
    Given I browse and select a TiffExample.tiff image
    
    Then A message appears indicating the file format is incorrect