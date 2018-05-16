@profile_settings
Feature: Profile - change password

  As a signed-in user I want to update my password to access the application

  Background:
    Given I have signed into Venzee application
    And I visit profile page
    
  @ready
  Scenario: Valid password changed and confirmed
    Given Enter 1qaz!QAZ information into the currentPassword field
    Given Enter NewPassw0rd information into the newPassword field
    And Enter NewPassw0rd information into the confirmNewPassword field
    And I save the changed password
    
    Then Success! You have changed your password displayed
    And I can logout and login with new password
	#(New Password = NewPassw0rd)
	And I Change the Password to default
	And I logout from the application
    
  #FAILURES
  @ready
  Scenario: Invalid pwd  - minimum char
    Given Enter TestP12 information into the newPassword field
    And Enter TestP12 information into the confirmNewPassword field
    And I Clicked on change-password
	
    Then Tip message is Password is too short
	And I logout from the application
	
  @ready
  Scenario: Invalid pwd  - numbers
    Given Enter UTestPWD information into the newPassword field
    And Enter UTestPWD information into the confirmNewPassword field
    And I Clicked on change-password
    
    Then Tip message is Password must contain at least one letter and number.
	And I logout from the application
	
  @ready
  Scenario: Invalid pwd  - confirmation does not match
    Given Enter TestPWD12 information into the newPassword field
    And Enter TestP1D12 information into the confirmNewPassword field
    And I Clicked on change-password
    
    Then Tip message is The two passwords must match
	And I logout from the application
