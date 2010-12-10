require 'test_helper'

class ChildProfilesControllerTest < ActionController::TestCase
  setup do
    @child_profile = child_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:child_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child_profile" do
    assert_difference('ChildProfile.count') do
      post :create, :child_profile => @child_profile.attributes
    end

    assert_redirected_to child_profile_path(assigns(:child_profile))
  end

  test "should show child_profile" do
    get :show, :id => @child_profile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @child_profile.to_param
    assert_response :success
  end

  test "should update child_profile" do
    put :update, :id => @child_profile.to_param, :child_profile => @child_profile.attributes
    assert_redirected_to child_profile_path(assigns(:child_profile))
  end

  test "should destroy child_profile" do
    assert_difference('ChildProfile.count', -1) do
      delete :destroy, :id => @child_profile.to_param
    end

    assert_redirected_to child_profiles_path
  end
end
