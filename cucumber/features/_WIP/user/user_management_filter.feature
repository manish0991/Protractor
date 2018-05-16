@user_mgmt
Feature: View Users - Filter

  As an Admin, I want to filter members in my organization.
  From User Management users can be filtered by group and status.
  
  Background:
  
    Given I am an admin
    And I have chosen to view users in my organization
    
   Scenario: No filters
  
    When No pending members exist
    And No groups have been created
    And I click or enter the search/filter field

    Then No list of filters appear 
    And The search/filter field is limited to search
 
  Scenario: Filter contents
  
    When <Members> with <Status> have been added <Groups> in my organization
    And I click or enter the search/filter field
    
    Then A list of applicable filters is presented
    And The list contains an 'All users' item
    And 'All users' is selected by default
    And The list contains a 'Users with pending invitations' item
    And The list contains an entry for each group in <Groups>
      
#    Examples:
#    |Members|Status|Groups|
#    |Champ Smith|pending|SE Asia Office|
#    |Chico Peters|not pending|SE Asia Office|
#    |Chris Jones|not pending|SE Asia Office|
#    |Christine Lois-Ville|pending|SE Asia Office|
#    |Christine Michane|not pending|SE Asia Office|
#    |Grant Chamberlain|not pending|SE Asia Office|
#    |Sally Chrapin|pending|Contractors|
#    |Percy Hudson-Michaels|pending|Contractors|
#    |Lois Lanely|not pending|Contractors|
#    |Michael Jordain|not pending|Contractors| 
 
  Scenario: Filter on pending
  
    When <Members> with <Status> have been added to my organization
    And I click or enter the search/filter field
    And I click the 'Users with pending invitations' item
    
    Then The user list is filtered to pending members only
  
 #   Examples:
 #   |Members|Status|
 #   |Champ Smith|pending|
 #   |Chico Peters|not pending|
 #   |Chris Jones|not pending|
 #   |Christine Lois-Ville|pending|
 #   |Christine Michane|not pending|
 #   |Grant Chamberlain|not pending|
 #   |Sally Chrapin|pending|
 #   |Percy Hudson-Michaels|pending|
 #   |Lois Lanely|not pending|
 #   |Michael Jordain|not pending|
    
  Scenario: Filter on groups 
  
    When <Members> in <Groups> have been added to my organization
    And I click or enter the search/filter field
    And I click a group in <Groups>
    
    Then The user list is filtered to only members in that group
    
#   Examples:
#    |Members|Groups|
#    |Champ Smith|SE Asia Office|
#    |Chico Peters|SE Asia Office|
#    |Chris Jones|SE Asia Office|
#    |Christine Lois-Ville|SE Asia Office|
#    |Christine Michane|SE Asia Office|
#    |Grant Chamberlain|SE Asia Office|
#    |Sally Chrapin|Contractors|
#    |Percy Hudson-Michaels|Contractors|
#    |Lois Lanely|Contractors|
#    |Michael Jordain|Contractors|  
    
  Scenario: Filter cleared
  
    When The user list is filtered to a single item
    And The filter box is cleared
    
    Then The user list displays all users/members
