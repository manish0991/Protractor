@user_mgmt
Feature: View Users - Search

  As an Admin, I want to search for members in my organization.
  Users can be searched by first and/or last name
  
  Background:
  
    Given I am an admin
    And <Members> have been added to my organization
    And I have chosen to view users in my organization
    
 #   Examples:
 #   |Members|
 #   |Champ Smith|
 #   |Chico Peters|
 #   |Chris Jones|
 #   |Christine Lois-Ville|
 #   |Christine Michane|
 #   |Grant Chamberlain|
 #   |Sally Chrapin|
 #   |Percy Hudson-Michaels|
 #   |Lois Lanely|
 #   |Michael Jordain|
    
    
  Scenario: Preview matching results
  
    Preview of matching results appears as text is typed
  
    When I enter <SearchText> for first and/or last name

    Then <MatchingUsers> in my organization who's first and/or last name begins with my search text should be listed
    And The search text is highlighted in the matching names list
    
  #  Examples:
  #  |SearchText|MatchingUsers|
  #  |Chr|Chris Jones,Christine Lois-Ville,Christine Michane,Sally Chrapin|
  #  |Mi|Christine Michane,Michael Jordain|
  #  |Pe|Chico Peters,Percy Hudson-Michaels|
  #  |S|Champ Smith,Sally Chrapin|
  #  |Lois|Christine Lois-Ville,Lois Lanely|
    
    
  Scenario: Search completed - Selected search item
  
    Selecting an item from the matching results preview executes a search
  
    When I enter <SearchText> for first and/or last name
    And <MatchingUsers> in my organization who's first and/or last name begins with my search text should be listed
    And I select the first matching name of <MatchingUser>
    
    Then The selected name is the search list
    And The user list contains only the select name
  
  #  Examples:
  #  |SearchText|MatchingUsers|
  #  |Chr|Chris Jones,Christine Lois-Ville,Christine Michane,Sally Chrapin|
  #  |Mi|Christine Michane,Michael Jordain|
  #  |Pe|Chico Peters,Percy Hudson-Michaels|
  #  |S|Champ Smith,Sally Chrapin|
  #  |Lois|Christine Lois-Ville,Lois Lanely|
  
  Scenario: Search completed - Search text  
  
    Executing a search without selecting an item from matched results preview
    does a broad search on entered text
  
    When I enter <SearchText> for first and/or last name
    And <MatchingUsers> in my organization who's first and/or last name begins with my search text should be listed
    And I complete the search without selecting any match results from <MatchingUser>
    #i.e. I execute the search only on <SearchText>
    
    Then The user list contains only the names in <MatchingUsers>
  
#    Examples:
#    |SearchText|MatchingUsers|
#    |Chr|Chris Jones,Christine Lois-Ville,Christine Michane,Sally Chrapin|
#    |Mi|Christine Michane,Michael Jordain|
#    |Pe|Chico Peters,Percy Hudson-Michaels|
#    |S|Champ Smith,Sally Chrapin|
#    |Lois|Christine Lois-Ville,Lois Lanely|
    
  Scenario: Search cleared
  
    When The user list is filtered to a single name
    And The search box is cleared
    
    Then The user list displays all users/members