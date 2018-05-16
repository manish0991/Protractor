
#==================================================================================================
# Execute any Command Line and spit the output in the stdout

def go(cmd)
  exit_status = true

  Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
    while line = stdout.gets
      puts line
    end
    exit_status = wait_thr.value
  end

  return exit_status
end



#==================================================================================================
# Change directory on the terminal

def goto_directory(path)

  if path == "qa"
      Dir.chdir("..")
  elsif path == "cucumber"
      Dir.chdir(path)
  end

end


