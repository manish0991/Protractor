require 'net/ssh'  

HOST = 'fuel-xbmc' 
USER = '<user>' 
PASS = '<password>'  

Net::SSH.start( HOST, USER, :password => PASS ) do|ssh| 
	result = ssh.exec!('cd c:/geek/qa/cuke_runner && ruby set_run_cuke_flag.rb') 
  puts result 
  #result = ssh.exec!('dir') 
  #puts result 
  #result = ssh.exec!('ruby set_run_cuke_flag.rb') 
	#puts result 
end




=begin

  require 'net/ssh'

  #@start_time = Time.now

  pid = spawn('ssh','sshuser@fuel-xbmc','dir')
  puts 'before wait'
  Process.wait(pid)
  puts 'after wait'

  #pid2= spawn('ssh','msylvestre@msylvestre-pc','run.bat')
  #Process.wait(pid2)

  #Process.waitpid(pid)
  #Process.wait(pid2)

  #@run_time = Time.now - @start_time

  #puts "Execution time was: #{@run_time.to_f}"

  #Net::SSH.start("fuel-xbmc", "sshuser") do |ssh|
  #  
  #  #result = ssh.exec!("dir")
  #  #puts result
  #end

=end