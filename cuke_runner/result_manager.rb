#!/usr/bin/ruby
require 'rubygems'
require 'bundler/setup'
require 'json'
require 'time'


# Global Variable
@run_cuke_flag_json = nil
@wait_for_result   = false



#===================================================================================
def set_cuke_flag()

  puts "clearing result & setting 'run_time'"

  # Clear the result
  @run_cuke_flag_json["results"].clear
  
  # Set the run_time so the runners will start cuke test
  @run_cuke_flag_json["run_cuke_flag"]["run_time"] = Time.now

  File.open("run_cuke_flag.json","w") do |f|
    f.write(JSON.pretty_generate(@run_cuke_flag_json))
  end

end


#===================================================================================
def is_running_runner()

  # Loop all the runner
    # if 1 runner is running
      # return true
    # else
      #return false

  for i in 0..@run_cuke_flag_json["results"].length - 1
    
    if @run_cuke_flag_json["results"][i]["running_now"] == true
      return true    
    end

  end

  return false

end


#===================================================================================
def get_global_test_result()

  # Loop all the results
    # if they are all test_result = pass
      #return true
    # else 
      # return false

  for i in 0..@run_cuke_flag_json["results"].length - 1
    
    if @run_cuke_flag_json["results"][i]["test_result"] == false
      return false  
    end

  end

  return true

end


#===================================================================================
def is_runner_list_empty()

  if @run_cuke_flag_json["results"].length > 0
    return false
  else
    return true
  end

end





#===================================================================================

# Get the cmd line parameter
case ARGV[0]
  when "--wait-for-result" then
	@wait_for_result = true
end


# Read the cuke flag json file
f = IO.read("run_cuke_flag.json")
@run_cuke_flag_json = JSON.parse(f)


# Check if runners are currently running before starting a new run
while is_running_runner() == true
  puts Time.now.to_s + " : runner Running.  Let's wait 10 sec and re-read the file..."
  sleep 10
  
  # Read the cuke flag json file
  f = IO.read("run_cuke_flag.json")
  @run_cuke_flag_json = JSON.parse(f)

end



# Set the timestamp to start the cuke test + clear the old result
set_cuke_flag()



# Result loop to get result from Cucumber
if @wait_for_result == true

  got_result = false

  while got_result == false

    if (is_running_runner() == false && is_runner_list_empty == false)
      got_result = true
    
    else
      sleep 10
      puts Time.now.to_s + " : runner still running.  Let's wait 10 sec and re-check..."

      # Read the cuke flag json file
      f = IO.read("run_cuke_flag.json")
      @run_cuke_flag_json = JSON.parse(f)

    end

  end

  if get_global_test_result() == false
    puts "At least one runner has a FAIL"
    exit(1)

  else
    puts "Global test result is PASS"
    # Then exit normally !

  end
end