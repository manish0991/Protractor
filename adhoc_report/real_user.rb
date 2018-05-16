require 'rubygems'
require 'bundler/setup'
require 'pg'
require 'json'
require 'cryptenv'


class PostgresConnect

  # Create the connection instance.
  def connect(env)

    crypt = Cryptenv.new()

    crypt.load_crypted_file("../../ci_env.json.enc")
    #crypt.load_file("../../ci_env.json")

    if env == 'QA'
      @conn = PG.connect(
          :host     => crypt.get("adhoc_report","real_user","credentials","qa","host"),
          :port     => crypt.get("adhoc_report","real_user","credentials","qa","port"),
          :dbname   => crypt.get("adhoc_report","real_user","credentials","qa","dbname"),
          :user     => crypt.get("adhoc_report","real_user","credentials","qa","user"),
          :password => crypt.get("adhoc_report","real_user","credentials","qa","password"))
      
    elsif env == "PROD"
      @conn = PG.connect(
          :host     => crypt.get("adhoc_report","real_user","credentials","prod","host"),
          :port     => crypt.get("adhoc_report","real_user","credentials","prod","port"),
          :dbname   => crypt.get("adhoc_report","real_user","credentials","prod","dbname"),
          :user     => crypt.get("adhoc_report","real_user","credentials","prod","user"),
          :password => crypt.get("adhoc_report","real_user","credentials","prod","password"))
    
    elsif env == "SANDBOX"
      @conn = PG.connect(
          :host     => crypt.get("adhoc_report","real_user","credentials","sandbox","host"),
          :port     => crypt.get("adhoc_report","real_user","credentials","sandbox","port"),
          :dbname   => crypt.get("adhoc_report","real_user","credentials","sandbox","dbname"),
          :user     => crypt.get("adhoc_report","real_user","credentials","sandbox","user"),
          :password => crypt.get("adhoc_report","real_user","credentials","sandbox","password"))

    elsif env == "DEV"
      @conn = PG.connect(
          :host     => crypt.get("adhoc_report","real_user","credentials","dev","host"),
          :port     => crypt.get("adhoc_report","real_user","credentials","dev","port"),
          :dbname   => crypt.get("adhoc_report","real_user","credentials","dev","dbname"),
          :user     => crypt.get("adhoc_report","real_user","credentials","dev","user"),
          :password => crypt.get("adhoc_report","real_user","credentials","dev","password"))

    end

  end

  # Disconnect the back-end connection.
  def disconnect
    @conn.close
  end

  ###########################################################################

  def get_total_user
    result = @conn.exec("SELECT count(*) 
                           FROM public.user
                        ")
      
    result.each do |row|
      #puts 'pg--> ' + row['id'].to_s + ":" + row['firstname'].to_s
      #puts JSON.pretty_generate(row)
      puts "Total User: " + row['count'].to_s
    end
  
  end

  def get_total_real_user
    result = @conn.exec("SELECT count(*)
                           FROM public.user
                          WHERE lower(firstname) NOT LIKE '%test%'
                            AND lower(lastname) NOT LIKE '%test%'
                            AND lower(username) NOT LIKE '%test%'
                            AND email NOT LIKE '%venzee%'
                            AND email NOT LIKE '%test%'
                            AND email NOT LIKE '%salsitasoft.com%'
                            AND email NOT LIKE 'melvindemo%'
                            AND email NOT IN ('rpeterson@serenitysoft.com',     'rsnows@gmail.com',           'vivekeivor02016@yopmail.com',
                                              'marit.brademann@gmx.net',        'mvin@gmail.com',             'aslamkhan02@yopmail.com',
                                              'isc.gabriel.ramirezm@gmail.com', 'huangxin@cs.unc.edu',        'qavivekgupta0206@yopmail.com',
                                              'killianbr@gmail.com',            'menshawi.em@gmail.com',      'vivekguptadev09@yopmail.com',
                                              'menaz.happy@gmail.com',          'diegoluis.rojas@gmail.com',  'vivekeivor0906@yopmail.com',
                                              'husseiny.mohammed@gmail.com',    'achalay@gmail.com',          'vivekeivor0906@yopmail.com',
                                              'aaadsfadf@adfdsa.com',           'aman28@yopmail.com',         'qavivekgupta16@yopmail.com',
                                              'aman1327@yopmail.com',           'yanliunc@cs.unc.edu',        'diego.luis.rojas@gmail.com',
                                              'test@ignacio.com',               'creatividadya@gmail.com',    'diego.luis.ro.jas@gmail.com',
                                              'mbdemo1@gmail.com',              'newnew@yopmail.com',         'di.ego.luis.rojas@gmail.com',
                                              'sdfsdfsdf@afsdf.com',            'manishkr28+tt@outlook.com',  'd.i.e.golui.srojas@gmail.com',
                                              'vivek11@yopmail.com',            'vivek321@yopmail.com',       'vivekgupta0306@yopmail.com',
                                              'vivekgupta30@yopmail.com',       'manishkr28@outlook.com',     'qavivekgupta03@yopmail.com',
                                              'dsfsd@sdfsdf.co',                'vivek@yopmail.com',          'virenk@yahoo.com',
                                              'aman14488@yopmail.com',          'vivek.eivor@gmail.com',      'manishkr2312@yopmail.com',
                                              'vivek1327@yopmail.com',          'vivek13@gmail.com',          'anyvendor-sandbox@sharklasers.com',
                                              'vivek27@yopmail.com',            'vivek55@yopmail.com',        
                                              'vivek19@yopmail.com',            'manishkr5555@gmail.com',
                                              'manishkr1327@gmail.com',         'vivekpathak@gmail.com',
                                              'vivek155@yopmail.com',           'vivek89@yopmail.com',
                                              'vivek88@yopmail.com',            'vivekeivor02016@yopmail.com'
                                              ) 
                        ")

    result.each do |row|
      puts "Total Real User: " + row['count'].to_s
      #puts row['id']
    end
 
  end

  def get_list_real_user

    result = @conn.exec("SELECT firstname, 
                                lastname, 
                                email, 
                                to_char(u.created, 'YYYY-MM-DD HH24:MI') as registered_date, 
                                planid, 
                                orgname, 
                                count(inviterid) as total_partner,
                                count(receiverid) as active_partner,
                                (SELECT count(application.name) as total_integration 
                                   FROM application 
                                        LEFT JOIN public.user ON public.user.id = application.owner
                                  WHERE username = u.username 
                                    AND application.status = 'enabled')
                           FROM public.user as u LEFT JOIN partnership ON u.id = partnership.inviterid LEFT JOIN organization ON u.id = organization.creatorid
                          WHERE lower(firstname) NOT LIKE '%test%'
                            AND lower(lastname) NOT LIKE '%test%'
                            AND lower(username) NOT LIKE '%test%'
                            AND email NOT LIKE '%venzee%'
                            AND email NOT LIKE '%test%'
                            AND email NOT LIKE '%salsitasoft.com%'
                            AND email NOT LIKE 'melvindemo%'
                            AND email NOT IN ('rpeterson@serenitysoft.com',     'rsnows@gmail.com',           'vivekeivor02016@yopmail.com',
                                              'marit.brademann@gmx.net',        'mvin@gmail.com',             'aslamkhan02@yopmail.com',
                                              'isc.gabriel.ramirezm@gmail.com', 'huangxin@cs.unc.edu',        'qavivekgupta0206@yopmail.com',
                                              'killianbr@gmail.com',            'menshawi.em@gmail.com',      'vivekguptadev09@yopmail.com',
                                              'menaz.happy@gmail.com',          'diegoluis.rojas@gmail.com',  'vivekeivor0906@yopmail.com',
                                              'husseiny.mohammed@gmail.com',    'achalay@gmail.com',          'vivekeivor0906@yopmail.com',
                                              'aaadsfadf@adfdsa.com',           'aman28@yopmail.com',         'qavivekgupta16@yopmail.com',
                                              'aman1327@yopmail.com',           'yanliunc@cs.unc.edu',        'diego.luis.rojas@gmail.com',
                                              'test@ignacio.com',               'creatividadya@gmail.com',    'diego.luis.ro.jas@gmail.com',
                                              'mbdemo1@gmail.com',              'newnew@yopmail.com',         'di.ego.luis.rojas@gmail.com',
                                              'sdfsdfsdf@afsdf.com',            'manishkr28+tt@outlook.com',  'd.i.e.golui.srojas@gmail.com',
                                              'vivek11@yopmail.com',            'vivek321@yopmail.com',       'vivekgupta0306@yopmail.com',
                                              'vivekgupta30@yopmail.com',       'manishkr28@outlook.com',     'qavivekgupta03@yopmail.com',
                                              'dsfsd@sdfsdf.co',                'vivek@yopmail.com',          'virenk@yahoo.com',
                                              'aman14488@yopmail.com',          'vivek.eivor@gmail.com',      'manishkr2312@yopmail.com',
                                              'vivek1327@yopmail.com',          'vivek13@gmail.com',          'anyvendor-sandbox@sharklasers.com',
                                              'vivek27@yopmail.com',            'vivek55@yopmail.com',        
                                              'vivek19@yopmail.com',            'manishkr5555@gmail.com',
                                              'manishkr1327@gmail.com',         'vivekpathak@gmail.com',
                                              'vivek155@yopmail.com',           'vivek89@yopmail.com',
                                              'vivek88@yopmail.com',            'vivekeivor02016@yopmail.com'
                                              )
                       GROUP BY u.id,
                                orgname,
                                planid
                       ORDER BY total_partner DESC, active_partner DESC, u.created
                        ")

    puts "#| Firstname\t\t| Lastname\t\t| email\t\t\t\t\t| Registered Date\t| Plan Id\t| Company Name\t\t\t| Total Partners| Active Partners| Total Integration"
    puts "=================================================================================================================================================================================================================="

    x = 1
    result.each do |row|
      
      display = "%03d" % x + ") " + row['firstname'].to_s + "\t"

      if row['firstname'].length < 4
        display += "\t\t"
      elsif row['firstname'].length < 15
        display += "\t"
      end

      display += " " + row['lastname'].to_s + "\t"

      if row['lastname'].length < 7
        display += "\t\t"
      elsif row['lastname'].length < 15
        display += "\t"
      end

      display += " " + row['email'].to_s + "\t"

      if row['email'].length < 7
        display += "\t\t\t\t"
      elsif row['email'].length < 15  
        display += "\t\t\t"
      elsif row['email'].length < 23
        display += "\t\t"
      elsif row['email'].length < 30  
        display += "\t"
      end

      display += " " + row['registered_date'].to_s + "\t " + row['planid'].to_s + "\t " + row['orgname'].to_s

     if row['orgname'] == nil
      display += "\t\t\t"
     elsif row['orgname'].length < 7
        display += "\t\t\t"
     elsif row['orgname'].length < 11
        display += "\t\t"
     elsif row['orgname'].length < 15
        display += "\t\t"
     elsif row['orgname'].length < 23
        display += "\t"
     end


      display += "\t\t " + row['total_partner'] + "\t\t " + row['active_partner'] + "\t\t " + row['total_integration']

      puts display
      x += 1
    end

  end

  def get_total_partner_per_company
  end

  def get_list_partner_per_company
  end

  def get_total_user_per_company
  end

  def get_total_new_user_this_week
  end

  def get_list_new_user_this_week
      # Show User, email, Company Name
  end

  def get_total_product_per_user
  end

  def get_total_user_not_finished_registration
    # The got only a user created, no company

    #select u.id, u.firstname, u.email, organization.id
    #from "user" as u LEFT JOIN organization ON u.id = organization.creatorid
    #where organization.id is null
  end

end

#==================================================================================================

def main()

  pg = PostgresConnect.new()
  
  if ARGV[0] == nil
    puts "Using SANDBOX environement by default.  Choice are: DEV, QA, SANDBOX, PROD"
    pg.connect("SANDBOX")

  elsif ARGV[0] == "DEV"
    puts "Using param #{ARGV[0]} environement"
    pg.connect(ARGV[0])

  elsif ARGV[0] == "QA"
    puts "Using param #{ARGV[0]} environement"
    pg.connect(ARGV[0])

  elsif ARGV[0] == "PROD"
    puts "Using param #{ARGV[0]} environement"
    pg.connect(ARGV[0])

  elsif ARGV[0] == "SANDBOX"
    puts "Using param #{ARGV[0]} environement"
    pg.connect(ARGV[0])
        
  else
    puts "Wrong parameter name.  Choice are: DEV, QA, SANDBOX, PROD"
    exit
  end

  begin

    pg.get_list_real_user()
    puts "\n\n"    
    pg.get_total_user()
    pg.get_total_real_user()

  rescue Exception => e
    puts e.message

  ensure
    pg.disconnect()
  end

end


#==================================================================================================
main()