var basePage = require('./basePage.js');
var cd       = require('./configData.js');

var productForm = function () {
 
  // CMS Sign In button locator
  var signUpButton   = element.all(by.css('[title="Get Started"]')).get(0);
  
   //the locators declaration for the current page
  var dashboardIcon = element(by.css(".layout-user--sidebar__logo"));
 

  // Dahboard Locators
  var sideMenuProfile  = element(by.xpath("//button[@class='layout-user--sidebar__profile-image']"));
  var logoutMenuItem   = element(by.css('[ng-click="sidenav.logout()"]'));
  var dashHeader       = element.all(by.css('.db__heading')); 
  var dashHeaderPlan      = element.all(by.css('p.ng-scope'));
 
  // Side Menu Locators
  var sideMenuSettings        = element(by.css(".fa-cog"));
  var billingItem      = element(by.css('[ng-click="sidenav.goBilling()"]'));
  var sideMenuData         = element.all(by.css(".fa-plus")).get(1);
  var formLink             = element(by.linkText('Add Products'));
  var productPageTitle     = element(by.xpath("//h2[text()=' Products']"));
  
  // Add product via Form page locators
  
  var productListName  = element(by.css('.form-field__input--icon-right.ng-pristine'));
  var productID  = element.all(by.css(".form-field__input.form-field__input--mandatory-star")).get(1);
  var productValue = element.all(by.css(".form-field__input.form-field__input--mandatory-star")).get(2);
  var addAdditionalData = element.all(by.css(".btn-text.btn-text--plus")).get(0);
  var lableOne = element.all(by.css(".form-field__input.ng-pristine")).get(0);
  var lableValue = element.all(by.css(".form-field__input.ng-pristine")).get(0);
  var saveButton  = element(by.css('.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope'));
  var productPage = element.all(by.css('.float--left>a'));
  var productlist = element.all(by.css('.grid-table__row__content'));
  var editButton = element(by.xpath("//div[@class='pull-right product-details__actions']/button[1]"));
  var addproductVaiForm = element.all(by.css('.form-group.ng-scope>h4')).get(0);
  var labelValue2 = element(by.xpath("//div[@class='row ng-scope']/ng-form/div[2]/input"));
  var saveChangeButton = element.all(by.css('.btn--large.btn--primary.btn.vz-btn-process.ng-isolate-scope')).get(0);
  

 


  this.addProduct = function() {
    
   // Product --> Form
  dashboardIcon.click(); 
  sideMenuData.click();
  formLink.click(); 
  productListName.sendKeys(cd.collection.collectionName + "Form");
  productID.sendKeys('SKU');
  productValue.sendKeys('0001');
  addAdditionalData.click();
  lableOne.sendKeys('Product Name');
  lableValue.sendKeys('Automation Product');
  saveButton.click();
  // browser.driver.sleep(5000);
  expect(productPage.isPresent()).toBe(true);
 
  
  };

  this.editProduct = function() {
  productlist.click();
  editButton.click();
  expect(addproductVaiForm.isPresent()).toBe(true);
  labelValue2.clear();
  labelValue2.sendKeys('Updated Automation Product');
  saveChangeButton.click();  
  expect(productPage.isPresent()).toBe(true);
  //cancelButton.click();
   };
   
  
  
  
  this.logout = function(){

  sideMenuProfile.click();
        
  logoutMenuItem.click().then(function(){
  global.isAngularSite(false);  // The CMS isn't an Angular site
    });

  };

};

productForm.prototype = basePage; // extend basePage...
module.exports = new productForm();
