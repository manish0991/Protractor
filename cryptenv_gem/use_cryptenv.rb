########################################################################################
# HOW TO
# Here's a list of command line to try crypen.gem

require 'cryptenv'

def main()
  ce = Cryptenv.new()

  case ARGV[0]

  when "--encrypt" then
  	ce.encrypt_in_file("This is the passphrase", ARGV[1])
  	puts "encrypted !"  	

  when "--decrypt-memory" then
    puts ce.decrypt_in_memory("This is the passphrase", ARGV[1])
    puts "decrypted in memory !"

  when "--decrypt" then
    ce.decrypt_in_file("This is the passphrase", ARGV[1])
    puts "decrypted !"

  when "--get-crypted-cred"
    ce.load_crypted_file(ARGV[1])
    puts JSON.pretty_generate(ce.get("adhoc_report","real_user","credentials","qa"))

  when "--get-cred"
    ce.load_file(ARGV[1])
    puts JSON.pretty_generate(ce.get("adhoc_report","real_user","credentials","qa"))

  when "--get-magic-salt"
    ce.load_crypted_file(ARGV[1])
    puts "Magic: #{ce.aa_magic}"
    puts "Salt: #{ce.aa_salt}"


  else
    puts "Need paramameter.  Usage: $ ruby use_cryptenv.rb <option> <file_path>  \n
      --encrypt          : Encrypt the file pass in parameter and output a new .enc file, 
      --decrypt-memory   : Show the output of the decrypted file, 
      --decrypt          : Decrypt the file pass in parameter and output a new .dec file, 
      --get-crypted-cred : Return the qa credential for real_user.rb report from a crypted file, 
      --get-cred         : Return the qa credential for real_user.rb report from an uncrypted file
      --get-magic-salt   : Return the Magic & Salt from an encrypted file"

  end

end


#######################################################################################
# Old School launch !
main()

