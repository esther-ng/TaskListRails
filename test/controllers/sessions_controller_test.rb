require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    get :create,  {provider: "github"}
  end

  def logout_a_user
    delete :destroy
  end

  test "Can Create a user" do
    assert_difference('User.count', 1) do
      login_a_user
      assert_response :redirect
      assert_redirected_to tasks_path
      assert_not_nil session[:user_id]
    end
  end

  test "if user is already logged in, root takes to tasks" do
    login_a_user
    get :index
    assert_response :redirect
    assert_redirected_to tasks_path
    assert_not_nil session[:user_id]
  end

  test "If a user logs in twice it doesn't create a 2nd user" do
    assert_difference('User.count', 1) do
      login_a_user
    end
    assert_no_difference('User.count') do
      login_a_user
      assert_response :redirect
      assert_redirected_to tasks_path
      assert_not_nil session[:user_id]
    end
  end

  test "If a user is not logged in they get redirected to root" do
    logout_a_user
    assert session[:user_id].nil?
    assert_redirected_to root_path
  end
end
