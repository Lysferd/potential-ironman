require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    logout
    get :index
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should login" do
    user = users(:one)
    post :create, username: user.username, password: 'pass'
    assert_redirected_to :admin
    assert_equal user.id, session[:user_id]
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to login_url
  end
end
