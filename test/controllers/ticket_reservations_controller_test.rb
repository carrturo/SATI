require 'test_helper'

class TicketReservationsControllerTest < ActionController::TestCase
  setup do
    @ticket_reservation = ticket_reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticket_reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket_reservation" do
    assert_difference('TicketReservation.count') do
      post :create, ticket_reservation: { email: @ticket_reservation.email, identity: @ticket_reservation.identity, name: @ticket_reservation.name }
    end

    assert_redirected_to ticket_reservation_path(assigns(:ticket_reservation))
  end

  test "should show ticket_reservation" do
    get :show, id: @ticket_reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket_reservation
    assert_response :success
  end

  test "should update ticket_reservation" do
    patch :update, id: @ticket_reservation, ticket_reservation: { email: @ticket_reservation.email, identity: @ticket_reservation.identity, name: @ticket_reservation.name }
    assert_redirected_to ticket_reservation_path(assigns(:ticket_reservation))
  end

  test "should destroy ticket_reservation" do
    assert_difference('TicketReservation.count', -1) do
      delete :destroy, id: @ticket_reservation
    end

    assert_redirected_to ticket_reservations_path
  end
end
