#==================================================================================================
# Global Variables

@catch_line             = 0
@catch_next_3_line      = false

@catch_failing_scenario = false
@nbr_of_failed_scenario = 0

@scenario_result        = ""
@failed_scenario        = ""


#==================================================================================================
# Run the Cuke test based on the OS

def start_cucumber_test(profile, tag, rerun)

  if rerun
    windows_command = "bundle exec cucumber.bat --profile #{profile} @rerun_#{@profile}.txt --format pretty --format rerun --out rerun2_#{@profile}.txt"
    ubuntu_command = "bundle exec cucumber --profile #{profile} @rerun_#{@profile}.txt --format pretty --format rerun --out rerun2_#{@profile}.txt"
  else
    windows_command = "bundle exec cucumber.bat --profile #{profile} --format pretty --format rerun --out rerun_#{@profile}.txt"
    ubuntu_command = "bundle exec cucumber --profile #{profile} --format pretty --format rerun --out rerun_#{@profile}.txt"
  end

  if @os == "Windows"
    puts " - Windows command : #{windows_command}\n\n"
    exit_status = go_cucumber(windows_command)

  elsif @os == "Linux" || @os == "Mac"
    puts " - Ubuntu command : #{ubuntu_command}\n\n"
    puts "Current dir" + Dir.pwd
    exit_status = go_cucumber(ubuntu_command)
    
  end

  return exit_status

end

#==================================================================================================
# Run Cucumber test, spit the output in the stdout and get the test result

def go_cucumber(cmd)

  begin

    @catch_line             = 0
    @catch_next_3_line      = false
    @catch_failing_scenario = false
    @nbr_of_failed_scenario = 0
    @scenario_result        = ""
    @failed_scenario        = ""
    exit_status             = false

    Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      
      # Best practice to close the stdin before starting to read lines
      stdin.close

      while line = stdout.gets      
        catch_stdout_msg(line)  
        puts line
      end

      exit_status = wait_thr.value
    end

    return exit_status

  rescue Exception => e
    puts "Err Msg from go_cucumber() : " + e.message

  end
end


#==================================================================================================
# Catch message spitted by Cucumber on the STDOUT (terminal), and grab usefull info
def catch_stdout_msg(line)

  # Grab the Test result - passed scenario + execution time
  if line["scenario"]
    @catch_next_3_line = true
  end 

  if @catch_next_3_line
  
    if @catch_line == 0
      @scenario_result = line[0,line.length-1]
    
    elsif @catch_line == 2
      @scenario_result = @scenario_result + " (" + line[0,line.length-1] + ")"
    end

    @catch_line = @catch_line + 1
  end

  

  # Grab the Failing Scenarios info
  if line["Failing Scenarios"]
    @catch_failing_scenario = true
  end

  if @catch_failing_scenario

    if @nbr_of_failed_scenario > 0 && line.length > 1
      #@failed_scenario = @failed_scenario + "> " + clean_color(line[0,line.length-1]) + "\\n"
      @failed_scenario = @failed_scenario + "> " + line[0,line.length-1] + " \\n"
    
    elsif @nbr_of_failed_scenario > 0 && line.length == 1
      @catch_failing_scenario = false      
    end

    @nbr_of_failed_scenario += 1 
  end

end

