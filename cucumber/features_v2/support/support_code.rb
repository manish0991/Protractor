#########################################################################################
# Support Code
@partneremail = ""
@chk = ""

def show_error(err, functionName, params)
  $error_raised = true

  puts "----------------------- ERROR -----------------------}"
  puts "fuctionName: " + functionName

  params.each do |key, value|
    puts "#{key} : #{value}"
  end

  puts "Err Msg: " + err.message  
  puts "----------------------- /ERROR -----------------------}"
  
  if $os == "Windows"
    get_screenshot()
	end
  
  enforce_logout() if !$local
    
  raise
end

def get_screenshot()
  begin
  	time1 = Time.new
  	base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
  	value=base_path.split("features")
  	path = File.absolute_path("#{value[0]}/Screenshot/")
  	name = "Error_"+Time.new.strftime("%Y-%m-%d-%H%-M%-S")+".jpg"
  	@browser.save_screenshot(path+'/'+name)
  	#Win32::Screenshot::Take.of(:desktop).write(path+"/"+name)
  	puts "Error Screenshot Captured"

  rescue Exception => e
    show_error(e, "get_screenshot()", {})
  end
end

def enforce_logout()
  begin
	 #visit_page("/#{$user_company}/profile", "Profile")
	 #visit_page(@app_url, "Login")
	 #click_by_xpath("//div[@class='fusion-main-menu']/ul/li[5]/a/span")
	 #wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      
     #wait.until { 
      # /Get Started/.match(@browser.page_source) ||
	  # /Not a registered user/.match(@browser.page_source)
     # }
	  
	# if /Get Started/.match(@browser.page_source)
	  sleep 2
       click_link("Expand", "Log out")
	   sleep 1
	   click_link("Log out", "Login")
      
  rescue Exception => e
    show_error(e, "enforce_logout()", {})
  end
end


def login_user()
  begin
	#sleep 2
	#click_by_xpath("//div[@class='fusion-main-menu']/ul/li[5]/a/span")
	#sleep 2
	visit("login","Not a registered user?")
    fill_in("username", $user.email)
    fill_in("password", $user.password)
    click_button("Login","Forever Free Plan")
	sleep 3
	if /Hi test/.match(@browser.page_source)
    sleep 1
    click_by_xpath("//div[@class='intercom-launcher-preview-close']")
    end

  rescue Exception => e
    show_error(e, "login_user()", {})
  end
end


def add_product_via_form()
  begin
  	sleep 2
    #click_button("Add","Add a product record using a form")
	#sleep 1
    #click_link("Add a product record using a form", "Add Product Record")
	click_link("Expand", "Log out")
	 sleep 1
	click_by_xpath("//div[@class='row']/nav/ul[2]/li/ul/li[2]/a")
  	wait_for_text("Collection Privacy")

    if collection_exist()
      select_from_dropdown("Collection", "New Collection")
    end

    fill_in("collectionName", $collection.name)
  	fill_in("labelrecordid","Record Id")
    fill_in("recordid", $product[0].id)
	  #fill_in("labelproductName","Record Name")
    #fill_in("productName", $product[0].name)
	  #fill_in("costlabel","Cost")
    #fill_in("cost", $product[0].cost)
	  #fill_in("maplabel","MAP")
    #fill_in("map", $product[0].map_policy)
    click_button("Save", "Product")
  	sleep 3
    wait_for_text($product[0].id)
  
  rescue Exception => e
    show_error(e, "add_product_via_form()", {})
  end
end


def collection_exist()
  begin
    element = @browser.find_element(:xpath, "//a[@placeholder = 'Collection']")

    if element != nil
      return true
    else
      return false
    end

  rescue Exception => e
    show_error(e, "collection_exist()", {})
  end
end



def register_user_and_company()
  begin
	#if /Use Venzee as/.match(@browser.page_source)
		#enforce_logout()
	
	#end
    puts "This is the app URL: "
    if (!$user.isRegistered || !$use_single_registration)

      if !$use_single_registration
       $user = User.new("user")
        $user_company = Company.new()
      end
  
       #Register a user
	  visit_page(@base_url,"Product")
	  click_by_xpath("//div[@class='fusion-main-menu']/ul/li[4]/a/span")
	  sleep 0.5
	  if /Dashboard/.match(@browser.page_source)
		enforce_logout()
	   click_by_xpath("//div[@class='fusion-main-menu']/ul/li[4]/a/span")
	  end
      #click_link("Sign Up", "Password")
      fill_in("firstName", $user.firstname)
      fill_in("lastName", $user.lastname)
      #fill_in("username", $user.username)
      fill_in("email", $user.email)
  	  fill_in("phone",$user.phone)
      fill_in("orgDisplayName",$user_company.name)
      fill_in("password", $user.password)
      #fill_in("passwordConfirm", $user.password)  
      #Above field is not available in latest design
      click_button("Register", "Forever Free Plan")

      # Register a company
      #fill_in("company", $user_company.name)
      #fill_in("website", $user_company.website)
	    #fill_in("phone",$user_company.phone)
      #select_from_dropdown("Select your industry", $user_company.industry)
      #select_option("describe", $user_company.activity_desc)
      #click_button("Set up my company","Dashboard")

      # Re-use the same user next time, don't re-create it.
      #$user.isRegistered = true
	   # if /Welcome to Venzee/.match(@browser.page_source)
      # ack_intercom_msg()
      #end
      #Intercom message not appearing now.
     enforce_logout()
    end

  rescue Exception => e
    show_error(e, "register_user_and_company()", {})
  end
end



def register_user_and_company_via_invitation()
  begin

   # Register a user
    fill_in("firstName", $user.firstname)
    fill_in("lastName", $user.lastname)
    #fill_in("username", "invitetestcuke" + rand(10000000).to_s)
    fill_in("phone",$user.phone)
    fill_in("password", $user.password)
    #fill_in("passwordConfirm", $user.password)
    fill_in("orgDisplayName", $partner_company[0].name)
    click_button("Register", "Get Started")

    sleep 2
    
    if /The company domain you are trying to register is taken/.match(@browser.page_source)
      fill_in("company", $partner_company[1].name)
      click_btn("Set up my company")
      sleep 2
      if /The company domain you are trying to register is taken/.match(@browser.page_source)
       fill_in("company", $partner_company[2].name)
       click_btn("Set up my company")
       sleep 2
       if /The company domain you are trying to register is taken/.match(@browser.page_source)
        fill_in("company", $partner_company[3].name)
        click_btn("Set up my company")
       end
      end
    end
  
  rescue Exception => e
    show_error(e, "register_user_and_company_via_invitation()",{})
  end
end

def register_user_via_invitation()
  begin

   # Register a user
    fill_in("firstName", "Second ")
    fill_in("lastName", "User")
    #fill_in("username", "invitetestcuke" + rand(10000000).to_s)
    fill_in("phone",$user.phone)
    fill_in("password", $user.password)
    #fill_in("passwordConfirm", $user.password)
    #fill_in("orgDisplayName", $partner_company[0].name)
    click_button("Register", "Data")
	
  sleep 2
  
  rescue Exception => e
    show_error(e, "register_user_via_invitation()",{})
  end
end



def ack_intercom_msg()
  begin
    puts "clicking intercom...."
    sleep 1
	  wait_for_text("Welcome to Venzee")
    sleep 1
    @browser.find_element(:xpath, "//div[@class='intercom-conversation-parts']/div").click
    sleep 1
    @browser.find_element(:css, "#intercom-conversation > div.intercom-sheet-header > a.intercom-sheet-header-button.intercom-sheet-header-close-button > div.intercom-sheet-header-button-icon").click
	  #@browser.find_element(:xpath,"//div[@class='intercom-sheet-header']/a[2]/div").click
	  sleep 2
  
  rescue Exception => e
    show_error(e, "ack_intercom_msg()", {})
  end
end



def enter_address_to_invite()
	begin
		wait_for_text("Add an email address for each of your partners")

		@partneremail = "cukevz+2" + rand(1000000).to_s + "@gmail.com"
		fill_in_from_placeholder("Add an email address for each of your partners. Separate each email with a , (comma).","#{@partneremail}"+",")
    
	rescue Exception => e
		show_error(e,"enter_address_to_invite()",{})
	end
end

def enter_address_to_invite_users()
	begin
		wait_for_text("Add an email address for each of your users")

		@partneremail = "cukevz+2" + rand(1000000).to_s + "@gmail.com"
		fill_in_from_placeholder("Add an email address for each of your users. Separate each with a , (comma).","#{@partneremail}"+",")
    
	rescue Exception => e
		show_error(e,"enter_address_to_invite_users",{})
	end
end



def send_invitation()
	begin
		sleep 2
		click_button("Send 1 invitation(s)","Select one or more partners from the list to view available actions.")
		#wait_for_text("fa fa-angle-left")
		#wait_for_text("ago")
    sleep 2
		
	rescue Exception => e
		show_error(e,"send_invitation()",{})
	end
end

def send_user_invitation()
	begin
		sleep 2
		click_button("Send 1 invitation(s)","Users")
		#wait_for_text("fa fa-angle-left")
		#wait_for_text("ago")
    sleep 2
		
	rescue Exception => e
		show_error(e,"send_user_invitation()",{})
	end
end



def test_email()
	begin
		@browser.manage.delete_all_cookies
		sleep 3
		@browser.get "https://mail.google.com/mail/u/1/#inbox"
		sleep 3

  	if /For work/.match(@browser.page_source)
  		click_link("Sign in","Sign in to continue to Gmail")
  	end
		
    if /COMPOSE/.match(@browser.page_source)
	    #click_link("cukevz@gmail.com","Sign out")
	    #click_link("Sign out","Sign in with a different account")
    
    elsif /cukevz@gmail.com/.match(@browser.page_source)
			#wait_for_text("Sign in with a different account")
			sleep 2
			fill_in("Passwd","Cucumber!2015")
			click_input("Sign in")
			wait_for_text("Loading")
    
    else
			fill_in("Email","cukevz@gmail.com")
			click_input("Next")
			sleep 2
			wait_for_text("Sign in with a different account")
			fill_in("Passwd","Cucumber!2015")
			click_input("Sign in")
			wait_for_text("Loading")
    
    end
		
  	wait_for_text("Inbox")
	  wait_for_text("Terms")
		
    sleep 5
	
	rescue Exception => e
		show_error(e,"test_email()",{})
	end
end



def edit_product_with_everyOne()
	begin
		click_button("Settings","Number of records")
		select_from_dropdown("Select one","Share with everyone")
		click_button("Yes, I do","Sharing Setting")
		click_button("Save Changes","contains")
		sleep 8
	rescue Exception => e
		show_error(e,"edit_product_with_everyOne()",{})
	end
end



def add_image_to_product()
	begin
		wait_for_text("name")
		sleep 5
		click_by_ng("products.select(product, $index)","Edit")
		sleep 5
		click_button("Edit","Edit Product")
    fill_in("recordid", $product[0].id)
    #fill_in("productName", $product[0].name)
    #fill_in("cost", $product[0].cost)
    #fill_in("map", $product[0].map_policy)
		upload_image($product[0].image, "Remove")
		
	rescue Exception => e
		show_error(e,"add_image_to_product()",{})
	end
end



def image_uploaded()
	begin
    sleep 5
		element_is_available("file-img__thumb")
    sleep 1
		click_button("Save Changes",$product[0].id)
	
  rescue Exception => e
		show_error(e,"image_uploaded()",{})
	end
end



def add_product_via_CSV()
  begin
    click_button("Add","Add product records using a CSV file")
    click_link("Add product records using a CSV file", "Add product data using a CSV file")
	  wait_for_text("What would you like to do?")
  
    fill_in("collectionName", $collection.name)
    fill_in("recordid", $product[0].id)
    fill_in("productName", $product[0].name)
    fill_in("cost", $product[0].cost)
    click_button("Add this product", $product[0].name)
  
  rescue Exception => e
    show_error(e, "add_product_via_CSV()", {})
  end
end



def add_group()
	click_button("Add groups","Organize partners into Groups")
	fill_in("nameGroup","new group name")
	sleep 2
	click_button("Save","new group name")
	
  begin
  	click_button("Add groups","Organize partners into Groups")
  	fill_in("nameGroup","new group name")
  	click_button("Save","new group name")
  
  rescue Exception => e
    show_error(e, "add_group()", {})
  end

end



def add_group_with_partner()
  begin
    #visit_page_via_nav_takeover("Manage Partners","Add Partners")
	click_link("Expand", "Log out")
	sleep 1
	click_link("Manage Partners", "Add Partners")
	sleep 1
    click_link("Add Partners", "Invite Partners to Access your Data")
   #visit("partners?page=1&per_page=50","Add Partners")
   #click_button("Add Partners","Invite Partners to Access your Product Data")
   enter_address_to_invite()
   send_invitation()
   click_checkbox("partner0")
   click_button("Groups","Organize partners into Groups")
   fill_in("nameGroup",$user.group)
   click_button("Save",$user.group)
   #visit("groups",$user.group)
   sleep 2
 click_button("Groups","Organize partners into Groups")
 sleep 2
 click_link("Manage groups","Groups")

  rescue Exception => e
    show_error(e, "add_group_with_partner()", {})
  end    
end



def fill_card_details()
	begin
		click_by_xpath_wait("//table[contains(@class,'simple-grid')]/tbody/tr[2]/td/button","Card number")
		fill_in("cardNumber","4242424242424242")
		fill_in("cardCVC","123")
		select_time("Month","June")
		select_time("Year","2020")
		fill_in("cardHolder",$user.lastname)
		click_button("Purchase","Purchase")
	
  rescue Exception => e
    show_error(e, "fill_card_details()", {})
  end

end



def change_language(lang)
	begin
		@browser.find_element(:xpath,"//nav[@class='nav-actions']/span/span/a").click
		wait_for_text("#{lang}")
		@browser.find_element(:xpath,"//ul[@class='dropdown-list']/li/a[contains(text(),'#{lang}')]").click
		
	rescue Exception => e
		show_error(e,"change_language(lang)",{"lang" => lang})
	end
end


def validate_integration_activation(no_of_integrations)
  begin
    for integration in 1..no_of_integrations
      execute_js("window.scrollTo(0, 0)") # Scroll to top of the page
      visit_page_via_nav_takeover("Create a Custom Integration", "Type a name for this integration")
      sleep 1
      fill_in("integrationName",$integration.name)
      fill_in_text_area("description",$integration.description)
      click_button("Add this integration","Copy")
      sleep 1
      execute_js("window.scrollTo(0, 0)") # Scroll to top of the page
      visit_page_via_nav_takeover("Integrations",$integration.name)
      sleep 1
      click_by_xpath("//ul[contains(@class, 'integration__list')]//li[" + integration.to_s + "]//input[@value='enabled']")
      assert_text_not_present("Upgrade your plan to enable more integrations")
    end
    
  rescue Exception => e
    show_error(e,"validate_integration_activation(no_of_integrations)",{"no_of_integrations" => no_of_integrations})
  end
end



def upgrade_plan_new_payment(plan_name)
  begin
    click_by_xpath("//td[contains(text(), '" + plan_name + "')]//ancestor::tr//div[text()='Upgrade']") # Click on Upgrade for Basic subscription
	@browser.execute_script("window.scrollBy(0,200)")
    fill_in("cardNumber", $user.cardNumber) # Input Credit card number
    fill_in("cardCVC", $user.cvc) # Input CVC
    @Month = (Date.today>>1).strftime("%b")
    select_date_from_dropdown("Month", "#{@Month}") # Input Credit card expiry month
    @Year = Date.today.strftime("%Y").to_i + 1
    select_date_from_dropdown("Year", "#{@Year}") # Input Credit card expiry year
    fill_in("cardHolder", $user.firstname + " " + $user.lastname) # Input Credit card holder's name
    #click_button("Purchase", "We hope the extra integrations come in handy.") # Click on Purchase button
    click_by_xpath("//button[contains(.,'Purchase')]") # this is temp code until billing issue get resolved.
    
  rescue Exception => e
    show_error(e,"upgrade_plan_new_payment(plan_name)",{"plan_name" => plan_name})
  end
end


def upgrade_plan_saved_payment(plan_name)
  begin
    click_by_xpath("//td[contains(text(), '" + plan_name + "')]//ancestor::tr//div[text()='Upgrade']") # Click on Upgrade for Basic subscription
    click_button("Purchase", "We hope the extra integrations come in handy.") # Click on Purchase button
    
  rescue Exception => e
    show_error(e,"upgrade_plan_new_payment(plan_name)",{"plan_name" => plan_name})
  end
end

def process_invitation()
  begin
    click("Click here")
	sleep 3
	#switch_tab("When you register on Venzee")
    switch_tab("Password")
  rescue Exception => e
    show_error(e,"process_invitation()",{})
  end
end

def create_public_template()
  begin
  click_link("View Templates","Choose a template to establish")
   sleep 2
  click_link("Add a template", "Set up your template")
  fill_in("templateName", $product[3].name)
  fill_in_text_area("description", "Automation template")
  select_from_dropdown("None", "Ecommerce")
  select_from_dropdown("Publish?", "Yes")
  upload_setting_image($user.picture)
  @browser.execute_script("window.scrollBy(0,400)")
  click_button("Next", "Build your template")
  fill_in("fieldName", "Product ID")
  select_from_dropdown("Field Type", "Text")
  click_button("Preview", "Preview of the Template")
  click_button("Save", "My Templates")
  sleep 2 
  wait_for_text($product[3].name) 
  
  rescue Exception => e
    show_error(e, "create_public_template()", {})
  end
end

def create_private_template()
  begin
  sleep 2
  click_link("View Templates","Choose a template to establish")
   sleep 2
  click_link("create your own", "Set up your template")
  fill_in("templateName", $product[3].name)
  #element = $product[3].name
  fill_in_text_area("description", "Automation template")
  select_from_dropdown("None", "Ecommerce")
  @browser.execute_script("window.scrollBy(0,400)")
  click_button("Next", "Build your template")
  fill_in("fieldName", "Product ID")
  select_from_dropdown("Field Type", "Text")
  click("Add Field")
  fill_in_from_xpath("//input[contains(@class, 'ng-invalid') and (@name='fieldName')]", "Cost")
  #select_from_dropdown_xpath("//span[@class='select2-chosen ng-binding' and contains(text(), 'Field Type')]", "Integer")
  click_by_xpath("//span[@class='select2-chosen ng-binding' and contains(text(), 'Field Type')]")
  click_by_xpath("//ul[@class='select2-result-single']/li[3]/div")
  @browser.execute_script("window.scrollBy(0,400)")
  click_button("Preview", "Preview of the Template")
  click_button("Save", "My Templates")
  sleep 2 
  wait_for_text($product[3].name) 
  
  rescue Exception => e
    show_error(e, "create_private_template()", {})
  end
end

def create_basic_template()
  begin
  sleep 2
  visit_page_via_nav_takeover("Templates Library", "My Templates")
  sleep 2 
  click_link("Add a template", "Set up your template")
  fill_in("templateName", $product[3].name)
  #element = $product[3].name
  fill_in_text_area("description", "Automation template")
  select_from_dropdown("None", "Ecommerce")
  @browser.execute_script("window.scrollBy(0,400)")
  click_button("Next", "Build your template")
  fill_in("fieldName", "Product ID")
  select_from_dropdown("Field Type", "Text")
  #click("Add Field")
  #fill_in_from_xpath("//input[contains(@class, 'ng-invalid') and (@name='fieldName')]", "Cost")
  #select_from_dropdown_xpath("//span[@class='select2-chosen ng-binding' and contains(text(), 'Field Type')]", "Integer")
  #click_by_xpath("//span[@class='select2-chosen ng-binding' and contains(text(), 'Field Type')]")
  #click_by_xpath("//ul[@class='select2-result-single']/li[3]/div")
  click_button("Preview", "Preview of the Template")
  click_button("Save", "My Templates")
  sleep 2 
  wait_for_text($product[3].name) 
  
  rescue Exception => e
    show_error(e, "create_basic_template()", {})
  end
end

def create_transform()
  begin
    sleep 2
   visit_page_via_nav_takeover("Dynamic Data", "about creating Dynamic collections.")
   sleep 1
   click_by_xpath("//div[@class='product-header__row']/div[2]/a")
   sleep 1
  click_by_xpath("//span[contains(@class, 'thumbnail-dashboard_item_name') and text()='#{$product[3].name}']")
  #@browser.execute_script("window.scrollBy(0,800)")
  
  #wait_and_refresh(3)
  #@browser.execute_script("window.scrollBy(0,800)")
  #sleep 2
  #mouse_Hover("//div[@class='intercom-launcher-preview']")
  #click_by_xpath("//div[@class='intercom-launcher intercom-launcher-enabled intercom-launcher-active']/div[1]")
  click_button("Next", "Select data source and destination")
  select_from_filter_dropdown("Select your source collection",$collection.name)
  fill_in("transformName", $er_collection.name)
  fill_in_text_area("transformsDescription", "Test er collection")
  click_button("Next", "Insert and combine attributes")
  click_btn("record id")
  click_btn("Generate Records")
  sleep 10
  wait_for_text("We generated")
  sleep 4
  click_button("View Records", "Dynamic Data")
  #sleep 2
  #select_from_filter_dropdown("Collection Name",$er_collection.name)
  sleep 5
  
  rescue Exception => e
    show_error(e, "create_transform()", {})
  end
end

def create_basic_transform()
  begin
   sleep 2
   visit_page_via_nav_takeover("Dynamic Data", "about creating Dynamic collections.")
   sleep 1
   click_by_xpath("//div[@class='product-header__row']/div[2]/a")
   sleep 1
  click_by_xpath("//span[contains(@class, 'thumbnail-dashboard_item_name') and text()='#{$product[3].name}']")
  sleep 2
  click_button("Next", "Select data source and destination")
  select_from_filter_dropdown("Select your source collection",$collection.name)
  fill_in("transformName", $er_collection.name)
  fill_in_text_area("transformsDescription", "Test er collection")
  click_button("Next", "Insert and combine attributes")
  click_btn("record id")
  sleep 2
  click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Cost')]")
  click_btn("cost")
   sleep 2
   wait_for_text("We generated") 
   click_button("View Records", "Dynamic Data")
   sleep 2
  
  rescue Exception => e
    show_error(e, "create_basic_transform()", {})
  end
end


def add_product_via_form_add_additional()
  begin
  	sleep 1
    
	click_link("Expand", "Log out")
	 sleep 1
	click_by_xpath("//div[@class='row']/nav/ul[2]/li/ul/li[2]/a")
	sleep 1
	
    sleep 2
  	wait_for_text("Collection Privacy")

    if collection_exist()
      select_from_dropdown("Collection", "New Collection")
    end
    fill_in("collectionName", $collection.name)
    #fill_in("collectionName", $collection.name)
  	fill_in("labelrecordid","Record Id")
    fill_in("recordid", $product[5].id)
	click_link("Add additional data", "Label")
    fill_in("specLabel", $product[5].spec_label)
    fill_in("specValue", $product[5].spec_value)
	  
	
    click_button("Save", "Product")
  	sleep 3
    wait_for_text($product[5].id)
  
  rescue Exception => e
    show_error(e, "add_product_via_form_add_additional()", {})
  end
end


def create_math_widget()
  begin
   sleep 2
   click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Cost')]")
   click_by_xpath("//a[@class='transformations__attribute-add']")
   click_by_xpath("//span[contains(text(), 'Math')]")
   sleep 2
   fill_in("customAttributeName", "New cost")
   @browser.find_element(:xpath, "//span[contains(text(), 'Type a numerical value or select an attribute.')]").click
   fill_in_from_xpath("//div[@class='select2-search']/input", "500")
   click_by_xpath("//span[contains(text(), 'Select an operator')]")
   sleep 1
   click_by_xpath("//span[contains(text(), '+')]")
   sleep 5
   @browser.find_element(:xpath, "//span[@class='ng-isolate-scope']/div[2]//span[contains(text(), 'Type a numerical value or select an attribute.')]").click
   click_by_xpath("//ul[@class='select2-result-single']/li[1]/div")
   sleep 3
   click_btn("Save")
   sleep 2
   click_btn("New cost")
  
  rescue Exception => e
    show_error(e, "create_math_widget()", {})
  end
end

def create_private_template_html()
  begin
  sleep 2
  click_link("View Templates","Choose a template to establish")
   sleep 2 
  click_link("Add a template", "Set up your template")
  fill_in("templateName", $product[3].name)
  #element = $product[3].name
  fill_in_text_area("description", "Automation template")
  select_from_dropdown("None", "Ecommerce")
  @browser.execute_script("window.scrollBy(0,400)")
  click_button("Next", "Build your template")
  fill_in("fieldName", "Product ID")
  select_from_dropdown("Field Type", "Text")
  element = @browser.find_element(:xpath,"//input[@name='supportHTML']")
   sc = "arguments[0].style.display = 'inline';";

    # Upload the image by sending the path
  @browser.execute_script(sc,element)
   element.click
  #click_checkbox_xpath("supportHTML")
  click("Add Field")
  fill_in_from_xpath("//input[contains(@class, 'ng-invalid') and (@name='fieldName')]", "Cost")
  #select_from_dropdown_xpath("//span[@class='select2-chosen ng-binding' and contains(text(), 'Field Type')]", "Integer")
  click_by_xpath("//span[@class='select2-chosen ng-binding' and contains(text(), 'Field Type')]")
  click_by_xpath("//ul[@class='select2-result-single']/li[3]/div")
  
  click_button("Preview", "Preview of the Template")
  click_button("Save", "My Templates")
  sleep 2 
  wait_for_text($product[3].name) 
  
  rescue Exception => e
    show_error(e, "create_private_template_html()", {})
  end
end

def create_Spec_table_widget()
  begin
   click_by_xpath("//a[@class='transformations__attribute-add']")
   click_by_xpath("//span[contains(text(), 'Spec List')]")
   sleep 2
   fill_in("customAttributeName", "ID Table")
   fill_in_from_xpath("//span[@class='ng-isolate-scope']/div[1]//input[contains(@name, 'text')]","First ID")
   click_by_xpath("//span[contains(@class, 'ng-isolate')]/div[1]//span[contains(text(), 'Value of')]")
   sleep 2
   click_by_xpath("//ul[@class='select2-result-single']/li[2]/div")
   sleep 2
   fill_in_from_xpath("//span[@class='ng-isolate-scope']/div[2]//input[contains(@name, 'text')]","Second ID")
   sleep 2
   click_by_xpath("//span[contains(@class, 'ng-isolate')]/div[2]//span[contains(text(), 'Value of')]")
   click_by_xpath("//ul[@class='select2-result-single']/li[2]/div")
   sleep 2
   click_btn("Save")
   sleep 2
   click_btn("ID Table")
   sleep 2
   click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Cost')]")
   click_btn("cost")
  
  rescue Exception => e
    show_error(e, "Create_Spec_table_widget()", {})
  end
end

def edit_product_via_csv()
  begin
    sleep 2
    click_link("Add records","Import product data to")
    click_by_xpath("//ul[@class='radio-list soft-double--bottom']/li[2]/label")
    click_button("Next", "Which of your collections")
    select_from_filter_dropdown("Collection",$collection.name)
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
	click_link("Close","Data")
	rescue Exception => e
    show_error(e, "edit_product_via_csv()", {})
  end
end

def edit_product_via_form()
  begin
   sleep 5
   click_by_xpath("//div[@ng-click='products.select(product, $index)']")
   sleep 3
   click_button("Edit", "Edit Product")
   sleep 2 
   fill_in_from_xpath("//div[@class='form-group ng-scope']//div[@class='form-group__fields']/div/div[2]/input","9999")
   #fill_in_from_xpath("//ng-form[contains(@class, 'ng-valid')]/div[2]//input[contains(@class, 'form-field__input')]","5000")
   #@browser.find_element(:xpath, "//ng-form[contains(@class, 'ng-pristine')]/div[2]//input[contains(@class, 'form-field__input')]").clear
   #@browser.find_element(:xpath, "//ng-form[contains(@class, 'ng-pristine')]/div[2]//input[contains(@class, 'form-field__input')]").send_keys "5000"
    click_button("Save Changes", "contains")
    rescue Exception => e
    show_error(e, "edit_product_via_form()", {})
  end
end

def upgrade_to_paid_plan()
  begin
    sleep 2
     visit_page_via_nav_takeover("Upgrade Plan", "Billing")
    wait_for_text("Upgrade")
    click_by_xpath("//td[contains(text(), 'Basic')]//ancestor::tr//div[text()='Upgrade']") # Click on Upgrade for Basic subscription
	@browser.execute_script("window.scrollBy(0,200)")
    fill_in("cardNumber", $user.cardNumber) # Input Credit card number
    fill_in("cardCVC", $user.cvc) # Input CVC
    @Month = (Date.today>>1).strftime("%b")
    select_date_from_dropdown("Month", "#{@Month}") # Input Credit card expiry month
    @Year = Date.today.strftime("%Y").to_i + 1
    select_date_from_dropdown("Year", "#{@Year}") # Input Credit card expiry year
    fill_in("cardHolder", $user.firstname + " " + $user.lastname) # Input Credit card holder's name
    #click_button("Purchase", "We hope the extra integrations come in handy.") # Click on Purchase button
    click_by_xpath("//button[contains(.,'Purchase')]") # this is temp code until billing issue get resolved.
	sleep 3
	current_url = @browser.current_url
    profile_screen = current_url.gsub("billing", "profile")
    visit_page(profile_screen, "Profile Settings")
    #wait_and_refresh(3)
	#@browser.execute_script("window.scrollBy(0,0)")
	sleep 2
  rescue Exception => e
    show_error(e,"upgrade_to_paid_plan()",{})
  end
end

def add_product_for_copy()
  begin
  	sleep 2
    
	visit_page_via_nav_takeover("Add Records via Form","Add Product Record")
    sleep 1
  	wait_for_text("Collection Privacy")
    if collection_exist()
      select_from_dropdown("Collection", "New Collection")
    end
    fill_in("collectionName", "source collection")
    #fill_in("collectionName", $collection.name)
  	fill_in("labelrecordid","Record Id")
    fill_in("recordid", $product[5].id)
	click_link("Add additional data", "Label")
    fill_in("specLabel", $product[5].spec_label)
    fill_in("specValue", $product[5].spec_value)
	click_button("Save", "Product")
  	sleep 3
    wait_for_text($product[5].id)
  
  rescue Exception => e
    show_error(e, "add_product_for_copy()", {})
  end
end

def image_private_template()
  begin
  sleep 4
  visit_page_via_nav_takeover("Templates Library", "Templates")
  sleep 2 
  click_link("create your own", "Set up your template")
  fill_in("templateName", $product[3].name)
  #element = $product[3].name
  fill_in_text_area("description", "Automation template")
  select_from_dropdown("None", "Ecommerce")
  @browser.execute_script("window.scrollBy(0,400)")
  click_button("Next", "Build your template")
  fill_in("fieldName", "Product ID")
  select_from_dropdown("Field Type", "Text")
  click("Add Field")
  fill_in_from_xpath("//input[contains(@class, 'ng-invalid') and (@name='fieldName')]", "Name")
  click_by_xpath("//span[@class='select2-chosen ng-binding' and contains(text(), 'Field Type')]")
  click_by_xpath("//ul[@class='select2-result-single']/li[3]/div")
  click("Add Field")
  fill_in_from_xpath("//input[contains(@class, 'ng-invalid') and (@name='fieldName')]", "image")
  click_by_xpath("//span[@class='select2-chosen ng-binding' and contains(text(), 'Field Type')]")
  click_by_xpath("//ul[@class='select2-result-single']/li[7]/div")
  #@browser.execute_script("window.scrollBy(0,400)")
  click_button("Preview", "Preview of the Template")
  click_button("Save", "My Templates")
  sleep 2 
   visit_page_via_nav_takeover("Perform a transformation", "Select the template you want to use")  
  
  rescue Exception => e
    show_error(e, "image_private_template()", {})
  end
end

def product_via_csv_with_images()
  begin
    sleep 2
	visit_page_via_nav_takeover("Add Records","Create a new collection")
    #click_link("Add records", "Add product data using a CSV file")
	 #wait_for_text("What would you like to do?")
    #click_link("Add records","Import product data to")
    #click_by_xpath("//ul[@class='radio-list soft-double--bottom']/li[1]/label")
    #click_button("Next", "Which of your collections")
    fill_in("collectionName", $collection.name)
    sleep 2
    upload_setting_image($product[0].csv1)
    sleep 10
    click_button("Next","Select All")
    click_button("Next", "Which column represents")
    click_button("product id","record id")
    click_button("Next","parent id")
   #click_button("name","record name")
    click_button("Next","parent id")
    click_button("Skip","Which column")
	click_button("media","Which column")
	click_button("Next","Please take a moment to confirm")
	click_button("Confirm","Done")
	click_button("Upload product images","Bulk upload media")
	upload_bulk_image($product[0].image1 , "Processing your Images")
	click_button("Proceed","contains")
	rescue Exception => e
    show_error(e, "product_via_csv_with_images()", {})
  end
end

def create_padding_widget()
  begin
   sleep 1
   click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Cost')]")
   click_by_xpath("//a[@class='transformations__attribute-add']")
   click_by_xpath("//span[contains(text(), 'Padding')]")
   sleep 2
   fill_in("customAttributeName", "Padding widget")
   #fill_in_from_xpath("//span[@class='ng-isolate-scope']/div[1]//input[contains(@name, 'text')]","First ID")
   click_by_xpath("//div[contains(@class, 'vz-select--comboinput')]/a[1]/span[contains(text(), 'Select an attribute.')]")
   sleep 1
   click_by_xpath("//ul[@class='select2-result-single']/li[1]/div/span[1]")
   sleep 2
   #fill_in("Padding Character.", "0")
   fill_in_from_xpath("//input[contains(@class, 'form-field__input ng-pristine') and (@placeholder='Padding Character.')]", "0")
   
   fill_in_from_xpath("//input[contains(@class, 'form-field__input ng-pristine') and (@placeholder='Maximun field length.')]", "8")
   sleep 4
   click_btn("Save")
   sleep 2
   #click_btn("ID Table")
   #sleep 2
   #click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Cost')]")
   click_btn("Padding widget")
   sleep 2
   
  
  rescue Exception => e
    show_error(e, "create_padding_widget()", {})
  end
end

def create_case_widget()
  begin
   sleep 1
   click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Cost')]")
   click_by_xpath("//a[@class='transformations__attribute-add']")
   click_by_xpath("//span[contains(text(), 'Case')]")
   sleep 2
   fill_in("customAttributeName", "Case widget")
   #fill_in_from_xpath("//span[@class='ng-isolate-scope']/div[1]//input[contains(@name, 'text')]","First ID")
   click_by_xpath("//div[contains(@class, 'vz-select--comboinput')]/a[1]/span[contains(text(), 'Select an attribute.')]")
   sleep 1
   click_by_xpath("//ul[@class='select2-result-single']/li[1]/div/span[1]")
   sleep 2
   #fill_in("Padding Character.", "0")
   #fill_in_from_xpath("//input[contains(@class, 'form-field__input ng-pristine') and (@placeholder='Padding Character.')]", "0")
   
   #fill_in_from_xpath("//input[contains(@class, 'form-field__input ng-pristine') and (@placeholder='Maximun field length.')]", "8")
   sleep 2
   click_btn("Save")
   sleep 2
   #click_btn("ID Table")
   #sleep 2
   #click_by_xpath("//label[@class = 'form-field__label form-field__label--visible ng-binding' and contains(text(), 'Cost')]")
   click_btn("Case widget")
   sleep 2
   
  
  rescue Exception => e
    show_error(e, "create_case_widget()", {})
  end
end

def add_product_via_form_add_additional_name()
  begin
  	sleep 1
    
	click_link("Expand", "Log out")
	 sleep 1
	click_by_xpath("//div[@class='row']/nav/ul[2]/li/ul/li[2]/a")
	sleep 1
	
    sleep 2
  	wait_for_text("Collection Privacy")

    if collection_exist()
      select_from_dropdown("Collection", "New Collection")
    end
    fill_in("collectionName", $collection.name)
    #fill_in("collectionName", $collection.name)
  	fill_in("labelrecordid","Record Id")
    fill_in("recordid", $product[5].id)
	click_link("Add additional data", "Label")
    fill_in("specLabel", $product[5].spec_labe2)
    fill_in("specValue", $product[5].spec_value2)
	  
	
    click_button("Save", "Product")
  	sleep 3
    wait_for_text($product[5].id)
  
  rescue Exception => e
    show_error(e, "add_product_via_form_add_additional_name()", {})
  end
end