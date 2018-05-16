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

# To write to GSheet
require 'openssl'
require "google_drive"  # sudo gem install google_drive
require "google/api_client"


OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Output Definition
OUTPUT = "GSHEET" # TXT or GSHEET

# GSheet Tab Index
FILESTACK_SUMMARY = 0
FILESTACK_RAW     = 1
PUBNUB_SUMMARY    = 2
PUBNUB_RAW        = 3
ZAPPIER_SUMMARY   = 4
ZAPPIER_RAW       = 5
STRIPE_SUMMARY    = 6
STRIPE_RAW        = 7
SEGMENT_SUMMARY   = 8
SEGMENT_RAW       = 9
LOCALIZE_SUMMARY  = 10
LOCALIZE_RAW      = 11
AWS_COST          = 12 


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
  #require 'win32/screenshot' 

else $os == "Linux" || $os == "Mac"
  puts "\nLinux/Mac OS - No screenshot capability, sorry....\n\n"

end

#Made changes according to the comment added in pull request

# Set the base url via the profile, in cucmber.yml
if ENV['VENZEE_BASE_URL'] != nil
  base_url = ENV['VENZEE_BASE_URL']
end

# Input capabilities for Win7 & Chrome
caps = Selenium::WebDriver::Remote::Capabilities.chrome
caps.platform = 'Windows 7'
caps.version = ''
caps['browserName'] = 'Chrome'


# what to test with?
if ENV['BROWSER_TYPE'] === 'safari'
  browser = Selenium::WebDriver.for :safari

elsif ENV['BROWSER_TYPE'] === 'chrome'
  browser = Selenium::WebDriver.for :chrome, :switches => %w[--test-type --ignore-certificate-errors]

else
  browser = Selenium::WebDriver.for :firefox
end





########## Test Fixture 'Before' and 'after' step ##########

Before do

  # Generate the data for the stats_grinder  
  generate_filestack_data()
  generate_localize_data()
  generate_pubnub_data()

  @base_url = base_url
  @browser = browser
  @browser.manage.window.maximize
  @browser.manage.delete_all_cookies
  @browser.manage.timeouts.implicit_wait = 30
  puts "Start Time = "+ Time.now.strftime("%d_%m_%Y %H:%M")
end

at_exit do
  browser.close
  puts "END Time = "+ Time.now.strftime("%d_%m_%Y %H:%M")
end