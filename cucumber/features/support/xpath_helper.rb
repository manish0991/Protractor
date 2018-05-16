def click_link(link)
  @browser.find_element(:xpath, "//a[contains(.,'#{link}')]").click
end

def find_label(label)
  @browser.find_element(:xpath, "//label[contains(text(),'#{label}')]")
end

def find_text_in_page(text)
  @browser.find_element :xpath => "//*[contains(text(),'#{text}')]"
end

def enter_data_in_field(data, field)
  element = @browser.find_element :xpath => "//input[@name = '#{field}']"
  element.clear
  element.send_keys "#{data}"
end

def click(type, object)
    @browser.find_element(:xpath, "//*[contains(@#{type},'#{object}')]").click
end
      
def attach_file(locator, path, options={})
 Array(path).each do |p|
   raise Capybara::FileNotFound, "cannot attach file, #{p} does not exist" unless File.exist?(p.to_s)
 end
 find(:file_field, locator, options).set(path)
end


def click_button(button, wait_for)
  begin
    @browser.find_element(:xpath, "//button[contains(.,'#{button}')]").click
    wait = Selenium::WebDriver::Wait.new(:timeout => 35) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source) 
    }
  
  rescue Exception => e
    show_error(e, "click_button(button, wait_for)", {"button" => button, "wait_for" => wait_for})
  end
end


def click_link_and_wait(link,wait_for)
  begin
    @browser.find_element(:xpath, "//a[contains(.,'#{link}')]").click
	 wait = Selenium::WebDriver::Wait.new(:timeout => 35) # seconds
    wait.until { 
      /#{wait_for}/.match(@browser.page_source) 
    }

  rescue Exception => e
    show_error(e, "click_link_and_wait(link,wait_for)", {"link" => link,"wait_for"=> wait_for})
  end
end

def click_button_and_wait(button,wait)
  begin
    @browser.find_element(:xpath, "//button[contains(.,'#{button}')]").click
	sleep wait
  
  rescue Exception => e
    show_error(e, "click_button_and_wait(button,wait)", {"button" => button,"wait"=> wait})
  end
end

def find_text(text)
  begin
    @browser.find_element :xpath => "//*[contains(text(),'#{text}')]"
  
  rescue Exception => e
    show_error(e, "find_text(text)", {"text" => text})
  end
end


def select_from_dropdown(dropdown, item)
  begin
    @browser.find_element(:xpath, "//a[@placeholder='#{dropdown}']").click
    @browser.find_element(:xpath, "//span[@class='ng-binding ng-scope'][contains(text(), '#{item}')]").click
  
  rescue Exception => e
    show_error(e, "select_from_dropdown(dropdown, item)", {"dropdown" => dropdown, "item" => item})
  end
end

def switch_tab(wait)
  begin
    @browser.switch_to.window @browser.window_handles.last
	sleep wait
  rescue Exception => e
    show_error(e, "switch_tab(wait)", {"wait" => wait})
  end
end


def select_from_filter_dropdown(dropdown_placeholder, item)
  begin
    @browser.find_element(:xpath, "//a[contains(@class, 'select2-choice ui-select-match') and contains(@placeholder,'#{dropdown_placeholder}')]").click
    sleep(2)
    @browser.find_element(:xpath, "//*[contains(@class, 'ng-binding') and contains(text(), '#{item}')]").click
  
  rescue Exception => e
    show_error(e, "select_from_filter_dropdown(dropdown_placeholder, item)", {"dropdown_placeholder" => dropdown_placeholder, "item" => item})
  end
end

def upload_setting_image(filename)

  begin
    base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
    value=base_path.split("features")
    file="#{value[0]}/image/#{filename}"
    element = @browser.find_element :xpath => "//input[@name='file']"
    element.send_keys file
    
    # Can't find anything to wait for....
    sleep 1

  rescue Exception => e
    show_error(e, "upload_setting_image(filename)", {"filename" => filename})
  end
end


def select_option(option_list, item)
  begin
    @browser.find_element(:xpath, "//input[@name='#{option_list}']")
    @browser.find_element(:xpath, "//span[@class = 'radio-list__text' and text() = '#{item}']").click
  
  rescue Exception => e
    show_error(e, "select_option(option_list, item)", {"option_list" => option_list, "item" => item})
  end
end

def clear_field(field)
  begin
    element = @browser.find_element :xpath => "//input[@name = '#{field}']"
    element.clear
  
  rescue Exception => e
    show_error(e, "clear_field(field)", {"field" => field})
  end
end

def element_not_displayed(field)
  begin
	@browser.find_element(:xpath,"//*[contains(.,'#{field}')]").displayed?.to_s.should=="false"
 
  
  rescue Exception => e
    show_error(e, "element_not_displayed(field)", {"field" => field})
  end
end

def fill_in(field, data)
  begin
    element = @browser.find_element :xpath => "//input[@name = '#{field}']"
    element.clear
    element.send_keys "#{data}"
  
  rescue Exception => e
    show_error(e, "fill_in(field, data)", {"field" => field, "data" => data})
  end
end

def fill_in_from_placeholder(placeholder, data)
  begin
    element = @browser.find_element :xpath => "//input[@placeholder = '#{placeholder}']"
    element.clear
    element.send_keys "#{data}"
  
  rescue Exception => e
    show_error(e, "fill_in_from_placeholder(placeholder, data)", {"placeholder" => field, "data" => data})
  end
end

def show_error(err, functionName, params)
  $error_raised = true

  puts "----------------------- ERROR -----------------------}"
  puts "fuctionName: " + functionName

  params.each do |key, value|
    puts "#{key} : #{value}"
  end

  puts "Err Msg: " + err.message  
  puts "----------------------- /ERROR -----------------------}"
  
  #enforce_logout()

  raise
end