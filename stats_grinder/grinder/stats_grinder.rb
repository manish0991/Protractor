# Gem dependencies
require 'rubygems'
require 'bundler/setup'
require 'open3'
require 'json'
require 'cryptenv'
require 'time'

# /Controller files
require './controller/config_file'
require './controller/cucumber'
require './controller/slack'
require './controller/terminal'


# Cucumber profile from /cuke/cucumber.yml 
@profile = Array.new()
@profile[0] = "grinder"


# CukeRunner Config
@wait_time_before_check_run_flag = 3600

# Global variable
@os               = ""
@version          = ""


####################################### CI Preparation #######################################

# Support for using ci_env.json.enc if this script need to read encrypted info.  
# Commented out cause it's not needed for now.

case ARGV[0]
  when "--run_once" then
    puts "run_once"

  when "--help" then
    puts "Usages :"
    puts "   - $ ruby cuke_runner.rb --help  : Show this file"
end

#-----------------------------------------------------------------------------------------------------------------------------

puts "\n\n>>>>>>> Reading config file <<<<<<"
puts "==========================================================="

@os = read_os("../ci_os.json")
puts " - Current OS: " + @os

Dir.chdir("../cucumber")
puts " - Current dir: " + Dir.pwd 

####################################### CI Execution #######################################

while(true)

  puts "\n\n======================================================================================"
  puts "|                                  Stats Grinder                                      |"
  puts "======================================================================================\n"

  for i in 0..@profile.length - 1
    
    cur_profile = @profile[i]
    exit_status = start_cucumber_test(cur_profile)
      
    puts "\n\n>>>>>> Posting to Slack <<<<<<"
    puts "==========================================================="

    if (exit_status.success? == true)
      payload = '{\"text\":\"Stats Grinder just grinded ' + cur_profile + ' , check the dashboard !\"}'
    else
      payload = '{\"text\":\"Stats Grinder just ran... and crashed :(\"}'
    end

    post_to_slack(payload)

  end

  # Wait 1 hours and re-run
  sleep(@wait_time_before_check_run_flag)
end
  