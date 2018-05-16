@pubnub
Feature: Read Monthly Consumption

  Background:
    Given a user is logged to Pubnub
 @pubnub
  Scenario: Read monthly consumption for 2 projects
  
    Then read the number of message flown on PROD
    Then read the number of unique device that connected on PROD
    Then read the number of message flown on DEV
    Then read the number of unique device that connected on DEV
     And write Pubnub data in the result file
