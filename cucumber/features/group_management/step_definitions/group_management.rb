@group = ""
@elText = ""
@existName =""

Given (/I am an admin$/) do


end

Given(/No groups exists$/) do
	sleep 2
	/0 partners, 0 pending invites/.match(@browser.page_source)
	sleep 1
end
Given (/I select one of my members$/) do
	sleep 3
	step 'I Click on AddPartner button'
	step 'Enter Demo@yopmail.com, into the email field'
	@browser.find_element(:xpath,"//p[contains(@class,'push--left')]").click
	sleep 2
	step 'I Click on SendInviteUser button'
	sleep 5
end

Given (/I must see Groups button$/) do
	sleep 2
	@browser.find_element(:xpath, "//div[contains(@class,'float--left ng-scope')]/div/button").displayed?.to_s.should == "true"
	sleep 1
end

Given (/I choose to add them to a group$/) do
	sleep 1
	step 'Then click on Groups'
	step 'Add member into group'
end


Given(/I Check (.*) Checkbox$/) do |x|
	sleep 3
	i = x.to_i+1
	@browser.find_element(:xpath, "//div[@class='grid-table partners-list']/div[#{i}]/div[1]/div[2]").click
end

Given (/click on Groups$/) do
	sleep 1
	@browser.find_element(:xpath,"//button[@class='groups-dropdown__btn btn btn--large']").click
	sleep 2
end

Given (/I save$/) do
	sleep 1
	@browser.find_element(:xpath,"//div[@class='checkbox-input ng-scope large-list']/button").click
end

Given (/Enter Group Name$/) do
	sleep 1
	@group = "Group1" + rand(10000000).to_s
	@browser.find_element(:xpath,"//div[@class='checkbox-input ng-scope large-list']/div/input").send_keys @group
end

Given(/In the user list "Group1" is listed for each of the selected members/) do
	sleep 5
	/@group/.match(@browser.page_source)
end

Given(/In the user list "Group1", "Group2" and "Group3" is listed for each of the selected members$/) do
	sleep 5
	/@group/.match(@browser.page_source)
end

Given(/Add member into group$/) do
	sleep 1
	@browser.find_element(:xpath,"//ul[@class='vz-panel__nav flush--bottom']/li[1]/a").click
	sleep 3
end

Given(/I select some of my members that dont belong to a group$/) do
	sleep 4
	step 'I select members'
	step 'I must see Groups button'
end

Given (/I add them to the existing groups$/) do
	sleep 2
	step 'I choose to add them to a group'
	sleep 3
	@elText = @browser.find_element(:xpath,"//*[@id='addGroup']/div/form/fieldset/div/ul/li[1]/label/input").text
	@browser.find_element(:xpath,"//*[@id='addGroup']/div/form/fieldset/div/ul/li[1]/label/input").click
end

Given(/In the user list "Group1" and "Group2" is listed for each of the selected members$/) do
	sleep 3
	/@elText/.match(@browser.page_source)
end

Given(/I select members$/) do
	sleep 2
	step 'I Click on AddPartner button'
	@browser.find_element(:xpath,"//div[@class='tags']/input").send_keys "Demo1213@yopmail.com,"
	@browser.find_element(:xpath,"//p[contains(@class,'push--left')]").click
	sleep 2
	step 'I Click on SendInviteUser button'
	sleep 5
	
	sleep 2
	step 'I Click on AddPartner button'
	@browser.find_element(:xpath,"//div[@class='tags']/input").send_keys "Demo121@yopmail.com,"
	@browser.find_element(:xpath,"//p[contains(@class,'push--left')]").click
	sleep 2
	step 'I Click on SendInviteUser button'
	sleep 5
end

Given(/A group named "Group1" exists$/) do
	sleep 2
	step 'I select one of my members'
	step 'I must see Groups button'
	step 'I Check 1 Checkbox'
    step 'I choose to add them to a group'
	@existName = @browser.find_element(:xpath,"//*[@id='addGroup']/div/form/fieldset/div/ul/li[1]/label/input").text
	print @existName
end

Given(/I name that group Group1/) do
	sleep 2
	@browser.find_element(:xpath,"//div[@class='checkbox-input ng-scope large-list']/div/input").send_keys @existName
end

Given(/An alert appears saying Group1 already exists $/) do
	sleep 2
	/This group name already exists /.match(@browser.find_element(:xpath,"//*[@id='addGroup']/div/form/fieldset/div/div/div/div/label").text)
end

Given(/I Start from First$/) do
	step 'I logout from the application'
	step 'I have signed into Venzee'
	step 'a company is registered'
end

Given(/No list of existing groups appear$/) do
	sleep 3
	/Organize partners into Groups for easy viewing and filtering/.match(@browser.find_element(:xpath,"//form[contains(@class,'ng-pristine ng-invalid')]/fieldset/div/p").text)
	sleep 2
end

Given(/A field to name a new group appears$/) do
	sleep 2
	@browser.find_element(:xpath, "//form[contains(@class,'ng-pristine ng-invalid')]/fieldset/div/div/input").displayed?.to_s.should == "true"
	sleep 1
end

Given(/Remove member From group$/) do
	sleep 1
	@browser.find_element(:xpath,"//ul[@class='vz-panel__nav flush--bottom']/li[2]/a").click
	sleep 3
end

Given (/I choose to remove them from a group$/) do
	sleep 2
	step 'Then click on Groups'
	step 'Remove member From group'
end

Given (/I select the (.*) group$/) do |x|
	sleep 2
	@browser.find_element(:xpath,"//*[@id='rmGroup']/div/form/fieldset/div/ul/li[#{x}]/label/input").click
	sleep 1
end

Given(/I remove$/) do
	sleep 2
	@browser.find_element(:xpath,"//*[@id='rmGroup']/div/form/fieldset/div/button").click
end

Given(/I add Multiple Members$/) do
	sleep 3
	step 'I Click on AddPartner button'
	@browser.find_element(:xpath,"//div[@class='tags']/input").send_keys "Demo@yopmail.com,"
	sleep 3
	step 'I Click on SendInviteUser button'
	sleep 5
	step 'I Click on AddPartner button'
	@browser.find_element(:xpath,"//div[@class='tags']/input").send_keys "Demo1213@yopmail.com,"
	sleep 3
	step 'I Click on SendInviteUser button'
	sleep 5
	step 'I Click on AddPartner button'
	@browser.find_element(:xpath,"//div[@class='tags']/input").send_keys "Demo121@yopmail.com,"
	sleep 3
	step 'I Click on SendInviteUser button'
	sleep 5
	step 'I Click on AddPartner button'
	@browser.find_element(:xpath,"//div[@class='tags']/input").send_keys "Demo123@yopmail.com,"
	sleep 3
	step 'I Click on SendInviteUser button'
	sleep 5
end

Given(/I select all of my members$/) do
	sleep 2
	step 'I Check 1 Checkbox'
	sleep 1
	step 'I Check 2 Checkbox'
	sleep 1
	step 'I Check 3 Checkbox'
	sleep 1
	step 'I Check 4 Checkbox'
end

Given(/Add In Group$/) do
	sleep 2
	step 'I select all of my members'
	step 'Then click on Groups'
	step 'Add member into group'
	step 'Enter Group Name'
	step 'I save'
	sleep 3
	
	sleep 2
	step 'I select all of my members'
	step 'Then click on Groups'
	step 'Add member into group'
	step 'Enter Group Name'
	step 'I save'
	sleep 3
	
	sleep 2
	step 'I select all of my members'
	step 'Then click on Groups'
	step 'Add member into group'
	step 'Enter Group Name'
	step 'I save'
	sleep 3
	
	sleep 2
	step 'I select all of my members'
	step 'Then click on Groups'
	step 'Add member into group'
	step 'Enter Group Name'
	step 'I save'
	sleep 3
end

Given(/I select the presented groups except the last$/) do
	sleep 2
	step 'I select the 1 group'
	step 'I select the 2 group'
	step 'I select the 3 group'
	step 'I select the 4 group'	
end

Given(/I wait for (.*) Second$/) do |c|
	sleep c.to_i
end

Given(/I verify group not displayed$/) do
	sleep 2
	/@group/.match(@browser.page_source)..displayed?.to_s.should == "false"
end
