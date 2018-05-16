#==================================================================================================
#Global Variable


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

