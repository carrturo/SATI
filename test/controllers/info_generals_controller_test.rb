require 'test_helper'

class InfoGeneralsControllerTest < ActionController::TestCase
  setup do
    @info_general = info_generals(:one)
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

end
