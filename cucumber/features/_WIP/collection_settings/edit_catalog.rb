=begin
And (/At least one public and one private catalog exists$/) do
  step 'One private catalog exist'
  step 'One public catalog exist'
end

Given "One public catalog exist" do
   step 'I have chosen to add a product using the form'
   wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
   wait.until { 
    /Choose existing catalog, or create a new one/.match(@browser.page_source) 
    sleep(3)}
   @browser.find_element(:xpath, "//*[@id='add-product']/fieldset/div/div[1]/div[2]/div/div[2]/div/div[2]/div[2]/div[2]/p[2]/button").click
   sleep 2
   enter_data_in_field("Chairs","collectionName")
   step 'Enter 1.5 information into the collectionImap field'
   step 'I make catalog Public'
   step 'I choose US Dollar as Currency'
   step 'I complete the required fields of the product details'
   step 'I Save'
   step 'the product view appears'
end

When "I click Yes I do button" do
  sleep 3
  @browser.find_element(:xpath, "//*[@id='add-product']/fieldset/div/div[1]/div[2]/div/div[2]/div/div[2]/div[2]/div[2]/p[2]/button").click
end

Given "One private catalog exist" do
   step 'I have chosen to add a product using the form'
   wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
   wait.until { 
    /Choose existing catalog, or create a new one/.match(@browser.page_source) 
    sleep(3)}
   enter_data_in_field("Tables","collectionName")
   step 'Enter 1.5 information into the collectionImap field'
   #step 'I make catalog Private'
   step 'I choose US Dollar as Currency'
   step 'I complete the required fields of the product details'
   step 'I Save'
   step 'the product view appears'
end

When "I have selected a single catalog" do
end

And (/I have chosen to edit the catalog settings$/) do
   @browser.find_element(:xpath, "//i[contains(@class, 'fa fa-cog')]").click
   wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
   wait.until { 
    /Settings of/.match(@browser.page_source) 
    sleep(3)}
end

And (/I change the IMAP policy to a different valid value$/) do
   step 'Enter 1.1 information into the map field'
end

And (/all products in the catalog have the new IMAP policy$/) do
   @browser.navigate.refresh
   sleep(10)
  /55/.match(@browser.page_source)
end

And (/I change the Currency to a different value$/) do
  step 'I choose Indian Rupee as Currency'
end

And (/all products in the catalog have the new currency$/) do
  @browser.navigate.refresh
   sleep(10)
  /55/.match(@browser.find_element(:xpath, "//div[2][@class='grid-table__row ng-scope']/div/div[2]/div[3]/p[1]").text)
end
=end