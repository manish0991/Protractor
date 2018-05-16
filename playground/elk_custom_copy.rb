require 'roo'
require 'fileutils'

##############################################################################################
# CONFIG
##############################################################################################

# BBB
BBB_EXCEL_FILE = 'I:\bbb\ELKLIGHT.LIGHTING.FIXTURES 5-13-16.xlsx'
BBB_UPC_COLUMN = 3

# Elk
ELK_EXCEL_FILE            = 'I:\elk\elk.xlsx'
ELK_UPC_COLUMN            = 7
ELK_IMAGE_FILENAME_COLUMN = 17


IMAGE_INPUT_DIRECTORY  = 'I:/ELK/Elk Full/Elk/'
IMAGE_OUTPUT_DIRECTORY = 'I:/BBB/poc_img/'
OUTPUT_LOG_FILE        = 'I:\BBB\poc_img\BBB_image_log.txt'  # No path mean it write in the current directory (where Ruby is run)




##############################################################################################
# APP
##############################################################################################


# Array to get the list of prouct that doesn't have image match
match_upc = Array.new
match_img = Array.new


# Read img filename in XLSX
puts "Loading Excel files..."
bbb_xlsx = Roo::Spreadsheet.open(BBB_EXCEL_FILE)
elk_xlsx = Roo::Spreadsheet.open(ELK_EXCEL_FILE)

puts "Loading BBB Data column..."
bbb_upc_column = bbb_xlsx.column(BBB_UPC_COLUMN)
puts "Loading ELK Data column..."
elk_upc_column = elk_xlsx.column(ELK_UPC_COLUMN)
puts "Loading ELK Image column..."
elk_img_column = elk_xlsx.column(ELK_IMAGE_FILENAME_COLUMN)

# Read image filename in a directory
puts "Loading Images directory..."
elk_img_file = Dir.entries(IMAGE_INPUT_DIRECTORY)


# Loop the product in the XLSX, then compare with the image in the folder
puts "Finding images files..."

for j in 10..(bbb_upc_column.count - 1)

  for i in 0..(elk_upc_column.count - 1)

    #puts bbb_upc_column[j].to_s + " - " + elk_upc_column[i].to_s

    if bbb_upc_column[j] == elk_upc_column[i]
      puts "Match : " + elk_upc_column[i].to_s
      match_upc.push(elk_upc_column[i].to_s)
      match_img.push(elk_img_column[i].to_s)
    end

  end

end

# Write result
puts "Writing log file..."

File.open(OUTPUT_LOG_FILE,"w") do |f|
  for i in 0..(match_upc.count - 1)
    f.write(match_upc[i].to_s + " - " +  match_img[i].to_s + "\n")
    FileUtils.cp(IMAGE_INPUT_DIRECTORY + match_img[i].to_s, IMAGE_OUTPUT_DIRECTORY + match_img[i].to_s)
  end
end