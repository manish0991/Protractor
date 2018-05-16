def visit_page(url, wait_for)
  begin
    @browser.get(url)
    wait = Selenium::WebDriver::Wait.new(:timeout => 25) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source)
    }
  rescue Exception => e
    show_error(e, "visit_page(url, wait_for)", {"url" => url, "wait_for" => wait_for})
  end
end


def click_button(button, wait_for)
  begin
	wait_for_element_visible("//button[contains(.,'#{button}')]",30)
    @browser.find_element(:xpath, "//button[contains(.,'#{button}')]").location_once_scrolled_into_view
    #sleep 2
    @browser.find_element(:xpath, "//button[contains(.,'#{button}')]").click
	if "#{wait_for}" == "new group name"
		#sleep 2
		if @browser.find_element(:xpath,"//button[contains(.,'#{button}')]").displayed?
			@browser.find_element(:xpath, "//button[contains(.,'#{button}')]").click
		end
	end
    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
	#sleep 2
    wait.until {
      /#{wait_for}/.match(@browser.page_source) 
    }
  
  rescue Exception => e
    show_error(e, "click_button(button, wait_for)", {"button" => button, "wait_for" => wait_for})
  end
end



def click_link(link, wait_for)
  begin
	wait_for_element_visible("//a[contains(.,'#{link}')]",30)
    if link == "Add a product record using a form"
       el = @browser.find_element(:xpath, "//a[contains(.,'#{link}')]")
       sc = "arguments[0].click();"
       @browser.execute_script(sc,el)
    else
       @browser.find_element(:xpath, "//a[contains(.,'#{link}')]").click
    end
    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source) 
    }
  
  rescue Exception => e
    show_error(e, "click_link(link, wait_for)", {"link" => link, "wait_for" => wait_for})
  end
end

def click(link)
  begin
	wait_for_element_visible("//a[contains(.,'#{link}')]",30)
	wait_for_text("#{link}")
    @browser.find_element(:xpath, "//a[contains(.,'#{link}')]").click
  
  rescue Exception => e
    show_error(e, "click(link)", {"link" => link})
  end
end

def click_bold(text)
  begin
    
    element = "//b[contains(.,'#{text}')]"
	  wait_and_check(element)
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
	  @browser.execute_script('arguments[0].click();', wait.until { @browser.find_element(:xpath,"//b[contains(.,'#{text}')]") })
	  #sleep 5
	
  rescue Exception => e
    show_error(e, "click_bold(text)", {"text" => text})
  end
end

def click_checkbox(name)
  begin
	wait_for_element_visible("//*[contains(@name,'#{name}')]",30)
    @browser.find_element(:xpath, "//*[contains(@name, '#{name}') and contains(@type, 'checkbox')]").click
    #sleep 0.5
  rescue Exception => e
    show_error(e, "click_checkbox(name)", {"name" => name})
  end
end

def click_checkbox_xpath(xpath)
  begin
	wait_for_element_visible("//*[contains(@name,'#{xpath}')]",30)
    @browser.find_element(:xpath, "//*[contains(@name, '#{xpath}') and contains(@type, 'checkbox')]").click
    #sleep 0.5
  rescue Exception => e
    show_error(e, "click_checkbox_xpath(xpath)", {"name" => xpath})
  end
end

def find_text(text)
  begin
    wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
    wait.until { 
      /#{text}/.match(@browser.page_source) 
    }

    # /#{text}/.match(@browser.page_source) # I was able to find "nomorspreadsheetssssss" in the landing page with that function, so I think something is wrong
    #@browser.find_element :xpath => "//*[contains(.,'#{text}')]"
  rescue Exception => e
    show_error(e, "find_text(text)", {"text" => text})
  end  
end

def validate_text(text, field)
  begin
    wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
    wait.until { 
      element = @browser.find_element :xpath => "#{field}"
      /#{text}/.match(element.text) 
    }
    
  rescue Exception => e
    show_error(e, "validate_text(text, field)", {"text" => text, "field" => field})
  end  
end


def find_label(label)
  @browser.find_element(:xpath, "//label[contains(text(),'#{label}')]")
end



def fill_in(field, data)
  begin
	  #sleep 0.5
    element = @browser.find_element :xpath => "//input[@name = '#{field}']"
    element.clear
    element.send_keys(data)
  
  rescue Exception => e
    show_error(e, "fill_in(field, data)", {"field" => field, "data" => data})
  end
end

def fill_in_from_xpath(field, data)
  begin
	  #sleep 0.5
    element = @browser.find_element :xpath => "#{field}"
    element.clear
    element.send_keys "#{data}"
  
  rescue Exception => e
    show_error(e, "fill_in(field, data)", {"field" => field, "data" => data})
  end
end


def fill_in_from_placeholder(placeholder, data)
  begin
	#sleep 0.5
    element = @browser.find_element :xpath => "//input[@placeholder = '#{placeholder}']"
    element.clear
    element.send_keys "#{data}"
  
  rescue Exception => e
    show_error(e, "fill_in_from_placeholder(placeholder, data)", {"placeholder" => placeholder, "data" => data})
  end
end

def fill_in_from_value(value, data)
  begin
  #sleep 0.5
    element = @browser.find_element :xpath => "//input[@value = '#{value}']"
    element.clear
    element.send_keys "#{data}"
  
  rescue Exception => e
    show_error(e, "fill_in_from_value(value, data)", {"value" => value, "data" => data})
  end
end

def select_from_dropdown(dropdown, item)
  begin
	wait_for_element_visible("//a[@placeholder='#{dropdown}']",30)
    @browser.find_element(:xpath, "//a[@placeholder='#{dropdown}']").click
    @browser.find_element(:xpath, "//span[@class='ng-binding ng-scope'][contains(text(), '#{item}')]").click
  
  rescue Exception => e
    show_error(e, "select_from_dropdown(dropdown, item)", {"dropdown" => dropdown, "item" => item})
  end
end


def select_date_from_dropdown(dropdown, item)
  begin
  wait_for_element_visible("//a[@placeholder='#{dropdown}']",30)
    @browser.find_element(:xpath, "//a[@placeholder='#{dropdown}']").click
    @browser.find_element(:xpath, "//a[contains(text(), '#{item}')]").click
  
  rescue Exception => e
    show_error(e, "select_month_from_dropdown(dropdown, item)", {"dropdown" => dropdown, "item" => item})
  end
end


def select_from_filter_dropdown(dropdown_placeholder, item)
  begin
	wait_for_element_visible("//a[contains(@class, 'select2-choice ui-select-match') and contains(@placeholder,'#{dropdown_placeholder}')]",30)
    @browser.find_element(:xpath, "//a[contains(@class, 'select2-choice ui-select-match') and contains(@placeholder,'#{dropdown_placeholder}')]").click
    #sleep(4)
    @browser.find_element(:xpath, "//*[contains(@class, 'ng-binding') and contains(text(), '#{item}')]").click
  
  rescue Exception => e
    show_error(e, "select_from_filter_dropdown(dropdown_placeholder, item)", {"dropdown_placeholder" => dropdown_placeholder, "item" => item})
  end
end



def select_option(option_list, item)
  begin
	wait_for_element_visible("//input[@name='#{option_list}']",30)
    @browser.find_element(:xpath, "//input[@name='#{option_list}']")
    @browser.find_element(:xpath, "//span[@class = 'radio-list__text' and text() = '#{item}']").click
  
  rescue Exception => e
    show_error(e, "select_option(option_list, item)", {"option_list" => option_list, "item" => item})
  end
end

def select_from_dropdown_xpath(xpath, item)
  begin
	wait_for_element_visible("#{xpath}",30)
    @browser.find_element(:xpath, "#{xpath}").click
    @browser.find_element(:xpath, "//span[@class='ng-binding ng-scope'][contains(text(), '#{item}')]").click
  
  rescue Exception => e
    show_error(e, "select_from_dropdown(xpath, item)", {"dropdown" => xpath, "item" => item})
  end
end



def upload_image(filename, wait_for)
  begin
	  @browser.execute_script "window.scrollBy(0,330)"
    #sleep 3
    @browser.find_element(:xpath, "//button[contains(@class, 'btn--center btn--large') and contains(text(), 'Upload your image(s)')]").click
	
  	wait1 = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait1.until { 
  		@browser.find_elements(:xpath,"//iframe[@id='filepicker_dialog']").size > 0
      }
  	sleep 20

    @browser.switch_to.frame 'filepicker_dialog'

    /Select a file to upload:/.match(@browser.page_source)

    base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
    value=base_path.split("features")
	 	path = File.absolute_path("#{value[0]}/image/#{filename}")
  
    if $os == "Windows"
    	my_dir = Dir[path]
    	dest_folder = path[0,2]
    	file = dest_folder+"\\#{filename}"

    	if !File.exist?(file)
    		FileUtils.cp(my_dir, dest_folder)
    	end
     	
  	  sleep 2
  	  f  = dest_folder + "\\#{filename}"

    elsif $os == "Linux" || $os == "Mac"
      # Just get the full path of the original image since it work in Linux
      f  = path

    end

  	element = @browser.find_element(:xpath,"//input[@class='fileUploadInput']")
  	element.send_keys f
    sleep 4

    #this sleep time is added for letting the image upload.
    default_switch()
  	sleep 20

    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source) 
    }

  rescue Exception => e
    show_error(e, "upload_image(filename, wait_for)", {"filename" => filename, "wait_for" => wait_for})
  end

end



def visit_page_via_nav_takeover(menu_item, wait_for)
  begin
    @browser.find_element(:xpath, "//a[@class='nav-takeover__expand']").click

    sleep 2
    if /Welcome to Venzee/.match(@browser.page_source)
      ack_intercom_msg()
    end

    # This is to check if we see the big initial
    #@browser.find_element(:xpath, "//span[@class='app-profile__initials ng-binding']").displayed?
    @browser.find_element(:xpath, "//a[contains(.,'#{menu_item}')]").location_once_scrolled_into_view
    sleep 3
    #@browser.find_element(:xpath, "//a[(text()='#{menu_item}')]").click
	
	if menu_item =="Data"
	@browser.find_element(:xpath, "//a[(text()='#{menu_item}')]").click
       
    else
      @browser.find_element(:xpath, "//a[contains(.,'#{menu_item}')]").click
	end
    wait = Selenium::WebDriver::Wait.new(:timeout => 35) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source)
    }

  rescue Exception => e
    show_error(e, "visit_page_via_nav_takeover(menu_item, wait_for)", {"menu_item" => menu_item, "wait_for" => wait_for})
  end
end



def upload_setting_image(filename)

  begin
  	base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
    value=base_path.split("features")
   	path = File.absolute_path("#{value[0]}/image/#{filename}")

    if $os == "Windows"
      my_dir = Dir[path]

      # Find the root
      dest_folder = path[0,2]
      
      # Find where the origin file is ans store the path
      file  = dest_folder+"\\#{filename}"

      # Remove the file at the root if it exist
      if File.exist?(file)
    		FileUtils.rm(file)
    		sleep 2
    	end

      # Copy the file at the root (C:\).  Needed in windows cause it don't want to upload the file with the full path
    	FileUtils.cp(my_dir, dest_folder)
    	sleep 4

      # Prepare the image path to upload it 
      f  = dest_folder+"\\#{filename}"    
    
    elsif $os == "Linux" || $os == "Mac"
      # Just get the full path of the original image since it work in Linux
    	f  = path
    end

  	wait = Selenium::WebDriver::Wait.new(:timeout => 30)
  	element = @browser.find_element(:xpath,"//input[@type='file']")
  	sc = "arguments[0].style.display = 'inline';";

    # Upload the image by sending the path
  	@browser.execute_script(sc,element)
  	element.send_keys f

    # Can't find anything to wait for....
    sleep 1

  rescue Exception => e
    show_error(e, "upload_setting_image(filename)", {"filename" => filename})
  end

end



def validate_textbox_content(textbox, content)
  begin
    element = @browser.find_element(:name, textbox)
    assert_equal(element.attribute("value"), content)

  rescue Exception => e
    show_error(e, "validate_text_box_content(textbox, content)", {"textbox" => textbox, "content" => content})
  end
end



def validate_placeholder_content(placeholder, content)
  begin
    /#{content}/.match(@browser.find_element(:xpath, "//*[@placeholder = '#{placeholder}']"))

  rescue Exception => e
    show_error(e, "validate_placeholder_content(placeholder, content)", {"placeholder" => placeholder, "content" => content})
  end
end



def validate_textbox_content_via_ngmodel(ng_model, content)
  begin
    element = @browser.find_element(:css, "input[ng-model='#{ng_model}']")
    assert_equal(element.attribute("value"), content)

  rescue Exception => e
    show_error(e, "validate_text_box_content(textbox, content)", {"ng_model" => ng_model, "content" => content})
  end
end



def validate_image(filename)
  begin
    element = @browser.find_element(:css, "div[class='file-dragdrop__thumb-default ng-scope']")

    # Remove the .jpg extention because 'style' include the name from the server which include a random id before the .jpg
    filename = filename[0, filename.length-4]

    assert_exist_in(filename, element.attribute("style").to_s)

  rescue Exception => e
    show_error(e, "validate_image(filename)", {"filename" => filename})
  end
end



def validate_dropdown(dropdown, item)
  begin

    @browser.find_element(:xpath, "//span[@class='ng-binding ng-scope'][contains(text(), '#{item}')]")

  rescue Exception => e
    show_error(e, "validate_dropdown(dropdown, item)", {"dropdown" => dropdown, "item" => item})
  end
end



def assert_equal(text,content)
  begin
    if text.to_s != content.to_s
      raise "Expect '#{content}', got '#{text}'"
    end

  rescue Exception => e
    show_error(e, "assert_equal(text,content)", {"text" => text, "content" => content})
  end
end



def assert_exist_in(text, text_to_look_in)
  begin
    
    if (text_to_look_in.include? text) == false
      raise "Cant find '#{text}' in '#{text_to_look_in}'"
    end

  rescue Exception => e
    show_error(e, "assert_exist_in(text, text_to_look_in)", {"text" => text, "text_to_look_in" => text_to_look_in})
  end
end



def click_by_ng(value,wait_for)
  begin
	wait_for_element_visible("//*[contains(@ng-click,'#{value}')]",20)
    @browser.find_element(:xpath, "//*[contains(@ng-click,'#{value}')]").click
	wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source) 
    }

  rescue Exception => e
    show_error(e, "click_by_ng(value, wait_for)", {"value" => value,"wait_for "=> wait_for})
  end
end



def click_input(value)
  begin
	wait_for_element_visible("//input[contains(@value,'#{value}')]",20)
    @browser.find_element(:xpath, "//input[contains(@value,'#{value}')]").click

  rescue Exception => e
    show_error(e, "click_input(value)", {"value" => value})
  end
end



def switch_frame(id,wait_for)

 begin
	@browser.switch_to.frame "#{id}"
    wait = Selenium::WebDriver::Wait.new(:timeout => 35) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source) 
    }
  
  rescue Exception => e
    show_error(e, "switch_frame(id, wait_for)", {"id" => id, "wait_for" => wait_for})
  end
end



def default_switch()
  begin
	@browser.switch_to.default_content

  rescue Exception => e
    show_error(e, "default_content()")
  end
end



def switch_tab(wait_for)
  begin
	@browser.switch_to.window(@browser.window_handles.last)
    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source) 
    }
  
  rescue Exception => e
    show_error(e, "switch_tab(wait_for)", {"wait_for" => wait_for})
  end
end


def element_is_available(element)
begin
	expect(@browser.find_element(:xpath,"//*[contains(@class,'#{element}')]").displayed?.to_s)=="true"
  rescue Exception => e
    show_error(e, "element_is_available(element)", {"element" => element})
  end
end



def element_not_available(field)
  begin
	@browser.find_element(:xpath,"//*[contains(.,'#{field}')]").displayed?.to_s.should=="false"
 
  
  rescue Exception => e
    show_error(e, "element_not_displayed(field)", {"field" => field})
  end
end



def visit(url, wait_for)
  begin
		@browser.get "#{@base_url}"+"/"+"#{url}"
		for i in 0..2
			wait = Selenium::WebDriver::Wait.new(:timeout => 90) # seconds
			wait.until { 
				/#{wait_for}/.match(@browser.page_source)
			}
		end
  rescue Exception => e
    show_error(e, "visit(url, wait_for)", {"url" => url, "wait_for" => wait_for})
  end
end



def wait_and_refresh(sec)
    @browser.navigate.refresh
	begin
		@browser.navigate.refresh
        sleep sec
	rescue Exception => e
		show_error(e, "wait_and_refresh(sec)", {"sec" => sec})
  end
end



def wait_for_element_enabled(arg1)
	begin
		#wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    #wait.until { 
	#	elementValue = @browser.find_element(:xpath,"//fieldset[contains(@ng-disabled, 'isSubmitting')and contains(@ng-init, '#{arg1}')]")
#		value = el.attribute('disabled')
	#	!elementValue.attribute('disabled')		
		sleep 20
    #}
	rescue Exception => e
		show_error(e, "wait_for_element_enabled(arg1)", {"arg1" => arg1})
  end
end



def text_not_available(text)
	begin
    puts "check if the group still visisble"
    /#{text}/.match(@browser.page_source).to_s.should==""

	rescue Exception => e
		show_error(e, "text_not_available(text)", {"text" => text})
	end
end



def list_not_available(text)
  begin
    puts "check if the group still visisble"
    sleep 10
    #/#{text}/.match(@browser.page_source).to_s.should==""

    @browser.find_element(:xpath,"//li[contains(.,'#{text}')]").displayed?.to_s.should=="false"

  rescue Exception => e
    show_error(e, "text_not_available(text)", {"text" => text})
  end
end


def press_key(field,key,wait_for)
	begin
		@browser.find_element(:xpath, "//input[contains(@class,'#{field}')]").send_keys key
		wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
		wait.until { 
		/#{wait_for}/.match(@browser.page_source)
		}
	rescue Exception => e
		show_error(e, "press_key(field,key,wait_for)",{"field" => field, "key" => key, "wait_for" => wait_for})
	end
end



def click_by_xpath(xpath)
  begin
    wait_for_element_visible(xpath, 30)
    @browser.find_element(:xpath, "#{xpath}").click

  rescue Exception => e
    show_error(e, "click_by_xpath(xpath)", {"xpath" => xpath})
  end
end



def wait_and_check(element)
	begin
    is_email_found = false
 
    puts "entering wait_and_check(): #{element}"

  	for i in 0..5
  		element_size = @browser.find_elements(:xpath, "#{element}").size
      puts "element_size size : #{element_size}"

  		if element_size > 0
  			if @browser.find_element(:xpath,"#{element}").displayed?.to_s
  				puts "Email is Visible"
          is_email_found = true
  				break

  			else
  				puts "Email is Not visible"
  			
        end
  		
      else
        puts "Refreshing the browser and wait 10 sec"
  			@browser.navigate.refresh
  			sleep 5
  		
      end
  	
    end
	
    # If email hasn'T been found, raise an error
    if is_email_found
      puts "exiting wait_and_check() cause email has been found"
    else
      raise "The following email hasn't been found : #{element}"
    end

  rescue Exception => e
  	puts "crash wait_and_check()"
    show_error(e, "wait_and_check(element)", {"element" => element})
	end
end



def verifyAlert()
  begin
	a = @browser.switch_to.alert
	if a.text == 'Are you sure'
		a.dismiss
	else
		a.accept
	end
  
  rescue Exception => e
	show_error(e,"verifyAlert()",{})
  end
end



def wait_for_element_visible(element,timeout)
	begin
		for i in 0..timeout
			element_size = @browser.find_elements(:xpath, "#{element}").size
			if element_size > 0
				if @browser.find_element(:xpath,"#{element}").displayed?.to_s
					break
				else
					puts "Element is not visible"
				end
			else
				sleep 1
			end
		end	
	rescue Exception => e
		show_error(e,"wait_for_element_visible(element,timeout)", {"element" => element, "timeout" => timeout})
	end
end



def fill_in_text_area(field, data)
  begin
	sleep 0.5
    element = @browser.find_element :xpath => "//textarea[@name = '#{field}']"
    element.clear
    element.send_keys "#{data}"
  
  rescue Exception => e
    show_error(e, "fill_in(field, data)", {"field" => field, "data" => data})
  end
end



def click_by_xpath_wait(xpath,wait_for)
  begin
	sleep 0.5
    @browser.find_element(:xpath, "#{xpath}").click
	 wait = Selenium::WebDriver::Wait.new(:timeout => 50) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source) 
    }
  rescue Exception => e
    show_error(e, "click_by_xpath(xpath)", {"xpath" => xpath})
  end
end



def select_time(dropdown,value)
	begin
		sleep 0.5
		@browser.find_element(:xpath, "//a[@placeholder='#{dropdown}']").click
	wait = Selenium::WebDriver::Wait.new(:timeout => 50) # seconds
    wait.until { 
      /#{value}/.match(@browser.page_source)
    }
	@browser.find_element(:xpath,"//a[contains(text(),'#{value}')]").click
	
	rescue Exception => e
    show_error(e, "select_time(dropdown,value)", {"dropdown" => dropdown, "value" => value})
  end
end


def wait_for_text(text)
  begin
    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until { 
      /#{text}/.match(@browser.page_source) 
    }
   rescue Exception => e
    show_error(e, "wait_for_text(text)", {"text" => text})
  end
end


def click_by_java(button, wait_for)
  begin
	wait_for_element_visible("//button[contains(.,'#{button}')]",30)
    element = @browser.find_element(:xpath, "//button[contains(.,'#{button}')]").click
  	sc = "arguments[0].click();"
  	@browser.execute_script(sc,element)
    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until {
      /#{wait_for}/.match(@browser.page_source) 
    }
  
  rescue Exception => e
    show_error(e, "click_button(button, wait_for)", {"button" => button, "wait_for" => wait_for})
  end
end


def assert_element_present(elem_locator)
  begin
    if @browser.find_elements(elem_locator).size() <= 0
      raise "'#{elem_locator}' NOT present on the page"
    end

  rescue Exception => e
    show_error(e, "assert_element_present(elem_locator)", {"elem_locator" => elem_locator})
  end
end


def is_element_present(elem_locator)
  begin
    @browser.find_element(elem_locator)
    return true
  
  rescue Exception => e
    return false  
  end
end


def click_if_present(elem_locator)
  begin
    wait_for_element_visible(xpath, 5)
    if is_element_present(elem_locator)
      @browser.find_element(elem_locator).click
    end

  rescue Exception => e
    show_error(e, "click_if_present(elem_locator)", {"elem_locator" => elem_locator})
  end
end


def assert_text_not_present(text)
  begin
    sleep 5
    if @browser.page_source.include? text
      raise "'#{text}' displayed on the page"
    end

  rescue Exception => e
    show_error(e, "assert_text_not_present(text)", {"text" => text})
  end
end


def execute_js(js)
  begin
    @browser.execute_script(js)
    
  rescue Exception => e
    show_error(e, "execute_js(js)", {"js" => js})
  end
end


def get_text(elem_locator)
  begin
    text = @browser.find_element(elem_locator).text.strip
    return text
  
  rescue Exception => e
    show_error(e, "get_text(elem_locator)", {"elem_locator" => elem_locator})
  end
end


def press_key(key)
  begin
    @browser.action.send_keys(key).perform
  
  rescue Exception => e
    show_error(e, "press_keys(key)", {"key" => key})
  end
end



def mouse_Hover(elem_locator)
  begin
   el = @browser.find_element(:xpath, "#{elem_locator}")
   @browser.action.move_to(el).perform
  rescue Exception => e
    show_error(e, "mouse_Hover(key)", {"key" => elem_locator})
  end
end 



def click_btn(button)
  begin
   wait_for_element_visible("//button[contains(.,'#{button}')]",30)
   wait_for_text("#{button}")
   @browser.find_element(:xpath, "//button[contains(.,'#{button}')]").click
  rescue Exception => e
   show_error(e, "click_btn(button)", {"button" => button})
  end
end



def upload_bulk_image(filename, wait_for)
  begin
	  @browser.execute_script "window.scrollBy(0,330)"
    #sleep 3
    @browser.find_element(:xpath, "//button[contains(@class, 'btn btn--large') and contains(text(), 'Upload your image(s)')]").click
	
  	wait1 = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait1.until { 
  		@browser.find_elements(:xpath,"//iframe[@id='filepicker_dialog']").size > 0
      }
  	sleep 20

    @browser.switch_to.frame 'filepicker_dialog'

    /Select a file to upload:/.match(@browser.page_source)

    base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
    value=base_path.split("features")
	 	path = File.absolute_path("#{value[0]}/image/#{filename}")
  
    if $os == "Windows"
    	my_dir = Dir[path]
    	dest_folder = path[0,2]
    	file = dest_folder+"\\#{filename}"

    	if !File.exist?(file)
    		FileUtils.cp(my_dir, dest_folder)
    	end
     	
  	  sleep 2
  	  f  = dest_folder + "\\#{filename}"

    elsif $os == "Linux" || $os == "Mac"
      # Just get the full path of the original image since it work in Linux
      f  = path

    end

  	element = @browser.find_element(:xpath,"//input[@class='fileUploadInput']")
  	element.send_keys f
    sleep 4

    #this sleep time is added for letting the image upload.
    default_switch()
  	sleep 20

    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source) 
    }

  rescue Exception => e
    show_error(e, "upload_bulk_image(filename, wait_for)", {"filename" => filename, "wait_for" => wait_for})
  end

end
