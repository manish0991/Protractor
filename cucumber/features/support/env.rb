############### Cucumber w/ Capybara Initialization ###############

=begin

require 'rbconfig'
require 'cucumber/formatter/unicode'

require 'capybara'
require 'capybara/dsl'
require "capybara/cucumber"

Capybara.default_driver = :selenium
Capybara.app_host = "https://guest1:4468@qa.venzee.com"
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.match = :first
Capybara.run_server = false

World(Capybara)
=end



############### Cucumber wo/ Capybara Initialization ###############

# system-wide gems
require 'rubygems'
require 'bundler/setup'
# locally installed by bundler
require 'selenium-webdriver'
require 'cucumber'

# Set the base url via the profile, in cucmber.yml
if ENV['VENZEE_BASE_URL'] != nil
  base_url = ENV['VENZEE_BASE_URL']
end

# Input capabilities for Win7 & Chrome
caps = Selenium::WebDriver::Remote::Capabilities.chrome
caps.platform = 'Windows 7'
caps.version = ''
caps['browserName'] = 'Chrome'

# Input capabilities for Windows XP & IE9
#caps = Selenium::WebDriver::Remote::Capabilities.new
#caps["browser"] = "IE"
#caps["browser_version"] = ".0"
#caps["os"] = "Windows"
#caps["os_version"] = "XP"
#caps["browserstack.debug"] = "true"
#caps["name"] = "Testing Selenium 2 with Ruby on BrowserStack"

# what to test with?
if ENV['BROWSER_TYPE'] === 'safari'
  browser = Selenium::WebDriver.for :safari

elsif ENV['BROWSER_TYPE'] === 'chrome'
  browser = Selenium::WebDriver.for :chrome, :switches => %w[--test-type --ignore-certificate-errors]

elsif ENV['BROWSER_TYPE'] === 'phantomjs'
  browser = Selenium::WebDriver.for :phantomjs

elsif ENV['BROWSER_TYPE'] === 'saucelabs'
  browser = Selenium::WebDriver.for :remote, :url => "http://venzee:35834820-a51b-4146-beae-bdeef77f172d@ondemand.saucelabs.com:80/wd/hub", :desired_capabilities => caps

else
  browser = Selenium::WebDriver.for :firefox
end



########## Test Fixture 'Before' and 'after' step ##########

Before do
  @base_url = base_url
  @browser = browser
  @browser.manage.delete_all_cookies
  @browser.manage.window.resize_to(1200, 900)
end

at_exit do
  #browser.quit
end