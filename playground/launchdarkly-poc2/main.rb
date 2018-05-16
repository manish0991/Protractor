require 'ldclient-rb'

client = LaunchDarkly::LDClient.new("sdk-ea7b9eab-1458-4000-8e99-3cb622456d21")

user = {
  key: "bob@venzee.com",
  firstName: "Bob",
  lastName: "Burger",
  custom: {
    groups: "beta_testers"
  }
}

if client.toggle?("incredible-feature", user, false)
  # application code to show the feature
  puts "Showing your feature to #{user[:key]}"
else
  # the code to run if the feature is off
  puts "Not showing your feature to #{user[:key]}"
end

client.flush()
