require 'rest-client'
require 'json'

@data = ""
@access_token = ""

# Use the API client/secret from the account api_ms/123456789q
CLIENT_ID = "53ca0c8c5e1b63ed693a74f3a1afb8cb"
CLIENT_SECRET = "733a035aac9dc6af018bc05d8d63665fa5c39890"


# This is the "FE keys that simulate the FE"
#curl -X POST -u "fqDM2s0Qg1uQofXvaASU:b66737097b9af3cea030d15ed34b11dd3ccf027b" --data "grant_type=password&username=integrations&password=A1234567890" -i https://betacode-qa.venzee.com/api/login

#curl -X POST -H "Content-Type:application/json" -d "{\"username\": \"api_ms2\", \"password\": \"123456789q\", \"firstName\": \"Api\", \"lastName\": \"Master\", \"email\": \"apimaster222@venzee.com\"}"  https://api-qa.venzee.com/api/users

def get_token()


  url  = "https://fqDM2s0Qg1uQofXvaASU:b66737097b9af3cea030d15ed34b11dd3ccf027b@betacode-qa.venzee.com/api/login"
  data = {
          :username => 'integrations',
          :password => 'A1234567890',
          :grant_type => 'password'
         }

  puts "---> Before post"
  x = RestClient.post(url, data, :accept => :json)

  puts "\nResult Code : " + x.code.to_s
  @data = JSON.parse(x)

  puts JSON.pretty_generate(@data)

  #puts "\n>>> Access token Acquired for '#{username}'"
  
  return @data["access_token"]


end



def get_authenticated_user(token)

  url         = "https://api-qa.venzee.com/api/user"
  auth_param  = 'Bearer ' + token

  x = RestClient.get(url, {:accept => :json, :Authorization => auth_param})

  #puts "\nResult Code : " + x.code.to_s
  @data = JSON.parse(x)

  puts JSON.pretty_generate(@data)
  
end



def get_collection(token, company_name)

  url         = "https://api-qa.venzee.com/api/orgs/#{company_name}/collections"
  auth_param  = 'Bearer ' + token

  x = RestClient.get(url, {:accept => :json, :Authorization => auth_param})

  #puts "\nResult Code : " + x.code.to_s
  @data = JSON.parse(x)

  #puts JSON.pretty_generate(@data)
  puts "\n>>> Collection Name: " + @data[0]["name"].to_s

end


def show_product_list(token, company_name, collection_name)

  url         = "https://api-qa.venzee.com/api/collections/#{company_name}/#{collection_name}/records?offset=0&limit=50"
  auth_param  = 'Bearer ' + token
  table       = ""

  x = RestClient.get(url, {:accept => :json, :Authorization => auth_param})

  #puts "\nResult Code : " + x.code.to_s
  @data = JSON.parse(x)

  #puts JSON.pretty_generate(@data)

  puts "\nRecord Id \t | Name \t | Cost"
  puts "-------------------------------------------------"

  for i in 0..@data.length - 1
    table += @data[i]["recordId"].to_s + "\t\t   " + @data[i]["name"].to_s + "\t"

    if @data[i]["name"].length < 5
      table += "\t"
    end

    table +=  "   " + @data[i]["cost"].to_s + " " + @data[i]["currency"].to_s + "\n"
  end

  puts table

end


def push_to_shopify(data)

  api_key = "<key>"
  pwd = "<id>"

  shop_url = "https://#{api_key}:#{pwd}@venzee.myshopify.com/admin/products.json"

  x = RestClient.post(shop_url, data, {:accept => :json})

  #puts "\nResult Code : " + x.code.to_s
  y = JSON.parse(x)

  #puts JSON.pretty_generate(y)

end

def get_product_list(token, company_name, collection_name)

  url         = "https://api-qa.venzee.com/api/collections/#{company_name}/#{collection_name}/records?offset=0&limit=50"
  auth_param  = 'Bearer ' + token
  table       = ""

  x = RestClient.get(url, {:accept => :json, :Authorization => auth_param})

  #puts "\nResult Code : " + x.code.to_s
  data = JSON.parse(x)

  return data

end

def transform_for_shopify(raw)

  data3 = {
    product: {
      title: raw["name"],
      body_html: "<strong>From Venzee!<\/strong>",
      vendor: "AcmeStore",
      product_type: "shirts",
    }
  }

  return data3

end

#=================================================================================================

def get_access_token2(id, secret)
  url  = "https://api-qa.venzee.com/api/app/token"
  data = {
          :id => id,
          :secret => secret
         }

  x = RestClient.post(url, data, :accept => :json)

  #puts "\nResult Code : " + x.code.to_s
  @data = JSON.parse(x)

  puts JSON.pretty_generate(@data)
  puts "\n------------------------------------------------------------------------------\n"

  return @data["access_token"]
end



def invite_users(token, nb_invite, test_name)

  for i in 1..nb_invite

    url         = "https://api-qa.venzee.com/api/orgs/api-corp/partnership"
    auth_param  = 'Bearer ' + token
    generate_email = "marco+#{test_name}-#{i}@venzee.com"
    data = {
            :email    => generate_email,
            :template => 'SHARE',
            :message  => 'test msg'
           }

    x = RestClient.post(url, data, {:accept => :json, :Authorization => auth_param})

    puts "\nResult Code : " + x.code.to_s
    @data = JSON.parse(x)

    puts JSON.pretty_generate(@data)
    puts "\n------------------------------------------------------------------------------\n"
 
  end

  return @data["token"]

end

def create_invited_user(token, test_name, i)

  url = "https://api-qa.venzee.com/api/users"
  auth_param  = 'Bearer ' + token
  generate_email = "marco+#{test_name}#{i}@venzee.com"
  generate_username = "invite#{test_name}#{i}"
  data = {
          :username   => generate_username,
          :password   => '123456789q',
          :email      => generate_email,
          :firstName  => 'api_invite1',
          :lastName   => 'invitee'
         }

  x = RestClient.post(url, data, {:accept => :json, :Authorization => auth_param})

  puts "\nResult Code : " + x.code.to_s
  @data = JSON.parse(x)

  puts JSON.pretty_generate(@data)

end

def create_invited_company(token)

  url         = "https://api-qa.venzee.com/api/orgs"
  auth_param  = 'Bearer ' + token
  data = {
          :name         => 'api-invite5',
          :displayName  => 'API Invite 5',
          :description  => 'This is my company',
          :address      => "17565 jacques-plante"
         }

  x = RestClient.post(url, data, {:accept => :json, :Authorization => auth_param})

  puts "\nResult Code : " + x.code.to_s
  @data = JSON.parse(x)

  puts JSON.pretty_generate(@data)
 
end

def accept_partnership(api_token, invite_token)
  
end

########################################################################################################

puts ">>> Getting Access token"
@access_token = get_token()

#puts ">>> Getting Access token"
#@access_token = get_access_token2(CLIENT_ID, CLIENT_SECRET)

#puts ">>> Inviting a user"
#@invite_token = invite_users(@access_token, 1, "api_load3")

puts ">>> Create an invited user"
#create_invited_user(@access_token, "api_tess", 1)

puts ">>> Create an invited company"
#create_invited_company(@access_token)

#accept_partnership(@access_token, @invite_token)

puts ">>> Get authenticated user"
get_authenticated_user(@access_token)
#create_company(@access_token)
#get_collection(@access_token, "api-corp")

#show_product_list(@access_token, "api-corp", "acme")
#raw = get_product_list(@access_token, "api-corp", "acme")

#puts "\n>>> Pushing " + raw.length.to_s + " products to your Shopify store..."

#for i in 0..raw.length - 1
#  push_to_shopify(transform_for_shopify(raw[i]))
#end

puts "\n>>> DONE !"



