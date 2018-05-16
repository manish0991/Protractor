Given (/^I am on Notfound page$/) do
  path = '/vivek31'
  @browser.get "#{@base_url}#{path}"
  sleep 1
end

Then (/^I should see error "(.*?)"$/) do |text_str|
  @browser.find_element(:xpath, "//strong[@class = 'error-page__code' and contains(text(), '#{text_str}')]")
end

Then (/^I should see error message "(.*?)"$/) do |text_str|
  @browser.find_element(:xpath, "//h2[@class = 'text--left text--white error-page__subheading' and contains(text(), '#{text_str}')]")
  sleep 1
end

Given (/^I resize the browser$/) do
  @browser.manage.window.resize_to(600, 300)
  sleep 1
end

Given (/^I should see warning message for mobile device$/) do
  text = 'Sorry, the Venzee app is not supported on smartphone browsers.'
  @browser.find_element(:xpath, "//h2[@class = 'text--left text--white error-page__subheading' and contains(text(), '#{text}')]")
  sleep 1
end

Then "sees the 404 page" do
	wait_for_text("404")
end