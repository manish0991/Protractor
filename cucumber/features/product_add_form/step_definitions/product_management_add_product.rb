Given (/I have chosen to add products for my organization$/) do
  step 'I have signed into Venzee'
  step 'I have access the Products page'
  step 'I have chosen to add a product using the form'
end

And (/At least two option sets are available$/) do
end

When (/An existing catalog is selected$/) do
  
end

When (/An existing catalog '(.*)' is selected$/) do |x|
   sleep(2)
   @browser.get "#{@base_url}/products/add/#{x}"
   sleep(2)
end 

And (/'(.*)' is product name$/) do |x|
  enter_data_in_field(x,"productName")
end

And (/A (.*) is entered as SKU$/) do |x|
  enter_data_in_field(x,"sku")
end

And (/A cost of '(.*)' is entered$/) do |x|
  enter_data_in_field(x,"cost")
end

And (/Currency remains the catalog default$/) do
  /US Dollar/.match(@browser.page_source)
end

And (/IMAP policy remains the catalog default$/) do
  /1.5/.match(@browser.page_source)
end

And (/A status of 'available' is selected$/) do
  step 'I choose Available as Status'
end

And (/'Add this product' is selected$/) do
  step 'I click Add this product'
end

Then (/The product details are saved$/) do
  step 'I see text Products'
end

And (/An alert appears saying: "(.*)"$/) do |x|
  /#{x}/.match(@browser.page_source)
end

And (/The product is viewable in the product list as entered$/) do
   /Chair/.match(@browser.page_source)
   /CHR1234/.match(@browser.page_source)
   /150.59/.match(@browser.page_source)
end 

And (/The product is viewable in the detailed product screen as entered$/) do
  sleep(2)
  @browser.find_element(:xpath, "//div[@class='grid-table__row ng-scope']/div[1]/div[2]/div[1]").click
  /SKU:/.match(@browser.page_source)
  /COST:/.match(@browser.page_source)
  /STATUS:/.match(@browser.page_source)
  sleep(2)
end

And (/Currency is changed to Canadian$/) do
  step 'I choose Canadian Dollar as Currency'
end

And (/IMAP policy is changed to '(.*)'$/) do |x|
  enter_data_in_field(x,"cost")
end

And (/Status is '(.*)'$/) do |arg|
  @browser.find_element(:xpath, "//a[contains(@class, 'select2-choice ui-select-match') and contains(@placeholder,'Status')]").click
  sleep(2)
  @browser.find_element(:xpath, "//*[contains(@class, 'ng-binding') and contains(text(), '#{arg}')]").click
end

And (/An inventory amount of 100 is entered$/) do
  step 'Enter 100 information into the productInventory field'
end

And (/A cost of (\d+) is entered$/) do |x|
  enter_data_in_field(x,"cost")
end

And (/'Save, and add another' is selected$/) do
  step 'I click Add this product'
end

And (/Now enabled, a future available date is selected or entered$/) do
  click("name", "availableDate")
  sleep(3)
  click("class", "date-btn--right")
  sleep(3)
  @browser.find_element(:xpath, "//button[contains(@class, 'date-btn date-btn--day')]/span").click
  #sleep(3)
  #@browser.find_element(:xpath, "//button[@class='date-btn btn-success date-btn--right ng-binding' and contains(text(), 'Done')]").click
end


When (/An new catalog named '(.*)' is created$/) do |x|
  step 'I have chosen to add a product using the form'
  step 'I click Yes I do button'
  enter_data_in_field(x,"collectionName")
  step 'Enter 1.5 information into the collectionImap field'
  step 'I make catalog Public'
  step 'I choose US Dollar as Currency'
end

And (/Supplier is '(.*)'$/) do |x|
  enter_data_in_field(x, "brand")
end

And (/Multiple links to videos are added$/) do
 click_link("Add another video")
 sleep(2)
 click_link("Add another video")
element = @browser.find_element :xpath => "//div[contains(@class, 'form-group__fields--clone')]/div[1]//ng-form[@name='videoForm']/input"
element.send_keys "https://www.youtube.com/watch?v=BQjBrt9LriY"
element1 = @browser.find_element :xpath => "//div[contains(@class, 'form-group__fields--clone')]/div[2]//ng-form[@name='videoForm']/input"
element1.send_keys "https://www.youtube.com/watch?v=BQjBrt9LriY"
element2 = @browser.find_element :xpath => "//div[contains(@class, 'form-group__fields--clone')]/div[3]//ng-form[@name='videoForm']/input"
element2.send_keys "https://www.youtube.com/watch?v=6C7oqXewyCE"
end

And (/A description is entered as follows:$/) do
  enter_data_in_field("Extendable dining table with 2 extra leaves seats", "productDesc")
end


Given (/The minimum required info is entered$/) do
    @browser.get "#{@base_url}/products/add/chairs"
    sleep(2)
    enter_data_in_field("Chair","productName")
    step 'Enter random sku into the recordid field'
    enter_data_in_field("150.43","cost")
    step 'Currency remains the catalog default'
    step 'IMAP policy remains the catalog default'
end

And (/5 or fewer JPG or PNG images are added via browsing, each under 5 MB$/) do
  @browser.find_element(:xpath, "//button[contains(@class, 'btn--center btn--large') and contains(text(), 'Upload your files')]").click
  sleep(3)
  @browser.switch_to.frame 'filepicker_dialog'
  /Select a file to upload:/.match(@browser.page_source)
  step 'I select Koala.jpg file'
  sleep(25)
end

And (/10 or more specification rows$/) do
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
  step 'Add one specification rows'
end

And (/Add one specification rows$/) do
  click_link("Add additional data")
  @random_Key = "key" + rand(10000000).to_s
  @random_Value = "value" + rand(10000000).to_s
  @browser.find_element(:xpath, "//input[contains(@class, 'ng-invalid') and contains(@name,'specLabel')]").send_keys @random_Key
  @browser.find_element(:xpath, "//input[contains(@class, 'ng-invalid') and contains(@name,'specValue')]").send_keys @random_Value
end

And (/Each row has a field name & field value pairs added$/) do
  /Name of Attribute/.match(@browser.page_source)
  /Value/.match(@browser.page_source)
end

And (/IMAP policy defaults to the catalog's setting$/) do
   /Value/.match(@browser.find_element(:xpath, "//input[contains(@name,'map')]").attribute("class"))
end

Then (/Currency defaults to the catalog's setting$/) do
   /USD/.match(@browser.find_element(:xpath, "//a[contains(@placeholder, 'Currency')]/span[2]/span").text)
end

When (/A catalog with over 150 products exists$/) do
  step 'I have signed into Venzee application'
  @browser.get "#{@base_url}/products/collection/demo?page=1&per_page=50"
  sleep(8)
end

And (/I navigate to the last page$/) do
  @browser.get "#{@base_url}/products/collection/?page=3&per_page=50"
  sleep(5)
end

And (/I add a product$/) do
  @browser.get "#{@base_url}/products/add/demo"
  sleep(10)
  step 'I complete the required fields of the product details'
end

And (/I select 'add'$/) do
step 'I click Add this product'
end

Then (/the product is added to the top of the list$/) do
  /page=1/.match(@browser.current_url)
end

When (/A catalog is being selected$/) do
  @browser.get "#{@base_url}/products/collection/"
  sleep(8)
  @browser.find_element(:xpath, "//a[@class='select2-choice ui-select-match' and contains(@placeholder, 'Collection Name')]").click
  sleep(3)
end

Then (/The list of all catalogs is displayed$/) do
  /chairs/.match(@browser.find_element(:xpath, "//div[@class='select2-drop select2-with-searchbox select2-drop-active']").text)
  /Table/.match(@browser.find_element(:xpath, "//div[@class='select2-drop select2-with-searchbox select2-drop-active']").text)
end

And (/The first few characters of a catalog name has been entered$/) do
  @browser.find_element(:xpath, "//div[@class='select2-search']/input").send_keys "demo"
end

Then (/The list of available catalogs that start with the entered text is displayed$/) do
  /chairs/.match(@browser.find_element(:xpath, "//div[@class='select2-drop select2-with-searchbox select2-drop-active']").text)
  /chairsnew/.match(@browser.find_element(:xpath, "//div[@class='select2-drop select2-with-searchbox select2-drop-active']").text)
end

And (/A catalog is selected$/) do
  @browser.find_element(:xpath, "//div[@class='select2-search']/input").send_keys:return
  sleep(2)
end

Then (/The details of the catalog are displayed$/) do
  /contains 1 products/.match(@browser.page_source)
end


When (/The required info for a product is entered$/) do
   step 'I have chosen to add a product using the form'
   sleep 2
   #step 'I click Yes I do button'
   enter_data_in_field("Tables","collectionName")
   step 'Enter 1.5 information into the collectionImap field'
   step 'I make catalog Public'
   step 'I choose US Dollar as Currency'
   step 'I complete the required fields of the product details'
end

And (/The option to add variants is selected$/) do
  click("name","addVariant")
end

Then (/The product is saved$/) do
  /has been added. Leave this page and/.match(@browser.page_source)
end

And (/The 'Add product variant' screen appears$/) do
  /Add a variant to:/.match(@browser.page_source)
end

Then (/The product details are not saved$/) do
  /Export Ready Products/.match(@browser.page_source)
end

And (/'cancel' is selected$/) do
  @browser.find_element(:xpath, "//button[@class='btn btn--large' and contains(text(), 'Cancel')]").click
  sleep(3)
end

Then (/The following message appears: "(.*)"$/) do |x|
 /#{x}/.match(@browser.page_source)
end