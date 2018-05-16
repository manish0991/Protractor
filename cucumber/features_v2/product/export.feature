@export_product
Feature: Happy Path Export Product and Image

  Background:
    Given a user is on the Venzee web site



###################################################################

 #@all_test @smoke_test 
  Scenario Outline: Export File

    Given a user and a company are registered
      And a user is logged in
      #And is on the product records page
      And products exist in the product list
    When selects a collection
      And chooses to export records in a <type> file
    Then sees a message that advising we are preparing data export
      And will receive a link to download the file
    When clicks on the link
    #Then starts the download of the CSV file

    Examples: 
     |type|
     |csv |
     |xls |
     #|xlsx|


###################################################################
  #@all_test @smoke_test 
  Scenario: Export Image

  Given a user and a company are registered
      And a user is logged in
      And is on the product records page
	  And products exist in the product list
	  #COMMENT: I Have added this "products exist in the product list" step here reduce this for adding a new product
    When selects a collection
      And chooses to export images 
      And chooses the original size of the images
    Then sees a message that advising we are preparing media export
      And will receive a link to download the images
    When clicks on the link
    #Then starts the download of the images

  #@all_test @smoke_test 
  Scenario Outline: Export a ER collection
    
    Given user created a transformation
      #And is on the Export Ready Records page

    When chooses to export on chooses to export records in a <type> file
    
    Then sees a message that advising we are preparing data export
        And will receive a link to download the file
    When clicks on the link
    #Then starts the download of the images
    Examples: 
     |type|
     |csv |
     |xls |
     |xlsx|