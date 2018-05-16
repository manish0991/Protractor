@user_mgmt
Feature: Group Management - Remove users

  As an Admin, I want to add members/users to groups for easier filtering.
  
  Background:
  
    Given I am an admin
    And I have several users in my organization
    And I have chosen to view users in my organization
    
  
  Scenario: Single member removed from its groups
  
    When members are assigned to unique groups (i.e. no member belongs to more than 1 group)
    And I select one of my members
    And I choose to remove them from a group
    And I select the presented groups
    And I remove
    
    Then A confirmation message appears saying: "Remove this user from the group?"
    And Upon confirmation, an alert appears saying "The user has been removed from its group." 
    And In the user list the group name is no longer listed for the selected member
  
  Scenario: Single member removed from multiple groups
  
    When Members are assigned to more than one group
    And I select one of my members
    And I choose to remove them from a group
    And I select the presented groups
    And I remove
    
    Then A confirmation message appears saying: "Remove this user from the groups?"
    And Upon confirmation, an alert appears saying "The user has been removed from its groups." 
    And In the user list the group names are no longer listed for the selected member
  
  Scenario: Multipe members removed from multiple groups
  
    When members are assigned to unique groups (i.e. no member belongs to more than 1 group)
    And I select all of my members
    And I choose to remove them from a group
    And I select the presented groups except the last
    And I remove
    
    Then A confirmation message appears saying: "Remove these user from the groups?"
    And Upon confirmation, an alert appears saying "The users has been removed from their groups." 
    And In the user list, the group names are only listed for members of the last group #not selected above
  
  ##################
  # Display
  Scenario: Display - Selected member belongs to 1 group
  
    When members are assigned to unique groups (i.e. no member belongs to more than 1 group)
    And I select one of my members
    And I choose to remove the member from a group

    Then The list is populated with that single group name
 
  Scenario: Display - Selected members belongs to different groups
  
    All groups to which selected users belong are to be listed, partial or otherwise.
    
    When members are assigned to unique groups (i.e. no member belongs to more than 1 group)
    And I select all of the members
    And I choose to remove the member from a group

    Then The list is populated with all the group names
    And The list is sorted in alpha asceding order
 
  Scenario: Display - Selected member belongs to different groups
  
    All groups to which a selected user belong are to be listed, partial or otherwise.
    
    When Members are assigned to more than one group
    And I select one of the members
    And I choose to remove the member from a group

    Then The list is populated with the names of the groups in which the member belongs 
    And The list is sorted in alpha asceding order
  