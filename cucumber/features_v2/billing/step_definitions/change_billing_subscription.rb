##########################################################################
Then "selects a paid plan" do
  click_by_xpath("//td[contains(text(), 'Basic')]//ancestor::tr//div[text()='Upgrade']")
end


##########################################################################
When "cancels his plans" do
  
  # Click on Cancel your subscription
  click_by_xpath("//a[text()='Cancel your subscription']")
  
  # Wait for text to appear
  wait_for_text("Downgrading an account")
  
  # Click on Proceed button
  #click_button("Yes - cancel", "Your subscription has been successfully cancelled")
  click_link("Close","Payment amount")
  enforce_logout()
end


##########################################################################
When "selects a less expensive plan" do
  # Logout
  enforce_logout()
  # Login again
  login_user()
  # Go to Billing page
  visit_page_via_nav_takeover("Billing", "Billing")
  # Click on Cancel your subscription
  click_by_xpath("//td[contains(text(), 'Basic')]//ancestor::tr//div[text()='Downgrade']")
end


##########################################################################
And "will get the premium services until the end of his billing cycle" do
  # Manual test
  # Make sure we logout at the end of the test
  enforce_logout()
end

##########################################################################
And "won't get the upgraded services anymore" do
  # Assert plan is downgraded to Basic
  assert_element_present({xpath: "//td[contains(text(), 'Plus')]//ancestor::tr//div[text()='Upgrade']"})
  # Validate integration activation
  validate_integration_activation(1)
  # Make sure we logout at the end of the test
  enforce_logout()
end

##########################################################################
And "the billing period is over" do
  # Manual test
end


##########################################################################
Then "won't get the premium services anymore" do
  # Manual test
  # Make sure we logout at the end of the test
  enforce_logout()
end

##########################################################################
Then "the user selected a paid plan" do
  wait_for_text("Upgrade")
  click_by_xpath("//td[contains(text(), 'Basic')]//ancestor::tr//div[text()='Upgrade']")
  @total_monthly_payment_before_discount = get_text({xpath: "//td[contains(text(), 'Total monthly payment:')]//following-sibling::td"}) # Get before discount price
  @amount_before_discount = @total_monthly_payment_before_discount.split("$").last.split("USD").first.strip.to_i # Format before discount price
end


##########################################################################
When /^the user enters promo code as (.*)$/ do |promo_code|
  fill_in("promoCode", promo_code) # Enter promo code
  click_button("Apply","Apply")
  #press_key(:tab) # Press tab key
  sleep 5
end

##########################################################################
Then /^sees the total price gets a discount of (.*)$/ do |discount|
  @total_monthly_payment_after_discount = get_text({xpath: "//td[contains(text(), 'Total monthly payment:')]//following-sibling::td"}) # Get after discount price
  @amount_after_discount = @total_monthly_payment_after_discount.split("$").last.split("USD").first.strip.to_i # Format after discount price
  assert_equal(@amount_after_discount, @amount_before_discount - discount.to_i) # Assert discount applied
  enforce_logout() # Logout
end

##########################################################################
When "user enters an invalid promo code" do
  fill_in("promoCode", 100) # Enter invalid promo code
  press_key(:tab) # Press tab key
  sleep 10
end

##########################################################################
Then "sees an error message saying that coupon code is invalid" do
  expected = "Unfortunately the Promo Code you entered is invalid. Please check your code and try again."
  message = get_text({xpath: "//label[contains(@class, 'billing')][contains(@class, 'error')]"}) # Get error message
  assert_equal(message, expected) # Assert discount applied
  enforce_logout() # Logout
end

##########################################################################
When "user enters an expired promo code" do
  fill_in("promoCode", "TESTCOUPON") # Enter invalid promo code
  press_key(:tab) # Press tab key
  sleep 10
end

##########################################################################
Then "sees an error message saying that coupon code is expired" do
  expected = "Unfortunately the Promo Code you entered has expired. Please enter a valid code and try again."
  message = get_text({xpath: "//label[contains(@class, 'billing')][contains(@class, 'error')]"}) # Get error message
  assert_equal(message, expected) # Assert discount applied
  enforce_logout() # Logout
end

##########################################################################