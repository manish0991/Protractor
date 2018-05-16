Given "a user is on the Dev Portal" do
 visit_page("https://guest1:4468@qa.venzee.com/develop/documentation","Getting Started")
 sleep 2
end
	
When "a user clicks on the Documentation link" do
sleep 2
    click("Documentation")
end
Then "sees the Documentation page" do
sleep 2
    wait_for_text("The Venzee API allows you to create")
end
When "a user clicks on the API link" do
sleep 2
    click("API")
end
Then "sees the API page" do
sleep 2
    wait_for_text("API Reference")
end

When "a user clicks on the Code Sample link" do
sleep 2
    click("Sample Code")
end
Then "sees the Code Sample page" do
sleep 2
    wait_for_text("Code Samples")
end

#Given(/^a user is on the Menu Nav Takeover page$/) do
   #visit_page_via_nav_takeover("Perform a Transformation", "Select the template you want to use")
   #click("Expand")
#end

When "a user clicks on the Dashboard Overview link" do
sleep 1
    click("Dashboard")
end
Then "sees the Dashboard Overview page" do
sleep 1
    wait_for_text("Overview")
	enforce_logout()
end

When "a user clicks on the Manage Partners link" do
sleep 1
    click("Manage Partners")
end
Then "sees the Manage Partners page" do
sleep 1
    wait_for_text("Partners")
	enforce_logout()
end

When "a user clicks on the Manage Users link" do
sleep 1
    click("Manage Users")
end
Then "sees the Manage Users page" do
sleep 1
    wait_for_text("Users")
	enforce_logout()
end

When "a user clicks on the Data link" do
sleep 2
    click("Data")
end
Then "sees the Data page" do
sleep 1
    wait_for_text("Data")
	enforce_logout()
end

When "a user clicks on the Add Records link" do
sleep 1
    click("Add Records")
end
Then "sees the Add Records page" do
sleep 1
    wait_for_text("Create a new collection")
	enforce_logout()
end

When "a user clicks on the Add Records via Form link" do
sleep 1
    click("Add Records via Form")
end
Then "sees the Add Records via Form page" do
sleep 1
    wait_for_text("Add Product Record")
	enforce_logout()
end

When "a user clicks on the Compliance link" do
sleep 1
    click("Compliance")
end
Then "sees the Compliance page" do
sleep 1
    wait_for_text("MAP Monitoring")
	enforce_logout()
end

When "a user clicks on the Integrations link" do
sleep 1
    click("Integrations")
end
Then "sees the Integrations page" do
sleep 1
    wait_for_text("Integrations")
	enforce_logout()
end

When "a user clicks on the Create a Custom Integration link" do
sleep 1
    click("Create a Custom Integration")
end
Then "sees the Create a Custom Integration page" do
sleep 1
    wait_for_text("Setup a Custom Integration")
	enforce_logout()
end

When "a user clicks on the MAP link" do
sleep 1
    click("MAP")
end
Then "sees the MAP page" do
sleep 1
    wait_for_text("MAP Monitoring")
	enforce_logout()
end

When "a user clicks on the Transform Data link" do
sleep 1
    click("Transform Data")
end
Then "sees the Transform Data page" do
sleep 1
    wait_for_text("Export Ready Data")
	enforce_logout()
end

When "a user clicks on the Templates Library link" do
sleep 1
    click("Templates Library")
end
Then "sees the Templates Library page" do
sleep 1
    wait_for_text("Templates")
	enforce_logout()
end

When "a user clicks on the Perform a transformation link" do
sleep 1
    click("Perform a transformation")
end
Then "sees the Perform a transformation page" do
sleep 1
    wait_for_text("Select Template")
	enforce_logout()
end
