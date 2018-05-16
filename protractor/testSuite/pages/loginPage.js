var basePage = require('./basePage.js');
var cd       = require('./configData.js');


var LoginPage = function () {

  var email            = element(by.name('username'));
  var password         = element(by.name('password'));
  var submitButtonElem = element.all(by.buttonText('Login')).get(0); //element(by.xpath("//button[@type='submit']"));
  var sideMenuProfile  = element(by.xpath("//button[@class='layout-user--sidebar__profile-image ng-isolate-scope']"));
  var logoutMenuItem   = element(by.css('[ng-click="sidenav.logout()"]'));
  var loginButton      = element(by.xpath("//a[text()='Login']"));
  var signUpButton     = element(by.xpath("//a[text()='Sign up!']"));

  this.login = function (){  

    //loginButton.click().then(function(){
      //global.isAngularSite(true);  
    //});

    email.isPresent().then(function(result){

      if (result)
      {
        //console.log("Ready to login");
        email.sendKeys(cd.user.email);
        password.sendKeys(cd.user.password);
        submitButtonElem.click();
        expect(sideMenuProfile.isPresent()).toBe(true);
      }
      else
      {
        //console.log("already login");
        expect(sideMenuProfile.isPresent()).toBe(true);
      }
      

    });

  };
  
  


  this.logout = function(url) {

    if (global.getAngularSite()) {
      sideMenuProfile.isPresent().then(function(result){
        
        if (result) {

          sideMenuProfile.click();
          
          logoutMenuItem.click().then(function(){
            global.isAngularSite(false);  // The CMS isn't an Angular site
          });

        }
        else {
          console.log("Take for granted that if I'm not on the dashboard, I'm logged out... DANGEROUS");
          browser.driver.get(url);
          global.isAngularSite(false);
          
          loginButton.click().then(function(){
            global.isAngularSite(true);
            email.isPresent().then(function(value){
              if (!value)
              {
                browser.driver.get(url);
                global.isAngularSite(false);
              }
              else
              {
                sideMenuProfile.click();
          
                logoutMenuItem.click().then(function(){
                  global.isAngularSite(false);  // The CMS isn't an Angular site
                });
              }

            });  
          });
          

        }
      });
    }
   
  }

};

LoginPage.prototype = basePage; // extend basePage...
module.exports = new LoginPage();
