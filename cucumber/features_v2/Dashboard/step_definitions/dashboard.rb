##########################################################################

Given "user is on the Dashboard page" do
   visit_page_via_nav_takeover("Dashboard", "Get Started") # Go to Dashboard page
end

##########################################################################

And /^a user clicks on the (.*) link$/ do |page|
  case page
  
  when "Users"
    click_by_xpath("//article[contains(@class,'users')]")

  when "Partners"
    click_by_xpath("//article[contains(@class,'partners')]")
    
  when "Source Data"
    click_by_xpath("//article[contains(@class,'collections')]")
  
  when "Dynamic Data"
    click_by_xpath("//article[contains(@class,'dynamicdata')]")    

  when "Integration"
    click_by_xpath("//article[contains(@class,'integrations')]")
  
  when "View Marketplace"
    click_by_xpath("//a[text()='View Marketplace']")
    
  when "View Templates"
    click_by_xpath("//a[text()='View Templates']")
      
  end
end

##########################################################################

Then /^sees the (.*) page$/ do |page|
  case page
  
  when "Users"
    find_text("Users")

  when "Partners"
    find_text("Partners")
    
  when "Source Data"
    find_text("Data")
  
  when "Dynamic Data"
    find_text("Data")    

  when "Integration"
    find_text("Integrations")
  
  when "View Marketplace"
    find_text("Integrations")
    
  when "View Templates"
    find_text("Templates")    
      
  end
end

##########################################################################