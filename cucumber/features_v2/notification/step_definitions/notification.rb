Given(/^is connected to a partner$/) do
   #visit_page_via_nav_takeover("Manage Partners","Add Partners")
   sleep 1
    click_link("Expand", "Log out")
	sleep 1
   click_link("Manage Partners", "Add Partners")
   click_link("Add Partners", "Invite Partners to Access your Data")
   enter_address_to_invite()
   send_invitation()
   wait_for_text("total partner")
end

When(/^removes the partner from his partner's list$/) do
   click_checkbox("partner0") 
   mouse_Hover("//div[@class='float--right soft-half--right partners-status']/a[1]")
   click_by_xpath_wait("//div[@class='float--right soft-half--right partners-status']/a[1]", "Are you sure you want to delete")
   click_button("Delete" , "Invite your partners to Venzee")
end

Then(/^sees a notification advising him he is no longer connected to the company he removed$/) do
   #visit_page_via_nav_takeover("Dashboard","Dashboard")
   click_by_xpath("//nav[@class='nav-takeover-right']/a")
   wait_for_text("no longer connected to")
   enforce_logout()
end
 
Given(/^sent a invitation to an unregistered Venzee partner$/) do
   #visit_page_via_nav_takeover("Manage Partners","Add Partners")
   sleep 1
    click_link("Expand", "Log out")
	sleep 1
   click_link("Manage Partners", "Add Partners")
   click_link("Add Partners", "Invite Partners to Access your Data")
   enter_address_to_invite()
   send_invitation()
   wait_for_text("total partner")
   enforce_logout()
end

When(/^a partner accepts the invitation$/) do
   test_email()
   puts "clicking on the email"
   click_bold("#{$user_company.name} has shared its products with you")
   process_invitation()
   sleep 2
   register_user_and_company_via_invitation()
   wait_for_text("Get Started")
   enforce_logout()
end

Then(/^a user sees a notification advising him he is connected to the company he invited$/) do
   login_user()
   sleep 2
   click_by_xpath("//nav[@class='nav-takeover-right']/a")
   #visit_page_via_nav_takeover("Dashboard","Dashboard")
   wait_for_text("connected to")
   enforce_logout()
end

Given(/^a user is not registered$/) do
   register_user_and_company()
   login_user()
   visit_page_via_nav_takeover("Manage Partners","Add Partners")
   click_button("Add Partners", "Invite Partners to Access your Data")
   enter_address_to_invite()
   wait_for_text("total partner")
   enforce_logout()   
end

Given(/^received a invitation to Venzee$/) do
   test_email(type)
   puts "clicking on the email"
   click_bold("Venzee | #{$user_company.name} has shared its products with you")
   process_invitation() 
end

When(/^registers on Venzee$/) do
   register_user_and_company_via_invitation()
end

Then(/^sees a notification advising him he is connected to the company who invited him$/) do
   visit_page_via_nav_takeover("Dashboard","Dashboard")
   click_link("Activity","You are connected to the company,| #{$user_company.name}") 
end