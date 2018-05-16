################
# [MS] Need to be reviewed after the feature is implemented
################

@resetPassword
Feature: Reset Password


  Registered users needing to reset their password must enter their
  registered email to which a link will be sent to choose a new password
  (creating the new password is addressed in a separate script)
  
  Background:
	 Given I am on the Venzee web site
	 Then I go to reset password screen
	 
  @need
  Scenario: Forgot password - Happy path password reset
	And I am on the Login page
    Then Forgot your password
    Then Enter testpart60@gmail.com information into the email field
    Then Click button Request Password
      #Then - reset password link verification - not done on phoenix.venzee

  @ready
  Scenario: Forgot password - Invalid email entered
    And I am on the Login page
    Then Forgot your password
    Then Enter testpart60@gmail information into the email field
    Then Click button Request Password
	Then Tip message is We experienced an error. Please try again

	@ready
  Scenario: Forgot password - No email entered
    And I am on the Login page
    Then Forgot your password
    Then Click button Request Password
    Then Tip message is Email is required.

  # Profile setting password change and Reset password does not work on phoenix.venzee