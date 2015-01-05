require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    email = 'newguy'
    password = 'mycomplexpass'
    assert_difference('User.count') do
      post :create, user: { email: email, password: password, password_confirmation: password }
    end

    assert_redirected_to users_url
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    new_email = 'updatedguy'
    new_password = 'myupdatedpass'
    patch :update, id: @user, user: { email: new_email, password: new_password, password_confirmation: new_password }
    assert_redirected_to users_url
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
