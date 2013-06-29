require 'test_helper'

class CastsControllerTest < ActionController::TestCase
  setup do
    @cast = casts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:casts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cast" do
    assert_difference('Cast.count') do
      post :create, :cast => { :description => @cast.description, :image_url => @cast.image_url, :source_code => @cast.source_code, :title => @cast.title }
    end

    assert_redirected_to cast_path(assigns(:cast))
  end

  test "should show cast" do
    get :show, :id => @cast
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cast
    assert_response :success
  end

  test "should update cast" do
    put :update, :id => @cast, :cast => { :description => @cast.description, :image_url => @cast.image_url, :source_code => @cast.source_code, :title => @cast.title }
    assert_redirected_to cast_path(assigns(:cast))
  end

  test "should destroy cast" do
    assert_difference('Cast.count', -1) do
      delete :destroy, :id => @cast
    end

    assert_redirected_to casts_path
  end
end
