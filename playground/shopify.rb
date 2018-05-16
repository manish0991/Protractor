require 'rest_client'
require 'json'

data = {  
   product:{  
      body_html:"Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters &amp; Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.",
      created_at:"2014-04-28T11:19:43",
      published_at:"2014-04-28T11:19:43",
      product_type:"Graphics Cards",
      title:"Matrox G200 MMS",
      vendor:"Matrox",
      published:true
   },
   variants:[  
      {  
         option1:"Value",
         option2:"4mb",
         price:"299.99",
         sku:"MG200MMSValue4mb"
      },
      {  
         option1:"Value",
         option2:"8mb",
         price:"349.99",
         sku:"MG200MMSValue8mb"
      },
      {  
         option1:"Value",
         option2:"16mb",
         price:"369.99",
         sku:"MG200MMSValue16mb"
      }
   ],
   options:[  
      {  
         name:"Model"
      },
      {  
         name:"Memory"
      }
   ]
}

data3 = {
  product: {
    title: "Burton Custom Freestlye 153",
    body_html: "<strong>Good snowboard!<\/strong>",
    vendor: "Burton",
    product_type: "Snowboard"
  }
}

data4 = {
  variant: {
    option1: "Default Title",
    price: "1.00",
    sku:"1212"
  }
}

#curl -X POST -H "Content-Type: application/json" https://$SHOP_API:$SHOP_PASS@$TEST_SHOP.myshopify.com/admin/products.json -d @product.json

API_KEY = "<key>"
PASSWORD = "<password>"

shop_url = "https://#{API_KEY}:#{PASSWORD}@venzee.myshopify.com/admin/products.json"

data3 = {
  product: {
    title: "Burton Custom Freestlye 153",
    body_html: "<strong>Good snowboard!<\/strong>",
    vendor: "Burton",
    product_type: "Snowboard"
  }
}


x = RestClient.post(shop_url, data3, {:accept => :json})


puts "\nResult Code : " + x.code.to_s
@data = JSON.parse(x)

puts JSON.pretty_generate(@data)
