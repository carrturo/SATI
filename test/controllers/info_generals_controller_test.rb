require 'test_helper'

class InfoGeneralsControllerTest < ActionController::TestCase
  setup do
    @info_general = info_generals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:info_generals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info_general" do
    assert_difference('InfoGeneral.count') do
      post :create, info_general: { direccion: @info_general.direccion, email: @info_general.email, fb: @info_general.fb, ig: @info_general.ig, nombre: @info_general.nombre, telefono: @info_general.telefono, tw: @info_general.tw, youtube: @info_general.youtube }
    end

    assert_redirected_to info_general_path(assigns(:info_general))
  end

  test "should show info_general" do
    get :show, id: @info_general
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @info_general
    assert_response :success
  end

  test "should update info_general" do
    patch :update, id: @info_general, info_general: { direccion: @info_general.direccion, email: @info_general.email, fb: @info_general.fb, ig: @info_general.ig, nombre: @info_general.nombre, telefono: @info_general.telefono, tw: @info_general.tw, youtube: @info_general.youtube }
    assert_redirected_to info_general_path(assigns(:info_general))
  end

  test "should destroy info_general" do
    assert_difference('InfoGeneral.count', -1) do
      delete :destroy, id: @info_general
    end

    assert_redirected_to info_generals_path
  end
end
