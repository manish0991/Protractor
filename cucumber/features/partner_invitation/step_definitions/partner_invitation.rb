Then "I add a partner" do
	click_link_and_wait("Add partners","Invite Partners to Access your Product Data")
	@random_yopmail = "vivek14"+rand(1000000).to_s+"@yopmail.com"
	fill_in_from_placeholder("Add an email addess for each of your partners. Separate each email with a , (comma).",@random_yopmail+",")
	click_button("Send 1 invitations","Invited a few seconds ago")
end

Then "User is available in the list" do
	find_text(@random_yopmail)
end

