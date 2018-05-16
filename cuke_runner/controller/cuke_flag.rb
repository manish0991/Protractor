#==================================================================================================
# Global Variable

@run_cuke_flag_json = ""  # Contain the json object from "run_cuke_flag.json"


#==================================================================================================
def read_run_cuke_flag(runner_name)

  begin

    load_cuke_flag_file()

    puts "result in read_cuke_flag -------"
    puts JSON.pretty_generate(@run_cuke_flag_json["results"])
    puts "result in read_cuke_flag -------"

    @time_cuke_flag = Time.parse(@run_cuke_flag_json["run_cuke_flag"]["run_time"])
    @profile        = get_runner_profile(runner_name)
    @time_now       = Time.now

      if get_time_last_run(runner_name) != nil
        @time_last_run  = Time.parse(get_time_last_run(runner_name))
      end

    puts "runner_name     : " + runner_name
    puts "@time_cuke_flag : " + @time_cuke_flag.to_s
    puts "@profile        : " + @profile.to_s
    puts "@time_now       : " + @time_now.to_s
    puts "@time_last_run  : " + @time_last_run.to_s

    if @time_last_run == nil
      @time_last_run = Time.now
      puts "result: @time_last_run is null, return false"
      return false

    elsif @time_cuke_flag > @time_last_run
      puts "result: @time_cuke_flag > @time_last_run, return true"
      return true

    elsif @time_cuke_flag < @time_last_run
      puts  "result: @time_cuke_flag < @time_last_run, return false"
      return false

    end

  rescue Exception => e
    puts e
    puts "Problem when reading '/run_cuke_flag.json'\n"
    raise
  end

end


#==================================================================================================
def update_run_cuke_flag(runner_name, test_result)

  # Re-read the file to avoid writing conflict
  load_cuke_flag_file()

  for i in 0..@run_cuke_flag_json["results"].length - 1
    
    if @run_cuke_flag_json["results"][i]["name"] == runner_name
    
      @run_cuke_flag_json["results"][i]["test_result"]   = test_result
      @run_cuke_flag_json["results"][i]["last_run_time"] = Time.now
      @run_cuke_flag_json["results"][i]["running_now"]   = false

    end

  end

  save_cuke_flag_file()
  puts "run_cuke_flag reseted."

end


#==================================================================================================
def load_cuke_flag_file()

  f = IO.read("../cuke_runner/run_cuke_flag.json")
  @run_cuke_flag_json = JSON.parse(f)

end


#==================================================================================================
def save_cuke_flag_file()

  File.open("../cuke_runner/run_cuke_flag.json","w") do |f|
    f.write(JSON.pretty_generate(@run_cuke_flag_json))
  end

end