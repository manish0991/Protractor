#==================================================================================================
# Read the json config 
def read_env(file_path, crypted)
  begin
    env = Cryptenv.new()

    if crypted 
      env.load_crypted_file(file_path)
    else
      env.load_file(file_path)
    end
 
  rescue Exception => e
    puts "\nERROR: #{file_path} file seems to be missing.\n"
    raise
  end
end

#==================================================================================================
# Read the OS config 
def read_os(file_path)
  begin
    raw_data = IO.read(file_path)
    json_data = JSON.parse(raw_data)
    return json_data["OS"]

  rescue Exception => e
    puts "\nERROR: /qa/ci_os.json file seems to be missing.  Please create it from a copy of /qa/ci_os.json.template and make sure to configure your OS in ci_env.json\n"
    raise
  end
end
