##########################################################################

Given "user is on the billing page" do
  visit_page_via_nav_takeover("Upgrade Plan", "Billing") # Go to Billing page
end

##########################################################################

Then "sees the plan he is currently subscribed" do
  # Asserts Current plan showing up fine
  assert_element_present({xpath: "//tr[@class='ng-scope billing__tr']/td[4]//div[text()='Your Plan']"})
  enforce_logout() # Logout at the end of the test
end

##########################################################################

Given "user is on the Terms of Payment page" do
  visit("terms", "Terms of Use") # Visit terms page
end

##########################################################################

Then "sees the Terms of Payment" do
  find_text("Terms of Use") # Find text 'Terms of Use'
  enforce_logout() # Logout at the end of the test
end

##########################################################################

Given "user had subscribed to a paid plan" do
  click_button("Upgrade","Billing")
  #visit_page_via_nav_takeover("Upgrade Plan", "Billing") # Navigate to Billing page
  upgrade_plan_new_payment("Basic") # Upgrade to Basic
end

##########################################################################

And "is on the Billing history page" do
  click_by_xpath("//button[text()='Billing history']") # Click on Billing history button
end

##########################################################################

Then "sees the billing history" do
  find_text("Monthly Venzee Basic Plan Subscription") # Find text 'Monthly Venzee Basic Plan Subscription'
  click_link("Close", "Payment method")
  sleep 2
  enforce_logout() # Logout at the end of the test
end

##########################################################################