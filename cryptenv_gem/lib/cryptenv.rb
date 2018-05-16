########################################################################################
# BUILD & INSTALLATION INSTRUCTION
#
# - Build : 
#      $ gem build cryptenv.gemspec
#
# - Install : 
#      $ gem install ./cryptenv-0.0.3.gem
#
# - Publish :
#      $ (one time) $ curl -u msylvestre https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials 
#      $ gem push cryptenv-0.0.3.gem
#      $ gem list --remote cryptenv  # validate the push of the gem
#
# - Unpublish :
#      $ gem yank cryptenv -v 0.0.1
#
# - Reference :
#      http://guides.rubygems.org/make-your-own-gem/
#
#
# CHANGE LOG
#
# - 0.0.1 Initial Release
# - 0.0.2 Added public encrypt/decrypt from file/memory
# - 0.0.3 Expose Magic & Salt for debuging purpose
#
########################################################################################

# TODO: Make those require as dependencies of the gem (see reference above)
require 'json' 
require 'openssl'
require 'securerandom'

class Cryptenv

  attr_accessor :env
  attr_accessor :aa_salt
  attr_accessor :aa_magic

  @@OPENSSL_MAGIC = "Salted__"
  @@DEFAULT_CIPHER = "aes-256-cbc"
  @@DEFAULT_MD = OpenSSL::Digest::SHA256
  @@file_loaded = false


  def load_crypted_file(path)
  	begin
  		data = decrypt_in_memory("This is the passphrase", path)
  		@env = JSON.parse(data)
      @@file_loaded = true

  	rescue Exception => e
      puts "\n\n-------------------------------------------------------------------------------------"  
      puts "FUNCTION: load_crypted_file(path)"
      puts "ERROR MESSAGE: " + e.message
      puts "HINT: You should create a local file ~/ci_env.json or in /<user>/ci_env.json (windows)"
      puts "-------------------------------------------------------------------------------------\n\n"  
      exit
    end
  end


  def load_file(path)
    begin
      data = IO.read(path)
      @env = JSON.parse(data)
      @@file_loaded = true

    rescue Exception => e
      puts "\n\n-------------------------------------------------------------------------------------"  
      puts "FUNCTION: load_file(path)"
      puts "ERROR MESSAGE: " + e.message
      puts "HINT: You should create a local file ~/ci_env.json or in /<user>/ci_env.json (windows)"
      puts "-------------------------------------------------------------------------------------\n\n"  
      exit
    end
  end


  def get(*criteria)
    
    begin
      raise "env_ci.json not loaded. Please load the file first via 'load_credential_file()'" if !@@file_loaded

      case criteria.length
    
      when 1 then
        return @env[criteria[0]]

      when 2 then
        return @env[criteria[0]][criteria[1]]

      when 3 then
        return @env[criteria[0]][criteria[1]][criteria[2]]

      when 4 then
        return @env[criteria[0]][criteria[1]][criteria[2]][criteria[3]]

      when 5 then
        return @env[criteria[0]][criteria[1]][criteria[2]][criteria[3]][criteria[4]]

      when 6 then
        return @env[criteria[0]][criteria[1]][criteria[2]][criteria[3]][criteria[4]][criteria[5]]

      when 7 then
        return @env[criteria[0]][criteria[1]][criteria[2]][criteria[3]][criteria[4]][criteria[5]][criteria[6]]

      when 8 then
        return @env[criteria[0]][criteria[1]][criteria[2]][criteria[3]][criteria[4]][criteria[5]][criteria[6]][criteria[7]]

      else
        raise "Number of parameter is out-of-bound (can't be > 8)"
      
      end

    rescue Exception => e
      puts "\n\n-------------------------------------------------------------------------------------"  
      puts "FUNCTION: get_credential(*criteria)"
      puts "PARAM: criteria = " + criteria.to_s
      puts "ERROR MESSAGE: " + e.message
      puts "-------------------------------------------------------------------------------------\n\n"  
      exit
    end
  end

  def encrypt_in_memory(password, source_file, cipher = @@DEFAULT_CIPHER, md = @@DEFAULT_MD.new)
    raise "encrypt_in_memory(...) is not implemented yet"
  end


  def encrypt_in_file(password, source_file, cipher = @@DEFAULT_CIPHER, md = @@DEFAULT_MD.new)
    buf = ""
    set_magic_salt = false

    salt =  SecureRandom.random_bytes(8)
    cipher = OpenSSL::Cipher::Cipher.new(cipher)
    cipher.encrypt
    cipher.pkcs5_keyivgen(password, salt, 1, md)
    #encrypted_data = cipher.update(data) + cipher.final
    
    File.open(source_file + ".enc", "wb") do |outf|
      File.open(source_file, "rb") do |inf|
        while inf.read(4096, buf)

          if !set_magic_salt
            outf << @@OPENSSL_MAGIC
            outf << salt
            set_magic_salt = true
          end

          outf << cipher.update(buf)
        end
        outf << cipher.final
      end
    end
  end

  def decrypt_in_memory(password, source_file, cipher = @@DEFAULT_CIPHER, md = @@DEFAULT_MD.new)

    buf  = ""
    data = ""
    got_magic_salt = false

    File.open(source_file, "rb") do |inf|

      while inf.read(4096, buf)

        if !got_magic_salt
          input_magic = buf.slice!(0, 8)
          input_salt = buf.slice!(0, 8)

          ## Debug code to see the salt
          @aa_magic = input_magic
          @aa_salt = input_salt

          cipher = OpenSSL::Cipher::Cipher.new(cipher)
          cipher.decrypt
          cipher.pkcs5_keyivgen(password, input_salt, 1, md)
          got_magic_salt = true
        end

        data += cipher.update(buf)

      end

      data += cipher.final
    end

    return data
  end

  # Data may be written from the command line with
  # `openssl enc -#{cipher} -md #{md} -in #{INFILE} -out #{OUTFILE}`
  # and the resulting bytes may be read by this function.
  #
  # Example:
  #  openssl enc -aes-256-cbc -md sha256 -in file.txt -out file.txt.encrypted
  def decrypt_in_file(password, source_file, cipher = @@DEFAULT_CIPHER, md = @@DEFAULT_MD.new)

    buf = ""
    got_magic_salt = false
    
    File.open(source_file + ".dec", "wb") do |outf|
      File.open(source_file, "rb") do |inf|

        while inf.read(4096, buf)

          if !got_magic_salt
            input_magic = buf.slice!(0, 8)
            input_salt = buf.slice!(0, 8)
            cipher = OpenSSL::Cipher::Cipher.new(cipher)
            cipher.decrypt
            cipher.pkcs5_keyivgen(password, input_salt, 1, md)
            got_magic_salt = true
          end

          outf << cipher.update(buf)

        end

        outf << cipher.final
      end
    end
  end

end

########################################################################################
# DEBUG CODE
=begin

def main()
  ce = Cryptenv.new()

  #ce.load_credential_file("ci_env.enc")
  #puts "env: " + cm.env.to_s

  ce.decrypt_in_file("This is the passphrase", "../../../ci_env.json.enc")
  puts "encrypted !"
  
  #puts ce.decrypt_in_memory("This is the passphrase", "ci_env.enc")
  #puts "decrypted in memory !"
  
  #puts JSON.pretty_generate(ce.get("adhoc_report","real_user","credentials","qa"))

end



#######################################################################################
# Old School launch !
main()
=end
