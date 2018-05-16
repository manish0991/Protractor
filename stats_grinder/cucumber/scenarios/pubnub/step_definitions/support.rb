########################################################################
# Data Object

class PubnubSubscription
  attr_accessor :messages_count
  attr_accessor :device_count
  attr_accessor :date

  def initialize()
    @messages_count    = ""
    @device_count = ""
    @date = ""
  end
end

#######################################################################
def generate_pubnub_data()

  $pubnub = Array.new()

  for i in 0..1
    $pubnub[i] = PubnubSubscription.new()
  end

end

def write_pubnub_to_gheet()

  # Initialize the session
  session = GoogleDrive.saved_session("../gsheet.json")

  # Write the RAW data from filestack
  ws = session.spreadsheet_by_key("1t6bsMsUL82UH3JjmLfxftGuVI3MSR80zmWSbDBeppAM").worksheets[PUBNUB_RAW]
  row = get_next_empty_row(ws)

  ws[row, 1] = $pubnub[0].date
  ws[row, 2] = $pubnub[0].device_count.to_f   / 20000 
  ws[row, 3] = $pubnub[0].messages_count.to_f / 40000000
  ws[row, 4] = $pubnub[1].device_count.to_f   / 100
  ws[row, 5] = $pubnub[1].messages_count.to_f / 1000000 
  ws.save

  # Write the SUMMARY data from filestack
  ws = session.spreadsheet_by_key("1t6bsMsUL82UH3JjmLfxftGuVI3MSR80zmWSbDBeppAM").worksheets[PUBNUB_SUMMARY]
  row = 2

  ws[row, 1] = $pubnub[0].date
  ws[row, 2] = $pubnub[0].device_count.to_f   / 20000 
  ws[row, 3] = $pubnub[0].messages_count.to_f / 40000000
  ws[row, 4] = $pubnub[1].device_count.to_f   / 100
  ws[row, 5] = $pubnub[1].messages_count.to_f / 1000000 
  ws.save

end

def write_pubnub_to_txt()

  for i in 0..1
    p "Messages : " + $pubnub[i].messages_count.to_s
    p "Devices  : " + $pubnub[i].device_count.to_s
    p "Date        : " + $pubnub[i].date.to_s
    p "-------------------------------------------\n\n"

  end

end

def convert_k_to_decimal(count)

  if count.include? ("K")
    converted_count = count.gsub('K', '').to_f * 1000
  else
    converted_count = count
  end

  return converted_count.to_f
end