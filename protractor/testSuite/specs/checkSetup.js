describe('Verify the Protractor setup',function(){

    it('Should verify the Protractor setup is done sucessfully and you can see qa.venzee.com', function() {

      var siteTitle = element(by.id("vz-title-01"));
      
      // This is normally in a "pages file", but this is the most basic test you can do !
      global.isAngularSite(false);  
      browser.driver.get("https://qa:9087@qa.venzee.com");
      expect(siteTitle.getText()).toEqual('Your Product Information isn’t compatible with Jet. So what else is new?')

    });

});
