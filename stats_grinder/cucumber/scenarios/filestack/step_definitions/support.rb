########################################################################
# Data Object

class FilestackSubscription
  attr_accessor :application
  attr_accessor :monthly_consumption
  attr_accessor :monthly_limit
  attr_accessor :snapshot_date

  def initialize()
    @application          = ""
    @monthly_consumption  = ""
    @monthly_limit        = ""
    @snapshot_date        = ""
  end
end

#######################################################################
def generate_filestack_data()

  $filestack = Array.new()

  for i in 0..3
    $filestack[i] = FilestackSubscription.new()
  end

end

def navigate_to(app)

  case app

    when "PROD"
      #visit_page1("https://developers.filepicker.com/apps/","Change Plan")
      click_link("Applications","Change Plan")
      click_link("Venzee.com","Venzee.com")
      #click_by_xpath("//table//tr[4]/td[1]/a")
      #validate_text("Venzee.com", "//h4")
      wait_for_text("Venzee.com")
    
    when "QA"
      click_link("Applications","Change Plan")
      click_by_xpath("//table//tr[3]/td[1]/a")
      validate_text("venzee-qa", "//h4")
      #wait_for_text("venzee-qa")

    when "DEV"
      click_link("Applications","Change Plan")
      click_by_xpath("//table//tr[2]/td[1]/a")
      validate_text("Venzee-dev", "//h4")
      #wait_for_text("Venzee-dev")

    when "SANDBOX"
      click_link("Applications","Change Plan")
      click_by_xpath("//table//tr[1]/td[1]/a")
      validate_text("venzee-sandbox", "//h4")
      #wait_for_text("venzee-sandbox")

    else
      #TODO : Extract an "Exception method and raise and exception and make sure the browser don't close"
      puts "Param $an_information : #{app}"
      fill_in("crash","now")
    
  end

end


def get_monthly_limit(plan_usage)
  return plan_usage  
end


def get_monthly_consumption(plan_usage)
  return plan_usage[plan_usage.index("(") + 1..plan_usage.index(")") - 2]
end


def write_filestack_to_gheet()

  puts "filestack write to gsheet: really ?"

  # Initialize the session
  session = GoogleDrive.saved_session("../gsheet.json")

  # Write the RAW data from filestack
  ws = session.spreadsheet_by_key("1t6bsMsUL82UH3JjmLfxftGuVI3MSR80zmWSbDBeppAM").worksheets[FILESTACK_RAW]
  row = get_next_empty_row(ws)

  ws[row, 1] = $filestack[0].snapshot_date
  ws[row, 2] = $filestack[0].monthly_consumption.to_s
  ws[row, 3] = $filestack[1].monthly_consumption.to_s
  ws[row, 4] = $filestack[2].monthly_consumption.to_s
  ws[row, 5] = $filestack[3].monthly_consumption.to_s
  ws.save

  # Write the SUMMARY data from filestack
  ws = session.spreadsheet_by_key("1t6bsMsUL82UH3JjmLfxftGuVI3MSR80zmWSbDBeppAM").worksheets[FILESTACK_SUMMARY]
  row = 2

  ws[row, 1] = $filestack[0].snapshot_date
  ws[row, 2] = $filestack[0].monthly_consumption.to_f / 100   # Because the display in GSheet is in %, so to avoid having 5 = 500%, then will divide by 100.
  ws[row, 3] = $filestack[1].monthly_consumption.to_f / 100
  ws[row, 4] = $filestack[2].monthly_consumption.to_f / 100
  ws[row, 5] = $filestack[3].monthly_consumption.to_f / 100
  ws.save

end


def write_filestack_to_txt()

  for i in 0..3
    p "Application : " + $filestack[i].application
    p "Consumption : " + $filestack[i].monthly_consumption.to_s
    p "Limit       : " + $filestack[i].monthly_limit.to_s
    p "Date        : " + $filestack[i].snapshot_date.to_s
    p "-------------------------------------------\n\n"

  end

end


def login_user()
  begin
    fill_in("email", "admin@venzee.com")
    fill_in("password", "remote281")
    click_button("Sign in","Your applications")

  rescue Exception => e
    show_error(e, "login_user()", {})
  end
end

