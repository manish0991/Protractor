Given(/I redirect to yopmail$/) do
 @browser.get "http://www.yopmail.com/en/"
 sleep 4
end

Given(/Enter Email$/) do
 @browser.find_element(:xpath,"//input[@id='login']").send_keys "vivekdev04"
 sleep 4
 @browser.find_element(:xpath,"//*[@id='lrefr']/span/span").click
 sleep 5
end

Given(/Enter Invited Email$/) do
 @browser.find_element(:xpath,"//input[@id='login']").send_keys @random_yopmail
 sleep 5
 @browser.find_element(:xpath,"//input[@class='sbut']").click
 sleep 4
end

Then "I Open reset mail" do
 frame_element = @browser.find_element(:xpath, "//iframe[@id='ifinbox']")
 @browser.switch_to.frame(frame_element)
 sleep 5
 @browser.find_element(:xpath,"//span[contains(text(),'Password reset')]").click
 @browser.switch_to.default_content
end

Then "I Open Invitation mail" do
 frame_element = @browser.find_element(:xpath, "//iframe[@id='ifinbox']")
 @browser.switch_to.frame(frame_element)
 sleep 20
 @browser.find_element(:xpath,"//span[contains(text(),'Your partner CucumberCorp has shared their product data')]").click
 @browser.switch_to.default_content
end

Then "I join the venzee" do
 sleep 3
 frame_element2 = @browser.find_element(:xpath, "//iframe[@id='ifmail']")
 @browser.switch_to.frame(frame_element2)
 @browser.find_element(:xpath,"//a[contains(text(), 'Join us at Venzee.com')]").click
end

Then "I switch to current tab" do
	switch_tab(10)
end