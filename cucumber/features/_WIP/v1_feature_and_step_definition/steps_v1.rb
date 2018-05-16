#!/bin/env ruby
# encoding: utf-8
=begin

Then /^I LogIn$/ do
  @browser.get "#{@base_url}"
  element = @browser.find_element :xpath => "//a[@href = '/login-or-register']"
  element.click
  sleep 2
  element = @browser.find_element :xpath => "//input[@class = 'form-control input-lg ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-minlength']"
  element.send_keys "Gurlei69@hotmail.com"
  sleep 1
  element = @browser.find_element :xpath => "//input[@class = 'form-control input-lg ng-pristine ng-invalid ng-invalid-required ng-valid-minlength']"
  element.send_keys "test123test123"
  sleep 1
  element = @browser.find_element :id => "sendLogin"
  element.click
  sleep 10
end



Then /^I LogIn as ([^"]*)invited partner with password ([^"]*)$/ do |name, pass|
  sleep 2
  element = @browser.find_element :xpath => "//input[@name = 'companyName']"
  element.send_keys "#{name}"
  sleep 1
  element = @browser.find_element :xpath => "//input[@class = 'form-control ng-pristine ng-invalid ng-invalid-required ng-valid-minlength']"
  element.send_keys "#{pass}"
  sleep 5
  element = @browser.find_element :id => "sendLogin"
  element.click
  sleep 5
end

Then /^LogOut$/ do
  sleep 5
  @browser.get "#{@base_url}"
  sleep 5
  element = @browser.find_element :xpath => "//a[@class = 'dropdown-toggle ng-binding']"
  # I have to click the element twice -- either this is a weird Selenium / Angular interaction  bug VEN - 2201
  # or it's a bug in the actual page implementation.  Take a look at this later.
  element.click
  element.click
  sleep 10
  element = @browser.find_element :xpath => "//a[@ng-click = '__logout()']"
  element.click
  sleep 3
end

Then /^I select the ([^"]*) option$/ do |x|
  element = @browser.find_element :xpath => "//li[@class = 'root-level']/a/span[text() = '#{x}']"
  element.click
  sleep 5
end



Then /^Upload csv file$/ do
  element = @browser.find_element(:id, 'upload').send_keys('/foo/bar')
end


# ---------- Products page elements---------------

Then /^Click the AddProducts button$/ do
  element = @browser.find_element :xpath => "//button[@class = 'btn btn-primary dropdown-toggle']"
  element.click
end

Then /^Click checkbox next to any product$/ do
  element = @browser.find_element :xpath => "(//input[@type = 'checkbox'])[3]"
  element.click
  sleep 5
end

Then /^Click the Bulk Delete button$/ do
  sleep 2
  element = @browser.find_element :xpath => "(//button[@class = 'btn btn-whitee blk-delete'])[2]"
  #"(//button[@class = 'btn btn-whitee blk-delete'])[1]"
  element.click
  element.click
  puts "here"
end


Then /^Upload product using option ([^"]*)$/ do |x| #VALUES: Dropbox, File Upload (Spreadsheet .CSV), Online Form, API Coming Soon!
  element = @browser.find_element :xpath => "//button[@class = 'btn btn-primary dropdown-toggle']/span"
  element.click
  element = @browser.find_element :xpath => "//ul[@class = 'dropdown-menu']/li/a[text()= '#{x}']"
  element.click
  sleep 3
end


Then /^Click the ([^"]*) button $/ do  |x|# -- Templates and IMAP Policy
  element = @browser.find_element :xpath => "//div[@class = 'btn btn-default nav-button btn-expend' and text()='#{x}']"
  element.click
end


Then /^Select product ([^"]*) from the list$/ do |x|
  element = @browser.find_element :xpath => "(//input[@type = 'checkbox'])[#{x}]"
  element.click
end

Then /^Edit product from the list$/ do
  element = @browser.find_element :xpath => "(//a[@class = 'glyphicon glyphicon-pencil'])[2]"
  sleep 5
 # element = @browser.find_element :xpath => "(//a[@class = 'glyphicon glyphicon-remove'])[1]"
  element.click
  sleep 5
end


Then /^Search for ([^"]*)$/ do |x|
  element = @browser.find_element :xpath => "//input[@type = 'text']"
  element.send_keys "#{x}"
end

Then /^Save$/ do
  element = @browser.find_element :xpath => "//button[@class = 'btn btn-primary btn-lg' and text() = 'SAVE']"
  element.click
  sleep 4
end

Then /^Click the ([^"]*) link$/ do |x|
  element = @browser.find_element :xpath => "//span[@class = 'text-info' and text() = '#{x}']"
  element.click
  sleep 2
end


Then /^Upload your product using spreadsheet$/ do
  element = @browser.find_element :xpath => "//a[@class = 'blue']"
  element.click
  sleep 1
end

Then /^Click the button ([^"]*)$/ do |x|   # uploadCSV  uploadZIP  uploadCSVFileButton
  element = @browser.find_element :id => "#{x}"
  element.click
  sleep 3
end

Then /^Delete the first available product$/ do
  sleep 3
  element = @browser.find_element :xpath => "(//a[@class = 'glyphicon glyphicon-remove'])[1]"
  element.click
  sleep 3
end

Then /^Verify  error messages displayed for each Upload$/ do    # uploadCSV  uploadZIP  uploadCSVFileButton
  @browser.find_element :xpath => "//div[@class = 'ng-binding'][contains(text(),'You appear to be trying to import an incorrect file type')]"
  @browser.find_element :xpath => "//small[@class = 'text-danger']/u[text() = 'sample of the correct file']"
  sleep 2
end

#------------------------- Create an Option to Add your product -----------------

Then /^Modify ([^"]*) information into the ([^"]*) field$/ do |x, y|
  element = @browser.find_element :xpath => "//input[@name = '#{y}']"
  element.clear
  element.send_keys "#{x}"
  element = @browser.find_element :xpath => "//button[@type = 'button' and text() = 'SAVE']"
  element.click
  sleep 10
  element = @browser.find_element :xpath => "//input[@data-ng-model = 'inputLiveSearch']"
  element.send_keys "#{x}"
  sleep 2
  element = @browser.find_element :xpath => "//span[@class = 'col-md-7 col-sm-7 col-xs-12']/a[contains(text(),'#{x}')]"
  element.click
end


#Then /^Select ([^"]*) ([^"]*)$/ do |x, y| #Select anything from any drop down list on the page
#  element = @browser.find_element :xpath => "//select[@name = '#{x}']"
#  element.click
#  element = @browser.find_element :xpath => "//option[@value = '#{y}']"
#  element.click
#end


Then /^Click Cancel button$/ do
  driver = $driver
  element = driver.find_element :xpath => "//a[@class = 'btn btn-white btn-lg' and text() = 'CANCEL']"
  element.click
end

Then /^Enter information ([^"]*) into the Option ID field$/ do |x|
element = @browser.find_element :xpath => "//input[@class = 'select2-input']"
element.send_keys "#{x}"
element = @browser.find_element :xpath => "//span[@class = 'select2-match' and text() = '#{x}']"
element.click
sleep 3
end

#-------------------------- Dashboard---------------------

Then /^Click the Dashboard button ([^"]*)$/ do |x| # Manage Products, Manage Products
  element = @browser.find_element :xpath => "//*[@class = 'btn btn-primary'][contains(text(),'#{x}')]"
  element.click
  sleep 4
end

Then /^Click Add on the Dashboard ([^"]*)$/ do |x|
  element = @browser.find_element :xpath => "(//button[@class = 'btn btn-primary'])[#{x}]"
  element.click
  sleep 4
end


Then /^Click the Upgrade button$/ do
  element = @browser.find_element :xpath => "//a[@class = 'submit']"
  element.click
end

Then /^On the dashboard filter by ([^"]*)$/ do |x| #  All Activity, Products, Partners, IMAP Monitoring, System and Billing
  element = @browser.find_element :xpath => "//div[@class = 'filter-blk clearfix']/ul/li/a[text() = '#{x}']"
  element.click
end

Then /^Navigate to the AppStore from the Dashboard$/ do
  element = @browser.find_element :xpath => "//a[@class = 'v-blue' and text() = 'App Store']"
  element.click
end

Then /^Verify that partner invite card appears on the Dashboard$/ do
  @browser.find_element :xpath => "//span[@class = 'ng-binding ng-scope']"
end

Then /^Verify that error message displayed if invalid file is uploaded$/ do
  @browser.find_element :xpath => "//div[@class = 'text-danger ng-binding ng-scope']"
end

Then /^Add valid email address ([^"]*)$/ do |x|
  element = @browser.find_element :xpath => "//input[@class = 'select2-input select2-default']"
  element.send_keys "#{x}"
  sleep 5
  element = @browser.find_element :xpath => "//span[@class = 'select2-match']"
  element.click
  element = @browser.find_element :xpath => "(//button[@class = 'btn btn-primary'][contains(text(),'Send Invitation')])[2]"
  element.click
  sleep 1
end

Then /^Verify that csv file was uploaded to invite partners$/ do
  @browser.find_element :xpath => "//div[@class = 'progress-bar ng-binding']"
  @browser.find_element :xpath => "//small[@class = 'ng-binding']"
end

#----------------- Invite your retailers ------------

Then /^Select upload file "([^"]+)", ([^"]*)$/ do |fname, buttonID|
  # hacky:  Selenium can't find the uploadFile element if it's hidden, so we need to unhideit
  @browser.execute_script "$('##{buttonID}').removeClass('hide').removeClass('hidden')"
  (@browser.find_element :id => buttonID).send_keys fname
end

Then /^Select an image "([^"]+)"$/ do |fname|
  # hacky:  Selenium can't find the uploadFile element if it's hidden, so we need to unhideit
  @browser.execute_script "$('//input[type='file']').style.visibility='visible'"
  (@browser.find_element :xpath => "//input[@type ='file']").send_keys fname
  @browser.execute_script "$('//input[type='file']').style.visibility='hidden'"
  sleep 6
end


Then /^On the Invite your retailers pg sort by([^"]*)$/ do |x| #  View All, Status, Alphabetical(A-Z), Alphabetical(Z-A), IMAP Compliance, Date Added
  element = @browser.find_element :xpath => "//a[@role='button']/span[text()= '#{x}']"
  element.click
end

#------------------------------- Create a Product -----------------------------------

Then /^Enter information into Brand or Catalog Name$/ do
  element = @browser.find_element :xpath => "//input[@ng-model = 'product.Brand']"
  element.send_keys "Winter 2014 Chanel"
  sleep 3
end

Then /^Enter information into Option Ids$/ do
  element = @browser.find_element :id => "//li[@class = 'select2-search-field']/input"
  element.send_keys "Women shoes"
  sleep 3
end

Then /^Verify notification product ([^"]*) was added to the catalog$/ do |x|
  @browser.find_elements :xpath => "//div[@class = 'ng-binding toast-title' and text()= '#{x}']"
  if element.count > 0
    puts "Notification was displayed"
  end
  sleep 3
end


Then /^Verify that products profile display correct information$/ do
  row_elements = @browser.find_elements :xpath => "(//tr[@class='ng-scope'])[1]//*[contains(@class,'ng-binding')]"
  row_values = row_elements.map { |x| x.text() }

  # click on the first row
  row_elements[0].click

  # compare each value
  elements = @browser.find_elements :xpath => "//div[@class='col-md-12 v-product-title ']/h1[@class='pull-left ng-binding']"
  expect(elements[0].text()).to start_with(row_values[0])

  elements = @browser.find_elements :xpath => "//td[@class='col-xs-8 ng-binding']"
  expect(elements[0].text()).to eq(row_values[6])
  expect(elements[1].text()).to eq(row_values[1])

  elements = @browser.find_elements :xpath => "//p[@class='v-product-price ng-binding']/strong"
  expect(elements[0].text()).to eq(row_values[2])

  elements = @browser.find_elements :xpath => "//p[@class='v-product-imap-price  ng-binding']/strong"
  expect(elements[0].text().gsub(' ', '')).to eq(row_values[3])

  #In stock info not displayed yet
  #@browser.find_elements :xpath => "//p[@class='v-product-price ng-binding']/strong[text() = '#{row_values[4]}']"

  #Available date  - info not displayed yet
  #@browser.find_elements :xpath => "//p[@class='v-product-price ng-binding']/strong[text() = '#{row_values[5]}']"
end

Then /^Compare amount of product in dashboard and product tab$/ do
  dash_elements = @browser.find_elements :xpath => "(//div[@id='chart-products']/*/*[name()='text']/*[name()='tspan'])[2]"
  dash_value = dash_elements.map { |x| x.text() }
  sleep 3
  element = @browser.find_element :xpath => "//span[@class = 'forklifter' and text() = 'Products']"
  element.click
  amount = @browser.find_elements :xpath => "(//small[@class='ng-binding'])[2]"
  expect(amount[0].text().gsub(/[ \(\)]/, '')).to eq(dash_value[0].gsub(',', ''))
end

#------------------------------  NOTIFICATION VERIFICATION ---------------------------
Then /^Verify delete notification is displayed$/ do
  @browser.find_elements :xpath => "//div[@class='ng-binding ng-scope'][contains(text(),'You deleted ')]"
  if element.count > 0
    puts "Notification was displayed"
  end
end

Then /^Verify invite notification is displayed$/ do
  sleep 3
  element = @browser.find_elements :xpath => "//div[@class='ng-binding ng-scope'][contains(text(),'You have granted')]"
  if element.count > 0
     puts "Invite notification was displayed"
  end
end

Then /^Verify upload notification is displayed$/ do
  sleep 3
  #element = @browser.find_elements :xpath => "//div[@class='ng-binding ng-scope'][contains(text(),'Your file upload is being processed, we'll notify you when its completed.')]"
  element = @browser.find_elements :xpath => "//div[@class='ng-binding ng-scope']"
  if element.count > 0
    puts "Upload notification was displayed"
  end
end


#--- EMAIL ---

#require 'gmail'

#def get_invite_link(email, password, destination)
#  click_url = ""
#
#  Gmail.new(email, password) do |gmail|
#    # turn on peek for debugging purposes -- doesn't mark the message as read
#    #gmail.peek = true
#    email = gmail.inbox.emails(:unread, :to => destination)
#    if email.count == 0
#      puts "Expected email, could not find one"
#    end
#    original_html = email[0].html_part.to_s
#    html = original_html.gsub("=\r", "").gsub("=\n", "").gsub("=3D", "=")
#    click_url = /"(https:\/\/via.intercom.io[^"]+)"/.match(html)[1]
#  end
#
#  return click_url
#end

Then /^Click on the invite link sent to (.*)$/ do |to_addr|
  invite_url = get_invite_link("marina@venzee.com", "test123test123", "marinap2@venzee.com")
  @browser.get invite_url
end


Then /^I verify partner has 3 chats displayed on the dashboard$/ do
  sleep 3
  @browser.find_element :id => "chart-products"
  @browser.find_element :id => "chart-retailers"
  @browser.find_element :id => "chart-imap"

end

Then /^Verify the number of products is ([0-9]+)$/ do | num_products |
  # the !#!@#!@#!@#!@# more info floater gets in the way
  @browser.execute_script "$('div.zopim').hide()"

  total_products = 0
  done = false
  while not done do
    # count the products on this page
    rows = @browser.find_elements :xpath => "//div[@id='productList']//tr[@class='ng-scope']"
    total_products += rows.count

    # get the next button
    next_button =  @browser.find_element :xpath => "(//div[@id='productList']//div[@ng-show='numPages > 1'])[1]//a[@ng-click='selectPage(page + 1)']"

    # check the parent node to see if the next button was disabled.  if it was disabled, we're done
    if (next_button.find_element :xpath => "..").attribute("class").include?("disabled") then
      done = true
    else
      # otherwise, go to the next page
      next_button.click
    end
    sleep 5
  end

  @browser.execute_script "$('div.zopim').show()"

  expect(total_products).to eq(num_products.to_i)
end
























#--------------------------------New homepage methods--------------------------------




Then /^Link (.*)$/ do |x|
  driver=@browser
  driver.find_element(:xpath, "//a[contains(text(),'#{x}')]").click
  sleep 2
  page = driver.title
  puts page
end

Then /^Dropdown select (.*)$/ do |x|
  driver=@browser
  driver.find_element(:xpath,"//button[@ng-model = 'home.describe']").click
  driver.find_element(:xpath,"//ul/li/a[@class and contains(text(), '#{x}')]").click
end

Then /^Beta code dropdown list verification$/ do |name|
  driver=@browser
  puts name
  driver.find_element(:xpath,"//button[@ng-model = 'home.describe']").click
  for row in name.hashes do
    driver.find_elements(:xpath,"//ul/li/a[@class and contains(text(), '#{row}')]")
  end
end

Then /^Icon (.*)$/ do |x|
  driver=@browser
  windowhandler = driver.window_handle
  driver.find_element(:xpath, "//i[contains(@class,'#{x}')]").click
  sleep 4
  driver.switch_to.window(driver.window_handles.last )
  puts driver.title
  driver.close
  driver.switch_to.window(windowhandler)
end

Then /^Click Logo$/ do
  driver=@browser
  driver.find_element(:xpath,"//a[@class = 'vz-logo main-header__logo' and text()='Venzee']").click
  sleep 2
end

Then /^Language dropdown list verification$/ do |name|
  driver=@browser
  puts name
  driver.find_element(:xpath,"//button[contains (@data-template, 'language-dropdown.html')]").click
  for row in name.hashes do
    driver.find_elements(:xpath,"//ul/li/a[@class and contains(text(), '#{row}')]")
  end
end

Then /^Language select (.*)$/ do |x|
  driver=@browser
  driver.find_element(:xpath,"//button[contains (@data-template, 'language-dropdown.html')]").click
  driver.find_element(:xpath,"//ul/li/a[@class and contains(text(), '#{x}')]").click
end

Then /^Forgot your password$/ do
  @browser.find_element(:xpath, "//a[@class = 'login__pwd-link' and text()= 'Forgot your password?']").click
  sleep 3
  @browser.find_element(:xpath, "//h2[@class='form-container__heading' and text()='Forgot your password?']").click
end

Then /^Click button ([^"]*)$/ do |x|
  @browser.find_element(:xpath, "//button[contains(text(), '#{x}')]").click
  sleep 3
end

Then /^Menu$/ do
  @browser.find_element(:xpath, "//a[@class = 'nav-takeover__expand']").click
  sleep 2
end

Then /^Menu button (.*)$/ do |x|
  #@browser.find_element(:xpath, "//a[@ng-click = 'header.toggleSearch()'").click
  step 'Menu'
  sleep 1
  @browser.find_element(:xpath, "//a[contains(text(),'#{x}')]").click
  sleep 2
end

#Then /^([^"]*) select ([^"]*)$/ do |x,y|
#  driver=@browser
#  driver.find_element(:xpath,"//button[contains (@ng-model, '#{x}')]").click
#  driver.find_element(:xpath,"//ul/li/a[@class and contains(text(), '#{y}')]").click
#end

Then /^Login verification$/ do
  @browser.find_element(:xpath, "//h1[@class and contains(text(), 'Products')]").click
  sleep 2
end

Then /^Profile phone (.*)$/ do |x|
  driver=@browser
  driver.find_element :xpath => "//input[@ng-model='profile.phone']"
  driver.send_keys x
end

Then /^Save changes$/ do
  @browser.find_element(:xpath, "//button[@class = 'btn btn--large btn--primary btn--center flush--top' and contains(text(), 'Save changes')]").click
  sleep 3
end

Then /^Save new password$/ do
  @browser.find_element(:xpath, "//button[@id = 'change-password']").click
  sleep 2
end

Given /^I logIn temporary$/ do
  step 'Base URL'
  step 'Login click'
  step 'Enter testpart6@gmail.com information into the username field'
  step 'Enter TestPWD123 information into the password field'
  step 'Click Login button'
end

Then /^Upload logo "(.*)"$/ do |fname|
  @browser.find_element(:xpath, "//input[@name = 'file']").send_keys fname
  sleep 2
end

Then /^Wrong image size message$/ do
  @browser.find_element(:xpath, "//label[@ng-message = 'FileUploadTooLarge']").click
end

Then /^Landing based on my role$/ do
  
  if $role.text == "Systems critical to my business aren’t connected"
    @browser.find_element(:xpath,'//h1[@class="main-header__headline ng-binding" and text() = "Products"]')
    puts 'Landed to integration'
    #should be integration
  
  elsif $role.text == "Not sure"
    @browser.find_element(:xpath, '//h1[@class = "main-header__headline ng-binding" and text() = "Dashboard"]')
    puts 'Landed to dashboard'
  
  else
    @browser.find_element(:xpath, '//h1[@class="main-header__headline ng-binding" and text() = "Products"]')
    puts 'Landed to products'
  end
end


=end