Given(/^I am on the homepage$/) do

    path = '/'

#  case page_name
#  when 'home page'
#    path = '/'
#  when 'contact page'
#    path = '/contact'
#  when 'about us page'
#    path = '/about-us'
#  when 'features page'
#    path = '/features'
#  when 'pricing page'
#    path = '/pricing'
#  when 'login page'
#    path = '/login-or-register'
#  when 'registration page'
#    path = '/login-or-register'
#  else
#    path = '/'
#  end

  @browser.get "#{@base_url}#{path}"

end

Then(/^I should see "(.*?)"$/) do |text_str|
  find_text(text_str)
  #@browser.find_element :xpath => "//*[contains(text(),'#{text_str}')]"
end
