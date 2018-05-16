@user_mgmt
Feature: Group Management - Add users

  As an Admin, I want to add members/users to groups for easier filtering.
  
  Background:
  
    Given I am an admin
    And I have several users in my organization
    And I have chosen to view users in my organization
       @NA
  Scenario: First Group Saved
  
    When No groups exists
    And I select one of my members
    And I choose to add them to a group
    And I name that group "Group1"
    And I save
    
    Then An alert appears saying "1 user has been added 'Group1'." 
    And In the user list "Group1" is listed for each of the selected members
  
     @NA
  Scenario: Saved to multiple groups
  
    When 2 groups exists (i.e. "Group1" and "Group2")
    And I select some of my members that don't belong to a group
    And I choose to add them to a group
    And I add them to the existing groups
    And I save
    
    Then An alert appears saying "# users has been added 'Group1' and 'Group2'."  
    And In the user list "Group1" and "Group2" is listed for each of the selected members
  
     @NA
  Scenario: Saved to multiple groups and a new group
  
    When 2 groups exists (i.e. "Group1" and "Group2")
    And I select some of my members that belong to "Group1", "Group2" and no groups
    And I choose to add them to a group
    And I add them to the existing groups
    And I also add to a new group: "Group3"
    And I save
    
    Then An alert appears saying "# users has been added 'Group1','Group2', and 'Group3'."  
    And In the user list "Group1", "Group2" and "Group3" is listed for each of the selected members
  
  ##################
  # Display
     @NA
  Scenario: Display - No group exists
  
    When No groups exists
    And I select some of my members
    And I choose to add them to a group

    Then No list of existing groups appear
    And A field to name a new group appears
 
    @NA
  Scenario: Display - Groups exists
  
    When No groups exists
    And I add 1/3 of my members to "Group1"
    And I add 1/3 of my member to "Group2"
    And I choose to add the balance of my members to a group

    Then A list of existing groups is presented in ascending alphabetical order (i.e. "Group1" and "Group2")
    And A field to name a new group appears
    
  
  ##################
  # Duplicate Name
     @NA
  Scenario: Save existing name
  
    When A group named "Group1" exists
    And I select one of my members
    And I choose to add them to a group
    And I name that group "Group1"
    And I save
    
    Then An alert appears saying "'Group1' already exists." 
    And The group is not saved
    