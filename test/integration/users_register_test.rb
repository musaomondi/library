require 'test_helper'

class UsersRegisterTest < ActionDispatch::IntegrationTest

  test "register with invalid information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: { name: "",
                               email: "user@invalid",
                               password: "foo",
                               password_confirmation: "bar" }}
    end
    assert_template 'users/new'
  end
  test "register with valid information" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: { name: "Just Example",
                                            email: "user@example.com",
                                            password: "password",
                                            password_confirmation: "password" }}
    end
    follow_redirect!
    #assert_template 'users/show'
    #assert is_logged_in?
  end
end
