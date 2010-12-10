require 'test_helper'

class AttendanceResultsControllerTest < ActionController::TestCase
  setup do
    @attendance_result = attendance_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_result" do
    assert_difference('AttendanceResult.count') do
      post :create, :attendance_result => @attendance_result.attributes
    end

    assert_redirected_to attendance_result_path(assigns(:attendance_result))
  end

  test "should show attendance_result" do
    get :show, :id => @attendance_result.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @attendance_result.to_param
    assert_response :success
  end

  test "should update attendance_result" do
    put :update, :id => @attendance_result.to_param, :attendance_result => @attendance_result.attributes
    assert_redirected_to attendance_result_path(assigns(:attendance_result))
  end

  test "should destroy attendance_result" do
    assert_difference('AttendanceResult.count', -1) do
      delete :destroy, :id => @attendance_result.to_param
    end

    assert_redirected_to attendance_results_path
  end
end
