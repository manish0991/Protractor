Given(/^a user is logged to Pubnub$/) do                                             

  pwd = "PZkv3MFz4Dw29Rio!"
  visit_page("https://admin.pubnub.com/#/login","Welcome")
  fill_in("email", "admin@venzee.com")

  fill_in("password", pwd)
  sleep 0.5
  click_by_xpath("//input[@value='Login']")
  wait_for_text("Welcome to PubNub")              

end                                                                                  
                                                                                    
Then(/^read the number of message flown on (.*)$/) do |env|

  t = Time.now()
  $pubnub[0].date = t.strftime("%Y-%m-%d %H:%M:%S")    


  if env == "PROD"                      
                                                     
    messages_count = @browser.find_element(:xpath => "//*[@id='grid']/div/div/div/div[3]/a/div/div/div[2]/div[1]/h2[1]").text.strip
    puts "mc: " + messages_count.to_s
    messages_count = convert_k_to_decimal(messages_count)
    $pubnub[0].messages_count = messages_count
    puts "This is Prod messages count: " + messages_count.to_s

  elsif env == "DEV"

    messages_count = @browser.find_element(:xpath => "//*[@id='grid']/div/div/div/div[4]/a/div/div/div[2]/div[1]/h2[1]").text.strip
    messages_count = convert_k_to_decimal(messages_count)
    $pubnub[1].messages_count = messages_count
    puts "This is DEV messages count: " + messages_count.to_s

  end

end                                                                         


                                                                                     
Then(/^read the number of unique device that connected on (.*)$/) do |env|

  if env == "PROD"  

    device_count = @browser.find_element(:xpath => "//*[@id='grid']/div/div/div/div[3]/a/div/div/div[2]/div[2]/h2[2]").text.strip

    device_count = convert_k_to_decimal(device_count)
    puts "This is Prod device count: " + device_count.to_s
    $pubnub[0].device_count = device_count

  elsif env == "DEV"

    device_count = @browser.find_element(:xpath => "//*[@id='grid']/div/div/div/div[4]/a/div/div/div[2]/div[2]/h2[2]").text.strip 
    device_count = convert_k_to_decimal(device_count)
    puts "This is DEV device count: " + device_count.to_s
    $pubnub[1].device_count = device_count

  end

end                                                                            


                                                                                     
Then(/^write Pubnub data in the result file$/) do                                    

  puts "Pubnub output to " + OUTPUT      # OUTPUT is defined in the env.rb

  if OUTPUT == "TXT"
    write_pubnub_to_txt()
  elsif OUTPUT == "GSHEET"
    write_pubnub_to_gheet()
  end                   

end                                                                                  
                                                                                     