// Not sure what this is used to...

var env = require('../environment.json');

var BasePage = function() {

    var loadingElem = element(by.id('loading'));
    
    // wait and test that we're on the page
    this.isVisible = function() {
        console.log('checking isVisible for element '+this.pageLoadedIdentifier);
        return browser.wait(EC.visibilityOf(this.pageLoadedLocator), 30000, 'timed out waiting for '+this.pageLoadedLocator+' to be visible');
    };

    this.isHidden = function() {
        return browser.wait(EC.invisibilityOf(this.pageLoadedLocator), 30000, 'timed out waiting for '+this.pageLoadedLocator+' to be hidden');
    };

    this.isLoadingIconVisible = function(){
        return browser.wait(EC.visibilityOf(loadingElem), 30000, 'timed out waiting for loading spinner to be visible');
    }

    this.isLoadingIconHidden = function(){
        return browser.wait(EC.invisibilityOf(loadingElem), 30000, 'timed out waiting for loading spinner to be hidden');
    }
    /**
     * Verifies if an element displayed on the page or not
     * @param element
     */
    this.isElementDisplayed = function (element) {
        return element.isPresent().then(function (isPresent) {
            if (isPresent) {
                return element.isDisplayed();
            }
            else {
                return isPresent;
            }
        });
    };

    this.expectErrorMessageToEqual = function(expectedErrorMessage, errMsgIndex){
        if(!errMsgIndex){
            errMsgIndex = 0;
        }
        element.all(by.repeater('alert in rootModel.alerts()').column('msg')).then(function(alertMessages){
            //var expectedErrorMessage = 'New user must have a unique username';
            expect(alertMessages[errMsgIndex].getText()).toContain(expectedErrorMessage);
        });
    };

    /**
     * Verifies that the passed array is sorted or not (Descending order)
     * @param arr - a javascript array
     * @returns {boolean}
     */
    this.isSorted=function(arr) {
        var len = arr.length - 1;
        for(var i = 0; i < len; ++i) {
            if(arr[i] > arr[i+1]) {
                return false;
            }
        }
        return true;
    };
};

BasePage.prototype = protractor.ExpectedConditions;
BasePage.prototype = env;
module.exports     = new BasePage();