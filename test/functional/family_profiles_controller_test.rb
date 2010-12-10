require 'test_helper'

class FamilyProfilesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => FamilyProfile.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    FamilyProfile.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    FamilyProfile.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to family_profile_url(assigns(:family_profile))
  end
  
  def test_edit
    get :edit, :id => FamilyProfile.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    FamilyProfile.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FamilyProfile.first
    assert_template 'edit'
  end

  def test_update_valid
    FamilyProfile.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FamilyProfile.first
    assert_redirected_to family_profile_url(assigns(:family_profile))
  end
  
  def test_destroy
    family_profile = FamilyProfile.first
    delete :destroy, :id => family_profile
    assert_redirected_to family_profiles_url
    assert !FamilyProfile.exists?(family_profile.id)
  end
end
