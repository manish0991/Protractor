#==================================================================================================
# Get the latest version of the Cuke test on Github.  NOTE that the current script of CukeRunner won't be updated cause there's in memory while running ;-)
def get_latest_from_github()

  windows_command = "git.exe pull origin"
  ubuntu_command = "git pull origin"

  # Going into /qa to get the latest version from Git Hub
  goto_directory("qa")
  puts "Current dir: " + Dir.pwd

  # Get the latest from GitHub
  if @os == "Windows"
    puts "Windows command : #{windows_command}"
    go(windows_command)

  elsif @os == "Linux" || @os == "Mac"
    puts "Ubuntu command : #{ubuntu_command}"
    go("git checkout secure-code")
    go(ubuntu_command)        
  end

  # Going back into /qa/Cucumber to be ready to run the test
  goto_directory("cucumber")
  puts "Current dir: " + Dir.pwd
end

