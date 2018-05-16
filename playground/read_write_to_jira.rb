require 'rest_client'
require 'json'


########################## Read from Jira #############################

# search a specific issue
url0 = "https://<username>:<password>@venzeedev.atlassian.net/rest/api/2/search?jql=id=VEN-4200"

# Or use JQL query
url0 = "https://<username>:<password>@venzeedev.atlassian.net/rest/api/2/search?jql=status=open"

# Or use a Filter 
url0 = "https://<username>:<password>@venzeedev.atlassian.net/rest/api/2/filter/12300"

# Execute the get
x = RestClient.get(url0, {:accept => :json})

puts "Result Code : " + x.code.to_s
data = JSON.parse(x)
puts JSON.pretty_generate(data)



########################## Write to Jira #############################

url1 = "https://<username>:<password>@venzeedev.atlassian.net/rest/api/2/issue/"

json1 = {
    fields: {
       project:
       { 
          key: "VEN"
       },
       summary: "REST ye merry gentlemen.",
       description: "Creating of an issue using project keys and issue type names using the REST API",
       issuetype: 
       {
          name: "Bug"
       }
   }
}.to_json

puts "Json to post : " + json1.to_s

x = RestClient.post(url1, json1, :content_type => :json, :accept => :json)

puts "Result Code : " + x.code.to_s
data = JSON.parse(x)
puts JSON.pretty_generate(data)



########################## Transition Issue in Jira Workflow #############################

url2 = "https://<username>:<password>@venzeedev.atlassian.net/rest/api/2/issue/VEN-4554/transitions?expand=transitions.fields"

json2 = {
    transition: {id: "61"}
}.to_json

# Transition IDs
#---------------------------
# 11 = Open
# 21 = In Progress
# 41 = Re-Opened
# 51 = Closed
# 61 = To Be Tested
# 71 = Ready to Deploy
# 81 = Peer Review


# You can get the transition list for a specific issue by going to the URL like : 
#    https://venzeedev.atlassian.net/rest/api/2/issue/VEN-4554/transitions

puts "Json to post : " + json2.to_s

# That to update the status, we need to POST a transition !
x = RestClient.post(url2, json2, :content_type => :json, :accept => :json)

puts "Result Code : " + x.code.to_s
#data = JSON.parse(x)
#puts JSON.pretty_generate(x)



########################## Add a comment + change assignee #############################

url3 = "https://<username>:<password>@venzeedev.atlassian.net/rest/api/2/issue/VEN-4554"

json3 = {
    update: {
        comment: [
            {
                add: {
                    body: "Comment added via API."
                }
            }
        ]
    },
    fields: {
        assignee: {
            name: "msylvestre"
        }
    }
}.to_json

puts "Json to post : " + json3.to_s

x = RestClient.put(url3, json3, :content_type => :json, :accept => :json)
puts "Result Code : " + x.code.to_s