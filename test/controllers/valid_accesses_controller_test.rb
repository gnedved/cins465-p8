require 'test_helper'

class ValidAccessesControllerTest < ActionController::TestCase
  setup do
    @valid_access = valid_accesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:valid_accesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valid_access" do
    assert_difference('ValidAccess.count') do
      post :create, valid_access: { user_id: @valid_access.user_id, wish_list_id: @valid_access.wish_list_id }
    end

    assert_redirected_to valid_access_path(assigns(:valid_access))
  end

  test "should show valid_access" do
    get :show, id: @valid_access
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @valid_access
    assert_response :success
  end

  test "should update valid_access" do
    patch :update, id: @valid_access, valid_access: { user_id: @valid_access.user_id, wish_list_id: @valid_access.wish_list_id }
    assert_redirected_to valid_access_path(assigns(:valid_access))
  end

  test "should destroy valid_access" do
    assert_difference('ValidAccess.count', -1) do
      delete :destroy, id: @valid_access
    end

    assert_redirected_to valid_accesses_path
  end
end
