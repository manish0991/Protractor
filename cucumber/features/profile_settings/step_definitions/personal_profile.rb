Given (/I browse and select a (.*) image$/) do |x|
  step 'I visit profile page'
  base_path=File.expand_path(File.dirname(File.dirname(__FILE__)))
  value=base_path.split("features")
  file="#{value[0]}/image/#{x}'"
  element = @browser.find_element :xpath => "//input[@name='file']"
  element.send_keys file
  sleep(15)
end

Given (/I change my (.*) to '(.*)'$/) do |x,y|
  enter_data_in_field(y,x)
end

Given (/my profile is changed as setup above$/) do
  /FName/.match(@browser.page_source)
end

Given (/I select 'Save Changes'$/) do
  click_button_and_wait("btn--center",3)
end

Given(/when I leave the profile page and return the above settings remain$/) do
  sleep(15)
  step 'I visit profile page'
  step 'I visit dashboard page'
  /FName/.match(@browser.page_source)
end

Given (/I select to change my language from its current setting$/) do
  select_from_dropdown("Language","Espa")
  click_button_and_wait("ng-untouched ng-valid ng-valid-maxlength",1)
end

Given (/The language of my profile page is changed$/) do
  find_text("Utilizado por Venzee para mostrar el contenido")
end

Then (/A message appears indicating the email format is incorrect$/) do
  /Please try again./.match(@browser.page_source)
end

Then (/I can logout and login with new password$/) do
  step 'I am on the Venzee web site'
  step 'Logout if already login'
  step 'I am on the Login page'
  step 'Enter qavivekgupta27 information into the username field'
  step 'Enter NewPassw0rd information into the password field'
  step 'I Login'
  step 'I am on the Venzee web site'
end

Given(/I save the changed password$/) do
  click_button("btn btn--large btn--primary","Success! You have changed your password")
end

Given (/I Change the Password to default$/) do
	step 'I visit profile page'
	step 'Enter NewPassw0rd information into the currentPassword field'
    step 'Enter 1qaz!QAZ information into the newPassword field'
    step 'Enter 1qaz!QAZ information into the confirmNewPassword field'
	step 'I save the changed password'
	step 'Success! You have changed your password displayed'
end

Given(/Success! You have changed your password displayed$/) do
	find_text("Success! You have changed your password")
end

Given (/I Clicked on change-password$/) do
	click_button_and_wait("btn btn--large btn--primary",2)
end

Given(/when I logout and login, the Venzee size and app appear in the new languge$/) do
  step 'I am on the Venzee web site'
  click_button_and_wait("btn profile-btn",2)
  click_link("Cerrar sesi")
  step 'I am on the Iniciar ses page'
  step 'Enter qavivekgupta27 information into the username field'
  step 'Enter 1qaz!QAZ information into the password field'
  step 'I Login'
  step 'I am on the Venzee web site'
  find_text("Transforma esas costosas")
end

Given (/I Change the language to english$/) do
  step 'I visit profile page'
  select_from_dropdown("Language","English")
  click_button_and_wait("ng-untouched ng-valid ng-valid-maxlength",1)
end