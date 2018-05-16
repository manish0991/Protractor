
require 'rest_client'
require 'json'

# curl -X POST https://push.geckoboard.com/v1/send/139717-5e43286e-3373-48d0-889a-318da998e716 -d '{"api_key":"<key>","data":{"item":23,"min":{"value":0}, "max":{"value":30}}}' -H "Content-Type:application/json"

# Wideget URL
rpm_widget_url 			= "https://push.geckoboard.com/v1/send/139717-5e43286e-3373-48d0-889a-318da998e716"
monitoring_widget_url 	= "https://push.geckoboard.com/v1/send/139717-2e05d9da-7a5a-42f9-9934-b715d4270fcf"
text_stat_widget_url 	= "https://push.geckoboard.com/v1/send/139717-1eed5216-2242-4bf5-9d01-c474fb9c218c"
text_widget_url 		= "https://push.geckoboard.com/v1/send/139717-f362e424-c075-4a73-9b96-032b0e073cec"

rpm_jsonData = {
	api_key:'<key>',
	data:{
		item:'13',
		min:{value:'0'},
		max:{value:'30'}
	}
}.to_json


monitoring_json = {
	api_key:'<key>',
	data:{
		status: 'Up',
  		downTime: '2 days ago'
  	}
}.to_json

text_stat_json = {
	api_key:'<key>',
	data:{
	  	item: [
	    	{
	      	value: 5723,
	      	text: 'Total paying customers'
	    	}
	  	]
	}
}.to_json

text_json = {
	api_key:'<key>',
	data:{
	  	item: [
	    	{
	      	text: "Unfortunately, as you probably already know, people",
	      	type: 0
	    	},
	    	{
	      	text: "As you might know, I am a full time Internet",
	      	type: 1
	    	}
	  	]
	}
}.to_json


#RestClient.post(rpm_widget_url, rpm_jsonData, :content_type => :json, :accept => :json)
RestClient.post(monitoring_widget_url, monitoring_json, :content_type => :json, :accept => :json)
#RestClient.post(text_stat_widget_url, text_stat_json, :content_type => :json, :accept => :json)
RestClient.post(text_widget_url, text_json, :content_type => :json, :accept => :json)
