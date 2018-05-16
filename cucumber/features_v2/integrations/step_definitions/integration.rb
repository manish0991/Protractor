Then "the user has signed into Venzee" do
	 visit_page(@base_url,"Product")
	register_user_and_company()
	sleep 2
	#sleep 3
	click_by_xpath("//div[@class='fusion-main-menu']/ul/li[4]/a/span")
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

And "user is on Setup your Integration screen" do
    click_by_xpath("//div[@class='grid-table connectors__table']/span[4]/div/div/div/div[6]/span")
	#login_user()
	#visit_page_via_nav_takeover("Integrations",$integration.name)
	#enforce_logout()
end
And "I see the authentication page" do
    click_button("Next","Connect with WooCommerce")
end
And "sees the new integration in the integration list" do
      click_by_xpath("//body/div[2]/div/div/div/div/div/div[2]/form/fieldset/div/div/div/div[4]/button")
	  sleep 5
	  click_button("Next","Review and activate this integration")
	  click_by_xpath("//body/div[2]/div/div/div/div/div/div[2]/form/div/div/button[2]")
	  wait_for_text("Last Updated")  
	  click_link("View/Edit","Edit this Integration")
	  click_link("Remove this integration","Are you sure you want to delete")
	  click_button("Delete","Get started by selecting a service from the")
	  enforce_logout()  	  
end

Then "has created an integration" do
	click_link("Expand", "Log out")
	sleep 1
	click_link("Integrations", "Enable integrations")
	sleep 1
	click_by_xpath("//div[@class='grid-table connectors__table']/span[4]/div/div/div/div[6]/span")
	fill_in("integrationName",$integration.name)
	fill_in_text_area("description",$integration.description)
	select_from_filter_dropdown("Frequency","Daily")
	click_button("Next","Connect with WooCommerce")
	fill_in_from_xpath("//input[contains(@class, 'form-field__input') and (@name='store.url')]", "http://cantodoelefante.info/wordpress")
    fill_in_from_xpath("//input[contains(@class, 'form-field__input') and (@name='oauth.api.key')]", "ck_dbce3a6319bded794309e117cce14161a39cd07b")
	fill_in_from_xpath("//input[contains(@class, 'form-field__input') and (@name='oauth.api.secret')]", "cs_5537cc32e26579498e1cb47ea535883223fb920e")
	click_by_xpath("//body/div[2]/div/div/div/div/div/div[2]/form/fieldset/div/div/div/div[4]/button")
    sleep 5
	click_button("Next","Review and activate this integration")
	click_by_xpath("//body/div[2]/div/div/div/div/div/div[2]/form/div/div/button[2]")
    wait_for_text("Last Updated")  
	#click_button("Add this integration","Copy")
	#visit_page_via_nav_takeover("Integrations",$integration.name)
end
Then "see the changes in the integration list" do
    click_by_xpath("//body/div[2]/div/div/div/div/div[2]/form/div/div/button[2]")
	wait_for_text("Updated Integration")
	click_link("View/Edit","Edit this Integration")
	click_link("Remove this integration","Are you sure you want to delete")
	click_button("Delete","Get started by selecting a service from the")
	enforce_logout() 
end

Then "deletes an integration" do
	click_link("Remove this integration","Are you sure you want to delete")
	click_button("Delete","Get started by selecting a service from the")
	
end

Then "the integration is no longer displayed in my integration list" do
	find_text("Get started by selecting a service from the")
	enforce_logout()
end


Given (/he copies the (.*)/) do |x|
	@browser.execute_script "window.scrollBy(0,315)"
	if x=="Client ID"
		click("Copy Client ID")
	else
		click("Copy Client Secret")
	end
		copiedData = Clipboard.paste
		puts copiedData
end

Given (/the (.*) was copied in the clipboard/) do |x|
	enforce_logout()
    #copiedData = Clipboard.paste
	puts copiedData
	@browser.get(copiedData)
	sleep 4
end

