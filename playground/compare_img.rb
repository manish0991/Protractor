require 'roo'

##############################################################################################
# CONFIG
##############################################################################################

EXCEL_FILE            = 'I:\MODWAY\master-collection-records-E2GEX71LXQ.xlsx'
IMAGE_FILENAME_COLUMN = 17
IMAGE_DIRECTORY       = 'I:\MODWAY\source-16mai'
OUTPUT_FILE           = 'I:\MODWAY\modway_image_no_match.txt'  # No path mean it write in the current directory (where Ruby is run)




##############################################################################################
# APP
##############################################################################################


# Array to get the list of prouct that doesn't have image match
no_match = Array.new

# Read img filename in XLSX
puts "Loading the Spreadtsheet...."
xlsx = Roo::Spreadsheet.open(EXCEL_FILE)
puts "Loading the Image column...."
xlsx_file = xlsx.column(IMAGE_FILENAME_COLUMN)

# Read image filename in a directory
puts "Loading the Image filename...."
img_file = Dir.entries(IMAGE_DIRECTORY)


# Loop the product in the XLSX, then compare with the image in the folder
for j in 1..(xlsx_file.count - 1)
  match = false
  puts "Product Number: " + j.to_s

  for i in 0..(img_file.count - 1)


    #puts "xlsx: " + xlsx_file[j].to_s
    #puts "img : " + img_file[i].to_s

    if xlsx_file[j] == img_file[i]
      match = true
    end

  end

  if match == false
    #puts "We have NO match ! - SKU: " + xlsx_file[j] 
    no_match.push(xlsx_file[j].to_s)
  end

end

# Write result
File.open(OUTPUT_FILE,"w") do |f|
  for i in 0..(no_match.count - 1)
    f.write(no_match[i].to_s + "\n")
  end
end



#for x in 1..5 # Start at 1, otherwise, I got the title of the column
#  puts xlsx.cell('A',x)
#end