require 'test_helper'

class EnrollmentOverTimesControllerTest < ActionController::TestCase
  setup do
    @enrollment_over_time = enrollment_over_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enrollment_over_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enrollment_over_time" do
    assert_difference('EnrollmentOverTime.count') do
      post :create, :enrollment_over_time => @enrollment_over_time.attributes
    end

    assert_redirected_to enrollment_over_time_path(assigns(:enrollment_over_time))
  end

  test "should show enrollment_over_time" do
    get :show, :id => @enrollment_over_time.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @enrollment_over_time.to_param
    assert_response :success
  end

  test "should update enrollment_over_time" do
    put :update, :id => @enrollment_over_time.to_param, :enrollment_over_time => @enrollment_over_time.attributes
    assert_redirected_to enrollment_over_time_path(assigns(:enrollment_over_time))
  end

  test "should destroy enrollment_over_time" do
    assert_difference('EnrollmentOverTime.count', -1) do
      delete :destroy, :id => @enrollment_over_time.to_param
    end

    assert_redirected_to enrollment_over_times_path
  end
end
