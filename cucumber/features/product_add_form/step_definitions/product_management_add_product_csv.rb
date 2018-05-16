Given (/I have chosen to add products using CSV$/) do
  @browser.get "#{@base_url}/upload/csv"
  sleep(2)
end

When (/I select (.*) product catalog$/) do |x|
  sleep(2)
  if x == "create a new"
    @browser.find_element(:xpath, "//*[@id='localizejs']/div/div/ul/li[1]/label/span[2]").click
  elsif x == "add to an existing"
    @browser.find_element(:xpath, "//*[@id='localizejs']/div/div/ul/li[2]/label/span[2]").click
   end
end

When (/I click Next button$/) do
  #@browser.find_element(:xpath, "//button[contains(@class, 'btn--large btn--primary btn vz-btn-process ng-isolate-scope') and contains(text(), 'Next')]").click
  @browser.find_element(:xpath, "//*[@id='localizejs']/div/div/div/form/fieldset/div/div[9]/button[2]").click
  sleep(2)
  wait = Selenium::WebDriver::Wait.new(:timeout => 150) # seconds
  wait.until { 
    /Which column is your product name/.match(@browser.page_source)}
end

When (/I select (.*) column$/) do |x|
  @browser.find_element(:xpath, "//button[text() = '#{x}']").click
  sleep(2)
end

And (/I choose AUD Currency$/) do
  sleep(2)
  @browser.find_element(:xpath, "//a[contains(@class, 'select2-choice ui-select-match') and contains(@placeholder,'Currency')]").click
  sleep(3)
  @browser.find_element(:xpath, "//div[@class='select2-search']/input").send_keys "USD"
  @browser.find_element(:xpath, "//div[@class='select2-search']/input").send_keys:return
  sleep(2)
end

And (/I browsed the valid CSV file$/) do
  base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
  value=base_path.split("features")
  file="#{value[0]}/image/demo.csv"
  filename=file.gsub("//", "/")
  puts file
  puts filename
  #attach_file("//input[@name='file']", file)
  element = @browser.find_element :xpath => "//input[@name='file']"
  element.send_keys file
  #element.set(file)
  sleep(15)
end

And "I complete the mapping process" do
    step 'I select name column'
    step 'I click Next button'
    step 'I select sku column'
    step 'I click Next button'
    step 'I click Skip button'
    step 'I select inventory column'
end


When (/Products exist$/) do
  @browser.get "#{@base_url}/products/catalog/?page=1&per_page=50"
  sleep(3)
end

And (/A new product is added with the SKU of an existing product$/) do
  sku=@browser.find_element(:xpath, "//div[@class='grid-table']/div[2]/div/div[2]/div[2]").text
  @browser.get "#{@base_url}/products/add/chairs"
  sleep(3)
  step 'I complete the required fields of the product details'
  enter_data_in_field(sku, "sku")
end