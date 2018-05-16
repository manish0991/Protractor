## Cucumber Test Framework

### Release note
**2015-09-10 Improved security of CukeRunner via cryptenv gem**
- `ci_env.json.enc` is now used by CukeRunner to store the credential crypted.  By default, it should be 1 level higher than the /qa directory.  Ex: If you clone your qa repo in E:/geek/qa, then the ci_env.json.enc should be in E:/geek.
- You can crypt and decrypt anyfile via cryptenv gem (see `/qa/cryptenv/use_cryptenv.rb` for usage example)
- The OS config is now stores in a file called `ci_os.json` to differenciate from `ci_env.json`. **NOTE:** Neither of those file should be checkin in github

**2015-04-25 New framework with abstraction layer**
- a full abstraction layer via `/support/action_helper.rb`  No more `@browser.find_element()` in the step definition--
- The `/support/common_step.rb` has been reviewed and will contain all the step_definition that are reused through many feature
- `/support/support_data.rb`  contain couple of class to generate useful data easily like a user, a product, a collection
- In the `before do` in `/support/env.rb` you'll see that `generate_data()` is called to create a user, a partner and a company for now
- You'll see in `/action_helper.rb` that `button_click()` need a 2nd parameter which is a sentence to wait for.  Same for visit_page and link_click.   No more "sleep" command !
- Ah little detail, since it's using another directory for the features - /features_v2 - you need to run it with --profile ms :)


----

### Installation Instruction 
Including Ruby and Selenium

**You need Ruby 1.9.3 installed to run these tests**

    $ ruby --version
    ruby 1.9.3p551 (2014-11-13) [i386-mingw32]


**Install git from git-scm.com**
- On windows: Make sure to add the path to your PATH environment variable
- On Linux: Make sure you create a synlink
 
### Install Ruby 1.9.3
Check your version : `$ ruby --version`

**On windows**
- Download Ruby : http://rubyinstaller.org/
- Install SDK for Ruby 1.9.3 from http://rubyinstaller.org/
 - Unzip in C:\Program Files\RubySDK
 - Then go to the sdk path and install the sdk.
 - `$ cd C:\Program Files\RubySDK`
 - `$ ruby dk.rb init`
- If you have multiple instance of Ruby 1.9.3 installed (like with the heroku toolbelt), you'll need to edit the config.yml file to remove the heroku-ruby path from the file before running the next command.  
 - On windows look here : C:\Users\<myUser>\AppData\Local\VirtualStore\Program Files\RubySDK
 - `$ ruby dk.rb install`

**On Linux**
Install Ruby via RVM (Ruby Version Manager)

    $ \curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
    $ \curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3

Install the dev ket

    $ apt-get install ruby-dev

**On Mac**
Install Ruby via RVM (Ruby Version Manager)

    $ curl -L get.rvm.io | bash -s stable
    $ source ~/.rvm/scripts/rvm
    $ rvm install 1.9.3
    
### Update gem version
	$ gem update --system 2.3.0

### Open a command line and install some gem
On linux, run with `sudo`

    $ gem install rspec --no-ri --no-rdoc
    $ gem install selenium-webdriver
    $ gem install cucumber -v 1.3.17
    $ gem install bundler

### Clone the git repo from Venzee/QA

    $ git clone https://github.com/venzee/qa.git

### (Optional) Copy the encrypted credential file to an external server
- You need to use `scp` instead of `ssh`
- You need to have the server provate key (.pem)
- You need to get the ci_env.json file encrypted via the gem `cryptenv`.  See qa/cryptenv_gem repo for info
- Then you execute the following command:

- `$ scp -i strider.pem ci_env.json.enc ec2-user@strider.venzee.com:~ec2-user/ci_env.json.enc`

### Go in the repo and install Bundle + Rails
On linux, run with `sudo`

    $ cd qa
    $ bundle install
    $ gem install rails

### Download the Chrome Web driver
Here : https://sites.google.com/a/chromium.org/chromedriver/downloads
** Windows **
 - Unzip it here it on your C:\Program Files\ChromeDriver
 - Add it to your PATH environment variable

** Linux **
 - Unzip the file `chromedriver` in /opt/chromedriver/
  - `$ cp chromedriver /optchromedriver/
  - Create the symlink : `sudo ln -s /opt/chromedriver/chromedriver /usr/bin/chromedriver` 

### Once you've done that, you're ready to start running some tests!

    Unix: 
      $ ./bin/cucumber features_v2/_qa_setup/qa_setup.feature
    Windows: 
      C:/> cucumber features_v2/_qa_setup/qa_setup.feature

You should see something along the lines of ...

    Using the default profile...
    Feature: Be A Venzee Testing Machine

      Venzee uses automated testing to ensure that our website is magically
      delicious at all times.

      Scenario: Hit the right homepage         # features/qa_setup.feature:6
        Given I am on the home page            # features/step_definitions/qa_setup.rb:1
        Then I should see "nomorespreadsheets" # features/step_definitions/qa_setup.rb:28

    1 scenario (1 passed)
    2 steps (2 passed)
    0m5.611s

## Cool, but ... what if I want to test locally?

Glad you asked that. You can run these tests against your local development environment like this:

    $ VENZEE_ENV=localdev ./bin/cucumber features/qa_setup.feature


---------------------------------

###Reference
- Question about Ruby Installer SDK ?
 - https://github.com/oneclick/rubyinstaller/wiki/Development-Kit
- Tired of entering your username/password each time you push/pull/clone from git ??
 - Here's the answer ! https://help.github.com/articles/generating-ssh-keys/  
- Want Guerkin syntax highlighted in Sublime 2 ?  http://shashikantjagtap.net/speed-up-your-bdd-with-sublime-text-2/
