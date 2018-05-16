# coding: utf-8
@links
Feature: Verify that all links which located on Menu Nav takeover, footers and headers work


    #@smoke_test
    Scenario Outline: Verify all links in the public website header

        Given a user is on the home page
		#venzee.com
        When a user clicks on the <page> link
        Then sees the <page> page

        Examples: 
        | page          |
        | Pricing       |
        | Login         |
        | Register User |
		| Webinar       |

    #@smoke_test
    Scenario Outline: Verify all links in the public website header when the user is logged in

        Given a user and a company are registered
            And a user is logged in 
            And a user is on the home page
			#venzee.com
        When a user clicks on the <page> link
        Then sees the <page> page

        Examples: 
        | page       |
        | Use Venzee |

    #@smoke_test
    Scenario Outline: Verify all links in the public website footer

        Given a user is on the home page
		#venzee.com
        When a user clicks on the <page> link
        Then sees the <page> page

        Examples: 
        | page         |
        | Pricing      |
        | About        |
        | Terms of Use |
        | Privacy      |
        | Dev Portal   |
        | Contact      |
        | Angels.co    |
		| Blog         |
		| Status       |
		| Support      |
		| Twitter      |

    #@smoke_test 
    Scenario Outline: Verify all links in the dev portal header 

        Given a user is on the Dev Portal 
        When a user clicks on the <page> link
        Then sees the <page> page

        Examples: 
        | page          |
        | Documentation |
        | API           |
        | Code Sample   |

    #@smoke_test
    Scenario Outline: Verify all links in the Venzee App footer 

        Given a user and a company are registered
            And a user is logged in
            And a user is on the Menu Nav Takeover page
        When a user clicks on the <page> link
        Then sees the <page> page

        Examples: 
        | page         |
        | Careers      |
        | Contact      |
        | Privacy      |
        | Blog         |
        | Dev Portal   |
        | Support      |
        | Status       |
        | Terms of Use |

    @smoke_test 
    Scenario Outline: Verify that all links in the Menu Nav Takeover work

        Given a user and a company are registered
            And a user is logged in
            And a user is on the Menu Nav Takeover page
        When a user clicks on the <page> link
        Then sees the <page> page

        Examples: 
        | page                      |
       | Dashboard Overview         |
       | Manage Partners            |
       | Manage Users               |
       #| Data                       |
       | Add Records                |
       | Add Records via Form       |
       | Compliance                 |
       | MAP                        |
      # | Integrations               |
       #| Create a Custom Integration|
       | Transform Data             |
	   | Perform a transformation   |
	   | Templates Library          |

    


