Given "user created a transformation" do
   register_user_and_company()
   login_user()
   add_product_via_form_add_additional()
   upgrade_to_paid_plan()
   #wait_and_refresh(3)
   #sleep 2 
   create_private_template()
   sleep 2
   create_transform() 
end
