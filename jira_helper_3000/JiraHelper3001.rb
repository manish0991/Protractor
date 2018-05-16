require 'rest_client'
require 'json'
require 'cryptenv'


#==============================================================================
class Jira

  @data = ""
  @username = ""
  @password = ""
  
  def initialize()    # Constructor
    env = Cryptenv.new()

    #env.load_crypted_file("../../ci_env.json.enc")
    env.load_file("../../ci_env.json")

    @username = env.get("jira-helper3000", "credentials", "username")
    @password = env.get("jira-helper3000", "credentials", "password")
  end

  def get_issue(state)
    if state == "offline"
      f = IO.read("issue_examples.json")
      @data = JSON.parse(f)

    else

      # Get the list of issue in Peer Review and To Be Tested
      url = "https://#{@username}:#{@password}@venzeedev.atlassian.net/rest/api/2/search?jql=project+%3D+%22Venzee+Core%22+AND+status+in+(%22Peer+Review%22,+%22Ready+To+Deploy%22)"

      puts "\nLoading... ... ... ... ...\n\n"

      payload = RestClient.get(url, {:accept => :json})

      puts "\nResult Code : " + payload.code.to_s
      
      @data = JSON.parse(payload)

    end
  end

  
  def move_issue(issue_nbr, status)
    key = @data["issues"][issue_nbr.to_i]["key"]
    url2 = "https://#{@username}:#{@password}@venzeedev.atlassian.net/rest/api/2/issue/" + key + "/transitions?expand=transitions.fields"

    # Transition IDs (status)
    #---------------------------
    # 11 = Open
    # 21 = In Progress
    # 41 = Re-Opened
    # 51 = Closed
    # 61 = To Be Tested
    # 71 = Ready to Deploy
    # 81 = Peer Review

    json2 = {transition: {id: status}}.to_json

    # Api Call.  Note: To update the status, we need to POST a transition, not PUT !
    payload = RestClient.post(url2, json2, :content_type => :json, :accept => :json)

    if payload.code == 204
      puts "Issue #{key} moved to 'To be Tested'"
    else
      puts "Hum... something went wrong - code : " + payload.code
    end
  end

  
  def move_all_issues() 
    for i in 0..@data["total"] - 1
      move_jira_issue(i, "61")
      key = @data["issues"][i]["key"]
      puts "Issue #{key} moved to 'To be Tested'"
    end
  end

  
  def move_all_ready_to_deploy_issues()
    for i in 0..@data["total"] - 1
      if @data["issues"][i]["fields"]["status"]["name"] == "Ready To Deploy"
        move_jira_issue(i, "61")
        key = @data["issues"][i]["key"]
        puts "Issue #{key} moved to 'To be Tested'"
      end
    end
  end


  def show_issue()
    @issue    = ""
    @sub_task = ""

    #puts JSON.pretty_generate(@data)
    puts "Total Issue Open : " + @data["total"].to_s

    # Show the List Header 
    puts "\n\nId | Issue Key \t | Type \t | Status \t\t | Summary"
    puts "-------------------------------------------------------------------------------------------------------------------------------------"

    # Build the list of Issues + Sub-Tasks
    for i in 0..@data["total"] - 1
    
      # Build 2 list - Issue and Sub task
      if @data["issues"][i]["fields"]["issuetype"]["name"] != "Sub-task"

        @issue += i.to_s + ") " + @data["issues"][i]["key"] + "\t   " + @data["issues"][i]["fields"]["issuetype"]["name"].to_s + "\t"

        # Command-line formating, adding a tab if needed
        if @data["issues"][i]["fields"]["issuetype"]["name"].length < 5
          @issue += "\t" 
        end

        @issue += "   " + @data["issues"][i]["fields"]["status"]["name"].to_s + "\t"

        # Command-line formating, adding a tab if needed
        if @data["issues"][i]["fields"]["status"]["name"].length < 12
          @issue += "\t" 
        end

        @issue += "   " + @data["issues"][i]["fields"]["summary"].to_s + "\n"

      else
        @sub_task += i.to_s + ") " + @data["issues"][i]["key"] + "\t   " + @data["issues"][i]["fields"]["issuetype"]["name"].to_s + "\t"

        # Command-line formating, adding a tab if needed
        if @data["issues"][i]["fields"]["issuetype"]["name"].length < 5
          @sub_task += "\t" 
        end

        @sub_task += "   " + @data["issues"][i]["fields"]["status"]["name"].to_s + "\t"

        # Command-line formating, adding a tab if needed
        if @data["issues"][i]["fields"]["status"]["name"].length < 12
          @sub_task += "\t" 
        end

        @sub_task += "   " + @data["issues"][i]["fields"]["summary"].to_s + "\n"

      end
    end

    # Show the issue list 
    puts @issue + "\n"
    puts @sub_task
  end

  def show_action_menu()
    puts "\nWhat ya wanna do ?"
    puts "    1: Move all issue 'Ready to deploy' to 'To be Tested'"
    puts "    2: Move all issue to 'To Be Tested'"
    puts "    3: Move specific issue to 'To Be Tested'"
    puts "    4: Back to main menu"
    print "\nACTION> "

    action_code = gets

    #TODO: Handle multiple issue coma-separated

    case action_code.to_i
      
      when 1
        print "\nAre you sure (y/n) ? "
        final_answer = gets
        
        if final_answer == "y\n"
          jira.move_all_ready_to_deploy_issues()
        else
          puts "\nAction Cancelled"
        end

      when 2
        print "\nAre you sure (y/n) ? "
        final_answer = gets
        
        if final_answer == "y\n"
          jira.move_all_issues()
        else
          puts "\nAction Cancelled"
        end

      when 3
        #TODO: Handle multiple issue coma-separated

        print "\nWhat issue you want to move (id) ? "
        index = gets

        #TODO: Handle multiple issue coma-separated
        
        if (index.to_i >= 0) && (index.to_i < @data["total"].to_i) && (index.dump != "\"\\n\"")
          jira.move_jira_issue(index, 61)          
        else
          puts "\nBad choice. Try again !"      
        end
      
      else
        puts "\nSee ya !\n\n"
        return 99
    end
  end
end



#==============================================================================



class Github

  def show_action_menu()
    puts "\nWhat ya wanna do ?"
    puts "    1: Create a release tag"
    puts "    2: Back to main Menu"
    print "\nACTION> "

    action_code = gets

    case action_code.to_i
      
    when 1
      puts "Coming soon !"
   
    else
      puts "\nSee ya !\n\n"
      return 99
    end
  end
end



#==============================================================================



def manage_jira_issue()
  jira        = Jira.new
  action_code = 0

  # Loop until the user choose to quit
  while action_code.to_i != 99 do 
    jira.get_issue("offline")
    jira.show_issue()
    action_code = jira.show_action_menu()
  end
end


def manage_github()
  github      = Github.new
  action_code = 0

  # Loop until the user choose to quit
  while action_code.to_i != 99 do 
    action_code = github.show_action_menu()
  end
end


#==============================================================================

def main()

  action_code = 0

  # Loop until the user choose to quit
  while action_code.to_i != 99 do 

    puts "\n\n"
    puts "======================================"
    puts "           Jira Helper 3000"
    puts "======================================"

    puts "\nWhat ya wanna do ?"
    puts "    1: Manage Jira Issues"
    puts "    2: Create Github release tag"
    puts "    3: Quit"
    print "\nACTION> "

    action_code = gets

    case action_code.to_i

    when 1
      manage_jira_issue()

    when 2
      manage_github()

    else
      puts "\nSee ya !\n\n"
      action_code = 99
    end

  end

end





##########################################################################################

# Run the whole thing the good'ol fashion way ;-)
main()