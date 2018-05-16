@error_page
Feature: Test error pages

    #@all_test @smoke_testing
    Scenario: Test page 404
      Given a user is on the home page
        And a user is on the Not Found page
      Then sees the 404 page

    # We didn't find an easy way to test the "no javascript" error page, do for now it won't be automated.
    #Scenario: Test error page Not supported on mobile
      #Given I have disabled javascript
      #And I am on the homepage
      #Then I should see error message "JavaScript must be turned on for the site to work"

    #@all_test @smoke_testing
    Scenario: Test error page not support on mobile

      Given a user is on the Register User page
        #And is on mobile device #resize the browser
      #Then sees a message advising him we don't support mobile devices
