require 'test_helper'

class SchoolResultsControllerTest < ActionController::TestCase
  setup do
    @school_result = school_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_result" do
    assert_difference('SchoolResult.count') do
      post :create, :school_result => @school_result.attributes
    end

    assert_redirected_to school_result_path(assigns(:school_result))
  end

  test "should show school_result" do
    get :show, :id => @school_result.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @school_result.to_param
    assert_response :success
  end

  test "should update school_result" do
    put :update, :id => @school_result.to_param, :school_result => @school_result.attributes
    assert_redirected_to school_result_path(assigns(:school_result))
  end

  test "should destroy school_result" do
    assert_difference('SchoolResult.count', -1) do
      delete :destroy, :id => @school_result.to_param
    end

    assert_redirected_to school_results_path
  end
end
