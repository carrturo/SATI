require 'test_helper'

class DestrezasControllerTest < ActionController::TestCase
  setup do
    @destreza = destrezas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:destrezas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create destreza" do
    assert_difference('Destreza.count') do
      post :create, destreza: { comentario: @destreza.comentario, nombre: @destreza.nombre }
    end

    assert_redirected_to destreza_path(assigns(:destreza))
  end

  test "should show destreza" do
    get :show, id: @destreza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @destreza
    assert_response :success
  end

  test "should update destreza" do
    patch :update, id: @destreza, destreza: { comentario: @destreza.comentario, nombre: @destreza.nombre }
    assert_redirected_to destreza_path(assigns(:destreza))
  end

  test "should destroy destreza" do
    assert_difference('Destreza.count', -1) do
      delete :destroy, id: @destreza
    end

    assert_redirected_to destrezas_path
  end
end
