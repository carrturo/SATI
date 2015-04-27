require 'test_helper'

class ClasificacionsControllerTest < ActionController::TestCase
  setup do
    @clasificacion = clasificacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clasificacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clasificacion" do
    assert_difference('Clasificacion.count') do
      post :create, clasificacion: { comentario: @clasificacion.comentario, edadMax: @clasificacion.edadMax, edadMin: @clasificacion.edadMin, nombre: @clasificacion.nombre }
    end

    assert_redirected_to clasificacion_path(assigns(:clasificacion))
  end

  test "should show clasificacion" do
    get :show, id: @clasificacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clasificacion
    assert_response :success
  end

  test "should update clasificacion" do
    patch :update, id: @clasificacion, clasificacion: { comentario: @clasificacion.comentario, edadMax: @clasificacion.edadMax, edadMin: @clasificacion.edadMin, nombre: @clasificacion.nombre }
    assert_redirected_to clasificacion_path(assigns(:clasificacion))
  end

  test "should destroy clasificacion" do
    assert_difference('Clasificacion.count', -1) do
      delete :destroy, id: @clasificacion
    end

    assert_redirected_to clasificacions_path
  end
end
