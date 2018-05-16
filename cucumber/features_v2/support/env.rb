# system-wide gems
require 'rubygems'
require 'bundler/setup'
# locally installed by bundler
require 'selenium-webdriver'
require 'cucumber'
require 'json'
require 'clipboard'
require 'fileutils'
require 'date'


#==================================================================================================
# Read the json config 

def read_os(file_path)
  begin
    raw_data = IO.read(file_path)
    json_data = JSON.parse(raw_data)
    return json_data["OS"]
  rescue Exception => e
    puts "\nERROR: /qa/ci_os.json file seems to be missing.  Please create it from a copy of /qa/ci_os.json.template and make sure to configure your OS in ci_os.json\n"
    raise
  end
end

#==================================================================================================


# Read the server OS
$os = read_os("../ci_os.json")

# Check OS to enable or not Screeshot Capability
if $os == "Windows"
  puts "\nWindows OS - Adding Screenshot capability...\n\n"
  require 'win32/screenshot' 

else $os == "Linux" || $os == "Mac"
  puts "\nLinux/Mac OS - No screenshot capability, sorry....\n\n"

end

#Made changes according to the comment added in pull request

# Set the base url via the profile, in cucmber.yml
if ENV['VENZEE_BASE_URL'] != nil
  base_url = ENV['VENZEE_BASE_URL']
end

if base_url.include? "qa"
   app_url = "https://qa-app.venzee.com"
 elsif base_url.include? "dev"
   app_url = "dev-app.venzee.com"
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
$error_raised             = false
$local                    = false # Are you running the test locally and you want to browser to not close ?  
$isGeneratedData          = false
$use_single_registration  = false

Before do
  generate_data()
  @base_url = base_url
  @app_url = app_url
  @browser = browser
  @browser.manage.window.maximize
  @browser.manage.delete_all_cookies
  @browser.manage.timeouts.implicit_wait = 30
  puts "Start Time = "+ Time.now.strftime("%d_%m_%Y %H:%M")
  puts "Start Time = "+ Time.now.strftime("%d_%m_%Y %H:%M")
end

at_exit do
  if !$error_raised || !$local
    browser.close
  end
  puts "END Time = "+ Time.now.strftime("%d_%m_%Y %H:%M")
end