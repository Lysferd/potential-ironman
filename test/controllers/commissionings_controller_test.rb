require 'test_helper'

class CommissioningsControllerTest < ActionController::TestCase
  setup do
    @commissioning = commissionings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commissionings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commissioning" do
    assert_difference('Commissioning.count') do
      post :create, commissioning: { client_id: @commissioning.client_id, description: @commissioning.description, label: @commissioning.label }
    end

    assert_redirected_to commissioning_path(assigns(:commissioning))
  end

  test "should show commissioning" do
    get :show, id: @commissioning
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commissioning
    assert_response :success
  end

  test "should update commissioning" do
    patch :update, id: @commissioning, commissioning: { client_id: @commissioning.client_id, description: @commissioning.description, label: @commissioning.label }
    assert_redirected_to commissioning_path(assigns(:commissioning))
  end

  test "should destroy commissioning" do
    assert_difference('Commissioning.count', -1) do
      delete :destroy, id: @commissioning
    end

    assert_redirected_to commissionings_path
  end
end
