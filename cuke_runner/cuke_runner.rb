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
require './controller/cuke_flag'
require './controller/github'
require './controller/slack'
require './controller/terminal'
require './controller/runner'


# Cucumber Config 
@profile = "cuke_server_ts1"
@tag     = ""

# CukeRunner Config
@wait_time_before_check_run_flag = 7

# Global variable
@os               = ""
@version          = ""
@param_run_now    = false
@runner_name      = ""



####################################### CI Preparation #######################################

# Support for using ci_env.json.enc if this script need to read encrypted info.  
# Commented out cause it's not needed for now.

case ARGV[0]

when "--profile" then

  @profile = ARGV[1]
  puts @param_run_now

  if ARGV[2] == "--now"
    @param_run_now = true   # Run the cuke test now, not waiting for the run_cuke_flag to change to 'now'.
  end

when "--now" then

  @param_run_now = true   # Run the cuke test now, not waiting for the run_cuke_flag to change to 'now'.

  if ARGV[2] == "--profile"
    @profile = ARGV[3]
  end

when "--runner" then 

  @runner_name = ARGV[1]

#when "--env" then
#  puts "Using env file : " + ARGV[1]
#  read_env(ARGV[1], false)  # Don't use encrypted ci_env.json file

#when "--env-encrypted" then
#  puts "Using encrypted env file : " + ARGV[1]
#  read_env(ARGV[1], true)     # Use crypted ci_env.enc

when "--help" then
  puts "Usages :"
  puts "   - $ ruby cuke_runner.rb --help                         : Show this file"
  puts "   - $ ruby cuke_runner.rb --now                          : Start the cukeRunner and execute the cucumber test right away"
  puts "   - $ ruby cuke_runner.rb --profile                      : Start the cukeRunner with a specific cucumber profile (.yml)."
  #puts "   - $ ruby cuke_runner.rb --env <my_file_path>           : Use unencrypted file"
  #puts "   - $ ruby cuke_runner.rb --env-encrypted <my_file_path> : Use crypted file"
  #puts "   - $ ruby cuke_runner.rb                                : Use encrypted file, at the default path which is ../../ci_env.json.enc"
  exit

else
  raise "No param --runner found.  Please review run_cuke_flag.json for runners config."

end

#-----------------------------------------------------------------------------------------------------------------------------

puts "\n\n>>>>>>> Reading config file <<<<<<"
puts "==========================================================="

@os = read_os("../ci_os.json")
puts " - Current OS: " + @os

goto_directory("qa")
goto_directory("cucumber")

#puts " - Current dir: " + Dir.pwd 

####################################### CI Execution #######################################

while(true)

  puts "\n\n======================================================================================"
  puts "|                                   Cuke Runner                                      |"
  puts "======================================================================================\n"

  puts "\n\n>>>>>> Should I run ? (New Deployment Done) <<<<<<"
  puts "==========================================================="


  if read_run_cuke_flag(@runner_name) || @param_run_now
    
    puts "Yes, let's run the test !!!"   
    @param_run_now = false    # Reset the param 'run_now' to prevent a re-run

    #puts "\n\n>>>>>> Pulling from Git <<<<<<"
    #puts "==========================================================="
    #get_latest_from_github()

    puts "\n\n>>>>>> Starting Cucumber test <<<<<<"
    puts "==========================================================="
    
    reset_runner_result(@runner_name)
    exit_status = start_cucumber_test(@profile, @tag, false)
    
    puts "\n\n>>>>>> Posting to Slack <<<<<<"
    puts "==========================================================="

    # Uncomment if you want to show the list of test that fail during initial run.
    # It just become confusing in Slack, with 3 runners !
    #post_status(exit_status, @failed_scenario, @scenario_result, @runner_name)

    if (exit_status.success? == false)

      puts "\n\n>>>>>> Re-running Failed Cucumber test <<<<<<"
      puts "==========================================================="

      payload = '{\"text\":\"Re-running the failed scenario...\"}'
      post_to_slack(payload)

      exit_status = start_cucumber_test(@profile, @tag, true)

      puts "\n\n>>>>>> Re-Posting to Slack <<<<<<"
      puts "==========================================================="
      
      post_status(exit_status, @failed_scenario, @scenario_result, @runner_name)

    end

    update_run_cuke_flag(@runner_name, exit_status.success?)

  else
    puts " - Not for now..."
    sleep @wait_time_before_check_run_flag
  end

end
	