require 'json'
require 'openSSL'
require 'securerandom'

class CredentialManager

  @env          = ""
  @file_loaded  = false

  @@OPENSSL_MAGIC = "Salted__"
  @@DEFAULT_CIPHER = "aes-256-cbc"
  @@DEFAULT_MD = OpenSSL::Digest::SHA256


  def encrypt_for_openssl(password, data, cipher = @@DEFAULT_CIPHER, md = @@DEFAULT_MD.new)
    salt = SecureRandom.hex(8)
    cipher = OpenSSL::Cipher::Cipher.new(cipher)
    cipher.encrypt
    cipher.pkcs5_keyivgen(password, salt, 1, md)
    encrypted_data = cipher.update(data) + cipher.final
    
    return @@OPENSSL_MAGIC + salt + encrypted_data
  end

  # Data may be written from the command line with
  # `openssl enc -#{cipher} -md #{md} -in #{INFILE} -out #{OUTFILE}`
  # and the resulting bytes may be read by this function.
  #
  # Example:
  #  openssl enc -aes-256-cbc -md sha256 -in file.txt -out file.txt.encrypted
  def decrypt_from_openssl(password, data, cipher = @@DEFAULT_CIPHER, md = @@DEFAULT_MD.new)
    input_magic = data.slice!(0, 8)
    input_salt = data.slice!(0, 8)
    cipher = OpenSSL::Cipher::Cipher.new(cipher)
    cipher.decrypt
    cipher.pkcs5_keyivgen(password, input_salt, 1, md)
    
    return cipher.update(data) + cipher.final
  end

end

########################################################################################
#Example with cipher

=begin

require 'openssl'

# encryption
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

buf = ""
File.open("file.enc", "wb") do |outf|
  File.open("file", "rb") do |inf|
    while inf.read(4096, buf)
      outf << cipher.update(buf)
    end
    outf << cipher.final
  end
end

# decryption
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.decrypt
cipher.key = key
cipher.iv = iv # key and iv are the ones from above

buf = ""
File.open("file.dec", "wb") do |outf|
  File.open("file.enc", "rb") do |inf|
    while inf.read(4096, buf)
      outf << cipher.update(buf)
    end
    outf << cipher.final
  end
end
=end


########################################################################################

def main()
  cm = CredentialManager.new()

  x = cm.encrypt_for_openssl("pwd", "Data to encrypt")
  puts "encrypted ! - #{x}"
  
  y = cm.decrypt_from_openssl("pwd", x)
  puts "decrypted ! - #{y}"


end

#######################################################################################
# Old School launch !
main()

