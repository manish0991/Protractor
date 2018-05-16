require 'date'

##########################################################################
# Common Step 

@UserEmail =""
@UserName =""
@Companyname =""
Then /^see the (.*) page$/ do |page|
  case page
  
  when "Products"
    find_text("Data")
    enforce_logout()
  
  when "Register Company"
    find_text("Tell us about your company")

  when "Add Variant"
    find_text("Add a variant to:")
	

  when "Dashboard"
    find_text("Dashboard")
	  sleep 2
    ack_intercom_msg()
    #wait_for_text("Let's get started...")
	  enforce_logout()
  
  else
    #TODO : Extract an "Exception method and raise and exception and make sure the browser don't close"
    puts "Param $an_information : #{info}"
    fill_in("crash","now")
  
  end
end


##########################################################################
Given /^a user is on the (.*) page$/ do |page|
  case page

  when "Register User"
    visit("register", "Confirm Password")
  
  when "Login"
	  click_link("Login", "Not a registered user?")

  when "Product List"
    visit_page_via_nav_takeover("Source Data", "Source Data")

    when "Add Product via Form"
     click_link("Expand", "Log out")
	 sleep 1
	 click_by_xpath("//div[@class='row']/nav/ul[2]/li/ul/li[2]/a")
      # Don't know why, but when running the entire test suite, the "wait" doesn't seem to work, so I had to add a sleep 1
      sleep 1
 
  when "Collection Settings"
    click_button("Settings", "Settings for")

  when "Profile Settings"
    #visit_page_via_nav_takeover("Profile Settings", "Profile")
	click_link("Expand", "Log out")
	 sleep 1
	click_link("Profile Settings","Language")
	sleep 1
	
  when "Company Settings"
    #visit_page_via_nav_takeover("Company Settings","your company profile")
	
	click_link("Expand", "Log out")
	 sleep 1
	click_link("Company Settings","Company Profile")
	sleep 1

  when "invite partner"
    #visit_page_via_nav_takeover("Partners", "Partners")
	sleep 2
    click_link("Expand", "Log out")
	sleep 1
	 click_link("Manage Partners", "Add Partners")
	 click_link("Add Partners","Invite Partners to Access your Data")
	
  when "Group Management"
      visit_page_via_nav_takeover("Partners", "Partners")
	  click_button("Group", "Group")
	 
  when "Not Found"
	  @browser.manage.window.resize_to(600, 300)
      sleep 1
	  
  when "home"
	visit_page(@base_url,"Using spreadsheets")
	sleep 5
	
  when "Create a custom integration"
	visit_page_via_nav_takeover("Create an Integration", "Type a name for this integration")
	
  when "Edit an integration"
	#@browser.execute_script "window.scrollBy(0,315)"
	click_link("View/Edit","Edit this Integration")
	
  when "Integrations"
	#visit_page_via_nav_takeover("Integrations","Enable integrations")
	click_link("Expand", "Log out")
	sleep 1
	click_link("Integrations", "Enable integrations")
	
  when "billing"
    #visit_page_via_nav_takeover("Upgrade Plan", "Select your plan (Pay annually and get one month free)")
	click_button("Upgrade","Billing")

  when "Create a template"
    click_link("View Templates","Choose a template to establish")
    #sleep 1
    #visit_page_via_nav_takeover("Templates Library", "My Templates")
    sleep 2
    click_link("Add a template", "Set up your template")
	
  when "Edit a transformation"	
    click_button("Settings","Number of records")
    click_link("Edit this collection", "Edit Collection Transformation")
	
  when "Data"	
    sleep 2
	click_link("Source Data", "Settings")
    #visit_page_via_nav_takeover("Source Data", "Settings")
	
	when "Export Ready Records"
  sleep 2
    visit_page_via_nav_takeover("Dynamic Data", "Dynamic Data")
	
	when "Menu Nav Takeover"
  sleep 2
   click_by_xpath("//nav[@class='nav-takeover']/a")
   
   when "Dashboard"
  sleep 2
    visit_page_via_nav_takeover("Dashboard", "Get Started")
	sleep 0.5
	click("View More")
	
	#then "documentation"
	#driver.getPageSource().contains("Welcome to the Venzee Developers Portal")
  else
    #TODO : Extract an "Exception method and raise and exception and make sure the browser don't close"
    puts "Param $an_information : #{page}"
    fill_in("crash","now")
  
  end
end



##########################################################################
When "enter the following info" do |table|
  table.raw.each do |info|
    case info[0]
    
    when "firstname"
      fill_in("firstName", $user.firstname)
    
    when "lastname"
      fill_in("lastName", $user.lastname)

    when "username"
		@UserName = "testcuke" + rand(10000000).to_s
		#COMMENT : Here use to get unique Username.
      fill_in("username", "#{@UserName}")
    
    when "email"
		@UserEmail = "cukevz+1" + rand(10000000).to_s + "@gmail.com"
		#COMMENT : Here use to get unique Email.
      fill_in("email", "#{@UserEmail}")
    
    when "password twice"
      fill_in("password", $user.password)
      fill_in("passwordConfirm", $user.password)

    when "company name"
		@Companyname = "Vegan Corp" + rand(10000000).to_s
		#COMMENT : Here use to get unique companyname
		fill_in("company","#{@Companyname}")
		#fill_in("company", $user_company.name)
        
    when "company web site"
      fill_in("website", $user_company.website)

    when "valid credential"
      fill_in("username", $user.username)
      fill_in("password", $user.password)

    when "Collection Name"
	  wait_for_text("Collection Name")
      fill_in("collectionName", $collection.name)

    when "Record Id"
      fill_in("labelrecordid", "Record Id")
      fill_in("recordid", $product[0].id)

    when "Record Name"
      fill_in("labelproductName", "Product Name")
      fill_in("productName", $product[0].name)

    when "Cost"
      fill_in("costlabel", "Cost")
      fill_in("cost", $product[0].cost)

    when "Additional Specification"
      click_link("Add additional data", "Label")
      fill_in("specLabel", $product[0].spec_label)
      fill_in("specValue", $product[0].spec_value)

    when "Variant Record Id"
      fill_in("recordid", $variant[0].id)

    when "Variant Record Name"
      fill_in("productName", $variant[0].name)
	  
	when "phone"
      fill_in("phone",$user_company.phone)
	  
	when "Integration Name"
	  fill_in("integrationName",$integration.name)
	  
	when "credit card number"
	 @browser.execute_script("window.scrollBy(0,200)")
	  fill_in("cardNumber", $user.cardNumber)
	  
	when "CVC"
	  fill_in("cardCVC", $user.cvc)
	  
  when "credit card expiry month"
    @Month = (Date.today>>1).strftime("%b")
    select_date_from_dropdown("Month", "#{@Month}")
    
  when "credit card expiry year"
    @Year = Date.today.strftime("%Y").to_i + 1
    select_date_from_dropdown("Year", "#{@Year}")
    
  when "CardHolder Name"
    fill_in("cardHolder", $user.firstname + " " + $user.lastname)
    		
	when "Integration Description"
	  fill_in_text_area("description",$integration.description)
	  #click_button("Add this integration","Copy")
	  
	when "Update Frequency"
	  select_from_filter_dropdown("Frequency","Daily")
	  
	when "The Store URL"
	  fill_in_from_xpath("//input[contains(@class, 'form-field__input') and (@name='store.url')]", "http://cantodoelefante.info/wordpress")
	  
	when "API Key"
	  #fill_in("Enter API Key","ck_dbce3a6319bded794309e117cce14161a39cd07b")
	  fill_in_from_xpath("//input[contains(@class, 'form-field__input') and (@name='oauth.api.key')]", "ck_dbce3a6319bded794309e117cce14161a39cd07b")
	  
	when "API Secret"
	  #fill_in("Enter API Secret","cs_5537cc32e26579498e1cb47ea535883223fb920e")
	 fill_in_from_xpath("//input[contains(@class, 'form-field__input') and (@name='oauth.api.secret')]", "cs_5537cc32e26579498e1cb47ea535883223fb920e")
	  

  when "Name"
    fill_in("templateName", $product[3].name)
  
  when "Description"
    fill_in_text_area("description", "Automation template")

  when "Category"
    select_from_dropdown("None", "Ecommerce")

  when "Publish"
    select_from_dropdown("Publish?", "Yes")

  when "Logo"
		upload_setting_image($user.picture)
    
    else
      #TODO : Extract an "Exception method and raise and exception and make sure the browser don't close"
      puts "Param $an_in65R4Ration : #{info}"
      fill_in("crash","now")
    
    end 
  end
end



##########################################################################
And "change the following information" do |table|
  table.raw.each do |info|
    case info[0]
    
    when "Catalog Name"
      fill_in("collectionName", "New Collection Name")

    when "MAP Policy"
      fill_in("map", $collection.map_policy)

    when "Currency"
      select_from_filter_dropdown("Currency", $collection.currency)

    when "Profile Picture"
	  wait_for_text("Your profile can only")
      upload_setting_image($user.picture)

    when "Position"
      sleep 2
      fill_in("position", $user.position)
	  
	  when "Comany Name"
      wait_for_text("your company profile")
      fill_in("company",$user_company.name)
	
	  when "Number of employees"
	    fill_in("employees","123")
	
	  when "Country"
      sleep 2
	    select_from_filter_dropdown("Country",$user_company.country)
	
	  when "State/Province"
	    sleep 2
	    select_from_filter_dropdown("State/Province",$user_company.province)

      upload_setting_image($user.picture)

    when "Position"
      fill_in("position", $user.position)

    #when "Contact Telephone Number"
	  when "phone"
      # Kind of a patch I did since the field name is "position", same as the above... So I enter data via his placeholder. 
      # TODO: Change it back to "phone" since the field name has been corrected
      #fill_in_from_placeholder("Contact Telephone Number", $user.phone)
	    fill_in_from_placeholder("Phone Number", $user.phone)

    when "Company Picture"
      upload_setting_image($user_company.picture)

    when "Company Name"
      fill_in("company", "Modified Cuke")

    when "No. of employees"
      fill_in("employees", $user_company.nbr_employee)

    when "Country"
      select_from_filter_dropdown("Country", $user_company.country)
      
    when "State/Province"
      select_from_filter_dropdown("State/Province", $user_company.province)
	
	  when "Integration Name"
	    fill_in("integrationName","Updated Integration")
	  
	  when "Integration Description"
	    fill_in_text_area("description","Updated Description")

    when "Industry"
      select_from_filter_dropdown("Industry", "Art and Photography")

    when "Website"
      fill_in_from_placeholder("Company URL", "http://cuketest.com")

    when "describe"
      sleep 4
      click_by_xpath("//ul[@class = 'radio-list push--bottom']/li[1]/label[@class = 'radio-list__label']")
	  
	when "Name"
    fill_in("templateName","Updated Template")
  
    when "Description"
    fill_in_text_area("description", "Updated description")

    when "Category"
    select_from_dropdown("None", "Marketplace")

    when "Publish"
    select_from_dropdown("Publish?", "No")

    when "Logo"
		 upload_setting_image($user_company.picture)
	  
    else
      #TODO : Extract an "Exception method and raise and exception and make sure the browser don't close"
      puts "Param $an_information : #{info}"
      fill_in("crash","now")
    
    end 
  end
end


And "sees the following fields" do |fields|
  fields.raw.each do |info|
    case info[0]
    
    when "Client ID"
      wait_for_text("Copy Client ID")
	  
	when "Secret ID"
      wait_for_text("Copy Client Secret")
	  visit_page_via_nav_takeover("Integrations",$integration.name)
	  enforce_logout()
    else
      puts "Param $an_information : #{info}"
	  fill_in("crash","now")
    end 
  end
end


##########################################################################
And(/^a user is logged in$/) do
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



##########################################################################
And "products exist in the product list" do
  add_product_via_form()
end


#########################################################################
Then "the payment has passed" do
  #click_button("Purchase", "We hope the extra integrations come in handy")
  click_by_xpath("//button[contains(.,'Purchase')]")
  sleep 8
  @browser.navigate.refresh
  sleep 8
end


#########################################################################
Then "sees his subscribed plan" do
  assert_element_present({xpath: "//td[contains(text(), 'Basic')]//ancestor::tr//*[text()='Your Plan']"})
end


#########################################################################
Then "sees his new subscribed plan" do
  assert_element_present({xpath: "//td[contains(text(), 'Plus')]//ancestor::tr//*[text()='Your Plan']"})
end


#########################################################################
Then "sees his current plan" do
  assert_element_present({xpath: "//tr[@class='ng-scope billing__tr']/td[4]//div[text()='Your Plan']"})
 #mouse_Hover("//div[@class='vz-takeover__content ']/div/div/a")
 #click_by_xpath("//div[@class='vz-takeover__content ']/div/div/a")
  wait_and_refresh(3)
  enforce_logout()
  
end


##########################################################################
And "will get the premium services related to his subscription" do
  # Validate integration activation
  validate_integration_activation(1)
  # Make sure we logout at the end of the test
  enforce_logout()
end

##########################################################################
Given "the user had already subscribed to a paid plan" do
  upgrade_plan_new_payment("Basic") # Upgrade to Basic    
end


##########################################################################
When "a user selects a more expensive paid plan" do
  # Click on Upgrade for Plus subscription
  click_by_xpath("//td[contains(text(), 'Plus')]//ancestor::tr//div[text()='Upgrade']")
end


##########################################################################
And "selects a new payment method" do
  # Click on Use a new payment method button
  click_by_xpath("//button[contains(text(), 'Use a new payment method')]")
end


##########################################################################
Given "the user had already subscribed to an upgraded paid plan" do
  upgrade_plan_new_payment("Basic") # Upgrade to Basic
  sleep 2
  upgrade_plan_saved_payment("Plus") # Upgrade to Plus
end



##########################################################################
Given "a user has at least one payment method saved" do
  upgrade_plan_new_payment("Basic") # Upgrade to Basic
end


##########################################################################
And "selects a payment method" do
end


##########################################################################
And "the credit card will be charged" do
end

##########################################################################
And "will get the premium services related to his upgraded subscription" do
  validate_integration_activation(3) # Validate integration activation
  enforce_logout() # Make sure we logout at the end of the test
end

##########################################################################
Then "the payment has processed" do
  click_button("Purchase", "You have successfully downgraded your plan") # Click on Purchase button
end


#########################################################################
Given "a user has cancelled his plan" do
  upgrade_plan_new_payment("Basic") # Upgrade to Basic
  click_by_xpath("//a[text()='Cancel your subscription']") # Click on Cancel your subscription
  wait_for_text("Please note that your existing integrations will be turned off at the end of your billing cycle. Are you sure you want to cancel?") # Wait for text to appear
  click_button("Proceed", "Your subscription has been successfully cancelled") # Click on Proceed button
end


##########################################################################










########################## Old Common Step.  Keeping them just in case ###########################
=begin

Then /^Enter ([^"]*) information into the ([^"]*) field$/ do |data, field|
    
  if field == "firstName"
    @first_name = data
  end

  enter_data_in_field(data, field)
  sleep 0.5
end


##########################################################################
Then /^The error message is ([^"]*)$/ do |x|
  find_text_in_page(x)
  sleep 0.5
end


Then /^Tip message is ([^"]*)$/ do |x|
  find_label(x)
  sleep 0.2
end


##########################################################################
Given (/I select (.*) language$/) do |x|
  @browser.find_element(:xpath, "//*[contains(@class, 'dropdown')]/a").click
  click_link("#{x}")
  sleep 2
end


##########################################################################
Given (/I select (.*) file$/) do |x|
  base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
  value=base_path.split("features")
  file="#{value[0]}/image/#{x}"
  element = @browser.find_element :xpath => "//input[@name = 'fileUpload']"
  element.send_keys file
  sleep(15)
end


##########################################################################
Given (/Select an Image (.*) file$/) do |x|
  base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
  value=base_path.split("features")
  file="#{value[0]}/image/#{x}"
  element = @browser.find_element :xpath => "//input[@class= 'ng-pristine ng-untouched ng-valid ng-scope']"
  element.send_keys file
  sleep(15)
end

=end