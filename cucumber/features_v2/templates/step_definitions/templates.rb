When(/^I define template schema$/) do
  @browser.execute_script("window.scrollBy(0,400)")
  click_button("Next", "Build your template")
  fill_in("fieldName", "Product ID")
  select_from_dropdown("Field Type", "Text")  
end

Then(/^previews the fields$/) do
  click_button("Preview", "Preview of the Template")
end

Then(/^the template is saved$/) do
  click_btn("Save")
  wait_for_text("My Templates")
end

Then(/^sees template in the template list$/) do
 enforce_logout()
end

Then(/^template is saved$/) do
  sleep 2
  click_button("Save Changes", "Preview Template") 
  click_link("Close","My Templates")
end

Then(/^sees the new template in the template list$/) do
  wait_for_text($product[3].name)
  click_by_xpath("//div[@class='row']/div/div/div")
  click_link("Edit","Edit your template")
  select_from_dropdown("Publish?", "No")
  @browser.execute_script("window.scrollBy(0,400)")
  click_btn("Save Changes")
  click_link("Close","My Templates")
  sleep 2
  enforce_logout()
end

Given(/^a user has created a template$/) do
  create_public_template() 
end

Given(/^a user has created a private template$/) do
  create_private_template() 
end

Given(/^is on the Edit a template page$/) do
  click_by_xpath("//div[@class='row']/div/div/div")
  click_link("Edit","Edit your template")
  wait_for_text("Edit your template") 
end

Then(/^Then the template is saved$/) do
  click_btn("Save Changes")
  click_link("Close","My Templates")
  sleep 1
  enforce_logout()  
end

Then(/^the template is now saved$/) do
  click_btn("Save Changes")
  click_link("Close","My Templates")
  sleep 1
  #enforce_logout()  
end


Given(/^is on the Edit a template schema page$/) do
  click_by_xpath("//div[@class='row']/div/div/div")
  click_link("Edit","Edit your template")
  #wait_for_text("Edit your template") 
  click_link("Fields","Templates are used")
end

When(/^edits the template$/) do
  fill_in("fieldName", "Record ID")
  select_from_dropdown("Field Type", "Integer") 
end

When(/^deletes a template$/) do
  click_link("Delete", "Are you sure you want to delete the")
  click_btn("Delete")
  sleep 2
end

Then(/^doesn't see the template in the template list$/) do
  @browser.find_element(:xpath, "//div[@class='row']/div/div/div").displayed?
  #enforce_logout()
end

And(/^sees a notification saying he deleted a template$/) do
click_by_xpath("//nav[@class='nav-takeover-right']/a")
  #visit_page_via_nav_takeover("Dashboard","Dashboard")
   wait_for_text("removed")
   enforce_logout()
end

When(/^copy a template$/) do
  click_link("Copy","Name")
end

When(/^is on a new edit template page$/) do
   wait_for_text("Edit your template") 
end

When(/^is on a new edit template schema page$/) do
  click_link("Fields","Templates are used")
end

And(/^sees a notification saying he edited a template$/) do
   sleep 1
   click_by_xpath("//nav[@class='nav-takeover-right']/a")
   wait_for_text("updated")
   enforce_logout()
end
