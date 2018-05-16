Given (/I have signed into Venzee$/) do
  step 'a user is registered'
end

Given (/I have access the Products page$/) do
  step 'Enter CucumberCorp information into the company field'
  step 'Enter random domain into the domain field'
  step 'Enter cucumbercorp.com information into the website field'
  step 'Select an industry from the list'
  step 'Best describes me Companies send me spreadsheets'
  step 'click set up my company'
  step 'I see text Products'
end

Given (/an existing catalog named '(.*)' exists for my organization$/) do |x|
   wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
   wait.until { 
    /Choose existing catalog, or create a new one/.match(@browser.page_source) 
    sleep(3)}
   #step 'I click Yes I do button' 
   enter_data_in_field(x,"collectionName")
   step 'Enter 1.5 information into the collectionImap field'
   #step 'I make catalog Public'
   step 'I choose US Dollar as Currency'
   step 'I complete the required fields of the product details'
   step 'I Save'
   step 'the product view appears'
   step 'I have chosen to add a product using the form'
end

Given (/I have chosen to add a product using the form$/) do
   path='/products/add/'
  @browser.get "#{@base_url}#{path}"
  step 'I see text Add Product Record'
end

Given (/No catalog exists$/)do
 /New Catalog/.match(@browser.page_source)
 sleep(3)
end

Given (/I enter '(.*)' as the name of the catalog$/) do |x|
  sleep(3)
  @browser.find_element(:xpath, "//input[contains(@name, 'collectionName') and contains(@placeholder, 'Collection Name')]").send_keys "#{x}"
end

When (/^I enter 1.5 as the IMAP policy$/) do
  @browser.find_element(:xpath, "//input[contains(@name, 'collectionImap')]").send_keys '1.5'
end

Given (/I make catalog (.*)$/) do |arg1|
  if arg1 == "Public"
    select_from_dropdown("Select one","Share with everyone")
	sleep 2
	step 'I click Yes I do button'
  elsif arg1 == "Private"
    select_from_dropdown("Select one","Share with no one")
  end
end

Given (/I choose (.*) as (.*)$/) do |arg1, arg2|
  select_from_dropdown("#{arg2}","#{arg1}")
end

Given (/I click Add this product$/) do
    #@browser.find_element(:xpath, "//button[@class = 'btn--large btn--primary btn vz-btn-process ng-isolate-scope vz-btn-process--nospinner']").click
    @browser.find_element(:xpath, "//button[@class = 'btn--large btn--primary btn vz-btn-process ng-isolate-scope']").click
    #@browser.find_element(:xpath, "//span[@class='ng-scope' and contains(text(), 'Add this product')]").click
    sleep(20)
end

Given (/I see text (.*)$/) do |x|
 wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
  wait.until { 
    /#{x}/.match(@browser.page_source)}
end

Given (/I complete the required fields of the product details$/) do
  step 'Enter random productname into the productName field'
  step 'Enter random sku into the recordid field'
  #step 'Enter random username into the brand field'
  step 'Enter 50 information into the cost field'
  #step 'I choose Available as Status'
  #step 'Enter 25 information into the productInventory field'
end

Given (/I Save$/) do
  step 'I click Add this product'
  step 'I see text Products'
end

Given (/the product view appears$/) do
  step 'I see text Products'
end

And (/The Catalog is available under company catalogs in the product list$/) do
   /Chairs/.match(@browser.page_source)
end

And (/The product appears in the catalog$/) do
  /cucumberProd/.match(@browser.page_source)
end

Then (/An alert appears saying "(.*)"$/) do |x|
  /#{x}/.match(@browser.page_source)
end

And (/I Don't enter an IMAP policy$/) do
end

Then (/a tooltip appears saying "'(.*)' already exists."$/) do |x|
   /'#{x}' already exists./.match(@browser.page_source)
end