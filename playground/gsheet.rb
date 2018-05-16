#####################################################################################################
# REFERRENCES :
#
#  - Googledrive Gem : Https://github.com/gimite/google-drive-ruby
#  - API doc : http://www.rubydoc.info/gems/google_drive/GoogleDrive
#  - How to get your Google API keys : https://developers.google.com/drive/v3/web/about-auth
#  - API Exporer to test that your key works for the action you want to do : https://developers.google.com/apis-explorer/?hl=en_US#p/drive/v3/
#  - How to enable Google Drive API from the developer console : https://console.developers.google.com/apis/credentials?project=geckoboard-automation&pli=1




require 'openssl'
require "google/api_client"
require "google_drive"  # sudo gem install google_drive

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
session = GoogleDrive.saved_session("gsheet.json")

# Gets list of remote files.
#session.files.each do |file|
#  p file.title
#end

# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
# Or https://docs.google.com/a/someone.com/spreadsheets/d/pz7XtlQC-PYx-jrVMJErTcg/edit?usp=drive_web
ws = session.spreadsheet_by_key("1t6bsMsUL82UH3JjmLfxftGuVI3MSR80zmWSbDBeppAM").worksheets[2]

# Gets content of A2 cell.
#p ws[2, 1]  #==> "hoge"

# Changes content of cells.
# Changes are not sent to the server until you call ws.save().
ws[1, 1] = "una foo1"
ws[1, 2] = "uno bar1"
ws.save

# Dumps all cells.
#(1..ws.num_rows).each do |row|
#  (1..ws.num_cols).each do |col|
#    p ws[row, col]
#  end
#end

# Yet another way to do so.
#p ws.rows  #==> [["fuga", ""], ["foo", "bar]]

# Reloads the worksheet to get changes by other clients.
#ws.reload