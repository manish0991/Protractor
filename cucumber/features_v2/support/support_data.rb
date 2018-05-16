########################################################################
# Generated Data

class User
  attr_accessor :firstname
  attr_accessor :lastname
  attr_accessor :username
  attr_accessor :email
  attr_accessor :password
  attr_accessor :position
  attr_accessor :phone
  attr_accessor :picture
  attr_accessor :isRegistered
  attr_accessor :csv
  attr_accessor :group
  attr_accessor :cardNumber
  attr_accessor :cvc

  def initialize(type)

    @firstname    = "test Vegan"
    @username     = "testcuke" + rand(10000000).to_s
    @password     = "cukePwd1"
    @position     = "Clerk"
    @phone        = "514.888.4466"
    @csv		  = "demo.csv"
    @picture      = "Lighthouse.jpg"
    @group		  = "group"+rand(10000000).to_s
    @isRegistered = false
    @cardNumber = "4242424242424242"
    @cvc = "265"


    if type == "user"
      @lastname  = "User"
      @email     = "cukevz+1" + rand(10000000).to_s + "@gmail.com"
	  #COMMENT: User yopmail to get the email fast
      #@email     = "cukeuser" + rand(10000000).to_s + "@yopmail.com"
    
    elsif type == "partner"
      @lastname  = "Partner"
      @email     = "cukevz+2" + rand(10000000).to_s + "@gmail.com"
	  #COMMENT: User yopmail to get the email fast
	  #@email     = "cukePartner" + rand(10000000).to_s + "@yopmail.com"
    end

  end
end


########################################################################
class Company
  attr_accessor :name
  attr_accessor :website
  attr_accessor :domain
  attr_accessor :industry
  attr_accessor :activity_desc
  attr_accessor :nbr_employee
  attr_accessor :phone
  attr_accessor :country
  attr_accessor :province
  attr_accessor :picture

  def initialize()
    @name           = "Vegan Corp" + rand(10000000).to_s
    @website        = "http://cukes.com"
    @domain         = "vegan-corp" + rand(10000000).to_s
    @industry       = "Automotive and Industrial"
    @activity_desc  = "I export data to multiple channels"
    @nbr_employee   = 99
	@phone        = "514.888.4466"
    @country        = "Canada"
    @province       = "British Columbia"
    @picture        = "Jellyfish.jpg"

  end
end
########################################################################
class Product
  attr_accessor :id
  attr_accessor :name
  attr_accessor :cost
  attr_accessor :map_policy
  attr_accessor :spec_label
  attr_accessor :spec_value
  attr_accessor :spec_labe2
  attr_accessor :spec_value2
  attr_accessor :image
  attr_accessor :image1
  attr_accessor :image2
  attr_accessor :csv1
  attr_accessor :csv2
  
def initialize()
    @id         = "sku" + rand(10000000).to_s
    @name       = "relish jar " + rand(10000000).to_s
    @cost       = 99.98
    @map_policy = 2
    @spec_label = "Cost"
    @spec_value = "1000"
    @image      = "Koala.jpg"
	@image1     = "DH-00001.jpg"
	@image2     = "DH-00002.jpg"
	@csv1		= "image.csv"
	@csv2		= "row_4.csv"
	@spec_labe2 = "Name"
    @spec_value2 = "Cuke-Test"
	
  end
end

class Integration
  attr_accessor :name
  attr_accessor :description
  
  def initialize()
    @name         = "Integration" + rand(10000000).to_s
    @description  = "Description " + rand(10000000).to_s
  end
end



########################################################################
class Collection
  attr_accessor :name
  attr_accessor :share_setting
  attr_accessor :map_policy
  attr_accessor :currency
  attr_accessor :csv_file
  attr_accessor :delimiter

  def initialize()
    @name           = "cukecollection " + rand(10000000).to_s
    @share_setting  = "Share with everyone"
    @map_policy     = 1.5
    @currency       = "Canadian Dollar"
    @csv_file       = ""
    @delimiter      = ";"
  end
end
#######################################################################
class Er_collection
  attr_accessor :name
  attr_accessor :share_setting
  

  def initialize()
    @name           = "ercollection " + rand(10000000).to_s
    @share_setting  = "Share with everyone"
    
  end
end
#######################################################################
def generate_data()

  if $isGeneratedData == false
    $isGeneratedData = true
    $user         = User.new("user")
      $integration =  Integration.new()
    $user_company = Company.new()
    $collection   = Collection.new()
	$er_collection = Er_collection.new()

    $product = Array.new
    $variant = Array.new
    $partner = Array.new
    $partner_company = Array.new

    for i in 0..10
      $product[i] = Product.new()
      $variant[i] = Product.new()
      $partner[i] = User.new("partner")
      $partner_company[i] = Company.new()
    end
  end
end
####################################################################
