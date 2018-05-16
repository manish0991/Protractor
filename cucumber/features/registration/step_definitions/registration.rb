# Random User information
@random_username  = ""
@random_domain    = ""
@random_email     = ""
@random_password  = ""
@random_product   = ""
@random_sku       = ""
@first_name       = ""
@random_catalog   = ""
@random_yopmail   = ""

# Enter random username in the field username
# Enter random domain in the field domain
Then /^Enter random ([^"]*) into the ([^"]*) field$/ do |x, y|  

  element = @browser.find_element :xpath => "//input[@name = '#{y}']"
  
  if x == "username"
    @random_username = "cucumber" + rand(10000000).to_s
    element.send_keys @random_username

  elsif x == "domain"
    @random_domain = "cucumber" + rand(10000000).to_s
    element.send_keys @random_domain
  
  elsif x == "password" || x == "passwordConfirm"
    @random_password = "cukePwd1"
    element.send_keys @random_password  
    
  elsif x == "email"
    @random_email = "cucumber" + rand(10000000).to_s + "@venzee.com"
    element.send_keys @random_email
	
  elsif x== "YopmailID"
    @random_yopmail = "Vivek14"+rand(1000000).to_s+"@yopamil.com"
	element.send_keys @random_yopmail
	
  elsif x == "productname"
    @random_product = "cucumberProd" + rand(100000).to_s
    element.send_keys @random_product
  
  elsif x == "sku"
    @random_sku = "cucumber" + rand(10000000).to_s
    element.send_keys @random_sku
    
  elsif x == "catalogname"
    @random_catalog = "cucumberCatelog" + rand(100000000).to_s
    element.send_keys @random_catalog
  end

  sleep 1

end

Then /^Best describes me ([^"]*)$/ do |x|
  #"
  @browser.find_element(:xpath, "//span[@class = 'radio-list__text' and text() = '#{x}']").click
  $role = x
  sleep 2
end

#"

Then "set up my company" do
  click_button("Set up my company","Dashboard")
end

Then /^I see the ([^"]*) page$/ do |x|
#" 
  if x == "Register Company"
  wait = Selenium::WebDriver::Wait.new(:timeout => 35) # seconds
  wait.until { 
    /Tell us about your company/.match(@browser.page_source)
  }  
  else
    @browser.find_element(:xpath, "//h1[@class='main-header__headline ng-binding']").text.include?("#{x.capitalize}")
    #@browser.find_element(:xpath, "//h1[@class = 'main-header__headline ng-binding' and contains(text(), '#{x}')]")
  end

  sleep 1
  step 'I am on the Venzee web site'
  step 'Use Venzee as ' + @first_name + ' click'
  sleep 4
end 


Then /Enter the existing user (.*) into the (.*) field$/ do |x, y|
  element = @browser.find_element :xpath => "//input[@name = '#{y}']"
  
  if x == "username"
    element.send_keys @random_username
  
  elsif x == "domain"
    element.send_keys "CucumberCorp"+@random_domain
  elsif x == "email"
    element.send_keys @random_email

  elsif x == "password"
    element.send_keys @random_password  
  
  end

  sleep 1
end

Then "I Login" do
  @browser.find_element(:xpath, "//button[@class='btn--large btn--center btn--primary btn vz-btn-process ng-isolate-scope']").click
  wait = Selenium::WebDriver::Wait.new(:timeout => 25) # seconds
  wait.until { 
    /Username is already taken/.match(@browser.page_source) || 
    /Please enter valid email/.match(@browser.page_source) || 
    /Email already taken/.match(@browser.page_source) || 
    /Password is too short/.match(@browser.page_source) || 
    /must contain at least one letter/.match(@browser.page_source) || 
    /Passwords must match./.match(@browser.page_source) || 
    /Tell us about your company./.match(@browser.page_source) || 
    /Please enter valid/.match(@browser.page_source) || 
    /Invalid user credentials/.match(@browser.page_source) || 
    /is required/.match(@browser.page_source) ||
    /Products/.match(@browser.page_source) ||
	/Producto/.match(@browser.page_source)
  }
end

Then "Log me out" do
  step 'I am on the Venzee web site'
  #@browser.find_element(:xpath, "//button[@class='btn profile-btn']").click
  @browser.find_element(:xpath, "//*[@id='localizejs']/div/header/nav/span/div/button").click
  step 'Logout click'
end

Then "Click Register button" do
  click_button_and_wait("Register",3)
  wait = Selenium::WebDriver::Wait.new(:timeout => 35) # seconds
  wait.until { 
    /Username is already taken/.match(@browser.page_source) || 
    /Please enter valid email/.match(@browser.page_source) || 
    /Email already taken/.match(@browser.page_source) || 
    /Password is too short/.match(@browser.page_source) || 
    /must contain at least one letter/.match(@browser.page_source) || 
    /Passwords must match./.match(@browser.page_source) || 
    /Tell us about your company./.match(@browser.page_source) || 
    /Please enter valid/.match(@browser.page_source) || 
    /Invalid user credentials/.match(@browser.page_source) || 
    /is required/.match(@browser.page_source) ||
    /Tell us about your company/.match(@browser.page_source)
  }  
#=end
end

Then "register a new user" do
  step 'a user is registered'
end

And "the user is logged in" do
  puts 'step 1'
  step 'I am on the Login page'
  puts 'step 2'
  step 'Enter the existing user\'s username into the username field'
  puts 'step 3'
  step 'Enter TestPWD123 information into the password field'
  puts 'step 4'
  step 'I Login'
  puts 'step 5'
end

Then "Select an industry from the list" do
  @browser.find_element(:xpath, "//a[@class='select2-choice ui-select-match select2-default']").click
    @browser.find_element(:xpath, "//span[@class='ng-binding ng-scope'][contains(text(), 'Automotive and Industrial')]").click
  sleep 1
end

Given (/Upload logo (.*)$/) do |x|
	upload_setting_image("#{x}")
end


Then "select what best describes my Company" do
  select_option("describe","I export data to multiple channels")
end

Then "Forgot your password" do
	click_link_and_wait("Forgot your password?","Please enter your email address")
	
end

Then "select the type of industry I'm working in" do
  select_from_dropdown("Select your industry","Automotive and Industrial")
end

Then "click set up my company" do
  click_button_and_wait("Set up my company",3)
end

Then "Click button Request Password" do
  click_button_and_wait("Request Password",3)
end

Then "I go to reset password screen" do
	step 'I am on the Login page'
    step 'Forgot your password'
end

Then "I apply for new password" do
	step 'Enter vivekdev04@yopmail.com information into the email field'
    step 'Click button Request Password'
	step 'Tip message is sent you a temporary password. Please check your email'
end

Then "I redirect to check my email" do
	step 'I Test yopmail'
	step 'Enter Email'
end

Then "I open the given Link" do
	step 'I Open mail'
	
end