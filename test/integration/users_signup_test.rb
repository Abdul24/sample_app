require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  
  #Reveiw signup test it passes once above information is removed. 
  #SyntaxError: /Users/abdulaleemseyed/Dropbox/rails_projects/sample_app/test/integration/users_signup_test.rb
  #:36: syntax error, unexpected keyword_end, expecting end-of-input
  #end

  test "valid signup information" do
    get signup_path
    name  = "Example User"
    email = "user@example.com"
    password = "password"
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  name,
                                            email: email,
                                            password:              password,
                                            password_confirmation: password }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end