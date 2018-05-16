Given(/^a user is logged to Venzee$/) do
  #$curent_app = 0
  visit_page("https://app.venzee.com/login","Not a registered user?")
  #login_user() 
   fill_in("username", "testtransformation.2016@yopmail.com")
    fill_in("password", "1qaz!QAZ")
    click_button("Login","Get Started")
	sleep 3
end
Given(/^user selects the template and the source collection$/) do
   visit_page_via_nav_takeover("Dynamic Data", "about creating Dynamic collections.")
   sleep 1
   click_by_xpath("//div[@class='product-header__row']/div[2]/a")
   sleep 1
   click_by_xpath("//span[contains(text(), 'CukeTest')]")
   click_button("Next", "Select data source and destination")
   select_from_filter_dropdown("Select your source collection","001_cuke_test")  
end

When(/^enters the Dynamic collection name and the description$/) do
   fill_in("transformName", $er_collection.name)
   fill_in_text_area("transformsDescription", "Test Transformation")
   click_button("Next", "Insert and combine attributes")
end
When(/^mapped the required fields$/) do
  click_btn("product id")
  sleep 1
  click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Name')]")
  click_btn("name")
  sleep 2
  click_btn("Generate Records")
  sleep 8
  wait_for_text("We generated") 
  click_button("View Records", "contains")
  sleep 2 
end

Then(/^sees products in the Dynamic collection$/) do
   sleep 5
   select_from_filter_dropdown("Collection Name",$er_collection.name)
   #sleep 2
   #enforce_logout()
end
When(/^deletes the Dynamic collection$/) do
   sleep 2
   click_button("Settings","Number of records")
   click_link("Delete collection", "Are you sure you want to delete this collection?")
   click_btn("Delete")
   sleep 2
   enforce_logout()
   end