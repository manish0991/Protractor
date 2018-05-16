And (/At least one public and one private catalog exists$/) do
  step 'One private catalog exist'
  step 'One public catalog exist'
end

Given "One public catalog exist" do
   step 'I have chosen to add a product using the form'
   wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
   wait.until { 
    /Choose an existing collection or create a new one/.match(@browser.page_source) 
    }
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
  click_button_and_wait("Yes, I do",3)
end

Given "One private catalog exist" do
   step 'I have chosen to add a product using the form'
   wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
   wait.until { 
    /Choose existing catalog, or create a new one/.match(@browser.page_source) 
    sleep(3)}
   enter_data_in_field("Tables","collectionName")
   step 'Enter 1.5 information into the collectionImap field'
   step 'I make catalog Private'
   step 'I choose US Dollar as Currency'
   step 'I complete the required fields of the product details'
   step 'I Save'
   step 'the product view appears'
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

And (/all products in the catalog have the new (.*)$/) do |x|
   @browser.navigate.refresh
   sleep(5)
   if x=="IMAP policy"
	find_text("1.1")
   elsif x=="currency"
    find_text("INR")
   end
end

And (/I clear the IMAP$/) do
	clear_field("map")
end

And (/all products in the catalog have the IMAP policy cleared$/) do
	element_not_displayed("products.columns[2]")
end

And (/I Change the Currency to a different value$/) do
  step 'I choose Indian Rupee as Currency'
end

And (/I change the name of the catalog$/) do
	fill_in("collectionName","New Collection name Updated")
end

And (/The catalog name is changed$/) do
	find_text("new collection name updated")
end

And (/The products appear under the new the catalog$/) do
	find_text("new collection name updated")
end

And(/I have selected a (.*) catalog$/) do |x|
	if x=="public"
	select_from_filter_dropdown("Collection Name","chairs")
	find_text("contains")
	
	elsif x=="private"
	select_from_filter_dropdown("Collection Name","tables")
	find_text("contains")
	
	elsif x=="single"
	end
end

And (/I change the name of the catalog to an existing name$/) do
	step 'I have selected a single catalog'
    step 'I have chosen to edit the catalog settings'
	step 'Enter tables information into the collectionName field'
	step 'Enter 1.2 information into the map field'
	sleep 2
end