#########################################################################################
# Support Code

def show_error(err, functionName, params)
  $error_raised = true

  puts "----------------------- ERROR -----------------------}"
  puts "fuctionName: " + functionName

  params.each do |key, value|
    puts "#{key} : #{value}"
  end

  puts "Err Msg: " + err.message  
  puts "----------------------- /ERROR -----------------------}"
  
  if $os == "Windows"
    get_screenshot()
	end
  
  enforce_logout() if !$local
    
  raise
end



def get_screenshot()
  begin
  	time1 = Time.new
  	base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
  	value=base_path.split("features")
  	path = File.absolute_path("#{value[0]}/Screenshot/")
  	name = "Error_"+Time.new.strftime("%Y-%m-%d-%H%-M%-S")+".jpg"
  	@browser.save_screenshot(path+'/'+name)
  	#Win32::Screenshot::Take.of(:desktop).write(path+"/"+name)
  	puts "Error Screenshot Captured"

  rescue Exception => e
    show_error(e, "get_screenshot()", {})
  end
end


def get_next_empty_row(ws)

  empty_line = false
  row = 0

  while empty_line == false
    row += 1

    if ws[row, 1] == ""
      empty_line = true
    end      
  end

  return row
end
