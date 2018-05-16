#$wait = Selenium::WebDriver::Wait.new(:timeout => 15)

Then /^Enter ([^"]*) information into the ([^"]*) field$/ do |data, field|
    
  if field == "firstName"
    @first_name = data
  end

  enter_data_in_field(data, field)
  sleep 0.5
end

Then /^The error message is ([^"]*)$/ do |x|
  find_text_in_page(x)
  sleep 0.5
end

#click by link

Then /^([^"]*) click$/ do |x|
  if x=="Get Started"
    #wait = Selenium::WebDriver::Wait.new(:timeout => 35) # seconds
    #wait.until { 
       #/First Name/.match(@browser.page_source)}
       step 'I visit register page'
    else
      sleep 5
    click_link(x)
    end
end

#click by id

Then (/I click on (.*)$/) do |x| 
  @browser.find_element(:xpath, "//*[contains(@id,'#{x}')]").click
  sleep 2
end

Then /^Tip message is (.*)$/ do |x|
  find_label(x)
  sleep 0.2
end

Given "I am on the Venzee web site" do 
    @browser.get "#{@base_url}"
    sleep 4
end

Given /^I visit ([^"]*) page$/ do |x|
   @browser.get "#{@base_url}/#{x}"
   sleep 4
end

Given /^I am on the ([^"]*) page$/ do |x|
#"
  if x == "Register"
    puts "register"
    if /Get Started/.match(@browser.page_source) != nil
      click_link("Get Started")
      step 'I visit register page'
      sleep 2
    elsif /Use Venzee as Uname/.match(@browser.page_source) != nil
      puts "use v Uname"
      click_link("Use Venzee as Uname")
    elsif /Use Venzee as 123456789/.match(@browser.page_source) != nil
      puts "use v 123"
      click_link("Use Venzee as 123456789")
    end

  else
    sleep 2
    puts "else : #{x}"
    click_link("#{x}")
  end

  sleep 4

end

Given (/I select (.*) language$/) do |x|
  @browser.find_element(:xpath, "//*[contains(@class, 'dropdown')]/a").click
  click_link("#{x}")
  sleep 2
end

Given "Logout if already login" do
  if /Logout/.match(@browser.page_source)
  #@browser.find_element(:xpath, "//button[@class='btn profile-btn']").click
  @browser.find_element(:xpath, "//*[@id='localizejs']/div/header/nav/span/div/button").click
  @browser.find_element(:xpath, "//a[contains(.,'Logout')]").click
  wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
  wait.until { 
    /Login/.match(@browser.page_source)}
    end
end

Given (/I select (.*) file$/) do |x|
  base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
  value=base_path.split("features")
  file="#{value[0]}/image/#{x}"
  element = @browser.find_element :xpath => "//input[@name = 'fileUpload']"
  element.send_keys file
  sleep(15)
end

Given "a user is registered" do
  step 'I am on the Venzee web site'
  step 'Logout if already login'
  step 'Get Started click'
  step 'Enter Uname information into the firstName field'
  step 'Enter Ulastname information into the lastName field'
  step 'Enter random username into the username field'
  step 'Enter random email into the email field'
  step 'Enter TestPWD123 information into the password field'
  step 'Enter TestPWD123 information into the passwordConfirm field'
  step 'Click Register button'
end

Given "a company is registered" do
  step 'Enter CucumberCorp information into the company field'
  step 'Enter random domain into the domain field'
  step 'Enter cucumbercorp.com information into the website field'
  step 'Select an industry from the list'
  step 'Best describes me Companies send me spreadsheets'
  step 'set up my company'
  step 'I see the Products page'
end

  Given "I have signed into Venzee application" do
  step 'I am on the Venzee web site'
  step 'Logout if already login'
  step 'I am on the Login page'
  step 'Enter qavivekgupta27 information into the username field'
  step 'Enter 1qaz!QAZ information into the password field'
  step 'I Login'
  step 'I am on the Venzee web site'
end

Given "I logout from the application" do
  step 'I am on the Venzee web site'
  #sleep(3)
  @browser.navigate.refresh
  sleep(2)
  @browser.find_element(:xpath, "//*[@id='localizejs']/div/header/nav/span/div/button").click
  click_link("Logout")
end

Given (/Select an Image (.*) file$/) do |x|
  base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
  value=base_path.split("features")
  file="#{value[0]}/image/#{x}"
  element = @browser.find_element :xpath => "//input[@class= 'ng-pristine ng-untouched ng-valid ng-scope']"
  element.send_keys file
  sleep(15)
end
