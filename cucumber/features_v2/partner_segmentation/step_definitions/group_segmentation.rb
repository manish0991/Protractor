Then "has created a group" do
	add_group()
end

Then "sees the group in the groups list" do
	find_text($user.group)
	enforce_logout()
end

Then "adds a new group" do
	click_button("Add groups","Organize partners into Groups")
	fill_in("nameGroup",$user.group)
	click_button("Save",$user.group)
end

Then "the group is not be created" do
	click_button("Add groups","Organize partners into Groups")
	fill_in("nameGroup",$user.group)
	click_button("Save","Organize partners into Groups")
end

Then "sees an alert advising him the group name already exist" do
	find_text("This group name already exists")
	enforce_logout()
end

Then "has an active partner" do
	enter_address_to_invite()
	send_invitation()
end

Then "selects partner" do
	click_checkbox("partner0")
end

Then "creates a new group" do
	click_button("Groups","Organize partners into Groups")
	fill_in("nameGroup",$user.group)
	click_button("Save",$user.group)
end

Then "the group is created" do
	find_text($user.group)
end

Then "the partner are added the group" do
	visit("groups","Manage your groups:")
end

Then "has already created a group" do
	add_group_with_partner()
end

Then "deletes the group" do
	click_checkbox("group0")
	sleep 2
	click_by_ng("groups.removeGroups()","Are you sure you want to delete")
	sleep 2
	click_button("Delete","Create and manage your groups")
end

Then "the group is deleted" do
	find_text("Create and manage your groups")
end

Then "partners associated to the group are disassociated" do
	text_not_available("1 Partners")
	#click_button("Return to partners","Select one or more partners")
	click_link("Expand", "Log out")
	sleep 2
	click_link("Manage Partners", "Add Partners")
	sleep 2
	#visit("partners?page=1&per_page=50","Add Partners")
	text_not_available($user.group)
	enforce_logout()
end

Then "renames group" do
	click_by_ng("isEditing.$show()","required")
end

Then "enters a valid group name" do
	fill_in_from_placeholder("Group name","New Group Name")
end

Then "the group name doesn't already exist" do
	press_key("editable-input",":enter","saving")
	text_not_available("This group name already exists")
end

Then "the group is renamed" do
	find_text("New Group Name")
end

Then "sees an alert advising him the renaming was completed" do
	visit("partners?page=1&per_page=50","Add Partners")
	find_text("New Group Name")
	enforce_logout()
end

Then "the group name already exist" do
	fill_in_from_placeholder("Group name","new group name")
	press_key("editable-input",":enter","saving")
	find_text("This group name already exists")
end

Then "the group is not renamed" do
	
end

Then "add a group" do
	add_group()
end

Then "add him to the group" do
	click_button("Groups","Organize partners into Groups")
	fill_in("nameGroup",$user.group)
	click_button("Save",$user.group)
end

Then "the partner is added to the group" do
	find_text($user.group)
end

Then "the collections shared with the group is shared with the partner" do
	find_text($user.group)
end

Then "sees an alert advising him the partner was added to the group" do
	visit("groups","Manage your groups:")
	find_text("1 partner")
	enforce_logout()
end

Then "added him to a group" do
    sleep 2
	click_checkbox("partner0")
	click_button("Groups","Organize partners into Groups")
	fill_in("nameGroup",$user.group)
	click_button("Save",$user.group)
	wait_for_element_enabled("setForm")
	#visit_page_via_nav_takeover("Dashboard","Dashboard")

	# Verify that the user is on the group by going to the partner page and then looking for the group
	#visit_page_via_nav_takeover("Partners",$user.group)

	# temp double check
	puts "try to find this $user.group : //*[contains(.,'#{$user.group}')]"
	@browser.find_element(:xpath,"//*[contains(.,'#{$user.group}')]").displayed?.to_s.should=="true"
end

Then "removes him from the group" do
	click_button("Groups","Organize partners into Groups")
	click_link("Remove from group(s)","Remove from:")
	click_by_xpath("//li[@ng-repeat='group in partners.detachAvailableGroups']/label/input")
	click_button("Remove","Add Partners")
end

Then "the partners groups is removed from the group" do
	wait_for_element_enabled("detachGroupForm")
    #visit_page_via_nav_takeover("Partners", "Partners")
	#visit("groups","Manage your groups:")
    click_button("Groups", "Manage groups")
    click_link("Manage groups", "manage your groups")
	click_button("Return to partners", "Add Partners")
	list_not_available($user.group)
end

Then "the collections shared with the group is not shared with the partner anymore" do
	list_not_available($user.group)
end

Then "sees an alert advising him the partner was removed from the group" do
    #visit_page_via_nav_takeover("Partners", "Partners")
	click_button("Groups", "Manage groups")
    click_link("Manage groups", "manage your groups")
	text_not_available("1 partner")
	enforce_logout()
end

Then "does not see the filter window" do
	text_not_available("Find partners")
end

Then "has an active user" do
	enter_address_to_invite()
	send_invitation()
end

Then "has a pending user" do
	enter_address_to_invite()
	send_invitation()
end