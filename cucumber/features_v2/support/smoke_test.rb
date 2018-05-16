# TODO
# ----------------------------------------------------------------------------------------
# 1) Manage "already existing user" to reuse it for the test                      - DONE
# 2) Manage error : Do not close the browser when it crash                        - DONE
# 3) Check RSpec to see if we could benefit from that (expect or should function) - TODO
# 4) Document the "Commen Step" & "Action" - Git Hub or through the code ??       - TODO


Given "I am debugging" do

end


########################################################################
#Login

Given "a user is on the Venzee web site" do
 visit_page(@base_url,"Product")
 #puts "This is the app URL: " + @app_url
 sleep 2
end


Given "a user and a company are registered" do
  sleep 2
  register_user_and_company()
end


When "enter valid credential" do
  fill_in("username1", $user.username)
  fill_in("password", $user.password)
end


And "Login to the application" do
    click_button("Login", "Forever Free Plan")
end

And "user login to the application" do
    sleep 3
	click_by_xpath("//div[@class='fusion-main-menu']/ul/li[5]/a/span")
	sleep 2
	#visit("login","Not a registered user?")
    fill_in("username", $user.email)
    fill_in("password", $user.password)
    click_button("Login","Forever Free Plan")
	sleep 3
	if /Hi test/.match(@browser.page_source)
    sleep 1
    click_by_xpath("//div[@class='intercom-launcher-preview-close']")
    end
end


########################################################################
#Register user and company

And "register the user" do
  click_button("Register", "Tell us about your company")
  $user.isRegistered = true
end



Then "select the type of industry I'm working in" do
  select_from_dropdown("Select your industry","Automotive and Industrial")
end



Then "select what best describes my Company" do
  select_option("describe","I export data to multiple channels")
end



Then "set up my company" do
  click_button("Set up my company","Dashboard")
end


########################################################################
#Add a product & varient

And "upload an image" do
  upload_image($product[0].image, "Remove")
  # Depending on the screen you upload the image, in the Add Product page, there's a spinner on the "Add this product" button that stay there for 1 sec after the product has appeared on the page, so the "wait" feature can't work here, I had to use a "Sleep :("
end


And "add this product" do
  click_button("Add this product","Product Data")
end


And "add this product with a variant" do
  click_button("Save","Add a variant to:")
end


And "choose to add a variant" do
  click_checkbox("addVariant")
end


When "a user copy info from the parent" do
  sleep 2
  click_checkbox("useParentData")
end


And "add the variant" do
  click_button("Add", "record id")
end


Then "see the product in the product list" do
  find_text($product[0].id)
  #find_text($product[0].name)
end


And "see the variant in the product list" do
  find_text($variant[0].id)
  #find_text($variant[0].name)
  sleep 1
  enforce_logout()
end


########################################################################
# Edit Collection Settings


Then "change are reflected in the product list" do
  visit_page_via_nav_takeover("Manage Partners","Partners")
  sleep 3
  visit_page_via_nav_takeover("Source Data", "Settings")
  wait_for_text("new collection name")
  find_text("new collection name")

  wait_for_text($product[0].id)
  #find_text($product[0].name)
  #find_text("CAD " + $product[0].cost.to_s)
  #find_text("CAD " + ($product[0].cost * $collection.map_policy).to_s + " MAP")
  sleep 1
  enforce_logout()
end


########################################################################
# Edit Profile Settings

Given(/save the (.*) change/) do |x|
 
  if x=="Company Settings"
	click_button("Save changes", "Save changes")
	wait_for_element_enabled("Organization")
	
  elsif x=="Collection Settings"
	click_button("Save Changes", $product[0].id)
	sleep 4
	
  else
	click_button("Save changes", "Save changes")
    sleep 5
    wait_for_element_enabled("Profile")
  end
end


Then "change are reflected on the Profile Settings" do
  # Change page; Partners screen
  #visit_page_via_nav_takeover("Partners","Add Partners")
	sleep 8
  # Then come back to the Profile Setting and validate the change of text.
  #visit_page_via_nav_takeover("Profile Settings","Your profile can only")
  
  # Validate 3 element that changed
  validate_textbox_content("position", $user.position)
  validate_textbox_content("phone", $user.phone)
  #validate_image($user.picture)

  # Make sure we logout at the end of the test
  sleep 1
  enforce_logout()
end


########################################################################
# Edit Company Settings



Then "change are reflected on the Company Settings" do

 # Change page; goto the Company Settings
  visit_page_via_nav_takeover("Profile Settings", "Profile Settings")
  
  # Then come back to the Profile Setting and validate the change of text.
  visit_page_via_nav_takeover("Company Settings", "Create and maintain your company profile")
  
  #visit("#{$user_company.domain}"+"/profile","Profile Settings")
  
  #visit("#{$user_company.domain}"+"/users/settings","Create and maintain your company profile")
  
  # Validate 3 element that changed
  sleep 5 #wait for page load time
  validate_textbox_content("company", "Modified Cuke")
  validate_textbox_content("employees", $user_company.nbr_employee)

  validate_dropdown("Country", $user_company.country)
  validate_dropdown("State/Province", $user_company.province)
  #validate_image($user_company.picture)

  # Make sure we logout at the end of the test
  sleep 1
  enforce_logout()

end

Then "enters a valid email address" do
	enter_address_to_invite()
end

Then "selects a suggested message" do
#TODO:
end

Then "sends the invitations" do
	send_invitation()
end

Then "gets redirect to the partners page" do
	find_text("Select one or more partners from the list to view available actions.")
end

Then "sees the pending invitation in the partners list" do
    sleep 2
	aa = @partneremail.split('+')
	find_text(aa.at(1))
	enforce_logout()
end

Then "is on the invite partner page" do
    click_by_xpath("//ul[@class='livetile__list ng-scope']/li[2]/article/footer")
    #sleep 2
	 #visit_page_via_nav_takeover("Manage Partners","Add Partners")
	 sleep 3
	 click_link("Add Partners", "Invite Partners to Access your Data")
end

Then "an email will be sent to the partners" do
    test_email()
	#test_email("partner")
	click_bold("#{$user_company.name} has shared its products with you")
	sleep 5
end

Then "has at least one partner that shared a collection" do
	add_product_via_form()
	edit_product_with_everyOne()
	#click_by_xpath("//ul[@class='livetile__list ng-scope']/li[2]/article/footer")
    sleep 2
    click_link("Expand", "Log out")
	sleep 1
	click_link("Manage Partners", "Add Partners")
	#visit_page_via_nav_takeover("Manage Partners","Add Partners")
	click_link("Add Partners", "Invite Partners to Access your Data")
	#visit("partners?invite=true","Add an email address for each of your partners")
	sleep 1
	enter_address_to_invite()
    send_invitation()
	find_text("Select one or more partners from the list to view available actions.")
	sleep 2
	enforce_logout()
	
	sleep 5
	test_email()
	#test_email("partner")
	click_bold("#{$user_company.name} has shared its products with you")
	process_invitation()
	register_user_and_company_via_invitation()
	wait_for_text("Dashboard")
	#ack_intercom_msg()
end

Then "is on the product records page" do
 sleep 2
  visit_page_via_nav_takeover("Source Data", "Source Data")
end

Then "opens the collections list" do
    sleep 2
	wait_for_text($collection.name)
	sleep 2
	select_from_filter_dropdown("Collection Name",$collection.name)
end

Then "selects a shared collection" do
     sleep 2
	select_from_filter_dropdown("Collection Name",$collection.name)
end

Then "sees the shared collection" do
    #validate_textbox_content_via_ngmodel("products.collection",$collection.name)
    find_text($collection.name)
	#wait_for_text("Welcome to Venzee")
	#ack_intercom_msg()
	sleep 2
	enforce_logout()
end

Then "adds images to his product records" do
	add_image_to_product()
end

Then "the images are uploaded" do
	image_uploaded()
end

Then "sees the collection" do
	select_from_filter_dropdown("Collection Name",$collection.name)
	wait_for_text($product[0].name)
end

Then "each product record correctly displays the uploaded thumbnail image" do
	element_is_available("thumbnail ng-scope")
	enforce_logout()
end

Then "a partner received an invitation" do
	register_user_and_company()
    login_user()
	click_by_xpath("//ul[@class='livetile__list ng-scope']/li[2]/article/footer")
    sleep 2
    #sleep 2
	#visit_page_via_nav_takeover("Manage Partners","Add Partners")
	click_link("Add Partners", "Invite Partners to Access your Data")
  	enter_address_to_invite()
    send_invitation()
    find_text("Select one or more partners from the list to view available actions")
	enforce_logout()
end

 #Then "the invitation token is still valid" do
   #test_email()
   #puts "clicking on the email"
   #click_bold("Venzee | #{$user_company.name} has shared its products with you")
   #process_invitation()
   #register_user_and_company_via_invitation()
   #enforce_logout()
   
	#click_bold("has shared their products with you")
	#puts "Inviting a partner"

	#enforce_logout()
	
	#puts "Prepare to verify the email"
	#sleep 20
	#test_email("partner")
	#puts "Email verified" 
#end

Then "the invitation token is still valid" do
    test_email()
	puts "clicking on the email"
    click_bold("#{$user_company.name} has shared its products with you")
	#default_switch()
end

Then "is not register on Venzee" do
	wait_for_text("click here")
end

Then "clicks on the invitation link" do
    process_invitation()
	#switch_frame("ifmail","Venzee is free")
	#click("Click here")
	#switch_tab("Register")
end

Then "completes the registration process" do
	register_user_and_company_via_invitation()
end

Then "sees the Dashboard screen" do
    visit_page_via_nav_takeover("Dashboard","Dashboard")
	#find_text("Dashboard")
	#wait_for_text("Let’s get started")
	#ack_intercom_msg()
end

Then "the user will be added to the partner's partners list" do
	sleep 4
    visit_page_via_nav_takeover("Manage Partners","Add Partners")
	sleep 2
	#visit("partners","Partners")
	find_text($user_company.name)
	enforce_logout()
end

Then "the partner will be added to the user's partners list" do
	#ack_intercom_msg()
	#enforce_logout()
    login_user()
	visit_page_via_nav_takeover("Partners","Partners")
	sleep 2
	verify_partner()
	enforce_logout()
end

Then "selects a collection" do
	add_image_to_product()
	image_uploaded()	
end

Then "chooses to export images" do
	sleep 5 
    # ToDo: will implement the method to wait for button to activate.
	click_button("Export records","Export images")
	click_link("Export images","How would you like to export")
end

Then "chooses the original size of the images" do
 click_by_ng("exportImages(showInputs, resize, compression, exportForm)","Preparing your export")
end

Then "sees a message that advising we are preparing data export" do
 find_text("Shortly, we'll send you an email containing a link to download your product data.")
 wait_and_refresh(3)
end

Then "sees a message that advising we are preparing media export" do
 #find_text("Shortly, we'll send you an email containing a link to download your product media.")
 #wait_and_refresh(3)
end

Given (/will receive a link to download the (.*)$/) do |x|
 enforce_logout()
 test_email()
 if x=="images"
   click_bold("Image Export Request")
 else
   click_bold("Data Export Request")
 end
 
end

Then "clicks on the link" do
 sleep 5
 click_by_xpath("//a[contains(.,'Download')]")
 sleep 3
end

Then (/chooses to export records in a (.*) file$/) do |x|
 sleep 5
 click_button("Export records", "File download")
 click_link("File download","Select the file format:")
 sleep 6
 if x == "csv"
   click_by_xpath("//label[@value='csv']/span[1]")
 elsif x == "xls"
 	click_by_xpath("//label[@value='xls']/span[1]")
 elsif x == "xlsx"
 	click_by_xpath("//label[@value='xlsx']/span[1]")
 	end
 sleep 1
 click_by_xpath("//button[@class = 'btn btn--center' and contains(text(), 'Export')]")
 #click_button("Export", "Preparing your export.")
end

#NOW

Then "a user is registered" do
	register_user_and_company()
	login_user()
	add_product_via_form()
end

Then "I'm on the Add product data using a CSV file page" do
  click_by_xpath("//ul[@class='livetile__list ng-scope']/li[3]/article/footer")
     sleep 3
	 click_link("Expand", "Log out")
	sleep 1
	click_by_xpath("//nav[@class='app-sections']/ul[2]/li/ul/li[1]")
	sleep 2
	#click_button("Add","Add records")
	#click_by_java("Add", "Add records")
    #click_link("Add records", "Create a new collection")
end

Then "I choose to create a new collection" do
	#select_option("state","Add product record to a new collection")
	#click_button("Next","Create a new collection")
end

Then "I enter a collection name" do
	fill_in("collectionName", $product[0].name)
end

Then "I share the collection with everyone" do
	select_from_dropdown("Select one","Share with everyone")
	click_button("Yes, I do","Sharing Setting")
end

Then "I provide a valid csv file" do
select_from_filter_dropdown("Select Data Source","Local Drive")
	sleep 5
	upload_setting_image($user.csv)
    sleep 10
end

Then "I submit the file" do
	click_button("Next", "From which row does")
	click_button("Next","Select All")
end

Then "I see the mapping page" do
	click_button("Next", "Which column represents")
	#find_text("found in your data")
end

Then "I map the Record Id" do
	click_button("product id","record id")
	click_button("Next","parent id")
end

Then "I map the Record Name" do
	click_button("name","record name")
	click_button("Next","parent id")
end

Then "I map the cost" do
	click_button("Skip","Which column")
	click_button("Skip","Please take a moment to confirm")
	click_button("Confirm","Done")
	click_link("Close","Source Data")
end

Then "I'm done mapping" do
	click_button("Done Mapping","Please take a moment")
end

Then "I see the confirmation screen" do
	find_text("Confirm")
end

Then "I confirm my choice" do
	click_button("Confirm","Mapping your CSV file")
end

Then "I skip to upload image" do
	wait_for_text("View them now")
	click_link("Close","Data")
end

Then "I see my product in the product list" do
	wait_for_text($product[0].name)
	find_text($product[0].name)
	enforce_logout()
end

def verify_partner()
  begin
    wait = Selenium::WebDriver::Wait.new(:timeout => 25) # seconds
    wait.until { 
      /#{$partner_company[0].name}/.match(@browser.page_source) ||
      /#{$partner_company[1].name}/.match(@browser.page_source) ||
      /#{$partner_company[2].name}/.match(@browser.page_source) ||
      /#{$partner_company[3].name}/.match(@browser.page_source)
    }
    rescue Exception => e
      show_error(e, "verify_partner()", {})
  end
end

And "selects a frequency times for the notification" do
	click_by_xpath("//div[contains(@class, 'notifications-frecuency')]/label[2]/span[1]")
end