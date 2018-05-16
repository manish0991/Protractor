# coding: utf-8
Then(/^I logIn$/) do

  @browser.find_element(:xpath, "//a[@href='/login']").click
  sleep 1
  @browser.find_element(:xpath, "//input[@name='username']").send_keys("GeneD")
  @browser.find_element(:xpath, "//input[@name='password']").send_keys("QW12erty")
  @browser.find_element(:xpath, "//button[@class='btn--large btn--center btn--primary btn vz-btn-process']").click
  sleep 4
end

When("I click the nav takeover") do
  @browser.find_element(:xpath, "//a[@class='nav-takeover__expand']").click
end

Then(/^Nav should be displayed$/) do
  @browser.find_element(:xpath, "//span[@class='app-profile__initials ng-binding']").displayed?
end

Then(/^verify that '([^"]*)' link works$/) do |nav_link|
  if nav_link == "Users"
       @browser.find_element(:xpath, "//a[@href='/users']").click
  else
       @browser.find_element(:xpath, "//a[contains(.,'#{nav_link}')]").click
  end
  sleep 2
  @browser.find_element(:xpath, "//h1[@class='main-header__headline ng-binding']").text.include?("#{nav_link.capitalize}")
  if nav_link == "Invite Partners"
      sleep 2
      @browser.find_element(:xpath, "//button[contains(text(), 'Cancel')]").click
      sleep 2
    end
  @browser.find_element(:xpath, "//a[@class='nav-takeover__expand']").click

end

When(/^I log out$/) do
  @browser.find_element(:xpath, "//a[@class='app-profile__logout']").click
  sleep 3
end

Then(/^I should be redirected to the main page$/) do
  @browser.get "#{@base_url}"
  sleep 3
end

Then(/^I shouldnt be logged in$/) do
  @browser.find_element(:xpath, "//a[contains(.,'Login')]")
end

Then(/^Nav bar shouldnt be displayed$/) do
  @browser.find_element(:xpath, "//span[@class='app-profile__initials ng-binding']").displayed?.to_s.should == "false"
end