@notification
Feature: Features related to the dashboard/recent activity notifications
#based on https://drive.google.com/a/venzee.com/file/d/0B3v4oU8Rx_CtaEJ6ckE0d1pEdDg/view?usp=sharing

	#In order to stay informed about all the activity 
	#A user 
	#Should be able to view the recent activity on his dashboard

	Background:
		Given a user and a company are registered
     		And a user is logged in
		
	#@all_test 
	Scenario: Display actionable notification icon 

		Given a user is on the Dashboard Overview page
			And has new notification
		Then sees the notification icon
			And the number of notifications he hasn't viewed 
		When clicks on the icon
		Then sees the Dashboard Activity page

	#@all_test 
	Scenario: Display unactionable notification icon

		Given a user is on the Inviter Partners page
			And has new notification
		Then sees the notification icon
			And the number of notifications he hasn't viewed
			And can't click on the notification icon

	#@all_test 
	Scenario: Don't display notification icon

		Given a user is on the Add Product via form page
			And has new notification
		Then doesn't see the notification icon

	#@all_test 
	Scenario: Hide notification icon

		Given a user is on the Dashboard Overview page
			And has no new notification
		Then doesn't see the notification icon

	#@all_test @smoke_test @vg18
	Scenario: Display the number of notification a user hasn't viewed 

		Given a user is on the Dashboard Overview page
			And a has one notification
		Then sees one new notification next to the notificaiton icon

	#@all_test @smoke_test
	Scenario: Display Activity page
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781462/preview

		Given a user is on the Dashboard Overview page
			And has new notification
		When clicks on Dashboard Activity
		Then sees the Dashboard Activity page
			And sees the latest 15 notifications in a a reverse chronological order #manual testing

		When clicks on the next page
		Then sees the next 15 activites 

	#@all_test 
	Scenario: Up to two months of activites
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781462/preview

		Given a user is on the Dashboard Activity page
			And he sees the oldest notification 
		Then the notification should not be older than two months old #manual testing

	#@all_test 
	Scenario: Display latest 5 activites 
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781462/preview

		Given a user is on the Dashboard Overview page
			And has 5 notifications
		Then sees the last 5 notifications

	#@all_test 
	Scenario: No existing notification
	#based on https://projects.invisionapp.com/d/main/default/#/console/3211633/70781462/preview

		Given a user is on the Dashboard Overview page
			And has no existing notifications
		Then sees a message advising him he has no recent activities



