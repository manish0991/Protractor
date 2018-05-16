# Global Variable
$app_key    = ""  # PROD, DEV, SANDBOX, QA
$curent_app = 0   # 0..3, one for each app_key


#------------------------------------------------------------------------------------------------------------------------------
Given(/^a user is logged to Filestack$/) do
  $curent_app = 0
  visit_page("https://dev.filestack.com/login","Welcome back!")
  login_user() 
end


#------------------------------------------------------------------------------------------------------------------------------
When(/^the user is on the (.*) application$/) do |app|
  # Navigate to the right application (environment) in Filestack
  $app_key = app
  navigate_to($app_key)
  $filestack[$curent_app].application = $app_key
end


#------------------------------------------------------------------------------------------------------------------------------
Then(/^read the number of images uploaded to date$/) do

  # Then use the object $filestack that has been initiated early to store the info
  plan_usage = @browser.find_element(:xpath => "//*[@id='plan-usage']").text.strip
  puts "plan: " + plan_usage.to_s

  if plan_usage.nil? || plan_usage.empty? || plan_usage == "-----------"
    puts "inside condition !!"
    navigate_to(@app_key)
    sleep 3
    plan_usage = @browser.find_element(:xpath => "//*[@id='plan-usage']").text.strip
    puts plan_usage
  end

  t = Time.now()
  $filestack[$curent_app].snapshot_date        = t.strftime("%Y-%m-%d %H:%M:%S")
  $filestack[$curent_app].monthly_consumption  = get_monthly_consumption(plan_usage)
  $filestack[$curent_app].monthly_limit        = get_monthly_limit(plan_usage)
 
  $curent_app += 1
end


#------------------------------------------------------------------------------------------------------------------------------
Then(/^write filestack data in the result file$/) do

  puts "Filestack Output to " + OUTPUT      # OUTPUT is defined in the env.rb

  if OUTPUT == "TXT"
    write_filestack_to_txt()
  elsif OUTPUT == "GSHEET"
    write_filestack_to_gheet()
  end    

end