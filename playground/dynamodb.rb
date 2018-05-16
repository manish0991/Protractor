#! /usr/bin/ruby
require "set"
require "bigdecimal"
require 'aws-sdk'
require 'json'

#require "aws-sdk-core"

# DYNAMODB_ENDPOINT_LOCAL=dynamodb.us-west-2.amazonaws.com 
# DYNAMODB_REGION_LOCAL=us-west-2 ;


########################################################################################################
# Create the object and connect

@dynamo_db = Aws::DynamoDB::Client.new(
    access_key_id: '',
    secret_access_key: '',
    endpoint: 'http://dynamodb.us-west-2.amazonaws.com',
    region: 'us-west-2'
  )



########################################################################################################
# List all the table using the "dynamo_db" object

def get_table_list()
  resp = @dynamo_db.list_tables()
  puts "Table list : " + resp.table_names.to_s
end

######################################################
def do_scan(filter_exp, exp_attribute_values)
    result = @dynamo_db.scan(
      :expression_attribute_values => exp_attribute_values,
      :filter_expression => filter_exp,   # Condition Expressions are supplied through the FilterExpression parameter
      #:projection_expression => "organizationId",
      :table_name => "record"
    ).data.items
   
    # format all retrieved titles into a single line
    puts "-----------------------------------------"
    puts JSON.pretty_generate(result)
    puts "-----------------------------------------"
    #return "scan retrieved: #{(result.map { |item| item["organizationId"] }).join(", ")}"
end

####################################################
def get_collection_id(collection_name)

  result = @dynamo_db.scan(
    :expression_attribute_values => {":m" => collection_name},
    :filter_expression => "id = :m",   # Condition Expressions are supplied through the FilterExpression parameter
    #:projection_expression => "organizationId",
    :table_name => "collection"
  ).data.items
 
  # format all retrieved titles into a single line
  puts "-----------------------------------------"
  puts JSON.pretty_generate(result)
  puts "-----------------------------------------"
  #return "scan retrieved: #{(result.map { |item| item["organizationId"] }).join(", ")}"

end


def get_records()
=begin
resp = @dynamo_db.query({
  table_name: "record", # required
  index_name: "id_record_index",
  select: "ALL_ATTRIBUTES", # accepts ALL_ATTRIBUTES, ALL_PROJECTED_ATTRIBUTES, SPECIFIC_ATTRIBUTES, COUNT
  limit: 10,
  consistent_read: false,
  #exclusive_start_key: {
  #  "AttributeName" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
  #},
  #return_consumed_capacity: "INDEXES", # accepts INDEXES, TOTAL, NONE
  #projection_expression: "ProjectionExpression",
  filter_expression: "",
  key_condition_expression: "collectionId = :m",
  #expression_attribute_names: {
  #  "ExpressionAttributeNameVariable" => "AttributeName",
  #},
  expression_attribute_values: {":m" => "MRC4XKTPOT"},
})
=end

  result = @dynamo_db.query({ 
    :table_name => 'record', 
    :index_name => 'record_row_index',
    #:consistent_read => true,
    :select => 'ALL_ATTRIBUTES',
    #:attributes_to_get => ['recordId'],
    :key_conditions => { 
      'collectionId' => { 
        :comparison_operator => 'EQ', 
        :attribute_value_list => [
          'MYNN05UXR8'
        ]
      }
    } 
  }).data.items

  # format all retrieved titles into a single line
  puts "-----------------------------------------"
  #puts JSON.pretty_generate(result)
  puts "Count: " + result.count.to_s
  puts "-----------------------------------------"


end

def count_rec()

  result = @dynamo_db.query({
    table_name: 'record',
    index_name: 'record_row_index',
    select: 'COUNT',
    limit: 5000,
    return_consumed_capacity: 'TOTAL',
    key_condition_expression: 'collectionId = :collectionId',
    expression_attribute_values: {
      ':collectionId' => 'MYNN05UXR8'
    }
  }).data

  puts "-----------------------------------------"
  #puts JSON.pretty_generate(result)
  puts "Count: " + result.to_s
  puts "-----------------------------------------"

end

#do_scan("collectionId = :m",{":m" => "MRC4XKTPOT"})
#get_table_list()
#get_collection_id("MRC4XKTPOT")
#get_records()
count_rec()


=begin
resp = dynamo_db.get_item({
  table_name: "TableName", # required
  key: { # required
    "AttributeName" => "value", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
  },
  attributes_to_get: ["AttributeName"],
  consistent_read: false,
  return_consumed_capacity: "INDEXES", # accepts INDEXES, TOTAL, NONE
  projection_expression: "ProjectionExpression",
  expression_attribute_names: {
    "ExpressionAttributeNameVariable" => "AttributeName",
  },
})

=end


########################################################################################################
# Create a Table

=begin
begin
  dynamo_db.describe_table(:table_name => "ms_test")
  puts "Table already exist !"
rescue Aws::DynamoDB::Errors::ResourceNotFoundException
  dynamo_db.create_table(
    :table_name => "ms_test",
    :attribute_definitions => [
      {
        :attribute_name => :Id,
        :attribute_type => :N
      }
    ],
    :key_schema => [
      {
        :attribute_name => :Id,
        :key_type => :HASH
      }
    ],
    :provisioned_throughput => {
      :read_capacity_units => 1,
      :write_capacity_units => 1,
    }
  )
 
  # wait for table to be created
  puts "waiting for table to be created..."
  dynamo_db.wait_until(:table_exists, table_name: "ms_test")
  puts "table created!"
end
=end

########################################################################################################
# Add a JSON item to the table

=begin
# Prepare item
item = {
  Id: 207, # hash key
  Title: "20-Bicycle 207",
  Description: "205 description",
  BicycleType: "Hybrid",
  Brand: "Brand-Company C",
  Price: 500,
  Gender: "B",
  Color: Set.new(["Red", "Black"]),
  ProductCategory: "Bike",
  InStock: true,
  QuantityOnHand: nil,
  NumberSold: BigDecimal.new("1E4"),
  RelatedItems: [
    341, 
    472, 
    649
  ],
  Pictures: { # JSON Map of views to url String
    FrontView: "http://example.com/products/205_front.jpg", 
    RearView: "http://example.com/products/205_rear.jpg",
    SideView: "http://example.com/products/205_left_side.jpg",
  },
  ProductReviews: { # JSON Map of stars to List of review Strings
    FiveStar: [
      "Excellent! Can't recommend it highly enough!  Buy it!",
      "Do yourself a favor and buy this."
    ],
    OneStar: [
      "Terrible product!  Do not buy this."
    ]
  }
}

# Insert the item
dynamo_db.put_item(:table_name => "ms_test", :item => item)
puts "tadam !!!  Item inserted"
=end

########################################################################################################
# Batch Insert

=begin
puts "Prep for batch insert of 4 products"

dynamo_db.batch_write_item(
  :request_items => {
    "ms_test" => [
 
      {:put_request => { :item => {
        Id: 300,
        Title: "Sojourner",
        Description: "Mars Pathfinder robotic Mars rover",
        Price: BigDecimal.new("2.65e8"),
        LaunchDate: {
          M: 12, D: 4, Y: 1996
        },
        LostCommunicationDate: {
          M: 9, D: 27, Y: 1997
        },
        Features: {
          Rover: true,
        },
        NumberInStock: 10,
        OrdersPlaced: 3,
        Tags: ["#Mars", "#InStarTrekSeason4", "#InRedPlant2000", "#LostComms"],
      }}},
 
      {:put_request => { :item => {
        Id: 301,
        Title: "Spirit",
        Description: "Mars Exploration Rover - A",
        Price: BigDecimal.new("4.1e8"),
        LaunchDate: {
          M: 6, D: 10, Y: 2003
        },
        LostCommunicationDate: {
          M: 3, D: 22, Y: 2010
        },
        Features: {
          Rover: true,
        },
        NumberInStock: 10,
        OrdersPlaced: 5,
        Tags: Set.new(["#Mars", "#StuckOnMars", "#LostComms"]),
      }}},
 
      {:put_request => { :item => {
        Id: 302,
        Title: "Opportunity",
        Description: "Mars Exploration Rover - B",
        Price: BigDecimal.new("4.1e8"),
        LaunchDate: {
          M: 7, D: 7, Y: 2003
        },
        LostCommunicationDate: nil,
        Features: {
          Rover: true,
        },
        NumberInStock: 10,
        OrdersPlaced: 10,
        Tags: Set.new(["#Mars", "#StillRoving"]),
      }}},
 
      {:put_request => { :item => {
        Id: 303,
        Title: "Curiosity",
        Description: "car-sized robotic rover",
        Price: BigDecimal.new("2.5e9"),
        LaunchDate: {
          M: 11, D: 26, Y: 2011
        },
        LostCommunicationDate: nil,
        Features: {
          Rover: true,
          RoboticArm: true,
        },
        NumberInStock: 0,
        OrdersPlaced: 30,
        Tags: Set.new(["#Mars", "#MarsCuriosity", "#StillRoving"]),
      }}},
 
    ]
  }
)
puts "Insert DONE"
=end

########################################################################################################
# Read the DB
