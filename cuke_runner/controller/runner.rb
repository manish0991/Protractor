
@time_last_run      = nil


#==================================================================================================
def get_runner_profile(runner_name)
  
  profile = ""
  
  for i in 0..@run_cuke_flag_json["runners_config"].length - 1

    if @run_cuke_flag_json["runners_config"][i]["name"] == runner_name
      profile = @run_cuke_flag_json["runners_config"][i]["cuke_profile"]
    end

  end

  if profile != ""
    return profile
  else
    raise "controller/cuke_flag.rb : Can't find runner name."
  end

end


#===================================================================================
def is_runner_list_empty()

  if @run_cuke_flag_json["results"].length > 0
    return false
  else
    return true
  end

end


#==================================================================================================
def is_runner_result_exist(runner_name)

  for i in 0..@run_cuke_flag_json["results"].length - 1
  
    if @run_cuke_flag_json["results"][i]["name"] == runner_name
      return true
    end
  end

  return false

end


#==================================================================================================
def reset_runner_result(runner_name)

  if is_runner_result_exist(runner_name) == false # Add a new result placeolder for this runner

    runner_result = {
      "name"          => runner_name,
      "test_result"   => nil,
      "last_run_time" => nil,
      "running_now"   => true
    }

    @run_cuke_flag_json["results"].push(runner_result)

  else  # Update existing result info for this runner

    for i in 0..@run_cuke_flag_json["results"].length - 1
    
      if @run_cuke_flag_json["results"][i]["name"] == runner_name
        @run_cuke_flag_json["results"][i]["test_result"] = nil
        @run_cuke_flag_json["results"][i]["last_run_time"] = nil
        @run_cuke_flag_json["results"][i]["running_now"] = true
      end

    end

  end

  save_cuke_flag_file()

end


#===================================================================================
def get_time_last_run(runner_name)

  if is_runner_list_empty()
    last_run_time = nil

  else

    for i in 0..@run_cuke_flag_json["results"].length - 1

      if @run_cuke_flag_json["results"][i]["name"] == runner_name
        last_run_time = @run_cuke_flag_json["results"][i]["last_run_time"]
      end

    end
  
  end

  return last_run_time

end