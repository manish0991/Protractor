Given(/^the user created a template$/) do
  #upgrade_to_paid_plan()
  click_link("Expand", "Log out")
	sleep 1
	click_link("Dashboard", "Get Started")
	sleep 1
  create_private_template()  
end

Given(/^is on the create a transformation page$/) do
   visit_page_via_nav_takeover("Dynamic Data", "about creating Dynamic collections.")
   sleep 1
   click_by_xpath("//div[@class='product-header__row']/div[2]/a")
   sleep 1
end

When(/^selects the template and the source collection$/) do
   click_by_xpath("//span[contains(@class, 'thumbnail-dashboard_item_name') and text()='#{$product[3].name}']")
   click_button("Next", "Select data source and destination")
   select_from_filter_dropdown("Select your source collection",$collection.name)  
end

When(/^enters the ER collection name and the description$/) do
   fill_in("transformName", $er_collection.name)
   fill_in_text_area("transformsDescription", "Test er collection")
   click_button("Next", "Insert and combine attributes")
end

When(/^maps the required fields$/) do
   click_btn("record id")
   #click_btn("Generate Records")
   sleep 5
   wait_for_text("We generated") 
end

Then(/^sees the confirmation screen$/) do
   click_btn("Generate Records")
   sleep 5
   wait_for_text("We generated")
   sleep 2
   #wait_for_text("We are able to generate")
   click_button("View Records", "contains")
   sleep 2
end

Then(/^sees products in the Export Ready list$/) do
   sleep 3
   select_from_filter_dropdown("Collection Name",$er_collection.name)
   sleep 2
end
And(/^sees a notification saying he added products$/) do
  click_by_xpath("//nav[@class='nav-takeover-right']/a")
   #visit_page_via_nav_takeover("Dashboard","Dashboard")
   wait_for_text("dynamic record")
   enforce_logout()
end

And(/^sees a notification saying that product were added$/) do
   sleep 1
   visit_page_via_nav_takeover("Dashboard","Dashboard")
   wait_for_text("added")
   enforce_logout()
end

Given(/^has at least one partner that shared an Export Ready collection$/) do
    add_product_via_form()
	#upgrade_to_paid_plan()
	click_link("Expand", "Log out")
	sleep 1
	click_link("Dashboard", "Get Started")
	sleep 1
	create_private_template()
	create_transform()
	click_button("Settings","Number of records")
	select_from_dropdown("Select one","Share with everyone")
	click_button("Yes, I do","Sharing Setting")
	click_button("Save Changes","contains")
	#sleep 4
	#visit_page_via_nav_takeover("Manage Partners","Add Partners")
	sleep 2
    click_link("Expand", "Log out")
	sleep 1
	click_link("Manage Partners", "Add Partners")
	click_link("Add Partners", "Invite Partners to Access your Data")
	sleep 1
	enter_address_to_invite()
    send_invitation()
	find_text("Select one or more partners from the list to view available actions.")
	enforce_logout()
	sleep 5
	test_email()
	click_bold("#{$user_company.name} has shared its products with you")
	process_invitation()
	register_user_and_company_via_invitation()
	wait_for_text("Get Started")
	#ack_intercom_msg()
end

Given(/^is on the on the Export Ready Records page page$/) do
   #visit_page_via_nav_takeover("Dynamic Data", "Dynamic Data")
   click_link("Expand", "Log out")
	sleep 1
	click_link("Source Data", "Data")
end

When(/^opens the Export Ready collections list$/) do
    sleep 5
	wait_for_text($er_collection.name)
	sleep 2
	select_from_filter_dropdown("Collection Name",$er_collection.name)
end


When(/^selects a shared Export Ready collection$/) do
    sleep 2
    select_from_filter_dropdown("Collection Name",$er_collection.name)
end

Then(/^sees the shared Export Ready collection$/) do
    find_text($er_collection.name)
	enforce_logout()
end

Given(/^has created a transformation$/) do
   add_product_via_form_add_additional()
   #upgrade_to_paid_plan()
   create_private_template()
   create_transform() 
end

When "user changes the mappings" do
   sleep 2
   click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Cost')]")
   click_btn("cost")
   sleep 3
   #click_by_xpath("html/body/div[4]/div/div/div/div/div[1]/form/fieldset/div/div[2]/div/button[2]")
   click_btn("Save Changes")
   sleep 2
   wait_for_text(" We modified") 
   #click_button("View Records", "Dynamic Data")
    click_btn("View Records")
   sleep 2
end

Then(/^sees a notification saying he updated products$/) do
   sleep 5
   visit_page_via_nav_takeover("Dashboard","Dashboard")
   click_link("Activity", "updated")
   enforce_logout()
end

When(/^create a custom math widget$/) do
   create_math_widget() 
end

When(/^products with add additional exist in the product list$/) do
   add_product_via_form_add_additional()
end

When(/^create a custom spec table widget$/) do
   create_Spec_table_widget()  
end

Given(/^the user created a template with html$/) do
    #upgrade_to_paid_plan()
	click_link("Expand", "Log out")
	sleep 1
	click_link("Dashboard", "Get Started")
	sleep 1
   create_private_template_html  
end

Given(/^sees the product details panel with that display the HTML table$/) do
    #click_by_xpath("//div[@class='grid-table__row__content']") 
	#click_by_xpath("//div[contains(@class, 'grid-table__td')]/span")
	sleep 2
	click("View More")
	sleep 2
	enforce_logout()
	
end

Given(/^has created a transformation records$/) do
   add_product_via_form_add_additional()
   #upgrade_to_paid_plan()
   create_private_template()
   create_basic_transform() 
end

When "edits products via csv" do
    sleep 5
    click_button("Add", "Add records")
    sleep 5
    edit_product_via_csv()
end

When "edits products via form" do
    sleep 5
    edit_product_via_form()
    sleep 2
end
 
When "sees updated products in the Export Ready list" do
   sleep 1
   click_link("Dynamic Data", "Settings")
   sleep 2
   #select_from_filter_dropdown("Collection Name",$er_collection.name)
end

When "products available in the product list" do
  product_via_csv_with_images()
end

When "associated images to those products" do
  #upgrade_to_paid_plan()
  image_private_template()
end

When "checks the transform images" do
 click_btn("product id")
  sleep 2
  click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Name')]")
  click_btn("name")
  sleep 2
  click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'image')]")
  click_btn("media")
  sleep 2
  #click_btn("Generate Records")
  #sleep 10
  #wait_for_text("We generated")
  #sleep 4
  #click_button("View Records", "Export Ready Data")
end

Given(/^the user created a template with text$/) do
click_link("Expand", "Log out")
	sleep 1
	click_link("Dashboard", "Get Started")
	sleep 1
 create_private_template()
end

When(/^create a custom padding widget$/) do
   create_padding_widget() 
end

When(/^sees the product's one of column with the padding character$/) do
   wait_for_text("00001000") 
   enforce_logout()
end
When(/^create a custom case widget$/) do
   create_case_widget() 
end

When(/^sees the product's one of column with the all capitals case character$/) do
   wait_for_text("CUKE-TEST") 
   enforce_logout()
end

Given(/^products with added additional exist in the product list$/) do
  add_product_via_form_add_additional_name
end
