When(/^deletes the collection$/) do
   click_button("Settings","Number of records")
   click_link("Delete collection", "Are you sure you want to delete this collection?")
   click_btn("Delete")
  #sleep 2
end

#Then(/^the collection is removed$/) do
   #click_btn("Delete")
  #sleep 2
 #text_not_available("$collection.name")
#end


Then(/^sees there are no more collection$/) do
 wait_for_text("Adding products is quick and easy.")
  #assert_text_not_present("contains")
#@browser.find_element(:xpath, "$collection.name").displayed?
   enforce_logout()
   #click("html/body/div[4]/header/nav[1]/a")
   #click("Log out")
   
end

Then(/^added products exist in the product list$/) do
    click_button("Add","Add records")
    click_link("Add records", "Create a new collection")
	fill_in("collectionName", $product[0].name)
	sleep 5
	upload_setting_image($user.csv)
    sleep 10
	click_button("Next","Select All")
    click_button("Next", "Which column represents")
    click_button("product id","record id")
    click_button("Next","parent id")
    #click_button("name","record name")
    click_button("Next","parent id")
    click_button("Skip","Which column")
	click_button("Skip","Please take a moment to confirm")
	click_button("Confirm","Done")
	click_link("Close","Product Data")
end

When "sorts the collection by Product ID in ascending order" do
 sleep 5
 click_by_xpath("//span[contains(., 'product id')]")
 sleep 5
 
end

When "sees the records sorted in ascending order by Product ID" do
 is_element_present("//div[@class='grid-table__row__content']/div//span[contains(text(), '8001')]")
 end
 
 When "sorts the collection by Product ID in descending order" do
 sleep 5
 click_by_xpath("//span[contains(., 'product id')]")
 sleep 5
 click_by_xpath("//span[contains(., 'product id')]")
 sleep 5
end

When "sees the records sorted in descending order by Product ID" do
 is_element_present("//div[@class='grid-table__row__content']/div//span[contains(text(), '8010')]")
 end
 
 
 Given(/^added images to his product records$/) do
    click_button("Add","Add records")
    click_link("Add records", "Create a new collection")
	fill_in("collectionName", $product[0].name)
	sleep 5
	upload_setting_image($user.csv)
    sleep 10
	click_button("Next","Select All")
    click_button("Next", "Which column represents")
    click_button("product id","record id")
    click_button("Next","parent id")
    click_button("Skip","Which column")
	click_button("media","image filenames")
	click_button("Next","Please take a moment to confirm your")
	click_button("Confirm","Done")
	click_button("Upload product images","Bulk upload media")
	sleep 2
	upload_bulk_image($product[0].image, "Processing your Images")
end

#When(/^requests the error file$/) do
 # find_text("Mismatched:1")
#end

Then(/^downloads a CSV file$/) do
  click("Click here")
  sleep 2
end

Given(/^select the product for copy$/) do
  click_button("Export records","Export images")
  #click_link("Collection","Select the file format")
  click_by_xpath("//div[@class='dropdown open']/ul/li[3]")
  click_by_xpath("//label[@value='new_collection']/span[1]")
  #fill_in("Name this collection", $collection.name)
  #click_by_xpath("//button[@class = 'btn btn--center' and contains(text(), 'Export')]")
  #sleep 2
end

When(/^product copied to new collection$/) do
  sleep 2
  fill_in_from_xpath("//input[contains(@class, 'form-field') and (@name='collectionName')]", "Copy Collection")
  #fill_in("Name this collection","Copy Collection")
  click_by_xpath("//button[@class = 'btn btn--center' and contains(text(), 'Export')]")
  sleep 5
end

When(/^sees new collection at data screen$/) do
   sleep 5
  find_text("copy collection")
  enforce_logout
end



Given(/^added a new collection$/) do
  add_product_for_copy()
end

When(/^copy product to the existing collection$/) do
   #click_by_xpath("//div[@class='grid-table__checkbox']/label")
   click_button("Export records","Export images")
   #click_link("Collection","Select the file format")
   sleep 0.5
   click_by_xpath("//div[@class='dropdown open']/ul/li[3]")
   click_by_xpath("//label[@value='existing_collection']/span[1]")
   sleep 2
   #select_from_filter_dropdown("Collection",$collection.name)
   click_by_xpath("//a[contains(@class, 'select2-choice ui-select-match select2-default') and (@placeholder='Collection')]")
   sleep 0.5
   click_by_xpath("//ul[@class='select2-result-single']/li[1]")
   sleep 2
   click_by_xpath("//vz-export-dropdown//div[2]/button[text()='Export']")
   sleep 5
   wait_for_text("Copying your data")
   sleep 5
  
end
#Then(/^product added to the selected existing collection$/) do
  
#end

When(/^selects the product$/) do
  click("View More")
  sleep 2
  click_button("Export records","Export images")
  sleep 2
  click_by_xpath("//div[@class='dropdown open']/ul/li[3]")
  sleep 2
  click_by_xpath("//label[@value='new_collection']/span[1]")
  sleep 2
end

Then "I provide a csv file" do
select_from_filter_dropdown("Select Data Source","Local Drive")
	sleep 5
	upload_setting_image($product[0].csv2)
    sleep 10
end
Then "I upload the file" do
	click_button("Next", "From which row does your data start?")
	#click_button("Next","Select All")
end
Then "I see row where the header row is" do
	fill_in_from_xpath("//input[contains(@class, 'form-field__input') and (@type='number')]", "4")
	click_button("Next","Select All")
end

Then "I map the Product Id" do
	click_button("record id","record id")
	click_button("Next","parent id")
end

