# coding: utf-8

=begin
Then(/^the default language is English$/) do
  @browser.find_element(:xpath, "//a[@class='nav-actions__link nav-actions__link--icon ng-binding']").text.should be == 'English'
  @browser.find_element(:xpath, "//h1[@class='home-section__heading']").text.include?("Using spreadsheets")
  sleep 2
end

Then(/^I change the language to ([^"]*)$/) do |lang|
  @browser.find_element(:xpath, "//a[@class='nav-actions__link nav-actions__link--icon ng-binding']").click
  @browser.find_element(:xpath, "//a[@class='ng-binding'][contains(text(), '#{lang}')]").text.should be == lang
  @browser.find_element(:xpath, "//a[@class='ng-binding'][contains(text(), '#{lang}')]").click
  sleep 2
end

Then(/^web page should be in ([^"]*)$/) do |lang|

  # Verify active language in the bar
  @browser.find_element(:xpath, "//a[@class='nav-actions__link nav-actions__link--icon ng-binding']").text.should be == lang
  
  # Verify content on the page
  if lang == "English"
    @browser.find_element(:xpath, "//h1[@class='home-section__heading']").text.should be == "Using spreadsheets\nto update your supply chain?"
  
  elsif lang == "Français"
    @browser.find_element(:xpath, "//h1[@class='home-section__heading']").text.include?("Utilisation de feuilles de")
  
  elsif lang == "Español"
    @browser.find_element(:xpath, "//h1[@class='home-section__heading']").text.include?("¿Usas hojas de cálculo para")
  
  elsif lang == "Português"
    @browser.find_element(:xpath, "//h1[@class='home-section__heading']").text.include?("Usando planilhas atualizar seus")
  end

  sleep 2

end


Then(/^I go to Login page$/) do
  @browser.get @base_url + "/login"
  sleep 2
end

Then(/^I go to the Venzee web site$/) do
  @browser.get @base_url
  sleep 2
end

Then(/^Login page should be in ([^"]*)$/) do |lang|
  if lang == "English"
    @browser.find_element(:xpath, "//h2[@class='register__heading ng-scope']").text.should be == 'Login'
  
  elsif lang == "Français (Canada)"
    @browser.find_element(:xpath, "//h2[@class='register__heading ng-scope']").text.should be == 'Connexion'
  
  elsif lang == "Español"
    @browser.find_element(:xpath, "//h2[@class='register__heading ng-scope']").text.should be == 'Iniciar sesión'
  
  elsif lang == "Português "
    @browser.find_element(:xpath, "//h2[@class='register__heading ng-scope']").text.should be == 'Entrar'
  end
 
  sleep 2

end

Then(/^back to English version from ([^"]*)$$/) do |from_language|
  @browser.find_element(:xpath, "//a[@class='nav-actions__link nav-actions__link--icon ng-binding']").click
  sleep 1
  @browser.find_element(:xpath, "//a[@class='ng-binding'][contains(text(), 'English')]").click
  sleep 1
end

=end

Then /^changes language to (.*)$/ do |language|
	sleep 5
  case language

  when "English"
		change_language("English")
		
  when "Español"
		change_language("Español")
		
  when "Português"
		change_language("Português")
		
  else
    #TODO : Extract an "Exception method and raise and exception and make sure the browser don't close"
    puts "Param $an_information : #{info}"
    fill_in("crash","now")
 
  end
end

Then /^sees the home page in (.*)$/ do |language| 
	sleep 3
case language

  when "English"
		wait_for_text("Using spreadsheets")
		
  when "Español"
		wait_for_text("Usas hojas de")
		
  when "Português"
		wait_for_text("Usando planilhas")
		
  else
    #TODO : Extract an "Exception method and raise and exception and make sure the browser don't close"
    puts "Param $an_information : #{info}"
    fill_in("crash","now")
 
  end

end