require 'roo'
require 'fileutils'

##############################################################################################
# CONFIG
##############################################################################################

# WTL
SOURCE_EXCEL_FILE = 'I:/RemoteStylist/Safavieh/Safavieh - data collection v3 - 31mai.xlsx'
DEFAULT_SHEET = "Furniture"  # case sensitive !
EXCEL_IMG_COLUMN = 4
EXCEL_UPC_COLUMN = 1


IMAGE_INPUT_DIRECTORY  = ['I:/RemoteStylist/Safavieh/full/']

IMAGE_OUTPUT_DIRECTORY = "I:/RemoteStylist/Safavieh/"
MATCH_LOG_FILE         = "I:/RemoteStylist/Safavieh/image_proposed_match_log.txt" # No path mean it write in the current directory (where Ruby is run)
NO_MATCH_LOG_FILE      = "I:/RemoteStylist/Safavieh/no_image_match_log.txt"  # No path mean it write in the current directory (where Ruby is run)




##############################################################################################
# APP
##############################################################################################

match_upc           = Array.new
match_img           = Array.new
img_path            = Array.new
match_img_path      = Array.new
no_match_img        = Array.new
no_match_upc        = Array.new
img_file_directory  = Array.new
img_row             = Array.new


#------------------------------------------------------------------------------------
# Read img filename in XLSX

puts "Loading Excel files..."
source_xlsx = Roo::Spreadsheet.open(SOURCE_EXCEL_FILE)
source_xlsx.default_sheet = DEFAULT_SHEET

puts "Loading Source Data column..."
img_column = source_xlsx.column(EXCEL_IMG_COLUMN)
upc_column = source_xlsx.column(EXCEL_UPC_COLUMN)



#------------------------------------------------------------------------------------
# Read image filename in a directory

puts "Loading Images directory..."

start = 0 # Build the path for each file in each directory.  

for i in 0..(IMAGE_INPUT_DIRECTORY.count - 1)
  img_file_directory +=  Dir.entries(IMAGE_INPUT_DIRECTORY[i])
 
  for j in start..(img_file_directory.count - 1)
    img_path.push(IMAGE_INPUT_DIRECTORY[i] + img_file_directory[j])
  end

  start = img_file_directory.count

end


#------------------------------------------------------------------------------------
# Loop the product in the XLSX, then compare with the image in the folder

puts "Finding images files..."

for j in 1..(img_column.count - 1)

  img_match = false
  img_row_temp = ""

  if (j % 50 == 0)
    print "#{j}..."
  end

  for i in 0..(img_file_directory.count - 1)

    if (img_file_directory[i].include? upc_column[j].to_s)

      #puts "img col FOUND : " + upc_column[j].to_s + " | " + img_file_directory[i].to_s
      img_row_temp += img_file_directory[i].to_s + ";"
      match_upc.push(upc_column[j].to_s)
      match_img.push(img_column[j].to_s)
      match_img_path.push(img_path[i].to_s)
      img_match = true
    end
    
  end

  # Add each row of img into the array.  
  img_row.push(img_row_temp)

  if img_match == false
      no_match_upc.push(upc_column[j].to_s)
      no_match_img.push(img_column[j].to_s)
  end

end





#------------------------------------------------------------------------------------
# Copy Image

puts "\n\nWriting img match log file & and copy images..."

File.open(MATCH_LOG_FILE,"w") do |f|
  
  # Header row
  f.write("Img Row\n") # Write the log file
  f.write("--------------------------------------------------------------------------------\n")

  puts "img_row.count : #{img_row.count}"
  
  for z in 0..(img_row.count - 1)
    x = img_row[z].to_s
    x = x[0...-1]

    f.write(x + "\n")
  end

=begin
  for i in 0..(match_upc.count - 1)
    f.write(match_upc[i].to_s + " - " +  match_img[i].to_s + " - " + match_img_path[i].to_s + " - " + img_row[i].to_s + "\n") 
    # Write the log file
    #FileUtils.cp(match_img_path[i].to_s, IMAGE_OUTPUT_DIRECTORY + match_upc[i].to_s + ".jpg")       # Rename the img to <UPC>.jpg
  
    if (i % 50 == 0)
      print "#{i}..."
    end

  end
=end

end


#------------------------------------------------------------------------------------
# Write log on imagne not found

puts "\nWriting no img match log file..."

File.open(NO_MATCH_LOG_FILE,"w") do |f|
  for i in 0..(no_match_upc.count - 1)
    f.write(no_match_upc[i].to_s + " - " +  no_match_img[i].to_s + "\n")
  end
end