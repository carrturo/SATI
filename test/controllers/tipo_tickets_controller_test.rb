require 'test_helper'

class TipoTicketsControllerTest < ActionController::TestCase
  setup do
    @tipo_ticket = tipo_tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_ticket" do
    assert_difference('TipoTicket.count') do
      post :create, tipo_ticket: { comentario: @tipo_ticket.comentario, precio: @tipo_ticket.precio, tipo: @tipo_ticket.tipo }
    end

    assert_redirected_to tipo_ticket_path(assigns(:tipo_ticket))
  end

  test "should show tipo_ticket" do
    get :show, id: @tipo_ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_ticket
    assert_response :success
  end

  test "should update tipo_ticket" do
    patch :update, id: @tipo_ticket, tipo_ticket: { comentario: @tipo_ticket.comentario, precio: @tipo_ticket.precio, tipo: @tipo_ticket.tipo }
    assert_redirected_to tipo_ticket_path(assigns(:tipo_ticket))
  end

  test "should destroy tipo_ticket" do
    assert_difference('TipoTicket.count', -1) do
      delete :destroy, id: @tipo_ticket
    end

    assert_redirected_to tipo_tickets_path
  end
end
