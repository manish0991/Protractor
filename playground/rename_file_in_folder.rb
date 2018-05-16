require 'fileutils'

INPUT_DIR = 'I:/RemoteStylist/Modway/KellyMissingImages/'
OUTPUT_DIR = 'I:/RemoteStylist/Modway/KellyMissingImages/renamed/'
STR_TO_FIND = ".jpg"
STR_TO_REPLACE = "_1_.jpg"

new_string = ""

begin
  
  file_list = Dir.entries(INPUT_DIR)

  for i in 2..(file_list.count - 1)  # Starting at 2, because 0 = . and 1 = ..

    new_string = file_list[i].gsub(STR_TO_FIND, STR_TO_REPLACE)
    
    if (i % 50 == 0)
      #print "."
      puts i
    end

    if (new_string != "")
      FileUtils.cp(INPUT_DIR + file_list[i].to_s, OUTPUT_DIR + new_string)
    end 

  end


rescue => e
  puts e
  puts e.backtrace
  puts "--- Error renaming file #{OUTPUT_DIR + new_string} ---"
end