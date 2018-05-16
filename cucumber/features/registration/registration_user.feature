@registration @registration_user
Feature: New User Registration

  Background:
    Given I am on the Venzee web site
    And I am on the Register page

  @ready
  Scenario: Happy path registration
    Then Enter Uname information into the firstName field
    Then Enter ULastname information into the lastName field
    Then Enter random username into the username field
    Then Enter random email into the email field
    Then Enter TestPWD12 information into the password field
    Then Enter TestPWD12 information into the passwordConfirm field
    Then Click Register button
    Then I see the Register Company page
    Then I logout from the application

  @ready
  Scenario: Partial registration, back to the public, click Go to Dashboard and resume registration
    When a user is registered
    And  I am on the Venzee web site
    And Use Venzee as Uname click
    Then I see the Register Company page

  @ready
  Scenario: Registration with empty fields
    Then Click Register button
    Then Tip message is Please enter valid name
    Then Tip message is Username is required
    Then Tip message is Email is required
    Then Tip message is Password is required
    Then Tip message is Confirm password is required.

  @ready
  Scenario: Registration with integer name
    When Enter 123456789 information into the firstName field
    Then Enter Ulastname information into the lastName field
    Then Enter random username into the username field
    Then Enter random email into the email field
    Then Enter TestPWD12 information into the password field
    Then Enter TestPWD12 information into the passwordConfirm field
    Then Click Register button    
    Then I see the Register Company page
    Then I logout from the application

  @ready
  Scenario: Registration with integer lastname
    When Enter Uname information into the firstName field
    Then Enter 123456789 information into the lastName field
    Then Enter random username into the username field
    Then Enter random email into the email field
    Then Enter TestPWD12 information into the password field
    Then Enter TestPWD12 information into the passwordConfirm field
    Then Click Register button
    Then I see the Register Company page
    Then I logout from the application

  @ready
  Scenario: username already used
    Given a user is registered
    Given a company is registered
    Then I logout from the application
    Then I am on the Venzee web site    
    Then I am on the Register page
    Then Enter Uname information into the firstName field
    Then Enter Ulastname information into the lastName field
    Then Enter the existing user username into the username field
    Then Enter the existing user email into the email field
    Then Enter TestPWD123 information into the password field
    Then Enter TestPWD123 information into the passwordConfirm field
    Then Click Register button
    Then Tip message is Username is already taken
 
  @ready
  Scenario: Invalid email registration - format
    Then Enter Uname information into the firstName field
    Then Enter Ulastname information into the lastName field
    Then Enter Username information into the username field
    Then Enter testpart6 information into the email field
    Then Enter TestPWD12 information into the password field
    Then Enter TestPWD12 information into the passwordConfirm field
    Then Click Register button
    Then Tip message is Please enter valid email

  @ready
  Scenario: Invalid email registration - duplicate
    When a user is registered
    Then a company is registered
    Then I logout from the application
    Then I am on the Venzee web site    
    Then I am on the Register page
    Then Enter Uname information into the firstName field
    Then Enter Ulastname information into the lastName field
    Then Enter random username into the username field
    Then Enter the existing user email into the email field
    Then Enter TestPWD123 information into the password field
    Then Enter TestPWD123 information into the passwordConfirm field
    Then Click Register button
    Then Tip message is Email already taken

  @ready
  Scenario: Invalid pwd registration - minimum char
    Then Enter Uname information into the firstName field
    Then Enter Ulastname information into the lastName field
    Then Enter random username into the username field
    Then Enter random email into the email field
    Then Enter TestP12 information into the password field
    Then Enter TestP12 information into the passwordConfirm field
    Then Click Register button
    Then Tip message is Password is too short

  @ready
  Scenario: Invalid pwd registration - numbers
    Then Enter Uname information into the firstName field
    Then Enter Ulastname information into the lastName field
    Then Enter random username into the username field
    Then Enter random email into the email field
    Then Enter UTestPWD information into the password field
    Then Enter UTestPWD information into the passwordConfirm field
    Then Click Register button
    Then Tip message is Password must contain at least one letter and number.

  @ready
  Scenario: Invalid pwd registration - confirmation does not match
    Then Enter Uname information into the firstName field
    Then Enter Ulastname information into the lastName field
    Then Enter random username into the username field
    Then Enter random email into the email field
    Then Enter TestPWD12 information into the password field
    Then Enter TestP1D12 information into the passwordConfirm field
    Then Click Register button
    Then Tip message is Passwords must match.

	
#-----------------------------NOT automated yet-------------------

  # Register from Invite

  #Scenario: Response to invite - Form Default

  #  If a user is registering in response to invite (i.e. cllicked link on invite email) then their email is pre-filled
  #  When I am registering in response to an invite
  #  Then My email address is pre-filled
  #  But The remainder of the form is blank

#  Scenario: Response to invite - Completion

#    If a user is registering in response to invite (i.e. cllicked link on invite email) then their email is pre-filled
#    When I am registering in response to an invite
#    Then I use the invited email address
#    Then I complete the balance of the form correctly
#    Then I press 'Done'

#    Then Based on my <Role> as per invite I should be taken to the appropriate <LandingPage>

#    Examples:
#      |Role|LandingPage|
#      |Companies send me spreadsheets|Products|
#      |I use spreadsheets to update the companies I do business with|Products|
#      |Systems critical to my business aren’t connected|Integration|
#      |I export data to multiple channels|Integration if products exists. If not, Products|
#      |Not sure|Dashboard|
  
 
    
#  Scenario: username already used - in difference case
#    When a user with username 'USER_NAME' is registered
#    Then a company is registered
#    Then I am on the Venzee web site    
#    Then I am on the Register page
#    Then I Enter 'user_name' into the username field
#    Then Tip message is Username is already taken appears


#  @happy_path @wip
#  Scenario: After login, if I go to the public web site, then click Go to Dashboard, I should see the dashboard
#    When A user is registered
#    And I a company is registered
#    And I I am on the Venzee web site
#    And I Go to Dashboard click
#    Then I see the Dashboard page
