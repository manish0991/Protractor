# Global Variable
$proj_key    = ""  # PROD, DEV, SANDBOX, QA
$curent_proj = 0   # 0..3, one for each app_key


#------------------------------------------------------------------------------------------------------------------------------
Given(/^a user is logged to Localize$/) do                                

  visit_page("https://localizejs.com/login","Welcome back!")
  fill_in_from_placeholder("Email address", "marco+venzeebot@venzee.com")
  fill_in_from_placeholder("Password", "CXR*Z3Wd%8Vz(OR(")
	sleep 0.5
  click_by_xpath("//a[@class='submit']")
  wait_for_text("Suggested languages")      

end                                                                       
                                                                          

#------------------------------------------------------------------------------------------------------------------------------
When(/^the user is on the (.*) project$/) do  |arg1|                         
  visit_page("https://localizejs.com/project", "Suggested languages")
  click_by_xpath("//div[@class='project-selector']")      
  click_by_xpath("//div[@class='listing']/a[text()='#{arg1}']")
  sleep 2
end                                                                       
                                                                          

#------------------------------------------------------------------------------------------------------------------------------
Then(/^read the number of page viewed in the last (\d+) days$/) do |arg1|   

  page_viewed = @browser.find_element(:xpath => "//*[@id='project-info-container']/div[@class='body']/table[2]//td").text.strip
  puts page_viewed
  
  t = Time.now()
  $localize[$curent_proj].snapshot_date        = t.strftime("%Y-%m-%d %H:%M:%S")
  $localize[$curent_proj].monthly_consumption  = page_viewed.gsub(',', '')

  $curent_proj += 1

end

Then(/^write localize data in the result file$/) do

  puts "Localize output to " + OUTPUT      # OUTPUT is defined in the env.rb

  if OUTPUT == "TXT"
    write_localize_to_txt()
  elsif OUTPUT == "GSHEET"
    write_localize_to_gheet()
  end    

end
