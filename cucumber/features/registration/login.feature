@registration @login
Feature: Login

  Background:
    Given I am on the Venzee web site
    And I am on the Login page

  @ready
  Scenario: Successful login using username
    Given a user is registered
    And a company is registered
    Then I logout from the application
    And I am on the Venzee web site    
    And I am on the Login page
    Then Enter the existing user's username into the username field
    #Then Enter the exisiting user's password into the password field
    Then Enter TestPWD123 information into the password field
    Then I Login
    Then I see the Products page
    Then I logout from the application

    #Then I based on my Role I should be taken to the appropriate LandingPage
    #  |Role|LandingPage|
    #  |Companies send me spreadsheets|Products|
    #  |I use spreadsheets to update the companies I do business with|Products|
    #  |Systems critical to my business aren’t connected|Integration|
    #  |I export data to multiple channels|Integration if products exists. If not, Products|
    #  |Not sure|Dashboard|

  @ready
  Scenario: Successful login using email
    Given a user is registered
    And a company is registered
    Then I logout from the application
    And I am on the Venzee web site    
    And I am on the Login page
    Then Enter the existing user's email into the username field
    #Then Enter the existing user's password into the password field
    Then Enter TestPWD123 information into the password field
    Then I Login
    Then I see the Products page
    Then I logout from the application
    #-- Then I based on my <Role> I should be taken to the appropriate <LandingPage>

	   @NA
  Scenario: Successful login - response to invite

   # After successfully logging in I'm taken to the landing page / dashboard
  #and join the organization of the inviter

    #all the criteria for a valid login
    #When A registered email address is entered
    #And A valid password is entered
    #And 'Done' is selected

    #Then I join the organization of the inviter
    #And Based on my <Role> I should be taken to the appropriate <LandingPage>

    #Examples:
    #  |Role|LandingPage|
    #  |Companies send me spreadsheets|Products|
    #  |I use spreadsheets to update the companies I do business with|Products|
    #  |Systems critical to my business aren’t connected|Integration|
    #  |I export data to multiple channels|Integration if products exists. If not, Products|
    #  |Not sure|Dashboard|

  @ready 
  Scenario: Invalid Log In - No credential
    Then I Login
    Then Tip message is Username is required.
    Then Tip message is Password is required.

  @ready
  Scenario: Invalid Log In - wrong credential
    Then Enter invalidlogin@venzee.com information into the username field
    Then Enter TestPWD12 information into the password field
    Then I Login
    Then The error message is Invalid user credentials provided.

  @ready 
  Scenario: Invalid Log In - password too short
    Then Enter wrongcredential@venzee.com information into the username field
    Then Enter TestPWD information into the password field
    Then I Login
    Then Tip message is Password is too short

  @ready 
  Scenario: Invalid Log In - password without number
    Then Enter invalidlogin@venzee.com information into the username field
    Then Enter TestPWDaaa information into the password field
    Then I Login
    Then Tip message is Password must contain at least one letter and number.

  @ready 
  Scenario: Invalid Log In - without password
    Then Enter invalidlogin@venzee.com information into the username field
    Then I Login
    Then Tip message is Password is required.
