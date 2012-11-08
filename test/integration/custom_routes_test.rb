require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
 test "that /signin route opens the login page" do 
 	get '/signin'
 	assert_response :success
 	
 end

 test "that /logout route opens the logout page" do 
 	get '/logout'
 	assert_response :redirect
 	assert_redirected_to '/'

 end

 test "that /register route opens the register page" do 
 	get '/register'
 	assert_response :success
 	
 end


end
