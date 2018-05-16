=begin
Then (/I access Venzee for the first time$/) do
  @browser.find_element(:xpath,"//div[@id='localizejs']/header/h1")
end

Then (/The "MAP" widget displays 0 resolved and 0 open violations$/) do
  "0".match(@browser.find_element(:xpath, "//ul[@class='db-stats db-stats--disabled']/li[1]/span[1]").text)
end

Then (/I access the dashboard without performing any other tasks$/) do
  "Dashboard".match(@browser.find_element(:xpath, "//div[@id='localizejs']/header/h1").text)
end

Then (/The "Import Products" widget displays instructional text to create the first catalog$/) do
  "Adding products is quick and easy.".match(@browser.find_element(:xpath, "//div[@class='text--center soft-double--bottom soft-double--top']/h3").text)
end

Then (/a sample graphic is displayed$/) do
	@browser.find_element(:xpath,"//div[@class='text--center soft-double--bottom soft-double--top']/p")
end
=end