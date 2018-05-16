# --------------------------------------------------------------------
# Note for deployment on Codeship
#
# 1) Upload a new ci_env.json.enc that include new IP address
# 2) Move ci_env.json.enc and remote-qa-key.pem to ~/qa
#
# --------------------------------------------------------------------

require 'rubygems'
require 'bundler/setup'
require 'net/ssh'  
require 'cryptenv'

def ssh_exec!(ssh, command)
  stdout_data = ""
  stderr_data = ""
  exit_code = nil
  exit_signal = nil
  ssh.open_channel do |channel|
    channel.exec(command) do |ch, success|
      unless success
        abort "FAILED: couldn't execute command (ssh.channel.exec)"
      end
      channel.on_data do |ch,data|
        stdout_data+=data
      end

      channel.on_extended_data do |ch,type,data|
        stderr_data+=data
      end

      channel.on_request("exit-status") do |ch,data|
        exit_code = data.read_long
      end

      channel.on_request("exit-signal") do |ch, data|
        exit_signal = data.read_long
      end
    end
  end
  ssh.loop

  # Return an array of data !
  [stdout_data, stderr_data, exit_code, exit_signal]
end

begin 

	wait_for_result = false

	case ARGV[0]
  	when "--wait-for-result" then
	  wait_for_result = true
	end

  # Instanciate a crypto object 
	env = Cryptenv.new()

  puts "\nLoading " + "../ci_env.json.enc ..."
  #env.load_file("../ci_env.json")            # Use the plain version of the ci_env.json
	env.load_crypted_file("../ci_env.json.enc")	# Use the encrypted version of the ci_env.json

	host = env.get("cuke_runner", "credentials", "qa", "host")
	user = env.get("cuke_runner", "credentials", "qa", "user")
	key  = "../" + env.get("cuke_runner", "credentials", "qa", "keys")

	puts "\n--- ssh_launcher.rb ---"
	puts "  Host: #{host}"
	puts "  User: #{user}"
	puts "  Key : #{key}"

	@result = nil

	cmd = 'cd qa/cuke_runner && ruby result_manager.rb'
	
	if wait_for_result
		cmd += ' --wait-for-result'
	end


	# Connect in SSH and change the cuke flag and wait for the execution
	Net::SSH.start(host, user, :keys => key) do |ssh|
	  @result = ssh_exec!(ssh, cmd)
	end

	# Check exit code from the ssh command.
	if @result[2] == 0
		puts "Exit 0"
    puts "Cucumber tests ALL passed !"

	else @result[2] == 1
		puts "Exit 1"
		raise "Cucumber test failed.  Look on #codeship channel for detailed result."
	
	end

rescue Exception => e
  puts "---------- ssh_launcher.rb ----------"
	puts "Error Message: #{e.message}"
	puts "-------------------------------------"
	raise
end
