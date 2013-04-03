require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "that /login route opens login page" do
    get '/login'
    assert_response :success   # Means you are expecting a certain HTTP response (here we want success)
  end
  
  test "that /logout route opens log out page" do
    get '/logout'
    assert_response :redirect
    assert_redirected_to '/'
  end
  
  test "that /register route opens sign up page" do
    get '/register'
    assert_response :success
  end
end
