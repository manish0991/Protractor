Given(/^a user received an invitation$/) do
     add_product_via_form()
	sleep 2
    #visit_page_via_nav_takeover("Manage Users","Users")
	click_link("Expand", "Log out")
	sleep 1
	click_link("Manage Users", "Add Users")
    click_link("Add Users", "Invite users to access and manage your data")
    enter_address_to_invite_users()
    send_user_invitation()
    #find_text("Select one or more partners from the list to view available actions")
	enforce_logout()
 end
 
 Then "the user invitation token is still valid" do
    test_email()
	puts "clicking on the email"
    click_bold("Join #{$user_company.name} on Venzee")
	#default_switch()
end

Then "user completes the registration process" do
	register_user_via_invitation()
end

Then(/^the user will be added to the company users list$/) do
    sleep 3
	click_link("Expand", "Log out")
	sleep 1
	click_link("Manage Users", "Add Users")
    #visit_page_via_nav_takeover("Manage Users", "Users")
end

Then(/^sees the collection created by users that belong to the same company$/) do
    #visit_page_via_nav_takeover("Source Data", "Add")
	sleep 2
	click_link("Expand", "Log out")
	sleep 1
	click_link("Source Data", "Add")
    sleep 2
    #select_from_filter_dropdown("Collection Name",$collection.name)
   # sleep 2
	#wait_for_text($product[0].name)
	enforce_logout()
end

Given(/^is on the invite user page$/) do
    #visit_page_via_nav_takeover("Manage Users","Users")
	click_link("Expand", "Log out")
	sleep 1
	click_link("Manage Users", "Add Users")
end

When(/^gets redirect to the users page$/) do
    send_user_invitation()
end
 
 When(/^user enters a valid email address$/) do
    click_link("Add Users", "Invite users to access and manage your data")
    enter_address_to_invite_users()
end

#When(/^gets redirect to the users page$/) do
 
#end

When(/^sees the pending invitation in the users list$/) do
    sleep 2
	aa = @partneremail.split('+')
	find_text(aa.at(1))
	enforce_logout()
  
end

Then(/^an email will be sent to the users$/) do
    test_email()
	#test_email("partner")
	click_bold("Join #{$user_company.name} on Venzee")
	sleep 5
end

Then "sends the user invitations" do
	send_user_invitation()
end

Given(/^is admin from the company$/) do
    sleep 2
    #visit_page_via_nav_takeover("Manage Users","Users")
	click_link("Expand", "Log out")
	sleep 1
	click_link("Manage Users", "Add Users")
    click_link("Add Users", "Invite users to access and manage your data")
    enter_address_to_invite_users()
end


Given(/^already invited another user$/) do
    send_user_invitation()
    enforce_logout()
    test_email()
	puts "clicking on the email"
    click_bold("Join #{$user_company.name} on Venzee")
	sleep 2
	process_invitation()
	register_user_via_invitation()
	enforce_logout()
end



Given(/^is on the users page$/) do
   login_user()
   sleep 2
   #visit_page_via_nav_takeover("Manage Users","Users")
   click_link("Expand", "Log out")
	sleep 1
   click_link("Manage Users", "Add Users")
  
end

When(/^removes a user$/) do
   click_checkbox("user0") 
   mouse_Hover("//div[@class='float--right soft-half--right partners-status']/a[1]")
   click_by_xpath_wait("//div[@class='float--right soft-half--right partners-status']/a[1]", "Are you sure you want to delete")
   click_btn("Delete") 
   sleep 2
end

Then(/^the user name is no longer displayed in the user list$/) do
   #browser.text.include?
   #Second/.match(@browser.page_source).displayed?
   #@browser.find_element :xpath => "//*[contains(.,'#{Second}')].displayed?
   #@browser.text.include?("Second User").should != true
  # if @browser.text.include? "Second User"
  # puts "user not deleted"
#else
  # enforce_logout()
#end
   @browser.find_text(:xpath, "//[contains(.,'#{Second}')]").displayed?
   
end
 