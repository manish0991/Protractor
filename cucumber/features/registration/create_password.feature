################
# [MS] Need to be reviewed after the feature is implemented
################


#  The following Scenarios cover actually setting new password after reset email received
#  (covered in a separate script)
  Feature:Create New Password
#  
#  Background:
#      Creating a new password completes the login process and user is taken
#      to landing page / dashboard
#      
#      Given I've clicked the email link to reset password
#      And I've landed on the 'Create Password' page
 
  Background:
	 Given I am on the Venzee web site
	 Then I go to reset password screen

   @NA      
  Scenario: Create new password successfully
	And I apply for new password
	And I redirect to check my email
	And I open the given Link
    When I enter a new password that is between 10 and 255 characters
    And The new password contains at least 2 upper letters
    And The new password includes at least 2 digits
    And the confirmed password matches the new password
    Then I should be logged in and directed to the <LandingPage> appropriate for my <Role>
  
#    Examples:
#    |Role|LandingPage|
#    |Companies send me spreadsheets|Products|
#    |I use spreadsheets to update the companies I do business with|Products|
#    |Systems critical to my business aren’t connected|Integration|
#    |I export data to multiple channels|Integration if products exists. If not, Products|
#    |Not sure|Dashboard|
    
  ###################################
  # Invalid new passwords  
     @NA
  Scenario: Invalid password entered - minimum characters
    
    When The password is less than 10 characters
    Then I should receive the following error message: 
    """
    Password must be at least 10 characters, including 2 uppercase letters and at least 2 digits.
    """
     @NA
  Scenario: Invalid password entered - case
    
    When The password does not contain at least 2 uppercase letters
    Then I should receive the following error message: 
    """
    Password must be at least 10 characters, including 2 uppercase letters and at least 2 digits.
    """
         @NA
  Scenario: Invalid password entered - numbers
    
    When The password does not include at least 2 digits
    Then I should receive the following error message: 
    """
    Password must be at least 10 characters, including 2 uppercase letters and at least 2 digits.
    """
 
  ####   
     @NA
  Scenario: Confirmed password does not match
  
    When I enter a new password that is between 10 and 255 characters
    And The new password contains at least 2 upper letters
    And The new password includes at least 2 digits
    And the confirmed password does not match the new password
    Then I should receive the following error message: "The passwords do not match."
