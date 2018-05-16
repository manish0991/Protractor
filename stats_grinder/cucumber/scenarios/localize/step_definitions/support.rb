
########################################################################
# Data Object

class LocalizeSubscription
  attr_accessor :monthly_consumption
  attr_accessor :snapshot_date

  def initialize()
    @monthly_consumption  = ""
    @snapshot_date        = ""
  end
end

#######################################################################
def generate_localize_data()

  $localize = Array.new()

  for i in 0..2
    $localize[i] = LocalizeSubscription.new()
  end

end


def write_localize_to_gheet()

puts "localize write to gsheet: really ?"

  # Initialize the session
  session = GoogleDrive.saved_session("../gsheet.json")

  # Write the RAW data from filestack
  ws = session.spreadsheet_by_key("1t6bsMsUL82UH3JjmLfxftGuVI3MSR80zmWSbDBeppAM").worksheets[LOCALIZE_RAW]
  row = get_next_empty_row(ws)

  ws[row, 1] = $localize[0].snapshot_date
  ws[row, 2] = $localize[0].monthly_consumption
  ws[row, 3] = $localize[1].monthly_consumption
  ws.save

  # Write the SUMMARY data from filestack
  ws = session.spreadsheet_by_key("1t6bsMsUL82UH3JjmLfxftGuVI3MSR80zmWSbDBeppAM").worksheets[LOCALIZE_SUMMARY]
  row = 2

  ws[row, 1] = $localize[0].snapshot_date
  ws[row, 2] = $localize[0].monthly_consumption
  ws[row, 3] = $localize[1].monthly_consumption
  ws.save

end

def write_localize_to_txt()

  for i in 0..3
    p "Consumption : " + $localize[i].monthly_consumption.to_s
    p "Date        : " + $localize[i].snapshot_date.to_s
    p "-------------------------------------------\n\n"

  end

end