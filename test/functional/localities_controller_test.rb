require 'test_helper'

class LocalitiesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Locality.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Locality.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Locality.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to locality_url(assigns(:locality))
  end
  
  def test_edit
    get :edit, :id => Locality.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Locality.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Locality.first
    assert_template 'edit'
  end

  def test_update_valid
    Locality.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Locality.first
    assert_redirected_to locality_url(assigns(:locality))
  end
  
  def test_destroy
    locality = Locality.first
    delete :destroy, :id => locality
    assert_redirected_to localities_url
    assert !Locality.exists?(locality.id)
  end
end
