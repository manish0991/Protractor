#!/usr/bin/ruby
require 'json'

###############################################################
# Read generic file

File.open("../env.conf", "r") do |aFile|
    aFile.each_line do |line|
        puts line
    end
end

###############################################################
# Read to JSON file

 Input file 'ci_env.json'

 {
   "version": "0.0.1",
   "OS":"Windows" //OS can be Windows, Linux or Mac - respect the case !
 }



f = IO.read("../ci_env.json")
obj = JSON.parse(f)
puts obj["OS"]
puts obj["version"]


###############################################################
# Write to JSON file

# Create a Hash v1.0
tempHash = 
{
    "version" => "0.0.1",
    "OS" => "Windows"
}

# Alternative way to create the same hash
@tempHash = Hash.new
@tempHash["version"] = "0.0.1"
@tempHash["OS"] = "Windows"


File.open("temp.json","w") do |f|
  f.write(JSON.pretty_generate(tempHash))
end


##################################################################
# Read write from a table

# Read the cuke flag json file
f = IO.read("run_cuke_flag.json")
@run_cuke_flag_json = JSON.parse(f)

# write
@x = {
  "name" => "Marco 3"
}

# Create a new element in the array of results
@run_cuke_flag_json["results"].push(@x)

# Update element #2
@run_cuke_flag_json["results"][2]["name"]    = "Marco 2 !"
@run_cuke_flag_json["results"][2]["test_result"]    = "Big fukin fail"
@run_cuke_flag_json["results"][2]["last_run_time"]  = Time.now

# Clear the result
@run_cuke_flag_json["results"].clear

# Write result
File.open("run_cuke_flag.json","w") do |f|
  f.write(JSON.pretty_generate(@run_cuke_flag_json))
end
