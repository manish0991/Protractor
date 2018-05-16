#==================================================================================================
#Global Variable

@current_status   = ""


#==================================================================================================
# Depending on the result of the test, determine if we need to post or not on slack

def is_post_needed(cucumber_result)

  if cucumber_result == true
    if @current_status == "pass"
      return false
    else
      return true
    end
  
  else
    if @current_status == "fail"
      return false
    else
      return true
    end
  end    

end


#==================================================================================================
# Build the payload to post on Slack

def post_status(exit_status, failed_scenario, scenario_result, runner_name)

  payload      = ""

  if (exit_status.success?)
    @current_status = "pass"
    payload = '{\"text\":\"' + runner_name + ': Cucumber test has passed, good job buddy!\n _-----> ' + @scenario_result + '_ \"}'
  else
    @current_status = "fail"
    payload = '{\"text\":\"' + runner_name + ': Cucumber test has failed, please check\n _----> ' + scenario_result + '_\n' + revert_backslash(failed_scenario) + '\"}'
  end

  puts " - Posting to Slack : test result is #{@current_status}"
  post_to_slack(payload)

end


#==================================================================================================
# Post the status on Slack

def post_to_slack(payload)
  
  if @os == "Windows"
    my_cmd = 'curl.exe '
  elsif @os == "Linux" || @os == "Mac"
    my_cmd = 'curl '
  end

  my_cmd += '-X POST -k https://hooks.slack.com/services/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 -d "' + payload + '"'
  
  # Execute the curl command to post in Slack
  go(my_cmd)    

end


#==================================================================================================
# Revert the backslash to slash in the failed scenario list

def revert_backslash(x)

  # Keep the \n by changing to ~n
  x = x.gsub("\\n", "~n") 
  
  # Change \ by /
  x = x.gsub("\\", "/")
  
  # Bring back the \n
  x = x.gsub("~n", "\\n")

  return x

end


#==================================================================================================
# Clean the color of the error message on STDOUT (Terminal) --> Now running the test without color
# so no more problem to post on Slack


=begin
def clean_color(sentence)

  temp = sentence.dump                      #Get a string dump including system char for color like \e[31m

  temp = temp.sub /(\\e\[32m)/,''           #Remove green color begin system char \e[32m
  temp = temp.sub /(\\e\[31m)/,''           #Remove red color begin system char \e[31m
  temp = temp.sub /(\\e\[90m)/,''           #Remove red color begin system char \e[90m

  while temp["\\e[0m"]
    temp = temp.sub("\\e[0m","")            #Remove multiple system char \e[0m
  end
  
  return temp[1,temp.length-2]              #Remove a "/ added at the beginning & ending of line, after a str.sub (I don't understand why !!) 
end
=end